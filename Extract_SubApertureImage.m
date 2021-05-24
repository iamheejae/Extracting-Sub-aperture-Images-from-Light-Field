clc; clear;
%%  Load Data %%
%x,y,u,v parameter of raw light field image
u=376; v=541; %spatial samples
x=14; y=14; % angular samples
start_x = 4; start_y = 4;
sub_aperture=uint8(zeros(u,v,3));
    
data_dir='./data/Flowers_8bit';
if ~isdir(data_dir)
  errorMessage = sprintf('Error: The following folder does not exist:\n%s', data_dir);
  uiwait(warndlg(errorMessage));
  return;
end

filePattern = fullfile(data_dir, '*.png');  %put the correct file format
pngFiles = dir(filePattern);
for k = 1:length(pngFiles)
    baseFileName = pngFiles(k).name;
    [~,baseFileName_length]=size(baseFileName);
    current_data_name=baseFileName(:,1:(baseFileName_length-4));  %4=length(.png)
    fullFileName = fullfile(data_dir, baseFileName);
    data = imread(fullFileName);
    [size_x,size_y,~]=size(data); %data size
    
    foldername = sprintf('./result/%s',current_data_name);
    if isdir(foldername)~=1
        mkdir(foldername);
    end
    
    for select_pix_x=start_x:1:x-3
        for select_pix_y=start_y:1:y-3
            for i=1:x:size_x
                for j= 1:y:size_y
                    extract_each_microlens=data(i:i+(x-1),j:j+(y-1),:);
                    select_position=extract_each_microlens(select_pix_x,select_pix_y,:);
                    sub_aperture(ceil(i/x),ceil(j/y),:)=select_position;
                end
            end

            filename=sprintf('%s/HR_%d_(%d,%d).tif',foldername,k,select_pix_x,select_pix_y);
            imwrite(sub_aperture,filename);
        end
    end
end
