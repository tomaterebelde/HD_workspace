% importation of the robot 
robot= importrobot('C:\Users\sami bouziri\Desktop\xplore\HD15\HD15\urdf\HD16.urdf');
bodyEndEffector = rigidBody('endeffector');
tform = [ 0 0 1 0;
          1 0 0 0;
          0 1 0 0.3;
          0 0 0 1];
setFixedTransform(bodyEndEffector.Joint,tform);
addBody(robot,bodyEndEffector,'Link_G');
home_config=homeConfiguration(robot);

% defining waypoints
waypoint_joints=[ 0        ,0    ,0      ,0     ,0      ,0      ,0;
                  3*pi/4   ,0.5  ,0.5    ,0.5   ,0.6    ,0.6    ,3*pi/4;
                  -pi/2    ,0.5  ,-0.5   ,-0.6  ,-0.6   ,-0.5   ,-pi/2;
                  0        ,0    ,0      ,0     ,0      ,0      ,0;
                  -pi/4    ,0    ,0      ,0     ,0      ,0      ,-pi/4;
                  0        ,-pi/2,-pi/2  ,-pi/2 ,-pi/2  ,-pi/2  ,0];
% coordinates (1) / joints (0)
coor_joint=[0 1 1 1 1 1 0];
           
% sample time             
ts=0.2;
% time at waypoints
time_interval=[0 5 10 13 16 19 34];
% trajectory in task space (0) or joint space (1)
task_joint=[1 0 0 0 0 1];
% initialization of the inverse kinematics parameters
ik = inverseKinematics('RigidBodyTree',robot);
ikWeights = [1 1 1 1 1 1];
ikInitGuess = set_config(home_config,[0,3*pi/4,-pi/2,0,-pi/4,0]);
% transform matrix of the trajectory 
point_number=1;
q=zeros(6,time_interval(end)/ts+1);
for i = 1:size(time_interval,2)-1
    time_interval_i= time_interval(i:i+1);
    traj_times= time_interval_i(1):ts:time_interval_i(2);
    if task_joint(i)==0
        if (coor_joint(i))
            T0 = trvec2tform(waypoint_joints(1:3,i)') * eul2tform(waypoint_joints(4:6,i)');
        else 
            config=set_config(home_config,waypoint_joints(:,i));
            T0=getTransform(robot,config,'endeffector','base_link');
        end
        if (coor_joint(i+1))
            Tf = trvec2tform(waypoint_joints(1:3,i+1)') * eul2tform(waypoint_joints(4:6,i+1)');
        else
            config=set_config(home_config,waypoint_joints(:,i+1));
            Tf=getTransform(robot,config,'endeffector','base_link');
        end
        [s,sd,sdd] = quinticpolytraj([0 1],time_interval_i,traj_times);
        [T,vel,acc] = transformtraj(T0,Tf,time_interval_i,traj_times, ... 
                                        'TimeScaling',[s;sd;sdd]);
         for idx = 1:numel(traj_times) 
            % Solve IK
            tgtPose = T(:,:,idx);
            [config,info] = ik('endeffector',tgtPose,ikWeights,ikInitGuess);
            ikInitGuess = config;
            q(:,point_number)=get_joint(config);
            point_number=point_number+1;
         end
    else 
        jointi=get_joint(ikInitGuess);
        if (coor_joint(i+1))
            tgtPose = trvec2tform(waypoint_joints(1:3,i+1)') * eul2tform(waypoint_joints(4:6,i+1)');
            [config,info] = ik('endeffector',tgtPose,ikWeights,ikInitGuess);
            jointf=get_joint(config);
            ikInitGuess = config;
        else 
            jointf=waypoint_joints(:,i+1);
            ikInitGuess = set_config(home_config,jointf);
        end
        [q1,qd1,qdd1] = quinticpolytraj([jointi,jointf],time_interval_i,traj_times, ... 
                    'VelocityBoundaryCondition',zeros(6,2), ...
                    'AccelerationBoundaryCondition',zeros(6,2));
        q(:,point_number:point_number+numel(traj_times)-1)=q1;
        point_number=point_number+numel(traj_times);
    end
    point_number=point_number-1;
end
 