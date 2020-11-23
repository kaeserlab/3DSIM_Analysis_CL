function [overlapbinstep,binoverlapzero,binoverlapzerointensity,binoverlapzeroarea,binoverlap,binoverlapintensity,binoverlaparea]=...
    Binning(input_binnumber,input_startpoint, input_endpoint, input_data,input_intensity,input_area)

    overlapbinsize=(input_endpoint-input_startpoint)/input_binnumber;
    overlapbinstep=zeros(1,input_binnumber);

    for i=1:input_binnumber
        overlapbinstep(1,i)=i*overlapbinsize;
    end

    m=0;  % initial values for calculating the overlapped objects
    sumintensity=0;
    sumarea=0;

    for j=1:numel(input_data) % bin zero overlap number
        if input_data(j)==0
            m=m+1;
            sumintensity=sumintensity+input_intensity(j);
            sumarea=sumarea+input_area(j);
        end
    end
    binoverlapzero=m; % get the number of 0 overlap puncta
    if m>0  
        binoverlapzerointensity=sumintensity/m; % zero overlap intensity 
        binoverlapzeroarea=sumarea/m; % zero overlap area
    else
        binoverlapzerointensity=0;
        binoverlapzeroarea=0;
    end

    binoverlap=zeros(1,input_binnumber);  % assign 0 to initial values
    binoverlapintensity=zeros(1,input_binnumber);
    binoverlaparea=zeros(1,input_binnumber);
    
    for i=1:input_binnumber % bin the others
        m=0;
        sumintensity=0;
        sumarea=0;
        for j=1:numel(input_data)
            if input_data(j)>overlapbinstep(i)-overlapbinsize && input_data(j)<=overlapbinstep(i)
                m=m+1;
                sumintensity=sumintensity+input_intensity(j);
                sumarea=sumarea+input_area(j);           
            end
        end
        binoverlap(i)=m;
        if m>0
            binoverlapintensity(i)=sumintensity/m; % overlap intensity
            binoverlaparea(i)=sumarea/m; % overlap area
        else
            binoverlapintensity(i)=0;
            binoverlaparea(i)=0; 
        end
    end


