#!/bin/bash

DATESHORT=$(date +%Y%m%d)
RELEASEDIR="CACIO-"$(date +%Y%m%d-%H%M%S)
mkdir $RELEASEDIR
cd ../Layout && sh zip_artwork.sh && cd -
cp ../Schematic/cacio.pdf $RELEASEDIR/ME0_CACIO_SCHEMATIC_$DATESHORT.pdf
cp ../Schematic/ME0_CACIO_BOM.xlsx $RELEASEDIR/
cp ../Layout/ME0_CACIO_ARTWORK.pdf $RELEASEDIR/ME0_CACIO_ARTWORK_$DATESHORT.pdf
cp ../Layout/cacio_artwork.zip $RELEASEDIR/
zip -FS -r cacio_project.zip ../Layout ../Schematic ../Padstacks ../Footprints && mv cacio_project.zip $RELEASEDIR/

cd $RELEASEDIR
mkdir ODB
tar xzvf ../../Layout/odbjob.tgz -C ./ODB/
zip -r cacio_odb.zip ODB
rm -r ODB
cd -

