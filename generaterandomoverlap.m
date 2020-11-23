function [sumrandomoverlap,randomoverlap]=generaterandomoverlap...
    (list,binaryr,scalex,scaley,scalez,radiusx,radiusy,radiusz,width,height,page)


randomoverlap=zeros(numel(list),1);
sumrandomoverlap=0;

for k=1:numel(list) % find the center of the object (weighted by intensity)
      if min(list(k).PixelList(:,1))-1 < radiusx 
          min_x = -(min(list(k).PixelList(:,1))-1);
      else
          min_x = -radiusx;
      end
      if width-max(list(k).PixelList(:,1)) < radiusx 
          max_x = width-max(list(k).PixelList(:,1));
      else
          max_x = radiusx;
      end
      rangex=[min_x,max_x];
      
      if min(list(k).PixelList(:,2))-1 < radiusy 
          min_y = -(min(list(k).PixelList(:,2))-1);
      else
          min_y = -radiusy;
      end
      if height-max(list(k).PixelList(:,2)) < radiusy 
          max_y = height-max(list(k).PixelList(:,2));
      else
          max_y = radiusy;
      end
      rangey=[min_y,max_y];
      
      if min(list(k).PixelList(:,3))-1 < radiusz 
          min_z = -(min(list(k).PixelList(:,3))-1);
      else
          min_z = -radiusz;
      end
      if page-max(list(k).PixelList(:,3)) < radiusz 
          max_z = page-max(list(k).PixelList(:,3));
      else
          max_z = radiusz;
      end
      rangez=[min_z,max_z];   
    
      randx=randi(rangex);
      randy=randi(rangey);
      randz=randi(rangez);
      
      for i=1:size(list(k).PixelList,1)
          x=list(k).PixelList(i,1)+randx; % generate random relocated object 
          y=list(k).PixelList(i,2)+randy;
          z=list(k).PixelList(i,3)+randz;
          
          
          if binaryr(y,x,z)==1  % count the number of overlapped pixel
            randomoverlap(k)=randomoverlap(k)+1;
            sumrandomoverlap=sumrandomoverlap+1;
          end
      end
      randomoverlap(k)=randomoverlap(k)/size(list(k).PixelList,1)*100;
end
sumrandomoverlap=sumrandomoverlap*scalex*scaley*scalez;