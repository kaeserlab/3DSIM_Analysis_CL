function Generate_Skeleton(inputimage,input_binary,page,outputpath,input_filename)

skeletonimage=inputimage.*input_binary*255;
skeletonimage=uint16(skeletonimage);

startnum=max(strfind(input_filename,'\'))+1;
endnum=length(input_filename);
filename=input_filename(startnum:endnum);
savenameselfmaskedimage=[outputpath,'\skeleton_',filename];


if page>1
    imwrite(skeletonimage(:,:,1),savenameselfmaskedimage);    
    for k = 2:page
        imwrite(skeletonimage(:,:,k), savenameselfmaskedimage, 'writemode', 'append');        
    end
else
    imwrite(skeletonimage,savenameselfmaskedimage);   
end