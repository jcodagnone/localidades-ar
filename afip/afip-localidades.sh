#!/bin/bash

wget http://www.afip.gov.ar/genericos/guiavirtual/archivos/localidades.pdf
pdftotext localidades.pdf

cat localidades.txt|
sed s//'\n\n'/g|
python afip-localidades.py |
sed 1d|
awk 'BEGIN {FS="\t"; OFS="\t"}{
        print $4,$2, $1, $3
}' |
sed -e "s/^SALTA/A/g" -e "s/^BUENOS AIRES/B/g" \
    -e "s/^CIUDAD AUTONOMA BUENOS AIRES/C/g" \
    -e "s/^SAN LUIS/D/g" -e "s/^ENTRE RIOS/E/g"  \
    -e "s/^LA RIOJA/F/g" -e "s/^SANTIAGO DEL ESTERO/G/g" \
    -e "s/^CHACO/H/g" -e "s/^SAN JUAN/J/g" -e "s/^CATAMARCA/K/g" \
    -e "s/^LA PAMPA/L/g" -e "s/^MENDOZA/M/g" -e "s/^MISIONES/N/g" \
    -e "s/^FORMOSA/P/g" -e "s/^NEUQUEN/Q/g" -e "s/^RIO NEGRO/R/g" \
    -e "s/^SANTA FE/S/g" -e "s/^TUCUMAN/T/g" -e "s/^CHUBUT/U/g"  \
    -e "s/^TIERRA DEL FUEGO/V/g" -e "s/^CORRIENTES/W/g"  \
    -e "s/^CORDOBA/X/g" -e "s/^JUJUY/Y/g" -e "s/^SANTA CRUZ/Z/g"|
sort > localidades.csv

rm localidades.txt localidades.pdf
