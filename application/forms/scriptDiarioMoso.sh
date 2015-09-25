
#!/bin/bash

# Variables de entorno
path="/var/log/portalwap"
pathscripts="/root/CDRs"

#######################################################################
YEAR=$(date +%Y)
#AYER=$(($(date +%Y%m%d) -1))
AYER=20141001
SEMANA=$(($(date +%V)-1))

cat $path/${AYER}*.moso > $path/diario${SEMANA}${AYER}.moso
cp  $path/diario${SEMANA}${AYER}.moso  $pathscripts
rm  $path/diario${SEMANA}${AYER}.moso

scp root@10.10.191.101:/root/CDRs/diario${SEMANA}${AYER}.p515 $pathscripts
cat diario${SEMANA}${AYER}.moso diario${SEMANA}${AYER}.p515 > diario${SEMANA}${AYER}.total
rm  $pathscripts/diario${SEMANA}${AYER}.moso
rm  $pathscripts/diario${SEMANA}${AYER}.p515

####################GUARDAR DIARIAMENTE LOS USUARIOS Y VISITAS EN UN REPORTE SEMANAL#################################
Visitas=$(cat diario${SEMANA}${AYER}.total |wc -l)
Usuarios=$(cat diario${SEMANA}${AYER}.total | awk -F"," '{ print $6 }'| sort | uniq -c |wc -l)
echo ${AYER}","${Visitas}","${Usuarios} >>  consolidado${YEAR}${SEMANA}.txt

####################REPORTE DIARIO#################################
echo "BANNERS" >> diario${AYER}${SEMANA}.txt

####################POSICION 1#################################
cat diario${SEMANA}${AYER}.total |grep http://helm.tekmob.com/pim/pezombiesmov?tid=31000 | wc -l >> diario${AYER}${SEMANA}.txt
cat diario${SEMANA}${AYER}.total |grep http://naranya.mx/SAMOVMM22 | wc -l >> diario${AYER}${SEMANA}.txt
####################POSICION 2#################################
cat diario${SEMANA}${AYER}.total |grep http://ad.adschemist.com/redirect?idc=51&v=90589 | wc -l >> diario${AYER}${SEMANA}.txt
cat diario${SEMANA}${AYER}.total |grep http://naranya.mx/SAMOVMM24 | wc -l >> diario${AYER}${SEMANA}.txt
####################POSICION 3#################################
cat diario${SEMANA}${AYER}.total |grep http://promoswap.enterfactory.com/ci/go/027892 | wc -l >> diario${AYER}${SEMANA}.txt
cat diario${SEMANA}${AYER}.total |grep http://naranya.mx/SAMOVMM23 | wc -l >> diario${AYER}${SEMANA}.txt
####################POSICION 4#################################
cat diario${SEMANA}${AYER}.total |grep http://promoswap.enterfactory.com/ci/go/027891 | wc -l >> diario${AYER}${SEMANA}.txt
cat diario${SEMANA}${AYER}.total |grep http://goo.gl/Kwtk6M | wc -l >> diario${AYER}${SEMANA}.txt
####################POSICION 5#################################
cat diario${SEMANA}${AYER}.total |grep /portalwap/rbt | wc -l >> diario${AYER}${SEMANA}.txt
cat diario${SEMANA}${AYER}.total |grep http://terra2013.go2cloud.org/aff_c?offer_id=2653&aff_id=2 | wc -l >> diario${AYER}${SEMANA}.txt
####################POSICION 6#################################
cat diario${SEMANA}${AYER}.total |grep http://ad.adschemist.com/redirect?idc=51&v=90589 | wc -l >> diario${AYER}${SEMANA}.txt
cat diario${SEMANA}${AYER}.total |grep http://terra2013.go2cloud.org/aff_c?offer_id=2519&aff_id=2 | wc -l >> diario${AYER}${SEMANA}.txt
####################POSICION 7#################################
cat diario${SEMANA}${AYER}.total |grep http://wap.clubwebin.com/wapkpop/ | wc -l >> diario${AYER}${SEMANA}.txt
####################POSICION 8#################################
cat diario${SEMANA}${AYER}.total |grep http://www.chevere.pe/welcome/registro/game/gmovil/112233 | wc -l >> diario${AYER}${SEMANA}.txt
cat diario${SEMANA}${AYER}.total |grep http://wap.toing.com.pe/landingwap/?origem=MADNET_ONMOVI_MOV_SEXY_SEX1 | wc -l >> diario${AYER}${SEMANA}.txt
####################POSICION 9#################################
cat diario${SEMANA}${AYER}.total |grep http://portales-cl.3gmotion.cl/le/wap.asp?sitio=3774 | wc -l >> diario${AYER}${SEMANA}.txt
####################POSICION 10#################################
cat diario${SEMANA}${AYER}.total |grep http://portales-cl.3gmotion.cl/le/wap.asp?sitio=3773 | wc -l >> diario${AYER}${SEMANA}.txt

echo "SERVICIOS" >> diario${AYER}${SEMANA}.txt
cat diario${SEMANA}${AYER}.total  |grep http://pe.movistar.genexies.net | wc -l >> diario${AYER}${SEMANA}.txt
cat diario${SEMANA}${AYER}.total  |grep http://mcp-latam.zed.com/pe/juegos/?ma= | wc -l >> diario${AYER}${SEMANA}.txt
cat diario${SEMANA}${AYER}.total  |grep http://mcp-latam.zed.com/pe/videos/?ma= | wc -l >> diario${AYER}${SEMANA}.txt
cat diario${SEMANA}${AYER}.total  |grep http://mcp-latam.zed.com/pe/adultos/?ma= | wc -l >> diario${AYER}${SEMANA}.txt
cat diario${SEMANA}${AYER}.total  |grep /portalwap/noticias | wc -l >> diario${AYER}${SEMANA}.txt
cat diario${SEMANA}${AYER}.total  |grep portalwap/rbt | wc -l >> diario${AYER}${SEMANA}.txt
cat diario${SEMANA}${AYER}.total  |grep portalwap/redes-sociales | wc -l >> diario${AYER}${SEMANA}.txt
cat diario${SEMANA}${AYER}.total  |grep /portal515/ | wc -l >> diario${AYER}${SEMANA}.txt

echo "TEX LINK" >> diario${AYER}${SEMANA}.txt
cat diario${SEMANA}${AYER}.total |grep http://saper.vas-pass.com/?pid=29157 | wc -l >> diario${AYER}${SEMANA}.txt
cat diario${SEMANA}${AYER}.total |grep http://promoswap.enterfactory.com/ci/go/028069 | wc -l >> diario${AYER}${SEMANA}.txt
cat diario${SEMANA}${AYER}.total |grep http://m.paginasamarillas.com.pe | wc -l >> diario${AYER}${SEMANA}.txt
cat diario${SEMANA}${AYER}.total |grep http://m.facebook.com | wc -l >> diario${AYER}${SEMANA}.txt


echo "MUSICA" >> diario${AYER}${SEMANA}.txt
cat diario${SEMANA}${AYER}.total |grep 0/9241111/0/6/1/8400/xhtmlmp_touch/posInTop/1| wc -l >> diario${AYER}${SEMANA}.txt
cat diario${SEMANA}${AYER}.total |grep /0/10066997/0/6/2/8400/xhtmlmp_touch/posInTop/2 | wc -l >> diario${AYER}${SEMANA}.txt
cat diario${SEMANA}${AYER}.total |grep /0/264597/0/6/3/8400/xhtmlmp_touch/posInTop/3 | wc -l >> diario${AYER}${SEMANA}.txt
cat diario${SEMANA}${AYER}.total |grep k/0/9955716/0/6/4/8400/xhtmlmp_touch/posInTop/4 | wc -l >> diario${AYER}${SEMANA}.txt
cat diario${SEMANA}${AYER}.total |grep k/0/9777052/0/6/5/8400/xhtmlmp/posInTop/5 | wc -l >> diario${AYER}${SEMANA}.txt

echo "JUEGOS" >> diario${AYER}${SEMANA}.txt
cat diario${SEMANA}${AYER}.total |grep iid=211825 | wc -l >> diario${AYER}${SEMANA}.txt
cat diario${SEMANA}${AYER}.total |grep nid=4514   | wc -l >> diario${AYER}${SEMANA}.txt
cat diario${SEMANA}${AYER}.total |grep iid=100315 | wc -l >> diario${AYER}${SEMANA}.txt
cat diario${SEMANA}${AYER}.total |grep nid=161150 | wc -l >> diario${AYER}${SEMANA}.txt

#rm  $pathscripts/diario${SEMANA}${AYER}.total




####################REPORTE DIARIO IMPRESIONES BANNERS HOME#################################

cat $path/${AYER}*.banners > $path/banners${SEMANA}${AYER}.moso
cp  $path/banners${SEMANA}${AYER}.moso  $pathscripts
rm  $path/banners${SEMANA}${AYER}.moso



scp root@10.10.191.101:/root/CDRs/banners${SEMANA}${AYER}.p515 $pathscripts
cat banners${SEMANA}${AYER}.moso banners${SEMANA}${AYER}.p515 > banners${SEMANA}${AYER}.total
rm  $pathscripts/banners${SEMANA}${AYER}.moso
rm  $pathscripts/banners${SEMANA}${AYER}.p515

echo "BANNERS" >> banners${AYER}${SEMANA}.txt


cat banners${SEMANA}${AYER}.total |grep 1.1 | wc -l >> banners${AYER}${SEMANA}.txt
cat banners${SEMANA}${AYER}.total |grep 1.2 | wc -l >> banners${AYER}${SEMANA}.txt
#cat banners${SEMANA}${AYER}.total |grep 1.3 | wc -l >> banners${AYER}${SEMANA}.txt
cat banners${SEMANA}${AYER}.total |grep 2.1 | wc -l >> banners${AYER}${SEMANA}.txt
cat banners${SEMANA}${AYER}.total |grep 2.2 | wc -l >> banners${AYER}${SEMANA}.txt
#cat banners${SEMANA}${AYER}.total |grep 3.1 | wc -l >> banners${AYER}${SEMANA}.txt
cat banners${SEMANA}${AYER}.total |grep 3.2 | wc -l >> banners${AYER}${SEMANA}.txt
cat banners${SEMANA}${AYER}.total |grep 3.3 | wc -l >> banners${AYER}${SEMANA}.txt
#cat banners${SEMANA}${AYER}.total |grep 4.1 | wc -l >> banners${AYER}${SEMANA}.txt
cat banners${SEMANA}${AYER}.total |grep 4.3 | wc -l >> banners${AYER}${SEMANA}.txt
cat banners${SEMANA}${AYER}.total |grep 5.1 | wc -l >> banners${AYER}${SEMANA}.txt
cat banners${SEMANA}${AYER}.total |grep 5.2 | wc -l >> banners${AYER}${SEMANA}.txt
cat banners${SEMANA}${AYER}.total |grep 6.1 | wc -l >> banners${AYER}${SEMANA}.txt
cat banners${SEMANA}${AYER}.total |grep 6.2 | wc -l >> banners${AYER}${SEMANA}.txt
cat banners${SEMANA}${AYER}.total |grep 7.1 | wc -l >> banners${AYER}${SEMANA}.txt
cat banners${SEMANA}${AYER}.total |grep 8.1 | wc -l >> banners${AYER}${SEMANA}.txt
cat banners${SEMANA}${AYER}.total |grep 8.2 | wc -l >> banners${AYER}${SEMANA}.txt
cat banners${SEMANA}${AYER}.total |grep 9.1 | wc -l >> banners${AYER}${SEMANA}.txt
cat banners${SEMANA}${AYER}.total |grep 10.1 | wc -l >> banners${AYER}${SEMANA}.txt




rm  $pathscripts/banners${SEMANA}${AYER}.total





cat ${semana_pasada}${YEAR}.total | awk -F"," '{ "," print $6 "," $8 }'| sort | uniq -c | sort -r >> perfiles${YEAR}${semana_pasada}.txt
cat ${semana_pasada}${YEAR}.total | awk -F"," '{ "," print $7 }' | sort | uniq -c | sort -r >> enlaces${YEAR}${semana_pasada}.txt


