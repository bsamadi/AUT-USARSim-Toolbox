%Mannage Veiwpoint
%   SET {Type Camera} {Robot string} {Name string}{Client ip}
%   This command sets the viewpoint of the specified Unreal Client to a
% robot’s camera. The unreal client is defined by ‘{Client ip}’ where ‘ip’
% is the client’s IP address. Please note USARSim doesn’t support the
% loopback ip address. So don’t use “127.0.0.1” as the parameter. The robot
% is specified by ‘{Robot string}’ where ‘string’ is the robot’s name. And
% the camera is specified by ‘{Name string}’ where ‘string’ is the camera’s
% name. Once the client’s viewpoint is set, we can NOT manually change it
% until we release the viewpoint control. To release the control, we send
% another SET command without ‘{robot name}’. For example, we can send “SET
% {Type Camera} {Client 10.0.0.2}” to release the viewpoint control on
% client 10.0.0.2.
%   We can use this command at anytime and anyplace. This command can be 
% sent either from a robot’s controller or from other applications such as
% the ImageServer.
Robot=InitializeRobot();
Cam=tcpip('10.0.0.2', 3000,'Terminator',{'CR/LF','CR/LF'});
fprintf(Robot.Connection,'SET {Type Camera} {Robot MyRobot} {Name GCam} {Client 10.0.0.2}');
fopen(Cam)
fscanf(Cam)

