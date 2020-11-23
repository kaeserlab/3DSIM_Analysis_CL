function [page,width,height,image]=Fileread(filename,removeb,removet)

information=imfinfo(filename);
page=size(information,1);
width=information.Width;
height=information.Height;

if information(1).BitsPerSample==[8,8,8] % for RGB files, use the first page info because it will generate errors if using multiple pages
    if page>1
        page=page-removet-removeb; % remove some pages from top and bottom
        image=zeros(height,width,page);
        m=0;
        for k=1+removet:page+removet
            m=m+1;
            temporaryimage=imread(filename,k); % read RGB file
            image(:,:,m)=temporaryimage(:,:,1); % convert to unit8
        end
    else
        temporaryimage=imread(filename);
        image=temporaryimage(:,:,1);
        image(:,:,2)=image;
        page=2;
    end
end
    

if information(1).BitsPerSample~=[8,8,8] % for non-RGB files
    if page>1
        page=page-removet-removeb; % remove some pages from top and bottom
        image=zeros(height,width,page);
        m=0;
        for k=1+removet:page+removet
            m=m+1;
            image(:,:,m)=imread(filename,k);
        end
    else
        image=imread(filename);
        image(:,:,2)=image;
        page=2;
    end
end


