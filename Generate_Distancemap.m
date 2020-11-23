function Generate_Distancemap(inputimage,page,outputpath,input_filename)

distanceimage=inputimage.*255;
distanceimage=uint16(distanceimage);

startnum=max(strfind(input_filename,'\'))+1;
endnum=length(input_filename);
filename=input_filename(startnum:endnum);
savenameselfmaskedimage=[outputpath,'\distance_',filename];


if page>1
    imwrite(distanceimage(:,:,1),savenameselfmaskedimage);    
    for k = 2:page
        imwrite(distanceimage(:,:,k), savenameselfmaskedimage, 'writemode', 'append');        
    end
else
    imwrite(distanceimage,savenameselfmaskedimage);   
end