function [intensityC1inC2]=ROIintensity(input_list,input_image) 

intensityC1inC2=zeros(1,numel(input_list));

for k=1:numel(input_list) % find the center of the object (weighted by intensity)
    sumintensity=0;
    n=0;
      for i=1:size(input_list(k).PixelList,1)
          ix=input_list(k).PixelList(i,1);
          iy=input_list(k).PixelList(i,2);
          iz=input_list(k).PixelList(i,3);
          sumintensity=sumintensity+input_image(iy,ix,iz);
          n=n+1;
      end
    intensityC1inC2(1,k)=sumintensity/n;  
end

