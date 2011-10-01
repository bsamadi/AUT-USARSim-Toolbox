clear all
Path='E:/Fraps/Screenshots';%path of Fraps screanshot

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