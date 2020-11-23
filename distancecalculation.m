function distancecalculation % not finished, as a backup
%% distance transform of reference and rotated reference within each layer

dbinaryr=zeros(height1,width1,page1);
drbinaryr=zeros(height1,width1,page1);
for k=1:page1 % distance transform of each layer
    dbinaryr(:,:,k)=bwdist(binaryr(:,:,k))*scalex;
    drbinaryr(:,:,k)=bwdist(rbinaryr(:,:,k))*scalex;    
end
display '8. distance transformation of reference completed'
toc;
   
%% determine the min distance between channel1 and channel reference
distance1=zeros(numel(list1),1);
for k=1:numel(list1)
    intx=int16(x(k)); % find nearest voxel index (integer)
    inty=int16(y(k));
    intz=int16(z(k));
    radius=int16(dbinaryr(inty,intx,intz)/scalex+1); % find the checking radius
    distance1(k)=10000;
    
    if radius==1  % check whether it is inside or outside
       check=0;
       if intx>1 && intx<widthr
           if dbinaryr(inty,intx-1,intz)~=0 && dbinaryr(inty,intx+1,intz)~=0
               check=check+1;
           end
       end
       if inty>1 && inty<heightr
           if dbinaryr(inty-1,intx,intz)~=0 && dbinaryr(inty+1,intx,intz)~=0
               check=check+1;
           end
       end
       if intz>1 && intz<pager
           if dbinaryr(inty,intx,intz-1)~=0 && dbinaryr(inty,intx,intz+1)~=0
               check=check+1;
           end
       end
       if check==0
       radius=range;
       zradius=int16(radius*scalex/scalez);
       if intx-radius<=0  % determine the start and end of each axis
          xstart=1;
       else
          xstart=intx-radius;
       end
       if inty-radius<=0
          ystart=1;
       else
          ystart=inty-radius;
       end
       if intz-zradius<=0
          zstart=1;
       else
          zstart=intz-zradius;
       end
       if intx+radius>=width1
          xend=width1;
       else
          xend=intx+radius;
       end
       if inty+radius>=height1
          yend=height1;
       else
          yend=inty+radius;
       end
       if intz+zradius>=page1
          zend=page1;
       else
          zend=intz+zradius;
       end
          intx=double(intx);
          inty=double(inty);
          intz=double(intz);
          radius=double(radius);
          xstart=double(xstart);
          ystart=double(ystart);
          zstart=double(zstart);
          xend=double(xend);
          yend=double(yend);
          zend=double(zend);       
 
       for m=zstart:zend
         for i=ystart:yend
           for j=xstart:xend
              if binaryr(i,j,m)==0                
                  newdist=sqrt(((y(k)-i)*scaley)^2+((x(k)-j)*scalex)^2+((z(k)-m)*scalez)^2);
                  if newdist<distance1(k)
                     distance1(k)=newdist;                 
                  end
              end
           end
         end
       end 
       distance1(k)=-distance1(k);    
       continue; 
       end
    end
    
    
    if radius>range  % range filter (check limited area)
        radius=range;  
        distance1(k)=range*scalex;        
    end
    
    zradius=int16(radius*scalex/scalez);
    if intx-radius<=0  % determine the start and end of each axis
        xstart=1;
    else
        xstart=intx-radius;
    end
    if inty-radius<=0
        ystart=1;
    else
        ystart=inty-radius;
    end
    if intz-zradius<=0
        zstart=1;
    else
        zstart=intz-zradius;
    end
    if intx+radius>=width1
        xend=width1;
    else
        xend=intx+radius;
    end
    if inty+radius>=height1
        yend=height1;
    else
        yend=inty+radius;
    end
    if intz+zradius>=page1
        zend=page1;
    else
        zend=intz+zradius;
    end
        intx=double(intx);
        inty=double(inty);
        intz=double(intz);
        radius=double(radius);
        xstart=double(xstart);
        ystart=double(ystart);
        zstart=double(zstart);
        xend=double(xend);
        yend=double(yend);
        zend=double(zend);       
 
    for m=zstart:zend
      for i=ystart:yend
        for j=xstart:xend
            if binaryr(i,j,m)==1                
                newdist=sqrt(((y(k)-i)*scaley)^2+((x(k)-j)*scalex)^2+((z(k)-m)*scalez)^2);
                if newdist<distance1(k)
                    distance1(k)=newdist;                 
                end
            end
        end
      end
    end   
end
display '9. min distance1 to channel reference completed' 
toc;
   
%% determine the min distance in rotated channel reference
rdistance1=zeros(numel(list1),1);
for k=1:numel(list1)
    intx=int16(x(k)); % nearest voxel index
    inty=int16(y(k));
    intz=int16(z(k));
    radius=int16(drbinaryr(inty,intx,intz)/scalex+1); % checking radius
    rdistance1(k)=10000;
    
    if radius==1  % check whether it is inside or outside
       check=0;
       if intx>1 && intx<widthr
           if drbinaryr(inty,intx-1,intz)~=0 && drbinaryr(inty,intx+1,intz)~=0
               check=check+1;
           end
       end
       if inty>1 && inty<heightr
           if drbinaryr(inty-1,intx,intz)~=0 && drbinaryr(inty+1,intx,intz)~=0
               check=check+1;
           end
       end
       if intz>1 && intz<pager
           if drbinaryr(inty,intx,intz-1)~=0 && drbinaryr(inty,intx,intz+1)~=0
               check=check+1;
           end
       end
       if check==0
       radius=range;
       zradius=int16(radius*scalex/scalez);
       if intx-radius<=0  % determine the start and end of each axis
          xstart=1;
       else
          xstart=intx-radius;
       end
       if inty-radius<=0
          ystart=1;
       else
       ystart=inty-radius;
       end
       if intz-zradius<=0
          zstart=1;
       else
          zstart=intz-zradius;
       end
       if intx+radius>=width1
          xend=width1;
       else
          xend=intx+radius;
       end
       if inty+radius>=height1
          yend=height1;
       else
          yend=inty+radius;
       end
       if intz+zradius>=page1
          zend=page1;
       else
          zend=intz+zradius;
       end
          intx=double(intx);
          inty=double(inty);
          intz=double(intz);
          radius=double(radius);
          xstart=double(xstart);
          ystart=double(ystart);
          zstart=double(zstart);
          xend=double(xend);
          yend=double(yend);
          zend=double(zend);       
      
       for m=zstart:zend
         for i=ystart:yend
           for j=xstart:xend
              if rbinaryr(i,j,m)==0                
                  newdist=sqrt(((y(k)-i)*scaley)^2+((x(k)-j)*scalex)^2+((z(k)-m)*scalez)^2);
                  if newdist<rdistance1(k)
                     rdistance1(k)=newdist;                 
                  end
              end
           end
         end
       end 
       rdistance1(k)=-rdistance1(k);    
       continue;
       end
    end
        
    if radius>range  % range filter (check limited area)
        radius=range; 
        rdistance1(k)=range*scalex;
    end
    
    zradius=int16(radius*scalex/scalez);
    if intx-radius<=0
        xstart=1;
    else
        xstart=intx-radius;
    end
    if inty-radius<=0
        ystart=1;
    else
        ystart=inty-radius;
    end
    if intz-zradius<=0
        zstart=1;
    else
        zstart=intz-zradius;
    end
    if intx+radius>=width1
        xend=width1;
    else
        xend=intx+radius;
    end
    if inty+radius>=height1
        yend=height1;
    else
        yend=inty+radius;
    end
    if intz+zradius>=page1
        zend=page1;
    else
        zend=intz+zradius;
    end
        intx=double(intx);
        inty=double(inty);
        intz=double(intz);
        radius=double(radius);
        xstart=double(xstart);
        ystart=double(ystart);
        zstart=double(zstart);
        xend=double(xend);
        yend=double(yend);
        zend=double(zend);     

    for m=zstart:zend
      for i=ystart:yend
        for j=xstart:xend
            if rbinaryr(i,j,m)==1                
                newdist=sqrt(((y(k)-i)*scaley)^2+((x(k)-j)*scalex)^2+((z(k)-m)*scalez)^2);
                if newdist<rdistance1(k)
                    rdistance1(k)=newdist;                 
                end
            end
        end
      end
    end 
    
    

end
display '10. min distance1 to rotated channel reference completed' 
toc;  


%% distance binning
n1=int16((endpoint-startpoint)/bin); % determine the step number
n1=double(n1);
step1=zeros(n1,1);
binnum1=zeros(n1,1);
binintensity1=zeros(n1,1);
binarea1=zeros(n1,1);

for k=1:n1  % binning for channel reference
    step1(k)=startpoint+double(bin*k);
    sumintensity=0;
    sumarea=0; 
    m=0;
    averageintensity1=mean(intensity1);
    averagearea1=mean(area1);
    for i=1:numel(list1);       
       if distance1(i)>step1(k)-bin/2 && distance1(i)<=step1(k)+bin/2
           m=m+1;
           sumintensity=sumintensity+intensity1(i);
           sumarea=sumarea+area1(i);
       end
    end
    binnum1(k)=m;
    if binnum1(k)>0
        binintensity1(k)=sumintensity/binnum1(k);
        binarea1(k)=sumarea/binnum1(k);
    else
        binintensity1(k)=averageintensity1;
        binarea1(k)=averagearea1;
    end
end

rbinnum1=zeros(n1,1);
rbinintensity1=zeros(n1,1);
rbinarea1=zeros(n1,1);
for k=1:n1  % binning for rotated channel reference
    step1(k)=startpoint+double(bin*k);
    sumintensity=0;
    sumarea=0; 
    m=0;
    averageintensity1=mean(intensity1);
    averagearea1=mean(area1);
    for i=1:numel(list1);
       if rdistance1(i)>step1(k)-bin/2 && rdistance1(i)<=step1(k)+bin/2
           m=m+1;
           sumintensity=sumintensity+intensity1(i);
           sumarea=sumarea+area1(i);
       end
    end
    rbinnum1(k)=m;
    if rbinnum1(k)>0
        rbinintensity1(k)=sumintensity/rbinnum1(k);
        rbinarea1(k)=sumarea/rbinnum1(k);
    else
        rbinintensity1(k)=averageintensity1;
        rbinarea1(k)=averagearea1;
    end
end

%% figure output

subplot(3,2,2);
plot(step1,binnum1,step1,rbinnum1);
title('distance n');
subplot(3,2,4);
plot(step1,binintensity1,step1,rbinintensity1);
title('intensity (AU)');
subplot(3,2,6);
plot(step1,binarea1,step1,rbinarea1);
title('volume (um3)');

%% assignin
assignin('base','dbinaryr',dbinaryr);
assignin('base','drbinaryr',drbinaryr);


% pushbutton
setappdata(hGUI,'binnum1',binnum1);
setappdata(hGUI,'rbinnum1',rbinnum1);
setappdata(hGUI,'binintensity1',binintensity1);
setappdata(hGUI,'binarea1',binarea1);
setappdata(hGUI,'rbinintensity1',rbinintensity1);
setappdata(hGUI,'rbinarea1',rbinarea1);
setappdata(hGUI,'step1',step1);


binnum1=getappdata(hGUI,'binnum1');
binintensity1=getappdata(hGUI,'binintensity1');
binarea1=getappdata(hGUI,'binarea1');
rbinnum1=getappdata(hGUI,'rbinnum1');
rbinintensity1=getappdata(hGUI,'rbinintensity1');
rbinarea1=getappdata(hGUI,'rbinarea1');
step1=getappdata(hGUI,'step1');


% output
xlswrite(outputfile,{'name'},'C1distance','a1');
    xlswrite(outputfile,step1','C1distance','b1');
    xlswrite(outputfile,{'name'},'RC1distance','a1');
    xlswrite(outputfile,step1','RC1distance','b1');
        
    xlswrite(outputfile,{'name'},'C1intensity','a1');
    xlswrite(outputfile,step1','C1intensity','b1');
    xlswrite(outputfile,{'name'},'RC1intensity','a1');
    xlswrite(outputfile,step1','RC1intensity','b1');
    
    xlswrite(outputfile,{'name'},'C1volume','a1');
    xlswrite(outputfile,step1','C1volume','b1');   
    xlswrite(outputfile,{'name'},'RC1volume','a1');
    xlswrite(outputfile,step1','RC1volume','b1');   


    %
    xlswrite(outputfile,{c1},'C1distance',['a',row]);
xlswrite(outputfile,binnum1','C1distance',['b',row]);
xlswrite(outputfile,{c1},'RC1distance',['a',row]);
xlswrite(outputfile,rbinnum1','RC1distance',['b',row]);

xlswrite(outputfile,{c1},'C1intensity',['a',row]);
xlswrite(outputfile,binintensity1','C1intensity',['b',row]);
xlswrite(outputfile,{c1},'RC1intensity',['a',row]);
xlswrite(outputfile,rbinintensity1','RC1intensity',['b',row]);

xlswrite(outputfile,{c1},'C1volume',['a',row]);
xlswrite(outputfile,binarea1','C1volume',['b',row]);
xlswrite(outputfile,{c1},'RC1volume',['a',row]);
xlswrite(outputfile,rbinarea1','RC1volume',['b',row]);

    

