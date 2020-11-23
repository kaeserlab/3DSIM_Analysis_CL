function Generate_Farobject(inputimage,height,width,page,inputlist,distancelist,farthreshold,outputpath,inputfilename)

closebinary=zeros(height,width,page);

for k=1:numel(inputlist)
    if distancelist(k)>farthreshold
        for i=1:size(inputlist(k).PixelList,1)
             ix=inputlist(k).PixelList(i,1);
             iy=inputlist(k).PixelList(i,2);
             iz=inputlist(k).PixelList(i,3);
             closebinary(iy,ix,iz)=1;
        end
    end
end

startnumber=max(strfind(inputfilename,'\'))+1;
endnumber=length(inputfilename);
objectimage=inputimage.*closebinary;
objectimage=uint16(objectimage);


filename=inputfilename(startnumber:endnumber);
savenameobjectimage=[outputpath,'\farobject_',char(string(farthreshold)),'_',filename];

if page>1
    imwrite(objectimage(:,:,1),savenameobjectimage);
    for k = 2:page
        imwrite(objectimage(:,:,k), savenameobjectimage, 'writemode', 'append');        
    end
else
    imwrite(objectimage,savenameobjectimage);
end
