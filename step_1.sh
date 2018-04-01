#! /bin/sh

# First Step
# re-georeference landslide shapefiles
# going in reverse order

mkdir ../landslides_georeferenced_first_step
outdir=../landslides_georeferenced_first_step

for landslide in `ls *.{shp,shx,dbf}` 
do
    echo $landslide
    input=$landslide
    filename="${landslide%}"
    output=$outdir/$filename
    echo $output
    ogr2ogr -progress -f "ESRI Shapefile" -a_srs EPSG:32601 -order 1 -tps -gcp 1.89162 0.234859 1.84417 0.233255 -gcp 2.16384 0.145588 2.12605 0.138658 -gcp 3.71832 1.59106 3.72477 1.60235 -gcp 3.7351 0.653018 3.75948 0.645148 -gcp 1.21922 2.13016 1.24679 2.11416 -gcp 1.02442 1.04713 1.01687 1.08332 -gcp 3.1063 2.29105 3.08848 2.29044 -gcp 0.266975 1.28472 0.352323 1.31691 -gcp 2.5608 2.31321 2.54641 2.31872 -gcp 3.26867 1.53613 3.2646 1.54979 -gcp 1.23707 1.58457 1.24185 1.5999 -gcp 2.75497 1.48969 2.7456 1.508 $output $input
done
