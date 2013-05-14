#!/bin/bash

mv images images.orig
mkdir images
cd images.orig
for X in img*
do
    convert $X -resize 600x600 ../images/${X}
done
cd ..
cp images.orig/cover.jpg images
rm -f david-copperfield.zip
zip -r david-copperfield.zip david-copperfield_pg.html images david-copperfield_utf8.txt david-copperfield_lat1.txt
rm -rf images
mv images.orig images
