function robot(l1,l2)  
%% A FUNCTION "robot" which requires the l1 & l2 of SCARA to plot
% INPUT(S)  : The link lengths l1 & l2
% OUTPUT(S) : NIL
%%
    N = 1000;
    
    % link lengths
    
    % joint angle limitations

    theta1_min = 0;
    theta1_max = 360;
    
    theta2_min = 0;
    theta2_max = 180;
    
    
    % limitations on theta1
    theta1_start_end = [theta1_min,theta1_max];
    % change the angle to Radians
    theta1_start_end = theta1_start_end*pi/180;
    
    % limitations on theta2
    theta2_start_end =[theta2_min,theta2_max];
    % change the angle to Radians
    theta2_start_end = theta2_start_end*pi/180;
    
    
    % joint angles 
    theta1 = linspace(theta1_min,theta1_max,N);
    % change the angle to Radians
    theta1 = theta1*pi/180;
    
    theta2 = linspace(theta2_min,theta2_max,N);
    % change the angle to Radians
    theta2 = theta2*pi/180;
    
    %intialization of the x and y
    x = zeros(2*length(theta1_start_end),length(theta2));
    y = zeros(2*length(theta1_start_end),length(theta2));
    
    % x and y are calculated using kinematics
    for i = 1:2
        for j = 1:length(theta1)
            x(i,j) = l1*cos(theta1(j)) + l2*cos(theta1(j) + theta2_start_end(i));
            y(i,j) = l1*sin(theta1(j)) + l2*sin(theta1(j) + theta2_start_end(i));
        end
        
        for k = 1:length(theta1)
             x(i+2,k) = l1*cos(theta1_start_end(i)) + l2*cos(theta1_start_end(i) + theta2(k));
             y(i+2,k) = l1*sin(theta1_start_end(i)) + l2*sin(theta1_start_end(i) + theta2(k));
        end
    end
    
    x = x';
    y = y';
    z1= zeros(1000,4);
    z2= 55*ones(1000,4);
    
    %plotting
    
    plot3(x(:,1),y(:,1),z1(:,1),'--','color',[0.60,0.70,0.25],'LineWidth',2)
    hold on
    set(gcf,'color','white')
    plot3(x(:,2),y(:,2),z1(:,2),'--','color',[0.60,0.70,0.25],'LineWidth',2)
    plot3(x(:,3),y(:,3),z1(:,3),'--','color',[0.60,0.70,0.25],'LineWidth',2)
    plot3(x(:,4),y(:,4),z1(:,4),'--','color',[0.60,0.70,0.25],'LineWidth',2)
    plot3(x(:,1),y(:,1),z2(:,1),'--','color',[0.60,0.70,0.25],'LineWidth',2)
    plot3(x(:,2),y(:,2),z2(:,2),'--','color',[0.60,0.70,0.25],'LineWidth',2)
    plot3(x(:,3),y(:,3),z2(:,3),'--','color',[0.60,0.70,0.25],'LineWidth',2)
    plot3(x(:,4),y(:,4),z2(:,4),'--','color',[0.60,0.70,0.25],'LineWidth',2)
    plot3([x(1,1),x(1,1)],[y(1,1),y(1,1)],[z1(1,1),z2(1,1)],'--','color',[0.60,0.70,0.25],'LineWidth',2)
    plot3([x(1,2),x(1,2)],[y(1,2),y(1,2)],[z1(1,1),z2(1,1)],'--','color',[0.60,0.70,0.25],'LineWidth',2)
    plot3([x(1,3),x(1,3)],[y(1,3),y(1,3)],[z1(1,1),z2(1,1)],'--','color',[0.60,0.70,0.25],'LineWidth',2)
    plot3([x(1,4),x(1,4)],[y(1,4),y(1,4)],[z1(1,1),z2(1,1)],'--','color',[0.60,0.70,0.25],'LineWidth',2)
    plot3([x(end,2),x(end,2)],[y(end,2),y(end,2)],[z1(1,1),z2(1,1)],'--','color',[0.60,0.70,0.25],'LineWidth',2)
    xlabel('x (mm)')
    ylabel('y (mm)')
    zlabel('y (mm)')
    
end