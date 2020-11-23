function [skeletonlength,skeletonimage]=Skeletonlength(binary_image_G,input_scalex, input_scalez)

skeletonimage=Skeleton3D(binary_image_G);

for i=1:size(skeletonimage,3)-1
    skeletonimage_zconnection(:,:,i)=skeletonimage(:,:,i).*skeletonimage(:,:,i+1);
end
    
allpixel=sum(skeletonimage,'all');
zpixel=sum(skeletonimage_zconnection,'all');

skeletonlength=(allpixel-zpixel)*input_scalex + zpixel*input_scalez;
                    
                    
                

