% Usage: [img]=ReadFrapsPic(FrapsDirPath)

% Amirkabir University of Tehran (Tehran Polytechnic)
% Summer 2011
% http://www.mechatronics3d.com

function [img]=ReadFrapsPic(FrapsDirPath)
% FrapsDirPath is path of Fraps screanshot
addpath(FrapsDirPath)
delete([FrapsDirPath '/*.BMP']) % Delete all BMP files
% Wait for a pic
pause(0.1);
av_files = dir(fullfile([FrapsDirPath '/*.BMP']));
while(size(av_files,1)==0)
av_files = dir(fullfile([FrapsDirPath '/*.BMP']));
end
pause(0.1);
name = av_files.name;
name=[FrapsDirPath '/' name];
img = imread(name);
return




