function [average_sumroverlap,average_rbinoverlap1zero,average_rbinoverlap1zerointensity,average_rbinoverlap1zeroarea,...
    average_rbinoverlap1,average_rbinoverlap1intensity,average_rbinoverlap1area]=Randomnizedoverlap(...
    repeattimes,list1,binaryr,scalex,scaley,scalez,radiusx,radiusy,radiusz,width1,height1,page1,...
    overlapbinnumber,intensity1,area1)

sum_sumroverlap=0;
sum_rbinoverlap1zero=0;
sum_rbinoverlap1zerointensity=0;
sum_rbinoverlap1zeroarea=0;
sum_rbinoverlap1=zeros(overlapbinnumber,1);
sum_rbinoverlap1intensity=zeros(overlapbinnumber,1);
sum_rbinoverlap1area=zeros(overlapbinnumber,1);

parfor i=1:repeattimes % repeat randomnized calculation
    [sumroverlap,roverlap1]=generaterandomoverlap(list1,binaryr,scalex,scaley,scalez,radiusx,radiusy,radiusz,width1,height1,page1);% generate randomoverlap
    
    [overlapbinstep,rbinoverlap1zero,rbinoverlap1zerointensity,rbinoverlap1zeroarea,rbinoverlap1,rbinoverlap1intensity,rbinoverlap1area]=...
        Overlapbinning(overlapbinnumber,roverlap1,intensity1,area1);
    
    sum_sumroverlap=sum_sumroverlap+sumroverlap;
    sum_rbinoverlap1zero=sum_rbinoverlap1zero+rbinoverlap1zero;
    sum_rbinoverlap1zerointensity=sum_rbinoverlap1zerointensity+rbinoverlap1zerointensity;
    sum_rbinoverlap1zeroarea=sum_rbinoverlap1zeroarea+rbinoverlap1zeroarea;
    sum_rbinoverlap1=sum_rbinoverlap1+rbinoverlap1;
    sum_rbinoverlap1intensity=sum_rbinoverlap1intensity+rbinoverlap1intensity;
    sum_rbinoverlap1area=sum_rbinoverlap1area+rbinoverlap1area;
end

average_sumroverlap=sum_sumroverlap/repeattimes;
average_rbinoverlap1zero=sum_rbinoverlap1zero/repeattimes;
average_rbinoverlap1zerointensity=sum_rbinoverlap1zerointensity/repeattimes;
average_rbinoverlap1zeroarea=sum_rbinoverlap1zeroarea/repeattimes;
average_rbinoverlap1=sum_rbinoverlap1/repeattimes;
average_rbinoverlap1intensity=sum_rbinoverlap1intensity/repeattimes;
average_rbinoverlap1area=sum_rbinoverlap1area/repeattimes;