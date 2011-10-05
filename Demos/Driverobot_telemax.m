% Driverobot_telemax(r,c,s)

% Amirkabir University of Tehran (Tehran Polytechnic)
% Summer 2011
% http://www.mechatronics3d.com

function Driverobot_telemax(r,c,s)

bound=40
    if (c-(s(2)/2)<=bound)||(c-(s(2)/2)>=-bound)
        DriveRobotDiff(Robot,3,3,1)
   
    elseif c-(s(2)/2)>bound
            DriveRobotDiff(Robot,3,5,1)
   
    elseif c-(s(2)/2)<-bound
            DriveRobotDiff(Robot,5,3,1)
           
    end
    
    
return

