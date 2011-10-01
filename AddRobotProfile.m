% Not complete Yet!
% 
% Robot= Robot that made from InitializRobot
% Exampel1  Robot=AddRobotProfile(Robot)
% Exampel2  Robot=AddRobotProfile(Robot,'C:\UT2004\System')
% 
function Robot=AddRobotProfile(Robot,path)
    
    if nargin > 2
        error('Too many input arguments');
    elseif nargin == 1
        path='C:\UT2004';
    elseif nargin < 0
        error('Too few input arguments');
    end
    
%     clc
%     path='C:\USARBot.ini';
%     Robot.Class='TeleMax';
    path=[path '\System\USARBot.ini'];
    fid=fopen(path);
    RobotClass=['[USARBot.' Robot.Class ']'];
    Line=1;
    while isempty(strfind(Line ,RobotClass))&(isempty(Line)|(Line~=-1))%#ok<AND2,OR2>
        Line=fgetl(fid);
    end
%     fprintf([Line '\n']);
    if (Line==-1)
        error('Can`t Find the Robot !!!');
    end
    Line=fgetl(fid);
    Robot.NMisPkg=0;
    Robot.MisPkg={};
    Robot.NJoints=0;
    Robot.Joints={};
    Robot.NSensor=0;
    Robot.Sensor={};
    Robot.NEffect=0;
    Robot.Effect={};
    Robot.NHLight=0;
    Robot.HLight={};
    while isempty(strfind(Line ,'[USARBot.'))&(isempty(Line)|(Line~=-1)) %#ok<AND2,OR2>
        if strfind(Line ,'JointParts=')
            Robot.NJoints=Robot.NJoints+1;
            index=strfind(Line ,'"');
            Robot.Joints{Robot.NJoints}=Line(index(1)+1:index(2)-1);
        elseif strfind(Line ,'Sensors')
            Robot.NSensor=Robot.NSensor+1;
            index=strfind(Line ,'"');
            Robot.Sensor{Robot.NSensor}=Line(index(1)+1:index(2)-1);
        elseif strfind(Line ,'MisPkgs=')
            Robot.NMisPkg=Robot.NMisPkg+1;
            index=strfind(Line ,'"');
            Robot.MisPkg{Robot.NMisPkg}=Line(index(1)+1:index(2)-1);
        elseif strfind(Line ,'Effecters=')
            Robot.NEffect=Robot.NEffect+1;
            index=strfind(Line ,'"');
            Robot.Effect{Robot.NEffect}=Line(index(1)+1:index(2)-1);
         elseif strfind(Line ,'HeadLights=')
            Robot.NHLight=Robot.NHLight+1;
            index=strfind(Line ,'"');
            Robot.HLight{Robot.NHLight}=Line(index(1)+1:index(2)-1);
        end
        Line=fgetl(fid);
    end
    
    