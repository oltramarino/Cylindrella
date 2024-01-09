O=[0,0,0];
th1=2*pi;
rho1=40;
rho2=50;
% %%%%
% Q3
% pl= RPP(O,th1,rho1,rho2) 
% %%

% Define the DH parameters for the robot:
r = [20, rho1+50, rho2+62];   % link lengths (m)
alpha = [0, 0,pi/2];   % link twists (rad)
d = [0, 0, 0];   % link offsets (m)
theta = [th1, 0, 0];   % joint angles (rad)

[T0Tn,T] = DenaHart(alpha, d, theta, r);

f=3;
tf=15;

th1_limit=[0,0];
rho1_limit=[0,40];
rho2_limit=[25,25];

for i=1:58
    t(i)=(i-1)*tf/57;
    r(i)=10*(t(i)/tf)^3-15*(t(i)/tf)^4+6*(t(i)/tf)^5;
    rv(i)=30*(t(i)^2/tf^3)-60*(t(i)^3/tf^4)+30*(t(i)^4/tf^5);
    ra(i)=60*(t(i)/tf^3)-180*(t(i)^2/tf^4)+120*(t(i)^3/tf^5);
    %simulation position
    % th1(i)=th1_limit(1)+(th1_limit(2)-th1_limit(1))*r(i);
    rho1(i)=rho1_limit(1)+(rho1_limit(2)-rho1_limit(1))*r(i);
    r = [20, rho1(i)+50, 25+62];   % link lengths (m)
    alpha = [0, 0,pi/2];   % link twists (rad)
    d = [0, 0, 0];   % link offsets (m)
    theta = [0, 0, 0];   % joint angles (rad)
    Dena(i).T= DenaHart(alpha,d,theta,r);
    drawnow ;
    RPP(O,0,rho1(i),25)
end

th1_limit=[0,-pi];
rho1_limit=[0,40];
rho2_limit=[25,25];

for i=1:58
    t(i)=(i-1)*tf/57;
    r(i)=10*(t(i)/tf)^3-15*(t(i)/tf)^4+6*(t(i)/tf)^5;
    rv(i)=30*(t(i)^2/tf^3)-60*(t(i)^3/tf^4)+30*(t(i)^4/tf^5);
    ra(i)=60*(t(i)/tf^3)-180*(t(i)^2/tf^4)+120*(t(i)^3/tf^5);
    %simulation position
    th1(i)=th1_limit(1)+(th1_limit(2)-th1_limit(1))*r(i);
    % rho1(i)=rho1_limit(1)+(rho1_limit(2)-rho1_limit(1))*r(i);
    r = [20, 40+50, 25+62];   % link lengths (m)
    alpha = [0, 0,pi/2];   % link twists (rad)
    d = [0, 0, 0];   % link offsets (m)
    theta = [th1(i), 0, 0];   % joint angles (rad)
    Dena(i).T= DenaHart(alpha,d,theta,r);
    drawnow ;
    RPP(O,th1(i),40,25)
end

th1_limit=[-pi,-pi];
rho1_limit=[40,0];
rho2_limit=[25,25];

for i=1:58
    t(i)=(i-1)*tf/57;
    r(i)=10*(t(i)/tf)^3-15*(t(i)/tf)^4+6*(t(i)/tf)^5;
    rv(i)=30*(t(i)^2/tf^3)-60*(t(i)^3/tf^4)+30*(t(i)^4/tf^5);
    ra(i)=60*(t(i)/tf^3)-180*(t(i)^2/tf^4)+120*(t(i)^3/tf^5);
    %simulation position
    rho1(i)=rho1_limit(1)+(rho1_limit(2)-rho1_limit(1))*r(i);
    r = [20, rho1(i)+50, 25+62];   % link lengths (m)
    alpha = [0, 0,pi/2];   % link twists (rad)
    d = [0, 0, 0];   % link offsets (m)
    theta = [-pi, 0, 0];   % joint angles (rad)
    Dena(i).T= DenaHart(alpha,d,theta,r);
    drawnow ;
    RPP(O,-pi,rho1(i),25)
    % Scara3D(70,70,theta1(i),theta2(i),rho(i),theta4(i))
    % hold on 
end

% A= Dena(end).T(1:3,4);
% A=A';
% B= [-12,25,30];
% %realizado para inicializar el vector job 
% vos1=[-12,25,30;vos]
% vos1(:,3)=abs(vos1(:,3)-30)
% for j=1:20
%     for i=1:58
%         t(i)=(i-1)*tf/57;
%         r(i)=10*(t(i)/tf)^3-15*(t(i)/tf)^4+6*(t(i)/tf)^5;
%         rv(i)=30*(t(i)^2/tf^3)-60*(t(i)^3/tf^4)+30*(t(i)^4/tf^5);
%         ra(i)=60*(t(i)/tf^3)-180*(t(i)^2/tf^4)+120*(t(i)^3/tf^5);
%         X(i) = vos1(j,1)+[vos1(j+1,1)-vos1(j,1)]*r(i)
%         Y(i)=  vos1(j,2)+[vos1(j+1,2)-vos1(j,2)]*r(i)
%         L(i)=sqrt(X(i)^2+Y(i)^2);
%         theta2(i)=acos((L(i)^2-L1^2-L2^2)/(2*L1*L2));
%         theta1(i)=atan2(Y(i),X(i))-atan2(L2*sin(theta2(i)),L1+L2*cos(theta2(i)));
%         rho(i)=vos1(j,3)+[vos1(j+1,3)-vos1(j,3)]*r(i);
%         drawnow ;
%         Scara3D(70,70,theta1(i),theta2(i),rho(i),theta4(i))
%     end
% end
