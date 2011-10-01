% DriveJoints(Robot,Name,Value,Steer,Order)
% Drive Robots joint
% NOT TESTED
function DriveMultipleJoints(Robot,Joints,Value)
    if nargin ~= 3
        error('Not correct input arguments Please enter Robot Joints Name & Value Of Joints ');
    else
        NJoints=length(Joints);
        if length(Value)~=NJoints
            if length(Value)<NJoints
                Value(end+1:NJoints)=Value(end);
            end
        end
        Msg='MULTIDRIVE';
        for i=1:NJoints
            Msg=[Msg ' {' Joints{i} ' ' num2str(Value(i)) '}' ];
        end
    end
    
    fprintf(Robot.Connection,Msg);
end