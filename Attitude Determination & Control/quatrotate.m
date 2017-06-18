function vec = quatrotate(quaternion,position)
% This funciton rotates the vector with utilizing quaternions
% Please be aware that the quaternions are normalised!

  q0 = quaternion(1);
  q1 = quaternion(2);
  q2 = quaternion(3);
  q3 = quaternion(4);
  
  x = position(1);
  y = position(2);
  z = position(3);

   x = x*(1-2*q2*q2-2*q3*q3)+y*(2*(q1*q2+q0*q3))+z*(2*(q1*q3-q0*q2));
   y = x*(2*(q1*q2-q0*q3))+y*(1-2*q1*q1-2*q3*q2)+z*(2*(q2*q3+q0*q1));
   z = x*(2*(q1*q3+q0*q2))+y*(2*(q2*q3-q0*q1))+z*((1-2*q1*q1-2*q2*q2));
   vec = [x y z];
end