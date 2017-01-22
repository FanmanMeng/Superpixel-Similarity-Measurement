function label=initilization(img_path,img_name,par1,par2,M_o,N_o)
% inptu: 
% img_path: the path of image folder
% img_name: the name of images

%outpt
%img: Original image set.
%img_new: image set with superpixel normalization.
%super: the sturture of superpixel representation.
%Gist: Gist features

%% parameters setting

out='.\image\SLIC\';
mkdir(out);
func='SLICSuperpixelSegmentation';
cand_param=[par1,par2];




%% pre-processing
    disp('Pre-processing of SLIC over-segmentation...');
    img_temp=imread([img_path,img_name]); % imread the image
    img_small=imresize(img_temp,[M_o,N_o]); % resize the image
    img=double(img_small);
    
    %% SLIC processing
    imwrite(img_small,[img_path,strrep(img_name,'.jpg','.bmp')]);% convert to bmp
    file=[img_path,strrep(img_name,'.jpg','.bmp')];% setting file for SLIC
    commond=[func,' ',file,' ',num2str(cand_param(1)),' ',num2str(cand_param(2)),' ',out];
    system(commond);% perform SLIC
    % read the superpixel as "label"
    label_path=fopen([out,strrep(img_name,'.jpg','.dat')],'r');
    label=(fread(label_path,[size(img_small,2),size(img_small,1)],'int'))';
    fclose(label_path);
    label=label+1;
    %% obtain the sift descriptor

