% Not complete Yet!
% 
% Robot= Robot that made from InitializRobot
% MissionName= Name of Mission acording to USARBot.ini
% Joints= an array Of Joints Number that you want control them
% Value=an array with same size of Joints Set Point Of Joint order Value
% Order= 0 (Position) or 1 (Speed) or 2 (Torque) It can be array or a
% number for all joint (also you can Use defult with dont enter anything)
% defult is Position.
% Exampel ControllMisPkg(Robot,'TeleMaxArm',[2 1],[pi/2,pi],[0,1])
% 
% 
function ControllMisPkg(Robot,MissionName,Joints,Value,Order)
    if nargin > 5
        error('Too many input arguments');
    elseif nargin == 5
%         Chek thet inputs lengh are the same
        nJoints=length(Joints);
        if nJoints~=length(Value)
            error('Set All Joint Value');
        else
            nOrder=length(Order);
            if nJoints~=nOrder
                if nJoints>nOrder
                Order=[Order , Order(end)*ones(1,nJoints-nOrder)];
                else
                    Order=Order(1:nJoints);
                end
            end
            SendMisPkgMsg(Robot,MissionName,Joints,Value,Order);
        end
    elseif nargin == 4
        nJoints=length(Joints);
        if nJoints~=length(Value)
            error('Set All Joint Value');
        else
            Order=zeros(1,nJoints);
            SendMisPkgMsg(Robot,MissionName,Joints,Value,Order);
        end
    elseif nargin < 3
        error('Not enough input arguments');
    end
    
    function SendMisPkgMsg(Robot,MissionName,Joints,Value,Order)
        Msg=['MISPKG {Name ' MissionName '}'];
        for i=1:length(Joints)
            Msg=[Msg ' {Link ' num2str(Joints(i)) '}'...
                ' {Value ' num2str(Value(i)) '} {Order ' num2str(Order(i)) '}'];
        end
        fprintf(Robot.Connection,Msg);
    return