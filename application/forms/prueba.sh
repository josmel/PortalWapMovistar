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
echo "1. Reporte diario"
echo "0. Salir"
echo -n "opcion:        "
read opcion
case $opcion in
        1)	diario
                ;;
        0)	exit
                ;;
        *)	menu
                ;;
esac


}

#-----------------------------------------------------------------------

diario()          # visitas por hora, se pide la fecha.
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

echo $fecha




cat c.moso |grep SAMOVMM22 | wc -l >> diario$fecha.moso 
cat c.moso |grep SAMOVMM24 | wc -l >> diario$fecha.moso
cat c.moso |grep SAMOVMM23 | wc -l >> diario$fecha.moso
cat c.moso |grep /portalwap/rbt | wc -l >> diario$fecha.moso
cat c.moso |grep http://terra2013.go2cloud.org/aff_c?offer_id=2521 | wc -l >> diario$fecha.moso
cat c.moso |grep http://terra2013.go2cloud.org/aff_c?offer_id=2519 | wc -l >> diario$fecha.moso
cat c.moso |grep SAMOVMM24 | wc -l >> diario$fecha.moso
cat c.moso |grep http://mcp-latam.zed.com/pe/adultos/?ma= | wc -l >> diario$fecha.moso
cat c.moso |grep http://portales-cl.3gmotion.cl/le/wap.asp?sitio=3774 | wc -l >> diario$fecha.moso
cat c.moso |grep http://portales-cl.3gmotion.cl/le/wap.asp?sitio=3773 | wc -l >> diario$fecha.moso


cat c.moso |grep ceid=10972 | wc -l >>diario$fecha.moso
cat c.moso |grep ceid=9434 | wc -l >> diario$fecha.moso
cat c.moso |grep pbid=787 | wc -l >> diario$fecha.moso
cat c.moso |grep http://wap.lalleva.com/ms/pemgalleta/ | wc -l >> diario$fecha.moso




cat c.moso  |grep http://pe.movistar.genexies.net | wc -l >> diario$fecha.moso
cat c.moso  |grep http://mcp-latam.zed.com/pe/juegos/?ma= | wc -l >> diario$fecha.moso
cat c.moso  |grep http://mcp-latam.zed.com/pe/videos/?ma= | wc -l >> diario$fecha.moso
cat c.moso |grep http://mcp-latam.zed.com/pe/adultos/?ma= | wc -l >> diario$fecha.moso
cat c.moso  |grep /portalwap/noticias | wc -l >> diario$fecha.moso
cat c.moso  |grep portalwap/rbt | wc -l >> diario$fecha.moso
cat c.moso  |grep portalwap/redes-sociales | wc -l >> diario$fecha.moso
cat c.moso  |grep /portal515/ | wc -l >> diario$fecha.moso


cat c.moso |grep http://saper.vas-pass.com/?pid=29157 | wc -l >> diario$fecha.moso
cat c.moso |grep portales-cl.3gmotion.cl/le/wap.asp?sitio=3774 | wc -l >> diario$fecha.moso
cat c.moso |grep http://m.paginasamarillas.com.pe | wc -l >> diario$fecha.moso
cat c.moso |grep http://m.facebook.com | wc -l >> diario$fecha.moso


cat c.moso |grep 0/9241111/0/6/1/8400/xhtmlmp_touch/posInTop/1| wc -l >> diario$fecha.moso
cat c.moso |grep /0/10066997/0/6/2/8400/xhtmlmp_touch/posInTop/2 | wc -l >> diario$fecha.moso
cat c.moso |grep /0/264597/0/6/3/8400/xhtmlmp_touch/posInTop/3 | wc -l >> diario$fecha.moso
cat c.moso |grep k/0/9955716/0/6/4/8400/xhtmlmp_touch/posInTop/4 | wc -l >> diario$fecha.moso
cat c.moso |grep /preview_skipifjustonelink/0/9777052/0/6/5/8400/xhtmlmp/posInTop/5 | wc -l >> diario$fecha.moso


cat c.moso |grep iid=211825 | wc -l  >> $diario$fecha.moso
cat c.moso |grep nid=4514   | wc -l >> diario$fecha.moso
cat c.moso |grep iid=100315 | wc -l >> diario$fecha.moso
cat c.moso |grep nid=161150 | wc -l >> diario$fecha.moso

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
