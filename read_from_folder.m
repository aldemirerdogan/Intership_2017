% read data from folder

clear ALL;
clc;
close all;
slice_number =97;
liverp_v = zeros(512,512,slice_number);

% slice_number =100;
for a = 1:slice_number
   filename = ['liverp_1' num2str(a-1,'%02d')];
   img = imread(filename);
   liverp_v(:,:,a) = imbinarize(img);
   % you can skip the imbinarize since the data is already binary
end
