function [ w1_next, w2_next, w3_next ] = wEvolution( w1, w2, w3, t1, t2, t3, Ts, I1, I2, I3 )


% Body evolution given the current angular velocities and torques on the
% body

   
    w1_dot = (t1 - (I3-I2)*w2*w3)/I1;
    w2_dot = (t2 - (I1-I3)*w3*w1)/I2;
    w3_dot = (t3 - (I2-I1)*w1*w2)/I3;
    
    w1_next = w1+w1_dot*Ts;
    w2_next = w2+w2_dot*Ts;
    w3_next = w3+w3_dot*Ts;
   

end

