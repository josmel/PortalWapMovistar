#!/bin/bash

# Variables de entorno
path="/var/log/portalwap"
pathscripts="/root/CDRs"

### ----- GENERAR ARCHIVO DIARIO DE CDRs  ----- ###

AYER=$(($(date +%Y%m%d) -1))
SEMANA=$(date +%V)

cat $path/${AYER}*.moso > $path/diario${SEMANA}${AYER}.p515
cp  $path/diario${SEMANA}${AYER}.p515  $pathscripts
rm  $path/diario${SEMANA}${AYER}.p515

### ----- GENERAR ARCHIVO DIARIO DE IMPRESIONES DE BANNERS  ----- ###

cat $path/${AYER}*.banners > $path/banners${SEMANA}${AYER}.p515
cp  $path/banners${SEMANA}${AYER}.p515  $pathscripts
rm  $path/banners${SEMANA}${AYER}.p515







