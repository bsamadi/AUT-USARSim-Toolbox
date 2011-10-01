% [Names,Range]=SensSonar(Robot)
function [Names,Range]=SensSonar(Robot)
    while(Robot.Connection.BytesAvailable>0)
        fread(Robot.Connection,Robot.Connection.BytesAvailable);
    end
    if nargin > 1
        error('Too many input arguments');
    elseif nargin < 1
        error('Not enough input arguments. The Robot must be specified.');
    else
        set(Robot.Connection,'ReadAsyncMode','continuous');
        Flag=1;
        i=1;
        while Flag && (i<1000);
            i=i+1;
            if Robot.Connection.BytesAvailable>0
                Line=fscanf(Robot.Connection);
                Find=strfind(Line ,'{Type Sonar}');
                if ~isempty(Find)
                    EndInds=strfind(Line ,'}');
                    RangeInds=strfind(Line ,'Range');
                    StrInd=strfind(Line ,'{Name');
                    if ~isempty(StrInd)
                        for j=1:length(StrInd)
                            Names{j}=Line(StrInd(j)+6:RangeInds(j)-1);
                            EndInd=EndInds(find(EndInds>RangeInds(j),1));
                            Range(j)=str2num(Line(RangeInds(j)+6:EndInd-1)); %#ok<ST2NM>
                        end
                    end
                    
                    StrInd=strfind(Line ,'{Time');
                    if ~isempty(StrInd)
                        EndInd=EndInds(find(EndInds>StrInd,1));
                        Time=str2num(Line(StrInd+6:EndInd-1)); %#ok<ST2NM>
                    else
                        Time=-1;
                    end
                    Flag=0;
                end
            else
                pause(1);
                if Robot.Connection.BytesAvailable<=0
                    Flag=0;
                    set(Robot.Connection,'ReadAsyncMode','manual');
                    error('Timeout in Sonar Sens Check if USARSim Run and Robot is initialized')
                end
            end
        end
        if i>1000
            set(Robot.Connection,'ReadAsyncMode','manual');
            error('Not Sonar sensor response');
        end
        set(Robot.Connection,'ReadAsyncMode','manual');
    end
end