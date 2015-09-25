#!/bin/bash

# Variables de entorno
path="/var/log/portalwap"
pathscripts="/root/CDRs"

######################### ----- REPORTE SEMANAL DE PERFILES Y ENLACES ----- ######################### 
YEAR=$(date +%Y)
semana_pasada=$(($(date +%V) -1))

cat $pathscripts/diario${semana_pasada}*.total > ${semana_pasada}${YEAR}.total
rm $pathscripts/diario${semana_pasada}*.total

cat ${semana_pasada}${YEAR}.total | awk -F"," '{ print $7 "," $9 }'| sort | uniq -c | sort -r >> perfiles${YEAR}${semana_pasada}.txt
cat ${semana_pasada}${YEAR}.total | awk -F"," '{ print $8 }' | sort | uniq -c | sort -r >> enlaces${YEAR}${semana_pasada}.txt


######################### ----- GUARDAR  LOS USUARIOS Y VISITAS POR SEMANA ----- ######################### 
Visitas=$(cat ${semana_pasada}${YEAR}.total |wc -l)
Usuarios=$(cat ${semana_pasada}${YEAR}.total | awk -F"," '{ print $6 }'| sort | uniq -c |wc -l)
echo "DATO SEMANAL" >>  consolidado${YEAR}${semana_pasada}.txt
echo "SEMANA,VISITAS,USUARIOS" >>  consolidado${YEAR}${semana_pasada}.txt
echo ${semana_pasada}","${Visitas}","${Usuarios} >>  consolidado${YEAR}${semana_pasada}.txt
rm $pathscripts/${semana_pasada}${YEAR}.total