
function [r,c,s]=PatternMatching(Image,Pattern)
extimg=Image(1:207,1:284,:);
% imshow(extimg)
% h=imread('C:\Users\Amin\Desktop\temp.jpg');

imaq=rgb2gray(extimg);
temp=rgb2gray(Pattern);
s=size(imaq);
g=abs(normxcorr2(temp,imaq));
gT=g==max(g(:));
[r,c]=find(gT==1);
return




