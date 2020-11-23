%% read parameters
disp '0. starting...'
c1=get(handles.edit1, 'string'); 
cr=get(handles.edit2, 'string');  
outputfile=get(handles.edit3, 'string');  
small1=str2double(get(handles.edit6, 'string')); 
smallr=str2double(get(handles.edit7, 'string'));
large1=str2double(get(handles.edit8, 'string'));
larger=str2double(get(handles.edit9, 'string'));
removet=str2double(get(handles.edit19, 'string'));
removeb=str2double(get(handles.edit18, 'string'));
scalex=str2double(get(handles.edit14, 'string'));
scaley=str2double(get(handles.edit15, 'string'));
scalez=str2double(get(handles.edit16, 'string'));

overlap_percentage_startpoint=str2double(get(handles.edit62, 'string'));
overlap_percentage_endpoint=str2double(get(handles.edit61, 'string'));
overlap_percentage_binnum=str2double(get(handles.edit60, 'string'));
overlap_absolute_startpoint=str2double(get(handles.edit59, 'string'));
overlap_absolute_endpoint=str2double(get(handles.edit58, 'string'));
overlap_absolute_binnum=str2double(get(handles.edit57, 'string'));
distance_startpoint=str2double(get(handles.edit11, 'string'));
distance_endpoint=str2double(get(handles.edit12, 'string'));
distance_binnum=str2double(get(handles.edit13, 'string'));

intensitycutoff1=str2double(get(handles.edit25, 'string'));
areacutoff1=str2double(get(handles.edit26, 'string'));
sdsdcutoff1=str2double(get(handles.edit34, 'string'));
intensitycutoffr=str2double(get(handles.edit32, 'string'));
areacutoffr=str2double(get(handles.edit33, 'string'));
sdsdcutoffr=str2double(get(handles.edit35, 'string'));
radiusx=str2double(get(handles.edit45, 'string'));
radiusy=str2double(get(handles.edit46, 'string'));
radiusz=str2double(get(handles.edit47, 'string'));
repeattimes=str2double(get(handles.edit48, 'string'));
overlapthreshold_percentage=str2double(get(handles.edit37, 'string'));
overlapthreshold_absolute=str2double(get(handles.edit52, 'string'));
distancethreshold_close=str2double(get(handles.edit51, 'string'));
distancethreshold_far=str2double(get(handles.edit53, 'string'));
convolution_xy=str2double(get(handles.edit63, 'string'));
convolution_z=str2double(get(handles.edit64, 'string'));

if get(handles.radiobutton1, 'value')==1   
    threshold1=str2double(get(handles.edit4, 'string'));
else
    threshold1=str2double(get(handles.edit30, 'string'));
end

if get(handles.radiobutton2, 'value')==1 
    thresholdr=str2double(get(handles.edit5, 'string'));
else
    thresholdr=str2double(get(handles.edit31, 'string'));
end

if get(handles.radiobutton3, 'value')==1 
    maskoutputpath=get(handles.edit36, 'string');   
    maskcheck=1;
else
    maskcheck=0;
end

if get(handles.radiobutton10, 'value')==1 
    lengthcheck=1;
else    
    lengthcheck=0;
end

if get(handles.radiobutton11, 'value')==1 
    gaussiancheck=1;
    sigma=str2double(get(handles.edit44, 'string'));
else    
    gaussiancheck=0;
end

if isempty(outputfile)==0
    if ~contains(outputfile,'.xls') && ~contains(outputfile,'.xlsx') && ~contains(outputfile,'.mat')  
        msgbox('output file is not xls or xlsx!')
        pause
    end
end

assignin('base','c1',c1);  
assignin('base','cr',cr);
assignin('base','outputfile',outputfile);
assignin('base','small1',small1);
assignin('base','smallr',smallr);
assignin('base','large1',large1);
assignin('base','larger',larger);
assignin('base','removet',removet);
assignin('base','removeb',removeb);
assignin('base','scalex',scalex);
assignin('base','scaley',scaley);
assignin('base','scalez',scalez);

assignin('base','overlap_percentage_startpoint',overlap_percentage_startpoint);
assignin('base','overlap_percentage_endpoint',overlap_percentage_endpoint);
assignin('base','overlap_percentage_binnum',overlap_percentage_binnum);
assignin('base','overlap_absolute_startpoint',overlap_absolute_startpoint);
assignin('base','overlap_absolute_endpoint',overlap_absolute_endpoint);
assignin('base','overlap_absolute_binnum',overlap_absolute_binnum);
assignin('base','distance_startpoint',distance_startpoint);
assignin('base','distance_endpoint',distance_endpoint);
assignin('base','distance_binnum',distance_binnum);

assignin('base','intensitycutoff1',intensitycutoff1);
assignin('base','areacutoff1',areacutoff1);
assignin('base','sdsdcutoff1',sdsdcutoff1);
assignin('base','intensitycutoffr',intensitycutoffr);
assignin('base','areacutoffr',areacutoffr);
assignin('base','sdsdcutoffr',sdsdcutoffr);
assignin('base','radiusx',radiusx);
assignin('base','radiusy',radiusy);
assignin('base','radiusz',radiusz);
assignin('base','repeattimes',repeattimes);
assignin('base','overlapthreshold_percentage',overlapthreshold_percentage);
assignin('base','overlapthreshold_absolute',overlapthreshold_absolute);
assignin('base','distancethreshold_close',distancethreshold_close);
assignin('base','distancethreshold_far',distancethreshold_far);
assignin('base','threshold1',threshold1);
assignin('base','thresholdr',thresholdr);
assignin('base','lengthcheck',lengthcheck);
assignin('base','gaussiancheck',gaussiancheck);

%% load file 
tic; 
[page1,width1,height1,image1]=Fileread(c1,removeb,removet);  
[pager,widthr,heightr,imager]=Fileread(cr,removeb,removet);
assignin('base','page1',page1);
assignin('base','image1',image1);
if (page1~=pager) || (width1 ~=widthr)|| (height1 ~=heightr)
   msgbox('Figure dimension does not match! program stopped!')   
   pause
end
volume=page1*height1*width1*scalex*scaley*scalez; 
image1=double(image1); 
imager=double(imager);

assignin('base','page1',page1);
assignin('base','width1',width1);
assignin('base','height1',height1);
assignin('base','volume',volume);
assignin('base','image1',image1);
assignin('base','pager',pager);
assignin('base','widthr',widthr);
assignin('base','heightr',heightr);
assignin('base','imager',imager);

disp '1. image loading completed'
toc;   
   
%% binary transform and size filter
tic;
if get(handles.radiobutton1, 'value')==1 
    [binary1]=TwoDotsu(image1,height1,width1,page1,threshold1);    
else
    binary1=image1>threshold1; 
end
binary1=xor(bwareaopen(binary1,small1),bwareaopen(binary1,large1)); 
if get(handles.radiobutton2, 'value')==1   
    [binaryr]=TwoDotsu(imager,heightr,widthr,pager,thresholdr);  
else
    binaryr=imager>thresholdr;     
end
binaryr=xor(bwareaopen(binaryr,smallr),bwareaopen(binaryr,larger)); 

disp '2. binary transformation completed'
toc;
   
%% find the center, intensity and volume of the objects in channels
tic;
[intensity1,area1,sdintensity1,list1,x,y,z]=Objectproperty(image1,binary1,threshold1,scalex,scaley,scalez); 
[intensityr,arear,sdintensityr,listr,xr,yr,zr]=Objectproperty(imager,binaryr,thresholdr,scalex,scaley,scalez); % xr yr zr are not used

disp '3. object finding completed'
toc;

%% further filter of channels
tic;
[intensity1,area1,list1,x,y,z,binary1]=Objectfilter(list1,intensity1,...
    intensitycutoff1,sdintensity1,sdsdcutoff1,area1,areacutoff1,x,y,z,...
    height1,width1,page1);
[intensityr,arear,listr,xr,yr,zr,binaryr]=Objectfilter(listr,intensityr,...
    intensitycutoffr,sdintensityr,sdsdcutoffr,arear,areacutoffr,xr,yr,zr,...
    heightr,widthr,pager);
size1=mean(area1);
sumarea1=sum(area1);
density1=numel(list1)/volume; 
num1=numel(list1);
set(handles.text37,'string',density1);
sizer=mean(arear);
sumarear=sum(arear);
densityr=numel(listr)/volume; 
set(handles.text45,'string',densityr);
numr=numel(listr);
pause(1);

assignin('base','intensity1',intensity1);
assignin('base','area1',area1);
assignin('base','sdintensity1',sdintensity1);
assignin('base','list1',list1);
assignin('base','x',x);
assignin('base','y',y);
assignin('base','z',z);
assignin('base','binary1',binary1);
assignin('base','sdintensityr',sdintensityr);
assignin('base','area1',area1);
assignin('base','sdintensityr',sdintensityr);
assignin('base','listr',listr);
assignin('base','xr',xr);
assignin('base','yr',yr);
assignin('base','zr',zr);
assignin('base','binaryr',binaryr);
assignin('base','size1',size1);
assignin('base','sumarea1',sumarea1);
assignin('base','density1',density1);
assignin('base','num1',num1);
assignin('base','sizer',sizer);
assignin('base','sumarear',sumarear);
assignin('base','densityr',densityr);
assignin('base','numr',numr);
disp '4. further object filtercompleted'
toc;

%% overlap binning for actual image
tic;
[sumoverlap,overlap1_percentage,overlap1_absolute]=Findoverlap(list1, binaryr,scalex,scaley,scalez); 
[overlap_binstep_percentage,bin_overlap_zero_percentage,bin_overlap_zero_intensity_percentage,bin_overlap_zero_area_percentage,...
    bin_overlap_percentage,bin_overlap_intensity_percentage,bin_overlap_area_percentage]=...
    Binning(overlap_percentage_binnum,overlap_percentage_startpoint,overlap_percentage_endpoint,overlap1_percentage,intensity1,area1);
[overlap_binstep_absolute,bin_overlap_zero_absolute,~,~,bin_overlap_absolute,~,~]=...
    Binning(overlap_absolute_binnum,overlap_absolute_startpoint,overlap_absolute_endpoint,overlap1_absolute,intensity1,area1);
[intensityC1inCr]=ROIintensity(listr,image1); 

assignin('base','sumoverlap',sumoverlap);
assignin('base','overlap1_percentage',overlap1_percentage);
assignin('base','overlap1_absolute',overlap1_absolute);
assignin('base','overlap_binstep_percentage',overlap_binstep_percentage);
assignin('base','bin_overlap_zero_percentage',bin_overlap_zero_percentage);
assignin('base','bin_overlap_zero_intensity_percentage',bin_overlap_zero_intensity_percentage);
assignin('base','bin_overlap_zero_area_percentage',bin_overlap_zero_area_percentage);
assignin('base','bin_overlap_percentage',bin_overlap_percentage);
assignin('base','bin_overlap_intensity_percentage',bin_overlap_intensity_percentage);
assignin('base','bin_overlap_area_percentage',bin_overlap_area_percentage);
assignin('base','overlap_binstep_absolute',overlap_binstep_percentage);
assignin('base','bin_overlap_zero_absolute',bin_overlap_zero_absolute);
assignin('base','bin_overlap_absolute',bin_overlap_absolute);

disp '5. overlap calculation for actual objects completed'
toc;
%% distance calculation
tic;

distance_matrixr=Distance_Transformation_3D(binaryr,scalex,scalez); 
distance_matrix1=Distance_Transformation_3D(binary1,scalex,scalez);
[distance_allpixel1,distance_average1,distance_min1,distance_max1]=Distance(distance_matrixr,list1); 

diffusion_map=Generate_Diffusion_Map(binary1, convolution_xy, convolution_z);

bin_distance_allpixel=histcounts(distance_allpixel1,distance_binnum,'BinLimits',[distance_startpoint,distance_endpoint]);

[distance_binstep_average,bin_distance_zero_average,bin_distance_zero_intensity_average,bin_distance_zero_area_average,...
    bin_distance_average,bin_distance_intensity_average,bin_distance_area_average]=...
    Binning(distance_binnum,distance_startpoint,distance_endpoint,distance_average1,intensity1,area1);
[~,bin_distance_zero_min,~,~,bin_distance_min,~,~]=...
    Binning(distance_binnum,distance_startpoint,distance_endpoint,distance_min1,intensity1,area1);
[~,bin_distance_zero_max,~,~,bin_distance_max,~,~]=...
    Binning(distance_binnum,distance_startpoint,distance_endpoint,distance_max1,intensity1,area1);

assignin('base','distance_matrixr',distance_matrixr);
assignin('base','distance_allpixel1',distance_allpixel1);
assignin('base','distance_average1',distance_average1);
assignin('base','distance_min1',distance_min1);
assignin('base','distance_max1',distance_max1);
assignin('base','bin_distance_allpixel',bin_distance_allpixel);
assignin('base','distance_binstep_average',distance_binstep_average);
assignin('base','bin_distance_zero_average',bin_distance_zero_average);
assignin('base','bin_distance_zero_intensity_average',bin_distance_zero_intensity_average);
assignin('base','bin_distance_zero_area_average',bin_distance_zero_area_average);
assignin('base','bin_distance_average',bin_distance_average);
assignin('base','bin_distance_intensity_average',bin_distance_intensity_average);
assignin('base','bin_distance_area_average',bin_distance_area_average);
assignin('base','bin_distance_zero_min',bin_distance_zero_min);
assignin('base','bin_distance_min',bin_distance_min);
assignin('base','bin_distance_zero_max',bin_distance_zero_max);
assignin('base','bin_distance_max',bin_distance_max);


%distance_matrix1=Distancetransformation_3D(binary1,scalex,scalez); % generate distance map for channel1
%[distance_allpixelr,distance_averager,distance_minr,distance_maxr]=Distance(distance_matrix1,listr); % generate the distance data from reference to channel1
%distance_allpixel1_bin=histcounts(distance_allpixel1,distance_binnum,'normalization','probability','BinLimits',[distance_startpoint,distance_endpoint]);
%distance_average1_bin=histcounts(distance_average1,distance_binnum,'normalization','probability','BinLimits',[distance_startpoint,distance_endpoint]);
%distance_min1_bin=histcounts(distance_min1,distance_binnum,'normalization','probability','BinLimits',[distance_startpoint,distance_endpoint]);
%distance_max1_bin=histcounts(distance_max1,distance_binnum,'normalization','probability','BinLimits',[distance_startpoint,distance_endpoint]);
%distance_allpixelr_bin=histcounts(distance_allpixelr,distance_binnum,'normalization','probability','BinLimits',[distance_startpoint,distance_endpoint]);
%distance_averager_bin=histcounts(distance_averager,distance_binnum,'normalization','probability','BinLimits',[distance_startpoint,distance_endpoint]);
%distance_minr_bin=histcounts(distance_minr,distance_binnum,'normalization','probability','BinLimits',[distance_startpoint,distance_endpoint]);
%distance_maxr_bin=histcounts(distance_maxr,distance_binnum,'normalization','probability','BinLimits',[distance_startpoint,distance_endpoint]);
disp '6. distance calculation for actual objects completed' 
toc;

%% overlap and distance for randomnized image
tic;
%[sumroverlap,rbinoverlap1zero,rbinoverlap1zerointensity,rbinoverlap1zeroarea,rbinoverlap1,rbinoverlap1intensity,rbinoverlap1area]=randomnizedoverlap(...
   % repeattimes,list1,binaryr,scalex,scaley,scalez,radiusx,radiusy,radiusz,width1,height1,page1,...
  %  overlap_percentage_binnum,intensity1,area1);
if repeattimes>0 
    [randomlist1]=Generaterandomlist(list1,radiusx,radiusy,radiusz,width1,height1,page1,repeattimes);   
    parfor i=1:size(randomlist1,1)
        [rsumoverlap(i,:),roverlap1_percentage(i,:),roverlap1_absolute(i,:)]=Findoverlap(randomlist1(i,:),binaryr,scalex,scaley,scalez);         
        
        [~,rbin_overlap_zero_percentage(i,:),rbin_overlap_zero_intensity_percentage(i,:),rbin_overlap_zero_area_percentage(i,:),...
        rbin_overlap_percentage(i,:),rbin_overlap_intensity_percentage(i,:),rbin_overlap_area_percentage(i,:)]=...
        Binning(overlap_percentage_binnum,overlap_percentage_startpoint,overlap_percentage_endpoint,roverlap1_percentage(i,:),intensity1,area1);    
        [~,rbin_overlap_zero_absolute(i,:),~,~,rbin_overlap_absolute(i,:),~,~]=...
        Binning(overlap_absolute_binnum,overlap_absolute_startpoint,overlap_absolute_endpoint,roverlap1_absolute(i,:),intensity1,area1);
         
        [rdistance_allpixel1(i,:),rdistance_average1(i,:),rdistance_min1(i,:),rdistance_max1(i,:)]=Distance(distance_matrixr,randomlist1(i,:)); 

        rbin_distance_allpixel(i,:)=histcounts(rdistance_allpixel1(i,:),distance_binnum,'BinLimits',[distance_startpoint,distance_endpoint]);
        [~,rbin_distance_zero_average(i,:),rbin_distance_zero_intensity_average(i,:),rbin_distance_zero_area_average(i,:),...
            rbin_distance_average(i,:),rbin_distance_intensity_average(i,:),rbin_distance_area_average(i,:)]=...
            Binning(distance_binnum,distance_startpoint,distance_endpoint,rdistance_average1(i,:),intensity1,area1);
        [~,rbin_distance_zero_min(i,:),~,~,rbin_distance_min(i,:),~,~]=...
            Binning(distance_binnum,distance_startpoint,distance_endpoint,rdistance_min1(i,:),intensity1,area1);
        [~,rbin_distance_zero_max(i,:),~,~,rbin_distance_max(i,:),~,~]=...
            Binning(distance_binnum,distance_startpoint,distance_endpoint,rdistance_max1(i,:),intensity1,area1);        
    end   
else
    randomlist1=list1;
    rsumoverlap=sumoverlap;
    rdistance_average1=distance_average1;
    rbin_overlap_zero_percentage=bin_overlap_zero_percentage;
    rbin_overlap_zero_intensity_percentage=bin_overlap_zero_intensity_percentage;
    rbin_overlap_zero_area_percentage=bin_overlap_zero_area_percentage;
    rbin_overlap_percentage=bin_overlap_percentage;
    rbin_overlap_intensity_percentage=bin_overlap_intensity_percentage;
    rbin_overlap_area_percentage=bin_overlap_area_percentage;
    rbin_overlap_zero_absolute=bin_overlap_zero_absolute;
    rbin_overlap_absolute=bin_overlap_absolute;

    rbin_distance_allpixel=bin_distance_allpixel;
    rbin_distance_zero_average=bin_distance_zero_average;
    rbin_distance_zero_intensity_average=bin_distance_zero_intensity_average;
    rbin_distance_zero_area_average=bin_distance_zero_area_average;
    rbin_distance_average=bin_distance_average;
    rbin_distance_intensity_average=bin_distance_intensity_average;
    rbin_distance_area_average=bin_distance_area_average;
    rbin_distance_zero_min=bin_distance_zero_min;
    rbin_distance_min=bin_distance_min;
    rbin_distance_zero_max=bin_distance_zero_max;
    rbin_distance_max=bin_distance_max;
end

rsumoverlap=mean(rsumoverlap,1);
rbin_overlap_zero_percentage=mean(rbin_overlap_zero_percentage,1);
rbin_overlap_zero_intensity_percentage=mean(rbin_overlap_zero_intensity_percentage,1);
rbin_overlap_zero_area_percentage=mean(rbin_overlap_zero_area_percentage,1);
rbin_overlap_percentage=mean(rbin_overlap_percentage,1);
rbin_overlap_intensity_percentage=mean(rbin_overlap_intensity_percentage,1);
rbin_overlap_area_percentage=mean(rbin_overlap_area_percentage,1);
rbin_overlap_zero_absolute=mean(rbin_overlap_zero_absolute,1);
rbin_overlap_absolute=mean(rbin_overlap_absolute,1);

rbin_distance_allpixel=mean(rbin_distance_allpixel,1);
rbin_distance_zero_average=mean(rbin_distance_zero_average,1);
rbin_distance_zero_intensity_average=mean(rbin_distance_zero_intensity_average,1);
rbin_distance_zero_area_average=mean(rbin_distance_zero_area_average,1);
rbin_distance_average=mean(rbin_distance_average,1);
rbin_distance_intensity_average=mean(rbin_distance_intensity_average,1);
rbin_distance_area_average=mean(rbin_distance_area_average,1);
rbin_distance_zero_min=mean(rbin_distance_zero_min,1);
rbin_distance_min=mean(rbin_distance_min,1);
rbin_distance_zero_max=mean(rbin_distance_zero_max,1);
rbin_distance_max=mean(rbin_distance_max,1);

assignin('base','rsumoverlap',rsumoverlap);
assignin('base','randomlist1',randomlist1);
assignin('base','rbin_overlap_zero_percentage',rbin_overlap_zero_percentage);
assignin('base','rbin_overlap_zero_intensity_percentage',rbin_overlap_zero_intensity_percentage);
assignin('base','rbin_overlap_zero_area_percentage',rbin_overlap_zero_area_percentage);
assignin('base','rbin_overlap_percentage',rbin_overlap_percentage);
assignin('base','rbin_overlap_intensity_percentage',rbin_overlap_intensity_percentage);
assignin('base','rbin_overlap_area_percentage',rbin_overlap_area_percentage);
assignin('base','rbin_overlap_zero_absolute',rbin_overlap_zero_absolute);
assignin('base','rbin_overlap_absolute',rbin_overlap_absolute);
assignin('base','rbin_distance_allpixel',rbin_distance_allpixel);
assignin('base','rbin_distance_zero_average',rbin_distance_zero_average);
assignin('base','rbin_distance_zero_intensity_average',rbin_distance_zero_intensity_average);
assignin('base','rbin_distance_zero_area_average',rbin_distance_zero_area_average);
assignin('base','rbin_distance_intensity_average',rbin_distance_intensity_average);
assignin('base','rbin_distance_area_average',rbin_distance_area_average);
assignin('base','rbin_distance_average',rbin_distance_average);

assignin('base','rbin_distance_zero_min',rbin_distance_zero_min);
assignin('base','rbin_distance_min',rbin_distance_min);
assignin('base','rbin_distance_zero_max',rbin_distance_zero_max);
assignin('base','rbin_distance_max',rbin_distance_max);

disp '7. calculation for locally randomnized objects completed' 
toc;  

%% skeltonization
tic;
if lengthcheck==1 
    if gaussiancheck==1 
        [binary1_G]=binary_image_gaussian(binary1,sigma);
        [binaryr_G]=binary_image_gaussian(binaryr,sigma);        
        disp '8.1 3D-gaussian filer completed'      
    else
        binary1_G=binary1;
        binaryr_G=binaryr;
    end
    [skeletonlength1,binary1_skeleton]=Skeletonlength(binary1_G,scalex,scalez); 
    [skeletonlengthr,binaryr_skeleton]=Skeletonlength(binaryr_G,scalex,scalez);    
    assignin('base','binary1_skeleton',binary1_skeleton);
    assignin('base','binaryr_skeleton',binaryr_skeleton);    
    disp '8.2 binary length of channelr completed'
else
    skeletonlength1=0;
    skeletonlengthr=0;
    disp '8.1 no skeletonization'   
end


assignin('base','skeletonlength1',skeletonlength1);
assignin('base','skeletonlengthr',skeletonlengthr);
toc;
%% QC figure output
tic;
if maskcheck==1 
    Generate_Selfmask(image1,binary1,page1,maskoutputpath,c1);    
    Generate_Selfmask(imager,binaryr,pager,maskoutputpath,cr); 
    Generate_Crossmask(image1,binary1,binaryr,page1,maskoutputpath,c1);
    Generate_Crossmask(imager,binary1,binaryr,pager,maskoutputpath,cr);
    Generate_Overlappedobject(image1,height1,width1,page1,list1,overlap1_percentage,overlapthreshold_percentage,maskoutputpath,c1,1);
    Generate_Overlappedobject(image1,height1,width1,page1,list1,overlap1_absolute,overlapthreshold_absolute,maskoutputpath,c1,0);
    Generate_Closeobject(image1,height1,width1,page1,list1,distance_average1,distancethreshold_close,maskoutputpath,c1); 
    Generate_Farobject(image1,height1,width1,page1,list1,distance_average1,distancethreshold_far,maskoutputpath,c1); 
    Generaterandomimage(list1,image1,radiusx,radiusy,radiusz,width1,height1,page1,maskoutputpath,c1);
    Generate_Distancemap(distance_matrixr,page1,maskoutputpath,cr);
    Generate_Distancemap(distance_matrix1,page1,maskoutputpath,c1);
    Generate_Diffusion_Image(diffusion_map,page1,maskoutputpath,c1);
    Generate_Diffusion_Overlap(diffusion_map,binaryr,page1,maskoutputpath,c1);
    if lengthcheck==1
        Generate_Skeleton(binary1_skeleton,binary1_skeleton,page1,maskoutputpath,c1);
        Generate_Skeleton(binaryr_skeleton,binaryr_skeleton,page1,maskoutputpath,cr); 
    end    
end    

middle=floor(page1/2); 
figure('Name','middle image');
subplot(2,2,1);  
sample1=mat2gray(image1(:,:,middle));
imshow(sample1);
title('channel 1');
subplot(2,2,2); 
sampler=mat2gray(imager(:,:,middle));
imshow(sampler);
title('reference');
subplot(2,2,3);  
imshow(binary1(:,:,middle));
title('binary of channel 1');
subplot(2,2,4);
imshow(binaryr(:,:,middle));
title('binary of reference');

figure ('Name','object detection')
subplot(3,1,1);
histogram(arear);
histfit(arear);
title('reference size');
subplot(3,1,2);
histogram(intensity1);
histfit(intensity1);
title('channel1 intensity');
subplot(3,1,3);
histogram(area1);
histfit(area1);
title('volume (um3)');


figure ('Name','overlap')
subplot(3,2,1);
plot(overlap_binstep_percentage,bin_overlap_percentage,overlap_binstep_percentage,rbin_overlap_percentage);
title('overlap n');
subplot(3,2,3);
plot(overlap_binstep_percentage,bin_overlap_intensity_percentage,overlap_binstep_percentage,rbin_overlap_intensity_percentage);
title('intensity (AU)');
subplot(3,2,5);
plot(overlap_binstep_percentage,bin_overlap_area_percentage,overlap_binstep_percentage,rbin_overlap_area_percentage);
title('volume (um3)');

figure ('Name','distance histogram')

histogram(rdistance_average1,distance_binnum,'BinLimits',[distance_startpoint,distance_endpoint],...
    'FaceColor','r','normalization','probability');
hold;
histogram(distance_average1,distance_binnum,'BinLimits',[distance_startpoint,distance_endpoint],...
    'FaceColor','b','normalization','probability');
title('distance histogram average1 in blue, random in red');

pause(1);
disp '9. data plot completed'  
disp 'Done!' 
toc;










