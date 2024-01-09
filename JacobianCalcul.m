function [Jinv,Jdot]=JacobianCalcul()

clear all;
clc;

syms q1 q2 L1 L2 rho q4;


% Direct kinematics of Scara for the robot with offsets (TD-5 to 8)
Px= L1*cos(q1) + L2*cos(q1+q2);
Py= L1*sin(q1) + L2*sin(q1+q2);
Pz= 10-rho;


% v is a vector that consists of Joint-variables
v= [q1 q2 rho q4];

% Cartesian Jacobians

J1= gradient(Px,v); %First row of Jacobian
J1= transpose(J1); % Convert from column to row wise

J2= gradient(Py,v); %First row of Jacobian
J2= transpose(J2); % Convert from column to row wise

J3= gradient(Pz,v); %First row of Jacobian
J3= transpose(J3); % Convert from column to row wise


J= [J1;J2;J3] %It should be 3x4

Jinv= pinv(J); %We do pseudo inverse as we dont have square matrix

Jinv= simplify(Jinv) %To remove conj terms of pinv we do simplify: 4x3 matrix after inversion


%For Jdot, it is done using 'for' loop, it is a 3x4 matrix like J

for i = 1: 3
    for j= 1 : 4

        Jdot(i,j)= diff(J(i,j),v(j));

    end

end

% Numerical substitutions
% Be careful, I am substituting for fixed values of q1 and q2. While
% performing simulations these angles vary according to robot postures so
% send the input variables accordingly

% Jnum = double(subs(J,{q1 q2 L1 L2},{pi/3 pi/3 70 70})) % 3x4
% JinNum = double(subs(Jinv,{q1 q2 L1 L2},{pi/3 pi/3 70 70})) % 4x3
% JdNum = double(subs(Jdot,{q1 q2 L1 L2},{pi/3 pi/3 70 70})) % 3x4
end





