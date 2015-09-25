#!/bin/bash

# Variables de entorno
path="/var/log/portalwap"
pathscripts="/root/CDRs"

#######################################################################
DIA=$(date +%Y%m%d)
YEAR=$(date +%Y)
AYER=$(($(date +%Y%m%d) -1))
semana_pasada=$(($(date +%V) -1))

cat $path/${semana_pasada}${YEAR}*.moso > $path/${semana_pasada}${YEAR}.moso
cp  $path/${semana_pasada}${YEAR}.moso  $pathscripts
rm  $path/${semana_pasada}${YEAR}.moso

scp root@10.10.191.101:/root/CDRs/${semana_pasada}${YEAR}.p515 $pathscripts
cat ${semana_pasada}${YEAR}.moso ${semana_pasada}${YEAR}.p515 > ${semana_pasada}${YEAR}.total
rm $pathscripts/${semana_pasada}${YEAR}.moso
rm $pathscripts/${semana_pasada}${YEAR}.p515

cat ${semana_pasada}${YEAR}.total | awk -F"," '{ print $7 "," $9 }'| sort | uniq -c | sort -r >> perfiles${YEAR}${semana_pasada}.txt
cat ${semana_pasada}${YEAR}.total | awk -F"," '{ print $8 }' | sort | uniq -c | sort -r >> enlaces${YEAR}${semana_pasada}.txt
rm $pathscripts/${semana_pasada}${YEAR}.total

cat 201405*.moso  | awk '$5 == "moza"'|wc -l
$ awk '$5 == "moza" { print “La linea”, NR, "contiene MOZA en el quinto campo”; }' ejemplo.txt

cat diario${SEMANA}${AYER}.total | awk -F" " '{ print $6 }'| sort | uniq -c |wc -l












#!/bin/bash

# Variables de entorno
path="/var/log/portalwap"
pathscripts="/root/CDRs"

### ----- REPORTE SEMANAL DE PERFILES Y ENLACES ----- ###
YEAR=$(date +%Y)
#semana_pasada=$(($(date +%V) -1))
semana_pasada=03
cat $pathscripts/diario${semana_pasada}*.total > ${semana_pasada}${YEAR}.total
rm $pathscripts/diario${semana_pasada}*.total

cat ${semana_pasada}${YEAR}.total | awk -F"," '{ print $7 "," $9 }'| sort | uniq -c | sort -r >> perfiles${YEAR}${semana_pasada}.txt
cat ${semana_pasada}${YEAR}.total | awk -F"," '{ print $8 }' | sort | uniq -c | sort -r >> enlaces${YEAR}${semana_pasada}.txt

### ----- GUARDAR  LOS USUARIOS Y VISITAS POR SEMANA ----- ###

Visitas=$(cat ${semana_pasada}${YEAR}.total |wc -l)
Usuarios=$(cat ${semana_pasada}${YEAR}.total | awk -F"," '{ print $6 }'| sort | uniq -c |wc -l)
echo "DATO SEMANAL" >>  consolidado${YEAR}${semana_pasada}.txt
echo "SEMANA,VISITAS,USUARIOS" >>  consolidado${YEAR}${semana_pasada}.txt
echo ${semana_pasada}","${Visitas}","${Usuarios} >>  consolidado${YEAR}${semana_pasada}.txt
rm $pathscripts/${semana_pasada}${YEAR}.total



cat 201412*.moso | awk -F"," '{ print $7 "," $9 }'| sort | uniq -c | sort -r >> prueba.txt
2014-12-14,21:00:00,1,10.10.190.72,10.10.116.14,51980247065,perfil:4,index,BlackBerry9300/5.0.0.997 Profile/MIDP-2.1 Configuration/CLDC-1.1 VendorID/136





































