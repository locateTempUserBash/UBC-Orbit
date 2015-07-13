function [ t1, t2, t3 ] = wController( w1, w1_last, w2, w2_last, w3, w3_last, target )
% Function takes in angular velocities and generates torques to obtain a
% target angular velocity



% PD control on each axis

kp1 = 1;
kd1 = 0.1;

kp2 = 1;
kd2 = 0.1;

kp3 = 1;
kd3 = 0.1;

% TODO: add integral control coupling terms

p1 = w1 - target(1);
d1 = w1 - w1_last;
p2 = w2 - target(2);
d2 = w2 - w2_last;
p3 = w3 - target(3);
d3 = w3 - w3_last;

t1 = -(kp1*p1+kd1*d1);
t2 = -(kp2*p2+kd2*d2);
t3 = -(kp3*p3+kd3*d3);


end

