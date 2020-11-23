function [intensity,area,list,x,y,z,binary]=Objectfilter(list,intensity,... 
intensitycutoff,sdintensity,sdsdcutoff,area,areacutoff,x,y,z,...
height,width,page)

filterbottom=mean(intensity)-std(intensity)*intensitycutoff; % find the lowest intensity
filtertop=mean(intensity)+std(intensity)*intensitycutoff;   % find the highest intensity
filtersdbottom=mean(sdintensity)-std(sdintensity)*sdsdcutoff;
filtersdtop=mean(sdintensity)+std(sdintensity)*sdsdcutoff;
filterareabottom=mean(area)-std(area)*areacutoff; % find the lowest area
filterareatop=mean(area)+std(area)*areacutoff;   % find the highest area
i=0; % new data index
for k=1:numel(list) % filter data
    if intensity(k)>filterbottom && intensity(k)<filtertop ...
            && sdintensity(k)>filtersdbottom && sdintensity(k)<filtersdtop...
            && area(k)>filterareabottom && area(k)<filterareatop
        i=i+1;
        filterlist(i)=list(k);
        filterintensity(i)=intensity(k);
        filterarea(i)=area(k);
        filterx(i)=x(k);
        filtery(i)=y(k);
        filterz(i)=z(k);
    end
end
list=filterlist;
intensity=filterintensity;
area=filterarea;
x=filterx;
y=filtery;
z=filterz;

filteredimage=zeros(height,width,page);
for k=1:numel(list) % change filtered image in binaryr to 3  
    for i=1:size(list(k).PixelList,1)
        ix=list(k).PixelList(i,1);
        iy=list(k).PixelList(i,2);
        iz=list(k).PixelList(i,3);
        filteredimage(iy,ix,iz)=3;  % assign a different number for image1
    end   
end 
binary=filteredimage==3; % binary positive is 1
