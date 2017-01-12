echo "TeamAA"
echo "12 January 2017"
echo "Calculate LandSat NDVI"


fn="../data/LE71700552001036SGS00_SR_Gewata_INT1U.tif"
outfn="../data/ndvi.tif"
echo "calculate ndvi"
gdal_calc.py -A $fn --A_band=4 -B $fn --B_band=3 --outfile=$outfn --calc="(A.astype(float)-B)/(A.astype(float)+B)" --type='Float32'

echo "reproject raster and resample"
outfn_proj_res="../data/ndvi_wgs_res.tif"
gdalwarp -t_srs EPSG:4326 -ts 60 60 -r cubic  $outfn $outfn_proj_res


 