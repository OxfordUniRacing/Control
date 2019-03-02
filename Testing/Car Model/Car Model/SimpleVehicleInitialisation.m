%% Vehicle Body Parameters
car_mass = 250; %kg
driver_mass = 70; %kg
CG_front = 0.8; %m (distance between centre of mass and front axle)
CG_rear = 0.8; %m (distance between centre of mass and rear axle)
CG_height = 0.3; %m (height of centre of mass above road)
frontal_area = 1.1; %m^2
drag_coeff = 0.8;
pitch_moment_of_inertia = 100; %kgm^2
front_suspension_stiffness = 10.4E+3; %N/m
front_suspension_damping = 1E+5; %Ns/m
rear_suspension_stiffness = 13.2E+3; %N/m
rear_suspension_damping = 1E+5; %Ns/m
air_density = 1.293; %kg/m^3

%% Tyre Parameters
tyre_radius = 0.124; %m
magic_B = 10;
magic_C = 1.9;
magic_D = 1;
magic_E = 0.97;
tyre_stiffness = 1.727E+5; %N/m
tyre_damping = 2000; %Ns/m
tyre_mass = 5.7; %kg
wheel_mass = 2.45; %kg
tyre_inertia = 0.5*(tyre_mass+wheel_mass)*tyre_radius^2; %kgm^2

%% Model Parameters
stop_time = 50; %s