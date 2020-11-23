function [output_concentration] = Concentration_Transformation_3D_2(input_image)

distance_image=bwdist(input_image,'euclidean');
surface_image=distance_image==1;
n=0;
for m=1:size(surface_image,3)
    for j=1:size(surface_image,2)
        for i=1:size(surface_image,1)
            if surface_image(i,j,m)==1
                n=n+1;
                y(n)=i;
                x(n)=j;
                z(n)=m;
            end
        end
    end
end

output_concentration=zeros(size(input_image));
temporary_image=zeros(size(input_image));
temporary_image(

parfor i=1:length(x)
     temporary_image=zeros(dimension);
     temporary_image(y(i),x(i),z(i))=1;
     temporary_distance=bwdist(temporary_image,'euclidean');                
     %temporary_distance=Distance_Transformation_3D(temporary_image,input_scalex,input_scalez);
     temporary_distance(y(i),x(i),z(i))=1;
     temporary_concentration=1/(temporary_distance.^2);
     output_concentration=output_concentration + temporary_concentration;               
end


    
end

