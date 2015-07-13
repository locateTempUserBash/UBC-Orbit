hold off
clear all


RUNTIME = 200;
global Fs;
Fs = 10;
RUNTIME_STEPS = RUNTIME*Fs;
global Ts;
Ts = 1/Fs;

global I1;
I1 = 10;
global I2;
I2 = 40;
global I3;
I3 = 40;


% make unit size
initial_pos_vector = [ 0 0 1 ];

r1(1) = initial_pos_vector(1);
r2(1) = initial_pos_vector(2);
r3(1) = initial_pos_vector(3);


% body frame
w_init = [ 0 1 0 ];
target = [ 0 0 0 ];

w1_last = w_init(1);
w2_last = w_init(2);
w3_last = w_init(3);
[w1(1),w2(1),w3(1)] = wEvolution(w_init(1),w_init(2),w_init(3),0,0,0,Ts,I1,I2,I3);




for i = 1:RUNTIME_STEPS
    
    
    
    % controller and inertia change angular momentum
    [t1(i), t2(i), t3(i)] = wController(w1(i), w1_last, w2(i), w2_last, w3(i), w3_last, target);
    [w1(i+1), w2(i+1), w3(i+1)] = wEvolution(w1(i), w2(i), w3(i), t1(i), t2(i), t3(i),Ts,I1,I2,I3);
    
    % update past  
    w1_last = w1(i);
    w2_last = w2(i);
    w3_last = w3(i);
    
    % angular velocity rotates body vector
    pos_vector = [r1(i) ,r2(i), r3(i)]; 
    [r1(i+1),r2(i+1),r3(i+1)] = QuaternionEvolution( w1(i), w2(i), w3(i), r1(i), r2(i), r3(i), Ts );
    
    
    
end

t = linspace(0,RUNTIME,RUNTIME_STEPS+1);

hold on
subplot(2,3,1)
plot(t,w1)
subplot(2,3,2)
plot(t,w2,'r')
subplot(2,3,3)
plot(t,w3,'g')
subplot(2,3,4)
plot(t,r1,'k')
subplot(2,3,5)
plot(t,r2,'y')
subplot(2,3,6)
plot(t,r3,'m')





