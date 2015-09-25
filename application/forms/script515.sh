#!/bin/bash

# Variables de entorno
path="/var/log/portalwap"
pathscripts="/root/CDRs"

#######################################################################
DIA=$(date +%Y%m%d)
YEAR=$(date +%Y)
AYER=$(($(date +%Y%m%d) -1))
semana_pasada=$(($(date +%V) -1))

cat $path/${semana_pasada}${YEAR}*.moso > $path/${semana_pasada}${YEAR}.p515
cp  $path/${semana_pasada}${YEAR}.p515  $pathscripts
rm  $path/${semana_pasada}${YEAR}.p515