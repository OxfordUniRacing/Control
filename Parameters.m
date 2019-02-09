clear all
close all
clc

%% Vehicle Parameters

MainFolder = cd('Testing/Car Model');
SimpleVehicleInitialisation;
cd(MainFolder);

% Car
Mass = car_mass + driver_mass;     %mass of car (kg)

%wheels
R=tyre_radius;            %wheel radius (m)
Jw = tyre_inertia;         %wheel inertia (kg.m^2)

%Aerodynamics
rho = air_density;     %density of air (kg/m^3)
Cd = drag_coeff;       % coefficient of drag
Area = frontal_area;       %Frontal Area(m^2)

%% Optimal Slip Estimator

%Sample time
OSE_Ts = 0.1;

% estimator gains
reduction = 0.9;

%% Tire Force Observer

%Sample time
TFO_Ts = 0.01;


% observer matrices SISO

A_s = [0 -1/Jw; 0 0];
B_s = [R/Jw; 0];
C_s = [1 0];

% observer gains SISO

l1 = 5;
l2 = 10;

K_s = [l1; -l2];

% observer matrices MIMO

A = [A_s zeros(2); zeros(2) A_s];
B = [B_s zeros(2,1); zeros(2,1) B_s];
C = [C_s zeros(1,2); zeros(1,2) C_s];

% observer gains MIMO

l1 = 5;
l2 = 10;

K = [K_s zeros(2,1); zeros(2,1) K_s];


%% Slip Ratio Controller

%Sample time
SRC_Ts = 0.1;

%% C code settings

try
set_param('Optimal_Slip_Estimator','TargetLangStandard','C99 (ISO)');
set_param('Slip_Ratio_Controller','TargetLangStandard','C99 (ISO)');
set_param('Tire_Force_Observer','TargetLangStandard','C99 (ISO)');
set_param('Control_System','TargetLangStandard','C99 (ISO)');
set_param('Control_System_Testbench','TargetLangStandard','C99 (ISO)');
catch
    disp('Models not loaded yet, compile simulink');
end