function [intensity,area,sdintensity,list,x,y,z]=Objectproperty(image,binaryimage,threshold,scalex,scaley,scalez)
object=bwconncomp(binaryimage);
list=regionprops(object,'PixelList');
iarea=regionprops(object,'Area');
x=zeros(numel(list),1);
y=zeros(numel(list),1);
z=zeros(numel(list),1);
intensity=zeros(numel(list),1);
area=zeros(numel(list),1);
sdintensity=zeros(numel(list),1);

for k=1:numel(list) % find the center of the object (weighted by intensity)   
    sumx=0;
    sumy=0;
    sumz=0;
    sumintensity=0;   
    for i=1:size(list(k).PixelList,1)
        ix=list(k).PixelList(i,1);
        iy=list(k).PixelList(i,2);
        iz=list(k).PixelList(i,3);
        sumx=sumx+ix*(image(iy,ix,iz)-threshold);
        sumy=sumy+iy*(image(iy,ix,iz)-threshold);
        sumz=sumz+iz*(image(iy,ix,iz)-threshold);
        sumintensity=sumintensity+(image(iy,ix,iz)-threshold); % intensity is calculated by subtracting the threshold1
    end    
    
    x(k)=(sumx/sumintensity);
    y(k)=(sumy/sumintensity);
    z(k)=(sumz/sumintensity);
    intensity(k)=sumintensity/i+threshold; % add threshold1 back to the intensity value.
    area(k)=iarea(k).Area*scalex*scaley*scalez;
    
    sumsdintensity=0; % calculate sd of the intensity
        for n=1:size(list(k).PixelList,1)
            ix=list(k).PixelList(n,1);
            iy=list(k).PixelList(n,2);
            iz=list(k).PixelList(n,3);
            sumsdintensity=sumsdintensity+(image(iy,ix,iz)-intensity(k))^2;
        end
    sdintensity(k)=sqrt(sumsdintensity);     
end 