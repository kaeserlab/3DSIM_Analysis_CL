
listfile=get(handles.edit28, 'string');  % getting info for analysis
[numbers, TEXT, listname] = xlsread(listfile);
assignin('base','numbers',numbers);
assignin('base','TEXT',TEXT);
assignin('base','listname',listname);
channellist1=listname(:,1);
channellistr=listname(:,2);

readthresholdcheck=0;
readthresholdcheckr=0;

filecheck=0;
m1=0;
mr=0;


for i=1:numel(channellist1) % check the existance of the files
    channel1=char(channellist1(i));
    channelr=char(channellistr(i));
    if exist(channel1,'file')~=2
        filecheck=filecheck+1;
        m1=m1+1;
        missingfile1(m1)=channellist1(i);
    end
    if exist(channelr,'file')~=2
        filecheck=filecheck+1;
        mr=mr+1;
        missingfiler(mr)=channellistr(i);
    end
end    
display 'File checking done!' 

if filecheck>0 
    display 'File not found!' 
    missingfile1
    missingfiler
end


if filecheck==0
    if numel(listname(1,:))>=3  % thresholding using otsu
        readthreshold=listname(:,3);
        readthreshold=cell2mat(readthreshold);
        if isnan(readthreshold)~=1
            readthresholdcheck=1;
            assignin('base','readthreshold',readthreshold);
            set(handles.edit30,'enable','on');
            set(handles.edit4,'enable','off');
            set(handles.radiobutton1, 'value', 0);
        end
    end

    if numel(listname(1,:))>=4 % thresholding using otsu
        readthresholdr=listname(:,4);
        readthresholdr=cell2mat(readthresholdr);
        if isnan(readthresholdr)~=1
            readthresholdcheckr=1;
            assignin('base','readthresholdr',readthresholdr);
            set(handles.edit31,'enable','on');
            set(handles.edit5,'enable','off');
            set(handles.radiobutton2, 'value', 0);
        end
    end

    filenumber=numel(channellist1);
    set(handles.text47,'string',filenumber);
    pause(1);
    for k=1:numel(channellist1) % repeat the commands
        channel1=char(channellist1(k));
        channelr=char(channellistr(k));

        assignin('base','channel1',channel1);
        assignin('base','channelr',channelr);
        if readthresholdcheck==1;         
             set(handles.edit30,'string',readthreshold(k));
             pause(1);
        end
        if readthresholdcheckr==1;         
             set(handles.edit31,'string',readthresholdr(k));
             pause(1);
        end

        set(handles.edit1,'string',channel1);
        set(handles.edit2,'string',channelr);     
        set(handles.text34,'string',k);
        pause(1);
        pushbutton4_Callback(hObject, eventdata, handles)
        pushbutton5_Callback(hObject, eventdata, handles)

        close name 'results';
        pause(5);
        close name 'object detection';
        pause(5);
        close name 'middle image'; % close figures
        pause(1);    
    end
end
display 'All done!' 
