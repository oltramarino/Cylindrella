% Cylindrical Robot Workspace Analysis

% Define robot parameters and joint limits
theta_min = 0;         % Minimum angle for revolute joint (in radians)
theta_max = 2*pi;      % Maximum angle for revolute joint (in radians)

d_min = 0;             % Minimum displacement for prismatic joint (horizontal)
d_max = 40;             % Maximum displacement for prismatic joint (horizontal)

h_min = 0;             % Minimum displacement for prismatic joint (vertical)
h_max = 50;             % Maximum displacement for prismatic joint (vertical)

% Set the resolution for the workspace analysis
theta_resolution = 0.1; % Resolution for revolute joint (in radians)
d_resolution = 0.1;     % Resolution for horizontal prismatic joint
h_resolution = 0.1;     % Resolution for vertical prismatic joint

% Initialize arrays to store workspace points
workspace_points = [];

% Generate workspace points
for theta = theta_min:theta_resolution:theta_max
    for d = d_min:d_resolution:d_max
        for h = h_min:h_resolution:h_max
            % Calculate robot end-effector position based on joint values
            x = d * cos(theta);
            y = d * sin(theta);
            z = h;
            
            % Store workspace point
            workspace_points = [workspace_points; x, y, z];
        end
    end
end

% Plot the workspace
figure;
scatter3(workspace_points(:,1), workspace_points(:,2), workspace_points(:,3), 'b.');
title('Cylindrical Robot Workspace');
xlabel('X-axis');
ylabel('Y-axis');
zlabel('Z-axis');
grid on;

% Calculate and display the volume of the workspace
workspace_volume = prod([d_max - d_min, h_max - h_min, theta_max - theta_min]);
disp(['Workspace Volume: ', num2str(workspace_volume), ' cubic units']);
