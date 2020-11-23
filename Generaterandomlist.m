function [output_randomlist] = Generaterandomlist...
    (list,radiusx,radiusy,radiusz,width,height,page,repeattimes)    
  
    
     for m=1:repeattimes   % generate repeattimes of list
          for k=1:numel(list)
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
                  ix=list(k).PixelList(i,1);
                  iy=list(k).PixelList(i,2);
                  iz=list(k).PixelList(i,3);          
                  x=ix+randx; % generate random relocated object 
                  y=iy+randy;
                  z=iz+randz;                
                  output_randomlist(m,k).PixelList(i,1)=x;
                  output_randomlist(m,k).PixelList(i,2)=y;
                  output_randomlist(m,k).PixelList(i,3)=z;
              end
          end
      end
end


