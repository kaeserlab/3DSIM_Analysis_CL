function [outputbinary]=TwoDotsu(inputimage,height,width,page,threshfactor)

image=mat2gray(inputimage); 
imageb=zeros(height, width, page);
kernel=[1 1 1; 1 0 1; 1 1 1]/8;

for m=1:page
    imageb(:,:,m)=conv2(image(:,:,m),kernel,'same');
end

binary=zeros(height, width, page);
binaryb=zeros(height, width, page);
for m=1:page      
    level=graythresh(image(:,:,m))* threshfactor;
    levelb=graythresh(imageb(:,:,m))*threshfactor;
    
    if level>=1
        level=0.995;
    end
    if levelb>=1
        level=0.995;
    end
    
    binary(:,:,m)=im2bw(image(:,:,m),level); 
    binaryb(:,:,m)=im2bw(imageb(:,:,m),levelb);     
end

outputbinary=binary.*binaryb;



