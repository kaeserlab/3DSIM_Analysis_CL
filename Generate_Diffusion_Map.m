function [output_map]=Generate_Diffusion_Map(input_image,convolution_xy,convolution_z)
    if convolution_xy>size(input_image,1)
        convolution_xy=size(input_image,1);
    end
    if convolution_z>size(input_image,3)
        convolution_z=size(input_image,3);
    end

    dist=bwdist(input_image,'euclidean');
    surface_image=dist==1;

    standard=zeros(convolution_xy,convolution_xy,convolution_z);
    standard(round(convolution_xy/2),round(convolution_xy/2),round(convolution_z/2))=1;
    distance=bwdist(standard,'euclidean');
    distance(round(convolution_xy/2),round(convolution_xy/2),round(convolution_z/2))=1;
    standard=1/(distance.^2)*255;
    
    output_map=convn(surface_image,standard,'same');