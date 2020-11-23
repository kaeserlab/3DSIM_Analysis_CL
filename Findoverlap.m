function [output_sumoverlap,output_individualoverlap_percentage,output_individualoverlap_absolute]=Findoverlap(input_list,input_binaryr,input_scalex,input_scaley,input_scalez)
output_sumoverlap=0;
output_individualoverlap_absolute=zeros(numel(input_list),1);
output_individualoverlap_percentage=zeros(numel(input_list),1);
for k=1:size(input_list,2) % find the center of the object (weighted by intensity)
      individualoverlap=0;
      for i=1:size(input_list(k).PixelList,1)
          ix=input_list(k).PixelList(i,1);
          iy=input_list(k).PixelList(i,2);
          iz=input_list(k).PixelList(i,3);
          if input_binaryr(iy,ix,iz)==1  % count the number of overlapped pixel
            individualoverlap=individualoverlap+1;
            output_sumoverlap=output_sumoverlap+1;
          end
      end
      output_individualoverlap_absolute(k)=individualoverlap;
      output_individualoverlap_percentage(k)=individualoverlap/size(input_list(k).PixelList,1)*100;
end
output_sumoverlap=output_sumoverlap*input_scalex*input_scaley*input_scalez;