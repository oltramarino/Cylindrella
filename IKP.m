function C= IKP(A,B)
%% A function for solving the inverse kinematics for each position of the end-effector %%
% INPUT(S):  NIL
% OUTPUT(S): A: A vector which consists of the milling coordinates
%%
    % Dimensions of the trajectory
    Length= 78;
    Width= 68;
    Depth=15;

    %Sequences along length
    seq1= 5;
    depart= [-12,25,20]; % Departure point- can be modified however must be within WS

    for i=1:58
    t(i)=(i-1)*20/57;
    r(i)=10*(t(i)/20)^3-15*(t(i)/20)^4+6*(t(i)/20)^5;
    rd(i)=30*(t(i)/20)^3/t(i)-60*(t(i)/20)^4/t(i)+30*(t(i)/20)^5/t(i);
    rdd(i)=60*(t(i)/20)^3/t(i)/t(i)-180*(t(i)/20)^4/t(i)/t(i)+120*(t(i)/20)^5/t(i)/t(i);
    X(i)=A(1)+(B(1)-A(1))*r(i);
    Y(i)=A(2)+(B(2)-A(2))*r(i);
    theta2_c(i)=acos((X(i)^2+Y(i)^2-L1^2-L2^2)/(2*L1*L2));
    theta1_c(i)=atan2(Y(i),X(i))-atan2(L2*sin(theta2_c(i)),L1+L2*cos(theta2_c(i)));
    % alpha = [0;0;pi;0];
    % rdena=[20;25;-10+pho(i);25];
    % theta=[theta1(i);theta2(i);0;theta4(i)];
    % d=[0;70;70;0];
    % Dena(i).T=DenaHart(alpha, d, theta,rdena);
    % A=Dena(end).T(1:3,4);
    % A=A';
    drawnow 
    Scara3D(70,70,theta1_c(i), theta2_c(i), pho(i), theta4(i));
    hold on;
    vos=jobs;
    hold off;
    end       

end