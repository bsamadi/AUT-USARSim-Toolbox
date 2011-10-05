% Robot = InitializeRobot(Class,Position,Name,Orientation,RobotProfile)

% Amirkabir University of Tehran (Tehran Polytechnic)
% Summer 2011
% http://www.mechatronics3d.com

function Robot = InitializeRobot(Class,Position,Name,Orientation,RobotProfile)
    
    Defaults={'TeleMax',[0,0.1,1.8],'MyRobot',[0,0,1.5708],0};
%     %Some where I Read that in y position of zero USARSim has a bug!
    if nargin > 2
        if Position(2)==0
            Position(2)=0.1;
        end
    end

    if nargin > 5
        error('Too many input arguments');
    elseif nargin == 5
        Robot.Name=Name;
        Robot.Class=Class;
    elseif nargin == 4
        RobotProfile=Defaults{5};
        Robot.Name=Name;
        Robot.Class=Class;
    elseif nargin == 3
        RobotProfile=Defaults{5};
        Orientation=Defaults{4};
        Robot.Name=Name;
        Robot.Class=Class;
    elseif nargin == 2
        RobotProfile=Defaults{5};
        Orientation=Defaults{4};
        Robot.Name=Defaults{3};
        Robot.Class=Class;
    elseif nargin == 1
        RobotProfile=Defaults{5};
        Orientation=Defaults{4};
        Robot.Name=Defaults{3};
        Position=Defaults{2};
        Robot.Class=Class;
    else
        RobotProfile=Defaults{5};
        Orientation=Defaults{4};
        Robot.Name=Defaults{3};
        Position=Defaults{2};
        Robot.Class=Defaults{1};
    end
    
    Robot.Connection=tcpip('localhost', 3000,'Terminator',{'CR/LF','CR/LF'},'inputbuffersize',4096);
    fopen(Robot.Connection);
    set(Robot.Connection,'ReadAsyncMode','manual');
    
    fprintf(Robot.Connection,['INIT {ClassName USARBot.' Robot.Class '} ' ...
            '{Name ' Robot.Name '} ' ...
            '{Location ' num2str(Position(1)) ',' num2str(Position(2)) ',' num2str(Position(3)) '} ' ...
            '{Rotation ' num2str(Orientation(1)) ',' num2str(Orientation(2)) ',' num2str(Orientation(3)) '}']);
    if RobotProfile
        path='C:/UT2004';
        Robot=AddRobotProfile(Robot,path);
    end
    