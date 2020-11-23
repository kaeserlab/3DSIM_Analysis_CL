function Generate_Diffusion_Overlap(inputimage,input_binary,page,outputpath,input_filename)

overlapped_image=inputimage.*input_binary;
overlapped_image=uint16(overlapped_image);

startnum=max(strfind(input_filename,'\'))+1;
endnum=length(input_filename);
filename=input_filename(startnum:endnum);
savenameselfmaskedimage=[outputpath,'\diffusion_overlapped_',filename];


if page>1
    imwrite(overlapped_image(:,:,1),savenameselfmaskedimage);    
    for k = 2:page
        imwrite(overlapped_image(:,:,k), savenameselfmaskedimage, 'writemode', 'append');        
    end
else
    imwrite(overlapped_image,savenameselfmaskedimage);   
end