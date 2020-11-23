%% creat the output file if not exist
tic;
disp 'outputting as .xlsx/xls...' 
outputfile=get(handles.edit3, 'string');  % read output file path

if exist(outputfile)~=2  % create new result files if not exist
    xlswrite(outputfile,{'channel1'},'summary','a1');
    xlswrite(outputfile,{'threshold1'},'summary','b1');
    xlswrite(outputfile,{'small1'},'summary','c1');
    xlswrite(outputfile,{'large1'},'summary','d1');
    xlswrite(outputfile,{'intensitycutoff1'},'summary','e1');
    xlswrite(outputfile,{'areacutoff1'},'summary','f1');
    xlswrite(outputfile,{'sdsdcutoff1'},'summary','g1');
    xlswrite(outputfile,{'density1'},'summary','h1');
    xlswrite(outputfile,{'n of channel1'},'summary','i1');
    xlswrite(outputfile,{'mean size of channel1'},'summary','j1');
    xlswrite(outputfile,{'area of channel1'},'summary','k1');       
    xlswrite(outputfile,{'channelr'},'summary','l1');        
    xlswrite(outputfile,{'thresholdr'},'summary','m1');
    xlswrite(outputfile,{'smallr'},'summary','n1');
    xlswrite(outputfile,{'larger'},'summary','o1');    
    xlswrite(outputfile,{'intensitycutoffr'},'summary','p1');
    xlswrite(outputfile,{'areacutoffr'},'summary','q1');
    xlswrite(outputfile,{'sdsdcutoffr'},'summary','r1'); 
    xlswrite(outputfile,{'densityr'},'summary','s1')
    xlswrite(outputfile,{'n of reference'},'summary','t1');
    xlswrite(outputfile,{'mean size of reference'},'summary','u1');
    xlswrite(outputfile,{'area of reference'},'summary','v1');        
    xlswrite(outputfile,{'scalex'},'summary','w1');
    xlswrite(outputfile,{'scaley'},'summary','x1');
    xlswrite(outputfile,{'scalez'},'summary','y1');
    xlswrite(outputfile,{'width'},'summary','z1');
    xlswrite(outputfile,{'height'},'summary','aa1');
    xlswrite(outputfile,{'page'},'summary','ab1');
    xlswrite(outputfile,{'imagearea (um)'},'summary','ac1'); 
    xlswrite(outputfile,{'overlaped area (um)'},'summary','ad1'); 
    xlswrite(outputfile,{'randomnized overlappedarea (um)'},'summary','ae1');
    xlswrite(outputfile,{'skeletonlength1'},'summary','af1');   
    xlswrite(outputfile,{'skeletonlengthr'},'summary','ag1');     
    xlswrite(outputfile,{'distance_binnum'},'summary','ah1');
    xlswrite(outputfile,{'distance_startpoint'},'summary','ai1');
    xlswrite(outputfile,{'distance_endpoint'},'summary','aj1'); 
    %xlswrite(outputfile,{'outputfile'},'summary','ak1');
    
    xlswrite(outputfile,{'name'},'overlap-p','a1');
    xlswrite(outputfile,{'0'},'overlap-p','b1');
    xlswrite(outputfile,overlap_binstep_percentage,'overlap-p','c1');
    
    xlswrite(outputfile,{'name'},'overlap-a','a1');
    xlswrite(outputfile,{'0'},'overlap-a','b1');
    xlswrite(outputfile,overlap_binstep_absolute,'overlap-a','c1');
    
    xlswrite(outputfile,{'name'},'distance-ave','a1');
    xlswrite(outputfile,{'0'},'distance-ave','b1');
    xlswrite(outputfile,distance_binstep_average,'distance-ave','c1');
    
    xlswrite(outputfile,{'name'},'distance-min','a1');
    xlswrite(outputfile,{'0'},'distance-min','b1');
    xlswrite(outputfile,distance_binstep_average,'distance-min','c1');
    
    xlswrite(outputfile,{'name'},'distance-max','a1');
    xlswrite(outputfile,{'0'},'distance-max','b1');
    xlswrite(outputfile,distance_binstep_average,'distance-max','c1');
    
    xlswrite(outputfile,{'name'},'distance-all','a1');
    xlswrite(outputfile,{'0'},'distance-all','b1');
    xlswrite(outputfile,distance_binstep_average,'distance-all','c1');
    
    xlswrite(outputfile,{'name'},'overlap-size','a1');
    xlswrite(outputfile,{'0'},'overlap-size','b1');
    xlswrite(outputfile,overlap_binstep_percentage,'overlap-size','c1');
    
    xlswrite(outputfile,{'name'},'distance-size','a1');
    xlswrite(outputfile,{'0'},'distance-size','b1');
    xlswrite(outputfile,distance_binstep_average,'distance-size','c1');
    
    xlswrite(outputfile,{'name'},'overlap-intensity','a1');
    xlswrite(outputfile,{'0'},'overlap-intensity','b1');
    xlswrite(outputfile,overlap_binstep_percentage,'overlap-intensity','c1');
    
    xlswrite(outputfile,{'name'},'distance-intensity','a1');
    xlswrite(outputfile,{'0'},'distance-intensity','b1');
    xlswrite(outputfile,distance_binstep_average,'distance-intensity','c1');    
    
    xlswrite(outputfile,{'name'},'Roverlap-p','a1');
    xlswrite(outputfile,{'0'},'Roverlap-p','b1');
    xlswrite(outputfile,overlap_binstep_percentage,'Roverlap-p','c1');
    
    xlswrite(outputfile,{'name'},'Roverlap-a','a1');
    xlswrite(outputfile,{'0'},'Roverlap-a','b1');
    xlswrite(outputfile,overlap_binstep_absolute,'Roverlap-a','c1');
    
    xlswrite(outputfile,{'name'},'Rdistance-ave','a1');
    xlswrite(outputfile,{'0'},'Rdistance-ave','b1');
    xlswrite(outputfile,distance_binstep_average,'Rdistance-ave','c1');
    
    xlswrite(outputfile,{'name'},'Rdistance-min','a1');
    xlswrite(outputfile,{'0'},'Rdistance-min','b1');
    xlswrite(outputfile,distance_binstep_average,'Rdistance-min','c1');
    
    xlswrite(outputfile,{'name'},'Rdistance-max','a1');
    xlswrite(outputfile,{'0'},'Rdistance-max','b1');
    xlswrite(outputfile,distance_binstep_average,'Rdistance-max','c1');
    
    xlswrite(outputfile,{'name'},'Rdistance-all','a1');
    xlswrite(outputfile,{'0'},'Rdistance-all','b1');
    xlswrite(outputfile,distance_binstep_average,'Rdistance-all','c1');    
      
    xlswrite(outputfile,{'name'},'Roverlap-size','a1');
    xlswrite(outputfile,{'0'},'Roverlap-size','b1');
    xlswrite(outputfile,overlap_binstep_percentage,'Roverlap-size','c1');
    
    xlswrite(outputfile,{'name'},'Rdistance-size','a1');
    xlswrite(outputfile,{'0'},'Rdistance-size','b1');
    xlswrite(outputfile,distance_binstep_average,'Rdistance-size','c1');
    
    xlswrite(outputfile,{'name'},'Roverlap-intensity','a1');
    xlswrite(outputfile,{'0'},'Roverlap-intensity','b1');
    xlswrite(outputfile,overlap_binstep_percentage,'Roverlap-intensity','c1');
    
    xlswrite(outputfile,{'name'},'Rdistance-intensity','a1');
    xlswrite(outputfile,{'0'},'Rdistance-intensity','b1');
    xlswrite(outputfile,distance_binstep_average,'Rdistance-intensity','c1');   
    
    xlswrite(outputfile,{'name'},'area1','a1');
    xlswrite(outputfile,{'name'},'arear','a1');
    xlswrite(outputfile,{'name'},'intensity1','a1');
    xlswrite(outputfile,{'name'},'intensityr','a1');
 
end

%% output the data 
line=size(xlsread(outputfile,'summary','b:b'),1)+2;
row=num2str(line);

xlswrite(outputfile,{c1},'overlap-p',['a',row]);
xlswrite(outputfile,bin_overlap_zero_percentage,'overlap-p',['b',row]);
xlswrite(outputfile,bin_overlap_percentage,'overlap-p',['c',row]);

xlswrite(outputfile,{c1},'overlap-a',['a',row]);
xlswrite(outputfile,bin_overlap_zero_absolute,'overlap-a',['b',row]);
xlswrite(outputfile,bin_overlap_absolute,'overlap-a',['c',row]);

xlswrite(outputfile,{c1},'distance-ave',['a',row]);
xlswrite(outputfile,bin_distance_zero_average,'distance-ave',['b',row]);
xlswrite(outputfile,bin_distance_average,'distance-ave',['c',row]);

xlswrite(outputfile,{c1},'distance-min',['a',row]);
xlswrite(outputfile,bin_distance_zero_min,'distance-min',['b',row]);
xlswrite(outputfile,bin_distance_min,'distance-min',['c',row]);

xlswrite(outputfile,{c1},'distance-max',['a',row]);
xlswrite(outputfile,bin_distance_zero_max,'distance-max',['b',row]);
xlswrite(outputfile,bin_distance_max,'distance-max',['c',row]);

xlswrite(outputfile,{c1},'distance-all',['a',row]);
%xlswrite(outputfile,bin_distance_zero_all,'distance-all',['b',row]);
xlswrite(outputfile,bin_distance_allpixel,'distance-all',['c',row]);

xlswrite(outputfile,{c1},'overlap-size',['a',row]);
xlswrite(outputfile,bin_overlap_zero_area_percentage,'overlap-size',['b',row]);
xlswrite(outputfile,bin_overlap_area_percentage,'overlap-size',['c',row]);

xlswrite(outputfile,{c1},'distance-size',['a',row]);
xlswrite(outputfile,bin_distance_zero_area_average,'distance-size',['b',row]);
xlswrite(outputfile,bin_distance_area_average,'distance-size',['c',row]);

xlswrite(outputfile,{c1},'overlap-intensity',['a',row]);
xlswrite(outputfile,bin_overlap_zero_intensity_percentage,'overlap-intensity',['b',row]);
xlswrite(outputfile,bin_overlap_intensity_percentage,'overlap-intensity',['c',row]);

xlswrite(outputfile,{c1},'distance-intensity',['a',row]);
xlswrite(outputfile,bin_distance_zero_intensity_average,'distance-intensity',['b',row]);
xlswrite(outputfile,bin_distance_intensity_average,'distance-intensity',['c',row]);


xlswrite(outputfile,{c1},'roverlap-p',['a',row]);
xlswrite(outputfile,rbin_overlap_zero_percentage,'roverlap-p',['b',row]);
xlswrite(outputfile,rbin_overlap_percentage,'roverlap-p',['c',row]);

xlswrite(outputfile,{c1},'roverlap-a',['a',row]);
xlswrite(outputfile,rbin_overlap_zero_absolute,'roverlap-a',['b',row]);
xlswrite(outputfile,rbin_overlap_absolute,'roverlap-a',['c',row]);

xlswrite(outputfile,{c1},'rdistance-ave',['a',row]);
xlswrite(outputfile,rbin_distance_zero_average,'rdistance-ave',['b',row]);
xlswrite(outputfile,rbin_distance_average,'rdistance-ave',['c',row]);

xlswrite(outputfile,{c1},'rdistance-min',['a',row]);
xlswrite(outputfile,rbin_distance_zero_min,'rdistance-min',['b',row]);
xlswrite(outputfile,rbin_distance_min,'rdistance-min',['c',row]);

xlswrite(outputfile,{c1},'rdistance-max',['a',row]);
xlswrite(outputfile,rbin_distance_zero_max,'rdistance-max',['b',row]);
xlswrite(outputfile,rbin_distance_max,'rdistance-max',['c',row]);

xlswrite(outputfile,{c1},'rdistance-all',['a',row]);
%xlswrite(outputfile,rbin_distance_zero_all,'rdistance-all',['b',row]);
%sometimes rbin_distance_zero_all is not generated
xlswrite(outputfile,rbin_distance_allpixel,'rdistance-all',['c',row]);

xlswrite(outputfile,{c1},'roverlap-size',['a',row]);
xlswrite(outputfile,rbin_overlap_zero_area_percentage,'roverlap-size',['b',row]);
xlswrite(outputfile,rbin_overlap_area_percentage,'roverlap-size',['c',row]);

xlswrite(outputfile,{c1},'rdistance-size',['a',row]);
xlswrite(outputfile,rbin_distance_zero_area_average,'rdistance-size',['b',row]);
xlswrite(outputfile,rbin_distance_area_average,'rdistance-size',['c',row]);

xlswrite(outputfile,{c1},'roverlap-intensity',['a',row]);
xlswrite(outputfile,rbin_overlap_zero_intensity_percentage,'roverlap-intensity',['b',row]);
xlswrite(outputfile,rbin_overlap_intensity_percentage,'roverlap-intensity',['c',row]);

xlswrite(outputfile,{c1},'Rdistance-intensity',['a',row]);
xlswrite(outputfile,rbin_distance_zero_intensity_average,'Rdistance-intensity',['b',row]);
xlswrite(outputfile,rbin_distance_intensity_average,'Rdistance-intensity',['c',row]);

xlswrite(outputfile,{c1},'area1',['a',row]);
xlswrite(outputfile,area1,'area1',['b',row]);

xlswrite(outputfile,{cr},'arear',['a',row]);
xlswrite(outputfile,arear,'arear',['b',row]);

xlswrite(outputfile,{c1},'intensity1',['a',row]);
xlswrite(outputfile,intensity1,'intensity1',['b',row]);

xlswrite(outputfile,{cr},'intensityr',['a',row]);
xlswrite(outputfile,intensityr,'intensityr',['b',row]);

xlswrite(outputfile,{c1},'summary',['a',row]);
xlswrite(outputfile,threshold1,'summary',['b',row]);
xlswrite(outputfile,small1,'summary',['c',row]);
xlswrite(outputfile,large1,'summary',['d',row]);
xlswrite(outputfile,intensitycutoff1,'summary',['e',row]);
xlswrite(outputfile,areacutoff1,'summary',['f',row]);
xlswrite(outputfile,sdsdcutoff1,'summary',['g',row]);
xlswrite(outputfile,density1,'summary',['h',row])
xlswrite(outputfile,num1,'summary',['i',row])
xlswrite(outputfile,size1,'summary',['j',row])
xlswrite(outputfile,sumarea1,'summary',['k',row])

xlswrite(outputfile,{cr},'summary',['l',row]);
xlswrite(outputfile,thresholdr,'summary',['m',row]);
xlswrite(outputfile,smallr,'summary',['n',row]);
xlswrite(outputfile,larger,'summary',['o',row]);
xlswrite(outputfile,intensitycutoffr,'summary',['p',row]);
xlswrite(outputfile,areacutoffr,'summary',['q',row]);
xlswrite(outputfile,sdsdcutoffr,'summary',['r',row]);
xlswrite(outputfile,densityr,'summary',['s',row]);
xlswrite(outputfile,numr,'summary',['t',row]);
xlswrite(outputfile,sizer,'summary',['u',row]);
xlswrite(outputfile,sumarear,'summary',['v',row]);

xlswrite(outputfile,scalex,'summary',['w',row]);
xlswrite(outputfile,scaley,'summary',['x',row]);
xlswrite(outputfile,scalez,'summary',['y',row]);
xlswrite(outputfile,width1,'summary',['z',row]);
xlswrite(outputfile,height1,'summary',['aa',row]);
xlswrite(outputfile,page1,'summary',['ab',row]);
xlswrite(outputfile,volume,'summary',['ac',row]);
xlswrite(outputfile,sumoverlap,'summary',['ad',row]);
xlswrite(outputfile,rsumoverlap,'summary',['ae',row]);
xlswrite(outputfile,skeletonlength1,'summary',['af',row]);
xlswrite(outputfile,skeletonlengthr,'summary',['ag',row]);
xlswrite(outputfile,distance_binnum,'summary',['ah',row]);
xlswrite(outputfile,distance_startpoint,'summary',['ai',row]);
xlswrite(outputfile,distance_endpoint,'summary',['aj',row]); 
%xlswrite(outputfile,{outputfile},'summary',['ak',row]); 

disp '12. data output completed' 
toc;  