function Generate_Selfmask(inputimage,input_binary,page,outputpath,input_filename)

selfmaskedimage=inputimage.*input_binary;
selfmaskedimage=uint16(selfmaskedimage);

startnum=max(strfind(input_filename,'\'))+1;
endnum=length(input_filename);
filename=input_filename(startnum:endnum);
savenameselfmaskedimage=[outputpath,'\selfmasked_',filename];


if page>1
    imwrite(selfmaskedimage(:,:,1),savenameselfmaskedimage);    
    for k = 2:page
        imwrite(selfmaskedimage(:,:,k), savenameselfmaskedimage, 'writemode', 'append');        
    end
else
    imwrite(selfmaskedimage,savenameselfmaskedimage);   
end