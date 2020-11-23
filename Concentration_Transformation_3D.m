function [output_concentration] = Concentration_Transformation_3D(x,y,z,dimension)

output_concentration=zeros(dimension);
x=round(x);
y=round(y);
z=round(z);

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

