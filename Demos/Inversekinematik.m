function [q1 q2 d3 q4 q5 q6] = Inversekinematik(x,y,z)

% Parameters
% L1=0.17383,L2=0.1627,L3=0.4436,L4=0.18996,L5=0.3999,L6=0.125,L7=0.125

% t01 =
% [ cos(q1), -sin(q1), 0,            0]
% [ sin(q1),  cos(q1), 0,            0]
% [       0,        0, 1, 17383/100000]
% [       0,        0, 0,            1]

% t12 =
% [ cos(q2), -sin(q2),  0, 1627/10000]
% [       0,        0, -1,          0]
% [ sin(q2),  cos(q2),  0,          0]
% [       0,        0,  0,          1]

% t23 =
% [ 1, 0,  0,   0]
% [ 0, 0, -1, -d3]
% [ 0, 1,  0,   0]
% [ 0, 0,  0,   1]

% t34 =
% [ cos(q4), -sin(q4),  0,          0]
% [       0,        0, -1, -1109/2500]
% [ sin(q4),  cos(q4),  0,          0]
% [       0,        0,  0,          1]
% t4e=[1 0 0 0;0 1 0 0;0 0 1 0.8339;0 0 0 1];

% Amirkabir University of Tehran (Tehran Polytechnic)
% Summer 2011
% http://www.mechatronics3d.com

% **************************************************
% radius
r=sqrt(x^2+y^2);        

% first revolute joint angle
a=atan2(y,x)-atan2(1.2775/r,sqrt(1-(1.632/r^2)));

% constraint: -pi<q1<pi
if a>pi
    q1=a-2*pi

elseif a<-pi
     q1=a+2*pi
else
    q1=a
end
        
% Prismatic joint
c=sqrt(0.302+(r*sqrt(1-(1.632/r^2))-0.1627)^2);
if c>0.3
    d3=0.3
else
    d3=c
end


% Second revolute joint angle
b=atan2(r*sqrt(1-(1.632/r^2))-0.1627,0.17383);
if b<0
    q2=-b
else q2=b
end

w=atan((cos(q2)*(0.1627-y*sin(q1)-x*cos(q1))-sin(q2)*(0.17383+z))/(cos(q2)*(0.17383-z)+sin(q2)*(x*cos(q1)+y*sin(q1)-0.1627)-d3));
if w>pi
    q4=w-2*pi

elseif w<-pi
     q4=w+2*pi
else
    q4=w
end

q5=0
q6=0
end

