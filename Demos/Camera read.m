
function [r,c,s]=Camera
Path='C:\Images\Usar\test2';%path of Fraps screanshot

addpath(Path) 
delete([Path '/*.BMP']) % Delete all BMP files
% Wait for a pic
av_files = dir(fullfile([Path '/*.BMP']));
while(size(av_files,1)==0)
av_files = dir(fullfile([Path '/*.BMP']));
end
name = av_files.name;
name=[Path '/' name];
img = imread(name);

image(img);
extimg=img(1:207,1:284,:);
% imshow(extimg)
h=imread('C:\Users\Amin\Desktop\temp.jpg');
% imshow(h);
% 
% 
imaq=rgb2gray(extimg);
temp=rgb2gray(h);
s=size(imag);
% 
% 
g=abs(normxcorr2(temp,imaq));
gT=g==max(g(:));
[r,c]=find(gT==1);
return




