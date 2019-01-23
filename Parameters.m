clear all
close all
clc

%% Vehicle Parameters

% Car
Mass = 200;     %mass of car (kg)

%wheels
R=1;            %wheel radius (m)
Jw = 1;         %wheel inertia (kg.m^2)

%Aerodynamics
rho = 1.22;     %density of air (kg/m^3)
Cd = 0.5;       % coefficient of drag
Area = 1;       %Frontal Area(m^2)

%% Optimal Slip Estimator

%Sample time
OSE_Ts = 0.1;

% estimator gains
reduction = 0.9;

%% Tire Force Observer

%Sample time
TFO_Ts = 0.01;

% observer matrices

A = [0 -1/Jw; 0 0];
B = [R/Jw; 0];
C = [1 0];

% observer gains

l1 = 5;
l2 = 10;

K = [l1; -l2];

%% Slip Ratio Controller

%Sample time
SRC_Ts = 0.1;