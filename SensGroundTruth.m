%[Location,Orientation,Time,GroundTruth]=SensGroundTruth(Robot)

% Amirkabir University of Tehran (Tehran Polytechnic)
% Summer 2011
% http://www.mechatronics3d.com

function [Location,Orientation,Time,GroundTruth]=SensGroundTruth(Robot)
    while(Robot.Connection.BytesAvailable>0)
        fread(Robot.Connection,Robot.Connection.BytesAvailable);
    end
    if nargin > 1
        error('Too many input arguments');
    elseif nargin < 1
        error('Too few input arguments');
    else
        set(Robot.Connection,'ReadAsyncMode','continuous');
        fscanf(Robot.Connection);
        Flag=1;
        i=1;
        while Flag && (i<1000);
            i=i+1;
            if Robot.Connection.BytesAvailable>0
                Line=fscanf(Robot.Connection);
                Find=strfind(Line ,'{Type GroundTruth}');
                if ~isempty(Find)
                    EndInds=strfind(Line ,'}');
                    StrInd=strfind(Line ,'{Name');
                    if ~isempty(StrInd)
                        EndInd=EndInds(find(EndInds>StrInd,1));
                        GroundTruth.Name=Line(StrInd+6:EndInd-1);
                    end
                    StrInd=strfind(Line ,'{Location');
                    if ~isempty(StrInd)
                        EndInd=EndInds(find(EndInds>StrInd,1));
                        GroundTruth.Location=Line(StrInd+10:EndInd-1);
                        Index=strfind(GroundTruth.Location ,',');
                        Location(1)=str2num(GroundTruth.Location(1:Index(1)-1)); %#ok<ST2NM>
                        Location(2)=str2num(GroundTruth.Location(Index(1)+1:Index(2)-1)); %#ok<ST2NM>
                        Location(3)=str2num(GroundTruth.Location(Index(2)+1:end)); %#ok<ST2NM>
                    else
                        Location='Erorr';
                    end
                    StrInd=strfind(Line ,'{Orientation');
                    if ~isempty(StrInd)
                        EndInd=EndInds(find(EndInds>StrInd,1));
                        GroundTruth.Orientation=Line(StrInd+13:EndInd-1);
                        Index=strfind(GroundTruth.Orientation ,',');
                        Orientation(1)=str2num(GroundTruth.Orientation(1:Index(1)-1)); %#ok<ST2NM>
                        Orientation(2)=str2num(GroundTruth.Orientation(Index(1)+1:Index(2)-1)); %#ok<ST2NM>
                        Orientation(3)=str2num(GroundTruth.Orientation(Index(2)+1:end)); %#ok<ST2NM>
                    else
                        Orientation='Erorr';
                    end
                    StrInd=strfind(Line ,'{Time');
                    if ~isempty(StrInd)
                        EndInd=EndInds(find(EndInds>StrInd,1));
                        GroundTruth.Time=Line(StrInd+6:EndInd-1);
                        Time=str2num(GroundTruth.Time); %#ok<ST2NM>
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
                    error('Timeout in GroundTruth Sens Check if USARSim Run and Robot is initialized')
                end
            end
        end
        if i>1000
            set(Robot.Connection,'ReadAsyncMode','manual');
            error('Not GroundTruth sensor response');
        end
        set(Robot.Connection,'ReadAsyncMode','manual');
    end
end