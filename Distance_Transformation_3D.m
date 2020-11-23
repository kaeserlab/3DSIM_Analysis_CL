function [output_distance] = Distance_Transformation_3D(input_image,input_scalex,input_scalez)
    output_distance=zeros(size(input_image));
    for m=1:size(input_image,3)
        output_distance(:,:,m)=bwdist(input_image(:,:,m),'euclidean')*input_scalex;
    end
    reference=output_distance; % a copy of output_distance to calculate minimum distance in each layer
    
    for m=1:size(input_image,3) % modify the distance in 3D
        for i=1:size(input_image,1)
            for j=1:size(input_image,2)
                radius_v=output_distance(i,j,m)/input_scalez;
                if radius_v>1
                    layer=floor(radius_v)+1; % determine the search layer
                    layer_start=m-layer;
                    layer_stop=m+layer;
                    if layer_start<1
                        layer_start=1;
                    end
                    if layer_stop>size(input_image,3)
                        layer_stop=size(input_image,3);
                    end
                    
                    for k=layer_start:layer_stop % find minimum distance;
                        if reference(i,j,k)<output_distance(i,j,m)
                            newdistance=sqrt(((m-k)*input_scalez)^2+reference(i,j,k)^2);
                            if newdistance<output_distance(i,j,m)
                                output_distance(i,j,m)=newdistance;
                            end
                        end
                    end
                end                    
            end
        end       
    end
    
    
    
    
end

