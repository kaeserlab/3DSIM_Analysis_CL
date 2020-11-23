c1=get(handles.edit1, 'string');
startthreshold=str2double(get(handles.edit21, 'string'));
endthreshold=str2double(get(handles.edit22, 'string'));
step=str2double(get(handles.edit23, 'string'));
removeb=str2double(get(handles.edit18, 'string'));
removet=str2double(get(handles.edit19, 'string'));
small=str2double(get(handles.edit6, 'string'));
large=str2double(get(handles.edit8, 'string'));
sdcutoff=str2double(get(handles.edit8, 'string'));

areacutoff=str2double(get(handles.edit26, 'string'));
scalex=str2double(get(handles.edit14, 'string'));
scaley=str2double(get(handles.edit15, 'string'));
scalez=str2double(get(handles.edit16, 'string'));

%% load file
tic;
info=imfinfo(c1); % get basic information from channel1
page=size(info,1); % get the page number from channel1
width=info.Width; % get the width of channel1
height=info.Height; % get the height of channel1
page=page-removeb-removet;
image0=zeros(height, width, page);
m=0;
for k=1+removet:page+removet % load channel1
   m=m+1; 
   image0(:,:,m)=imread(c1,k); 
end
display '1. image loading completed'

%% binary transform and filter

threshold=startthreshold:step:endthreshold;
objectsize=zeros(numel(threshold),1);
number=zeros(numel(threshold),1);
intensity=zeros(numel(threshold),1);

for m=1:numel(threshold)   
   
   [binary]=TwoDotsu(image0,height,width,page,threshold(m));
    
    binary=xor(bwareaopen(binary,small),bwareaopen(binary,large)); % size filtering of channel1
    object=bwconncomp(binary); % find connected object
    iarea=regionprops(object,'Area');    
    list=regionprops(object,'PixelList'); % get the position of each voxel of the object     
    
    area=zeros(numel(iarea),1);
    for k=1:numel(iarea)
        area(k)=iarea(k).Area;        
    end
    
    iintensity=zeros(numel(list),1);     
    for k=1:numel(list) % calculate intensity
        sumintensity=0;
        for n=1:size(list(k).PixelList,1)
            ix=list(k).PixelList(n,1);
            iy=list(k).PixelList(n,2);
            iz=list(k).PixelList(n,3);
            sumintensity=sumintensity+image0(iy,ix,iz);
        end
        iintensity(k)=sumintensity/n;   
        intensity(m)=mean(iintensity);     
        
    end    
       
    objectsize(m)=mean(area); 
    volume=page*width*height*scalex*scaley*scalez;
    number(m)=k/volume; 
    {'evaluating',threshold(m)}
    toc;
end 
display '2. object size finding completed'

%% output

figure ('Name','Thresholding');
subplot(3,1,1)
plot(threshold,objectsize)
title('threshold vs size');
subplot(3,1,2)
plot(threshold,number)
title('threshold vs density');
display 'Done'
subplot(3,1,3)
plot(threshold,intensity)
title('threshold vs intensity');
display 'Done'




