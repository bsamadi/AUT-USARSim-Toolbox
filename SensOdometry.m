% [Position,Time,Odometry]=SensOdometry(Robot)

% Amirkabir University of Tehran (Tehran Polytechnic)
% Summer 2011
% http://www.mechatronics3d.com

function [Position,Time,Odometry]=SensOdometry(Robot)
    while(Robot.Connection.BytesAvailable>0)
        fread(Robot.Connection,Robot.Connection.BytesAvailable);
    end
    if nargin > 1
        error('Too many input arguments');
    elseif nargin < 1
        error('Too few input arguments');
    else
        set(Robot.Connection,'ReadAsyncMode','continuous');
        Flag=1;
        i=1;
        while Flag && (i<1000);
            i=i+1;
            if Robot.Connection.BytesAvailable>0
                Line=fscanf(Robot.Connection);
                Find=strfind(Line ,'{Type Odometry}');
                if ~isempty(Find)
                    EndInds=strfind(Line ,'}');
                    StrInd=strfind(Line ,'{Name');
                    if ~isempty(StrInd)
                        EndInd=EndInds(find(EndInds>StrInd,1));
                        Odometry.Name=Line(StrInd+6:EndInd-1);
                    end
                    StrInd=strfind(Line ,'{Pose');
                    if ~isempty(StrInd)
                        EndInd=EndInds(find(EndInds>StrInd,1));
                        Odometry.Pose=Line(StrInd+6:EndInd-1);
                        Index=strfind(Odometry.Pose ,',');
                        Position(1)=str2num(Odometry.Pose(1:Index(1)-1)); %#ok<ST2NM>
                        Position(2)=str2num(Odometry.Pose(Index(1)+1:Index(2)-1)); %#ok<ST2NM>
                        Position(3)=str2num(Odometry.Pose(Index(2)+1:end)); %#ok<ST2NM>
                    else
                        Position='Erorr';
                    end
                    StrInd=strfind(Line ,'{Time');
                    if ~isempty(StrInd)
                        EndInd=EndInds(find(EndInds>StrInd,1));
                        Odometry.Time=Line(StrInd+6:EndInd-1);
                        Time=str2num(Odometry.Time); %#ok<ST2NM>
                    else
                        Time=-1;
                    end
                    Flag=0;
                end
            else
                pause(0.5);
                if Robot.Connection.BytesAvailable<=0
                    Flag=0;
                    set(Robot.Connection,'ReadAsyncMode','manual');
                    error('Timeout in Odometry Sens Check if USARSim Run and Robot is initialized')
                end
            end
        end
        if i>1000
            set(Robot.Connection,'ReadAsyncMode','manual');
            error('Not Odometry sensor response');
        end
        set(Robot.Connection,'ReadAsyncMode','manual');
    end
end