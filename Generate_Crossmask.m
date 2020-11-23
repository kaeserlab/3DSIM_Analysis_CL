function Generate_Crossmask(input_image,input_binary1,input_binaryr,page,outputpath,input_filename)

crossmaskedimage=input_image.*input_binary1.*input_binaryr;
crossmaskedimage=uint16(crossmaskedimage);

startnum=max(strfind(input_filename,'\'))+1;
endnum=length(input_filename);
filename=input_filename(startnum:endnum);
savenamecrossmaskedimage=[outputpath,'\crossmasked_',filename];

if page>1
    imwrite(crossmaskedimage(:,:,1),savenamecrossmaskedimage);
    for k = 2:page        
        imwrite(crossmaskedimage(:,:,k), savenamecrossmaskedimage, 'writemode', 'append');       
    end
else
    imwrite(crossmaskedimage,savenamecrossmaskedimage);  
end