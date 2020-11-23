function [output_distance_allpixel,output_averagedistance,output_mindistance,output_maxdistance]...
    = Distance(input_distance_matrix,input_list)

    output_averagedistance=zeros(1,size(input_list,2));
    output_mindistance=zeros(1,size(input_list,2));
    output_maxdistance=zeros(1,size(input_list,2));    
    n=0;
        
    for k=1:size(input_list,2)
        distance=zeros(1,size(input_list(k).PixelList,1));
        for i=1:size(input_list(k).PixelList,1)
            ix=input_list(k).PixelList(i,1);
            iy=input_list(k).PixelList(i,2);
            iz=input_list(k).PixelList(i,3);
            distance(1,i)=input_distance_matrix(iy,ix,iz);
            n=n+1;
        end
        output_averagedistance(1,k)=mean(distance);
        output_mindistance(1,k)=min(distance);
        output_maxdistance(1,k)=max(distance);  
    end
    
    output_distance_allpixel=zeros(1,n);
    m=0;
    for k=1:size(input_list,2)        
        for i=1:size(input_list(k).PixelList,1)
            m=m+1;
            ix=input_list(k).PixelList(i,1);
            iy=input_list(k).PixelList(i,2);
            iz=input_list(k).PixelList(i,3);
            output_distance_allpixel(1,m)=input_distance_matrix(iy,ix,iz);            
        end
    end
        
end

