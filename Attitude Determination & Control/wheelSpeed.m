function [ rw1, rw2, rw3 ] = wheelSpeed( rw1_last, rw2_last, rw3_last, t1, t2, t3, Ts )
% Integrates torques to compute the angular velocity of reaction wheels 

rw1 = rw1_last+Ts*t1;
rw2 = rw2_last+Ts*t2;
rw3 = rw3_last+Ts*t3;


end

