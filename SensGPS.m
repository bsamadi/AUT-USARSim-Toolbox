%[Latitude,Longitude,Time,Fix,Satellites,GPS]=SensGPS(Robot)
function [Latitude,Longitude,Time,Fix,Satellites,GPS]=SensGPS(Robot)
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
                Find=strfind(Line ,'{Type GPS}');
                if ~isempty(Find)
                    EndInds=strfind(Line ,'}');
                    StrInd=strfind(Line ,'{Name');
                    if ~isempty(StrInd)
                        EndInd=EndInds(find(EndInds>StrInd,1));
                        GPS.Name=Line(StrInd+6:EndInd-1);
                    end
                    StrInd=strfind(Line ,'{Latitude');
                    if ~isempty(StrInd)
                        EndInd=EndInds(find(EndInds>StrInd,1));
                        GPS.Latitude=Line(StrInd+10:EndInd-1);
                        Index=strfind(GPS.Latitude ,',');
                        Latitude(1)=str2num(GPS.Latitude(1:Index(1)-1)); %#ok<ST2NM>
                        Latitude(2)=str2num(GPS.Latitude(Index(1)+1:Index(2)-1)); %#ok<ST2NM>
                        S_N=GPS.Latitude(Index(2)+1:end);
                        if strcmpi(S_N,'S')
                            Latitude(3)=+1;
                        else
                            Latitude(3)=-1;
                        end
                    else
                        Latitude='Erorr';
                    end
                    StrInd=strfind(Line ,'{Longitude');
                    if ~isempty(StrInd)
                        EndInd=EndInds(find(EndInds>StrInd,1));
                        GPS.Longitude=Line(StrInd+11:EndInd-1);
                        Index=strfind(GPS.Longitude ,',');
                        Longitude(1)=str2num(GPS.Longitude(1:Index(1)-1)); %#ok<ST2NM>
                        Longitude(2)=str2num(GPS.Longitude(Index(1)+1:Index(2)-1)); %#ok<ST2NM>
                        E_W=GPS.Latitude(Index(2)+1:end);
                        if strcmp(E_W,'E')
                            Longitude(3)=+1;
                        else
                            Longitude(3)=-1;
                        end
                    else
                        Longitude='Erorr';
                    end
                    StrInd=strfind(Line ,'{Time');
                    if ~isempty(StrInd)
                        EndInd=EndInds(find(EndInds>StrInd,1));
                        GPS.Time=Line(StrInd+6:EndInd-1);
                        Time=str2num(GPS.Time); %#ok<ST2NM>
                    else
                        Time=-1;
                    end
                    StrInd=strfind(Line ,'{Fix');
                    if ~isempty(StrInd)
                        EndInd=EndInds(find(EndInds>StrInd,1));
                        GPS.Fix=Line(StrInd+5:EndInd-1);
                        Fix=str2num(GPS.Fix); %#ok<ST2NM>
                    else
                        Fix=0;
                    end
                    StrInd=strfind(Line ,'{Satellites');
                    if ~isempty(StrInd)
                        EndInd=EndInds(find(EndInds>StrInd,1));
                        GPS.Satellites=Line(StrInd+12:EndInd-1);
                        Satellites=str2num(GPS.Satellites); %#ok<ST2NM>
                    else
                        Satellites=-1;
                    end
                    
                    Flag=0;
                end
            else
                pause(0.5);
                if Robot.Connection.BytesAvailable<=0
                    Flag=0;
                    set(Robot.Connection,'ReadAsyncMode','manual');
                    error('Timeout in GPS Sens Check if USARSim Run and Robot is initialized')
                end
            end
        end
        if i>1000
            set(Robot.Connection,'ReadAsyncMode','manual');
            error('Not GPS sensor response');
        end
        set(Robot.Connection,'ReadAsyncMode','manual');
    end
end