function Generate_Overlappedobject(inputimage,height,width,page,inputlist,overlap,overlapthreshold,outputpath,inputfilename,percentagecheck)
overlapbinary=zeros(height,width,page);

for k=1:numel(inputlist)
    if overlap(k)>overlapthreshold
        for i=1:size(inputlist(k).PixelList,1)
             ix=inputlist(k).PixelList(i,1);
             iy=inputlist(k).PixelList(i,2);
             iz=inputlist(k).PixelList(i,3);
             overlapbinary(iy,ix,iz)=1;
        end
    end
end

startnumber=max(strfind(inputfilename,'\'))+1;
endnumber=length(inputfilename);
objectimage=inputimage.*overlapbinary;
objectimage=uint16(objectimage);

if percentagecheck==1
    filename=inputfilename(startnumber:endnumber);
    savenameobjectimage=[outputpath,'\overlappedobject_percentage_',char(string(overlapthreshold)),'_',filename];
else
     filename=inputfilename(startnumber:endnumber);
    savenameobjectimage=[outputpath,'\overlappedobject_absolute_',char(string(overlapthreshold)),'_',filename];
end

if page>1
    imwrite(objectimage(:,:,1),savenameobjectimage);
    for k = 2:page
        imwrite(objectimage(:,:,k), savenameobjectimage, 'writemode', 'append');        
    end
else
    imwrite(objectimage,savenameobjectimage);
end
