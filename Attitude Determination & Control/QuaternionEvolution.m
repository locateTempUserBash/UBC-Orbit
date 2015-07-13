function [ x, y, z ] = QuaternionEvolution( w1, w2, w3, r1, r2, r3, Ts )
% Earth-cenetered quaternion evolution returns a vector which represents angular position


size = (w1^2+w2^2+w3^2)^(1/2);

norm_w1 = w1/size;
norm_w2 = w2/size;
norm_w3 = w3/size;

theta = Ts*size;
quaternion  = sin(theta/2)*[ cot(theta/2), norm_w1, norm_w2, norm_w3 ];

position = [r1 r2 r3];
new = quatrotate(quaternion, position);

x = new(1);
y = new(2);
z = new(3);


end

