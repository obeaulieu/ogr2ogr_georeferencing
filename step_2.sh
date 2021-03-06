#! /bin/sh

# Second Step
# re-georeference landslide shapefiles


mkdir ../landslides_georeferenced_second_step
outdir=../landslides_georeferenced_second_step

for landslide in `ls *.shx/*.{shp,shx,dbf}`
do
   # echo $landslide
    input=$landslide
    filename=$(basename "$landslide")
    extension="${filename##*.}"
    filename="${filename%.*}"
    #echo $filename 
    #echo $extension
    output=$outdir/$filename.$extension
    echo $output
    ogr2ogr -progress -f "ESRI Shapefile" -a_srs EPSG:32601 -order 1 -tps -gcp 1804.9 -2547.43 1.89162 0.234859 -gcp 2128.71 -2656.07 2.16384 0.145588 -gcp 3960.72 -967.926 3.71832 1.59106 -gcp 4000.64 -2072.08 3.7351 0.653018 -gcp 1120.03 -377.302 1.21922 2.13016 -gcp 857.521 -1566.87 1.02442 1.04713 -gcp 3231.96 -173.946 3.1063 2.29105 -gcp 94.9106 -1297.07 0.266975 1.28472 -gcp 2610.06 -140.977 2.5608 2.31321 -gcp 3433.98 -1028.85 3.26867 1.53613 -gcp 1115.17 -970.144 1.23707 1.58457 -gcp 2838.93 -1077.15 2.75497 1.48969 $output $input
done
