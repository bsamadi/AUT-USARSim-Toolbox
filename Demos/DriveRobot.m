% Not complete Yet!
%
% There are seven kinds of control command. The first kind controls the
% left and right side wheels of a skid steered robot. The second kind
% controls the front and rear wheels of an Ackerman steered robot. The
% third kind controls an underwater robot. The fourth kind controls an
% aerial vehicle. The fifth kind controls the wheels of an OmniDrive robot.
% The sixth kind controls a specified joint of the robot. The seventh kind
% controls the angle of multiple joints of a robot, which is convenient for
% flipper, leg, and arm control. 

% Amirkabir University of Tehran (Tehran Polytechnic)
% Summer 2011
% http://www.mechatronics3d.com
 
function DriveRobot(Robot,Command,CommandType)
    if nargin > 3
        error('Too many input arguments');
    elseif nargin == 3
        
    elseif nargin == 2
        
    elseif nargin < 2
        error('Too few input arguments');
    end