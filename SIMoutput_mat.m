tic;
disp 'outputting as .mat...' 
outputfile=get(handles.edit3, 'string');  % read output file path

if exist(outputfile) ~=2  % check the length of output
    i = 1;
else
    load(outputfile);
    i = size(output.summary.channel1,1)+1;  % newline for existing files
end

output.summary_name(1,1) = "channel1";
output.summary_name(1,2) = "threshold1";
output.summary_name(1,3) = "small1";
output.summary_name(1,4) = "large1";
output.summary_name(1,5) = "intensitycutoff1";
output.summary_name(1,6) = "areacutoff1";
output.summary_name(1,7) = "sdsdcutoff1";
output.summary_name(1,8) = "density1";
output.summary_name(1,9) = "n of channel1";
output.summary_name(1,10) = "mean size of channel1";
output.summary_name(1,11) = "area of channel1";
output.summary_name(1,12) = "channelr";
output.summary_name(1,13) = "thresholdr";
output.summary_name(1,14) = "smallr";
output.summary_name(1,15) = "larger";
output.summary_name(1,16) = "intensitycutoffr";
output.summary_name(1,17) = "areacutoffr";
output.summary_name(1,18) = "sdsdcutoffr";
output.summary_name(1,19) = "densityr";
output.summary_name(1,20) = "n of reference";
output.summary_name(1,21) = "mean size of reference";
output.summary_name(1,22) = "area of reference";
output.summary_name(1,23) = "scalex";
output.summary_name(1,24) = "scaley";
output.summary_name(1,25) = "scalez";
output.summary_name(1,26) = "width";
output.summary_name(1,27) = "height";
output.summary_name(1,28) = "page";
output.summary_name(1,29) = "imagearea (um)";
output.summary_name(1,30) = "overlaped area (um)";
output.summary_name(1,31) = "randomnized overlappedarea (um)";
output.summary_name(1,32) = "skeletonlength1";
output.summary_name(1,33) = "skeletonlengthr";
output.summary_name(1,34) = "distance_binnum";
output.summary_name(1,35) = "distance_startpoint";
output.summary_name(1,36) = "distance_endpoint";

output.name_overlap_p(1,1) = 0;
output.name_overlap_p(1,2:length(overlap_binstep_percentage)+1) = overlap_binstep_percentage;

output.name_overlap_a(1,1) = 0;
output.name_overlap_a(1,2:length(overlap_binstep_absolute)+1) = overlap_binstep_absolute;

output.name_overlap_size(1,1) = 0;
output.name_overlap_size(1,2:length(overlap_binstep_percentage)+1) = overlap_binstep_percentage;

output.name_overlap_intensity(1,1) = 0;
output.name_overlap_intensity(1,2:length(overlap_binstep_percentage)+1) = overlap_binstep_percentage;

output.name_Roverlap_p(1,1) = 0;
output.name_Roverlap_p(1,2:length(overlap_binstep_percentage)+1) = overlap_binstep_percentage;

output.name_Roverlap_size(1,1) = 0;
output.name_Roverlap_size(1,2:length(overlap_binstep_percentage)+1) = overlap_binstep_percentage;

output.name_Roverlap_intensity(1,1) = 0;
output.name_Roverlap_intensity(1,2:length(overlap_binstep_percentage)+1) = overlap_binstep_percentage;



    
    
    output.summary.channel1(i,:) = c1;    
    output.summary.threshold1(i,:) = threshold1;
    output.summary.small1(i,:) = small1;
    output.summary.large1(i,:) = large1;
    output.summary.intensitycutoff1(i,:) = intensitycutoff1;
    output.summary.areacutoff1(i,:) = areacutoff1;
    output.summary.sdsdcutoff1(i,:) = sdsdcutoff1;
    output.summary.density1(i,:) = density1;
    output.summary.num1(i,:) = num1;
    output.summary.size1(i,:) = size1;
    output.summary.sumarea1(i,:) = sumarea1 ;
    output.summary.channelr(i,:) = cr;
    output.summary.thresholdr(i,:) = thresholdr;
    output.summary.smallr(i,:) = smallr;
    output.summary.larger(i,:) = larger;
    output.summary.intensitycutoffr(i,:) = intensitycutoffr;
    output.summary.areacutoffr(i,:) = areacutoffr;
    output.summary.sdsdcutoffr(i,:) = sdsdcutoffr;
    output.summary.densityr(i,:) = densityr;
    output.summary.numr(i,:) = numr;
    output.summary.sizer(i,:) = sizer;
    output.summary.sumarear(i,:) = sumarear;
    output.summary.scalex(i,:) = scalex;
    output.summary.scaley(i,:) = scaley;
    output.summary.scalez(i,:) = scalez;
    output.summary.width(i,:) = width1;
    output.summary.height(i,:) = height1;
    output.summary.page(i,:) = page1;
    output.summary.volume(i,:) = volume;
    output.summary.sumoverlap(i,:) = sumoverlap;
    output.summary.rsumoverlap(i,:) = rsumoverlap;
    output.summary.skeletonlength1(i,:) = skeletonlength1;
    output.summary.skeletonlengthr(i,:) = skeletonlengthr;
    output.summary.distance_binnum(i,:) = distance_binnum;
    output.summary.distance_startpoint(i,:) = distance_startpoint;
    output.summary.distance_endpoint(i,:) = distance_endpoint;

    output.overlap_p(i,1) = bin_overlap_zero_percentage;
    output.overlap_p(i,2:length(bin_overlap_percentage)+1) = bin_overlap_percentage;
    
    output.overlap_a(i,1) = bin_overlap_zero_absolute;
    output.overlap_a(i,2:length(bin_overlap_absolute)+1) = bin_overlap_absolute;

    output.overlap_size(i,1) = bin_overlap_zero_area_percentage;
    output.overlap_size(i,2:length(bin_overlap_area_percentage)+1) = bin_overlap_area_percentage;

    output.overlap_intensity(i,1) = rbin_overlap_zero_intensity_percentage;
    output.overlap_intensity(i, 2:length(rbin_overlap_intensity_percentage)+1) = rbin_overlap_intensity_percentage;

    output.Roverlap_p(i,1) = rbin_overlap_zero_percentage;
    output.Roverlap_p(i, 2:length(rbin_overlap_percentage)+1) = rbin_overlap_percentage;

    output.Roverlap_size(i,1) = rbin_overlap_zero_area_percentage;
    output.Roverlap_size(i, 2:length(rbin_overlap_area_percentage)+1) = rbin_overlap_area_percentage;

    output.Roverlap_intensity(i,1) = rbin_overlap_zero_intensity_percentage;
    output.Roverlap_intensity(i, 2:length(rbin_overlap_intensity_percentage)+1) = rbin_overlap_intensity_percentage;
    
    output.area1(i,1:length(area1)) = area1;
    output.arear(i,1:length(arear)) = arear;
    output.intensity1(i,1:length(intensity1)) = intensity1;
    output.intensityr(i,1:length(intensityr)) = intensityr;
    
    
save(string(outputfile), 'output');    
disp 'output finished' 
    















