function Generate_Diffusion_Image(inputimage,page,outputpath,input_filename)

diffusionimage=inputimage;
diffusionimage=uint16(diffusionimage);

startnum=max(strfind(input_filename,'\'))+1;
endnum=length(input_filename);
filename=input_filename(startnum:endnum);
savenameselfmaskedimage=[outputpath,'\diffusion_',filename];


if page>1
    imwrite(diffusionimage(:,:,1),savenameselfmaskedimage);    
    for k = 2:page
        imwrite(diffusionimage(:,:,k), savenameselfmaskedimage, 'writemode', 'append');        
    end
else
    imwrite(diffusionimage,savenameselfmaskedimage);   
end