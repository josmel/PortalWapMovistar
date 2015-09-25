#!/bin/bash                 
DIADOS=$(date +%d/%m --date="-1 day")
YEAR=$(date +%Y)

variable='d'
AYER=$(($(date +%Y%m%d) -1))
#AYER=20150303
SEMANA=$(date +%V)

# Variables de entorno
path="/var/www/peru/portalwapv2/logs/cdr"
#path="/var/log/portalwap"
pathscripts="/var/www/peru/portalwapv2/logs/cdr"
#pathscriptsGrafica="/root/CDRs/reportes"


                        #############################TABLA DE BANNERS#################################
##############################REPORTE DIARIO CLICKS BANNER POR INTEGRADOR############################################

     

#############################TABLA DE BANNERS#################################
##############################REPORTE DIARIO CLICKS BANNER POR INTEGRADOR############################################
                 for m in `seq 1 10`; do
                   valorFinal=$(($m*3))
                   mivarV=$(($valorFinal+1))
                   Constante=$(($m+5))
                   mivar=$(($valorFinal-2))
                   while [ $mivar -ne $mivarV ]
                        do
                           linea=$(head -$mivar banner.txt | tail -1)
                           valor=$(cat 20150309*.banners | awk -F"," -v var="$linea" -v numeral="$Constante" ' $numeral==var { print "," var }'| sort | uniq -c | sort -r)
                           if [ -z $valor ]; then
                               echo "0 ,$linea">>banner.temporalImpresiones
                             else
                                echo $valor>>banner.temporalImpresiones
                                fi
                            mivar=$(( $mivar + 1 ))
                        done
                     done
      if [ -f banners${YEAR}${SEMANA}.json ]; then
             for y in `seq 1 30`; do
                linea=$(head -$y banner.txt | tail -1)
                    contador=$(($y+1))
               valor=$(cat banner.temporalImpresiones | awk -F"," -v var="$linea" ' $2==var { print $1 }')
               result=$valor
                sed -i "$contador s/]},/,{\"v\": $result}]},/g"  banners${YEAR}${SEMANA}.json
             done 
             contador30=$(($(cat banners${YEAR}${SEMANA}.json |wc -l)-1))
             linea30=$(head -30 banner.txt | tail -1)
            valor30=$(cat banner.temporalImpresiones | awk -F"," -v var="$linea30" ' $2==var { print $1 }')
             sed -i "$contador30 s/]}/,{\"v\": $valor30}]}/g"  banners${YEAR}${SEMANA}.json
        else
               echo "[" >>banners${YEAR}${SEMANA}.json
                                  oldIFS=$IFS   
                                  IFS=$''
                                    valor=$(cat banner.banners | awk -F"," '{ print "    {\"c\": [{\"v\": \""$2"\"},{\"v\": "$1"}]}," }')
                                   echo $valor>>banners${YEAR}${SEMANA}.json
                                  IFS=$old_IFS
               echo "]" >>banners${YEAR}${SEMANA}.json
               contador=$(($(cat banners${YEAR}${SEMANA}.json |wc -l)-1))
              sed -i "$contador s/]},/]}/g"  banners${YEAR}${SEMANA}.json
           fi
         rm banner.temporalImpresiones
            
         