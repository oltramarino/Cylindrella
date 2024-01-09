% Set the height and radius of the cylinder
height = 40;
radius = 112;

% Define the number of points to use for drawing the cylinder
numPoints = 100;

% Generate the points on the lateral surface of the cylinder
theta = linspace(0, 2*pi, numPoints);
x = radius * cos(theta);
y = radius * sin(theta);

% Create a figure and plot the cylinder
figure;
hold on;

% Plot the lateral surface of the cylinder
for i = 1:numPoints
    z = linspace(0, height, 2);  % Two points to connect with a line
    plot3(x(i)*ones(size(z)), y(i)*ones(size(z)), z, 'blue');
end

% Add caps to the top and bottom of the cylinder
z_top = repmat(height, size(x));
z_bottom = repmat(0, size(x));
plot3(x, y, z_top, 'blue');
plot3(x, y, z_bottom, 'blue');

% Set the aspect ratio and labels
daspect([1 1 1]);
xlabel('X');
ylabel('Y');
zlabel('Z');
title('Cylinder');

% Adjust the view and lighting
view(3);
light('Position',[0 0 1],'Style','infinite');
camlight('left');

% Set the height and radius of the cylinder
height = 40;
radius = 62;

% Define the number of points to use for drawing the cylinder
numPoints = 100;

% Generate the points on the lateral surface of the cylinder
theta = linspace(0, 2*pi, numPoints);
x = radius * cos(theta);
y = radius * sin(theta);

% Create a figure and plot the cylinder

hold on;

% Plot the lateral surface of the cylinder
for i = 1:numPoints
    z = linspace(0, height, 2);  % Two points to connect with a line
    plot3(x(i)*ones(size(z)), y(i)*ones(size(z)), z, 'blue');
end

% Add caps to the top and bottom of the cylinder
z_top = repmat(height, size(x));
z_bottom = repmat(0, size(x));
plot3(x, y, z_top, 'blue');
plot3(x, y, z_bottom, 'blue');

% Set the aspect ratio and labels
daspect([1 1 1]);
xlabel('X');
ylabel('Y');
zlabel('Z');
title('Cylinder');

% Adjust the view and lighting
view(3);
light('Position',[0 0 1],'Style','infinite');
camlight('left');
