#!/bin/bash
#######################################################################
# hola          Script para obtener reportes del PORTAL WAP.
# version:	v1.0
# Autor:        Erick Enriquez
# Fecha:        03-dic-2012
#######################################################################


# Variables de entorno
path="/var/www/peru/portalwapv2/logs/cdr"
pathscripts="/var/www/peru/portalwapv2/application/configs"
#######################################################################

# funciones

menu()
{
echo
echo "1. Visitas por hora"
echo "2. Visitas por dia"
echo "3. Visitas por mes"
echo "0. Salir"
echo -n "opcion:        "
read opcion
case $opcion in
        1)	visitas_hora
                ;;
        2)	visitas_dia
                ;;
        3)	visitas_mes
                ;;
        0)	exit
                ;;
        *)	menu
                ;;
esac


}

#-----------------------------------------------------------------------

visitas_hora()          # visitas por hora, se pide la fecha.
{
# solicitar la fecha
if [ ! -n "$1" ]
then
    	echo -n "Enter para usar la fecha de hoy o ingresa la fecha (aaaammdd): "
        read fecha
 if [ -z $fecha ]          # si presiona ENTER se considera el dia de hoy.
                then
                    	fecha=`date +%Y%m%d`
                fi
else
    	fecha=$1
fi

echo
echo "Fecha,hora        Clics   Meta    Dif     %"
#paste $pathscripts/reporte.hora.$fecha $pathscripts/meta_horas | awk '{printf "%s %s %s %s %.2f\n" $1" "$2"    "$3"    "$3-$2" "$2/$3  }'


cat c.moso |grep SAMOVMM22 | wc -l >> cantidad.moso 
cat c.moso |grep SAMOVMM24 | wc -l >> cantidad.moso
cat c.moso |grep SAMOVMM23 | wc -l >> cantidad.moso
cat c.moso |grep /portalwap/rbt | wc -l >> cantidad.moso
cat c.moso |grep http://terra2013.go2cloud.org/aff_c?offer_id=2521 | wc -l >> cantidad.moso
cat c.moso |grep http://terra2013.go2cloud.org/aff_c?offer_id=2519 | wc -l >> cantidad.moso
cat c.moso |grep SAMOVMM24 | wc -l >> cantidad.moso
cat c.moso |grep http://mcp-latam.zed.com/pe/adultos/?ma= | wc -l >> cantidad.moso
cat c.moso |grep http://portales-cl.3gmotion.cl/le/wap.asp?sitio=3774 | wc -l >> cantidad.moso
cat c.moso |grep http://portales-cl.3gmotion.cl/le/wap.asp?sitio=3773 | wc -l >> cantidad.moso


cat c.moso |grep http://wap.renxo.com/subscriptionPlanDetail.do?grp=1430&ceid=10972 | wc -l >> cantidad.moso
cat c.moso |grep http://wap.renxo.com/subscriptionPlanDetail.do?grp=1430&ceid=9434 | wc -l >> cantidad.moso
cat c.moso |grep http://wap.renxo.com/subscriptionPlanDetail.do?grp=1430&opd=false | wc -l >> cantidad.moso
cat c.moso |grep http://wap.lalleva.com/ms/pemgalleta/ | wc -l >> cantidad.moso



cat c.moso  |grep http://pe.movistar.genexies.net | wc -l >> cantidad.moso
cat c.moso  |grep http://mcp-latam.zed.com/pe/juegos/?ma= | wc -l >> cantidad.moso
cat c.moso  |grep http://mcp-latam.zed.com/pe/videos/?ma= | wc -l >> cantidad.moso
cat c.moso |grep http://mcp-latam.zed.com/pe/adultos/?ma= | wc -l >> cantidad.moso
cat c.moso  |grep http://m.Terra.com.pe/noticia | wc -l >> cantidad.moso
cat c.moso  |grep portalwap/rbt | wc -l >> cantidad.moso
cat c.moso  |grep portalwap/redes-sociales | wc -l >> cantidad.moso
cat c.moso  |grep /portal515/ | wc -l >> cantidad.moso


cat c.moso |grep http://saper.vas-pass.com/?pid=29157 | wc -l >> cantidad.moso
cat c.moso |grep portales-cl.3gmotion.cl/le/wap.asp?sitio=3774 | wc -l >> cantidad.moso
cat c.moso |grep http://m.paginasamarillas.com.pe | wc -l >> cantidad.moso
cat c.moso |grep http://m.facebook.com | wc -l >> cantidad.moso


cat c.moso |grep 0/9241111/0/6/1/8400/xhtmlmp_touch/posInTop/1| wc -l >> cantidad.moso
cat c.moso |grep /0/10066997/0/6/2/8400/xhtmlmp_touch/posInTop/2 | wc -l >> cantidad.moso
cat c.moso |grep /0/264597/0/6/3/8400/xhtmlmp_touch/posInTop/3 | wc -l >> cantidad.moso
cat c.moso |grep k/0/9955716/0/6/4/8400/xhtmlmp_touch/posInTop/4 | wc -l >> cantidad.moso
cat c.moso |grep /preview_skipifjustonelink/0/9777052/0/6/5/8400/xhtmlmp/posInTop/5 | wc -l >> cantidad.moso


cat c.moso |grep iid=211825 | wc -l  >> cantidad.moso
cat c.moso |grep nid=4514   | wc -l >> cantidad.moso
cat c.moso |grep iid=100315 | wc -l >> cantidad.moso
cat c.moso |grep nid=161150 | wc -l >> cantidad.moso




# limpiar y borrar archivos auxiliares
rm -f $pathscripts/reportePerfiles$fecha.txt
rm -f $pathscripts/enlaces$fecha.txt
}

#-----------------------------------------------------------------------

visitas_dia()           # visitas totales por dia.
{
# obtener fecha
if [ ! -n "$1" ]
then
        echo -n "Enter para usar la fecha de hoy o ingresa la fecha (aaaammdd): "
       	read fecha
                if [ -z $fecha ]          # si presiona ENTER se considera el dia de hoy.
                then
                        fecha=`date +%Y%m%d`
                fi
else
    	fecha=$1
fi

# obtener la cantidad de visitas por dia
# para imprimir la fecha y el resultado
        wc -l $path/$fecha*.moso | grep total  | awk -v var=$fecha '{print substr(var,0,4)"-"substr(var,5,2)"-"substr(var,7,2)" "$1}'
}

#-----------------------------------------------------------------------

visitas_mes()           # visitas totales por dia.
{
# obtener fecha
if [ ! -n "$1" ]
then
        echo -n "Enter para usar el mes presente o ingresa la fecha (aaaamm): "
       	read fecha
                if [ -z $fecha ]          # si presiona ENTER se considera el dia de hoy.
                then
                        fecha=`date +%Y%m`
                fi
else
    	fecha=$1
fi

# obtener la cantidad de visitas por dia
# para imprimir la fecha y el resultado
        wc -l $path/$fecha*.moso | grep total  | awk -v var=$fecha '{print substr(var,0,4)"-"substr(var,5,2)"   "$1}'
}

#######################################################################

# Cuerpo del script

if [ ! -n "$1" ]
then
        menu
else
       	if [ $1 = "hora" ]
    	then
               	if [ ! -n "$2" ]
                then
                        visitas_hora
                else
                    	visitas_hora $2
                fi
        else
            	if [ $1 = "dia" ]
                then
                    	if [ ! -n "$2" ]
                        then
                            	visitas_dia
                        else
                            	visitas_dia $2
                        fi
                else
                    	if [ $1 = "mes" ]
                        then
                            	if [ ! -n "$2" ]
                                then
                                        visitas_mes
                                else
                                    	visitas_mes $2
                                fi
                        else
                            	menu
                        fi
                fi
        fi
fi






cat  $path/${AYER}*.moso | awk -F"," '{ print $7 "  " $9 }'| sort | uniq -c | sort -r >> reportePerfiles$fecha.txt
cat  $path/$fecha*.moso | awk -F"," '{ print $8 }' | sort | uniq -c | sort -r >> enlaces$fecha.txt
cp $pathscripts/reportePerfiles$fecha.txt /var/www/peru/portalwapv2/application/forms
cp $pathscripts/enlaces$fecha.txt /var/www/peru/portalwapv2/application/forms


DIA=$(date +%d)
MES=$(date +%m)
YEAR=$(date +%Y)
AYER=$(($(date +%Y%m%d) -1))

HACE_TRES_DIAS=$(date --date "-3 days" +%d)


echo ${DIA}

echo ${MES}
echo ${YEAR}

echo ${HACE_TRES_DIAS}




echo ${DIA}

echo ${MES}
echo ${YEAR}


echo ${AYER}
















































