%% CAR PARAMETERS

%% Geometry, Masses and Moments of Inertias

param.l_fs = 1.01476; %distance from front axle to sprung centre of mass (m)
param.l_rs = 1.67524; %distance from rear axle to sprung centre of mass (m)
param.t_f = 1.540; %front wheel tr  ack (m)
param.t_r = 1.530; %rear wheel track (m)
param.h_f = 0.130; %height of roll axis above ground at front axle (m)
param.h_r = 0.110; %height of roll axis above ground at rear axle (m)
param.h_cgs = 0.567851; %height of sprung centre of mass above ground (m)
param.h_cguf = 0.320; %height of front unsprung centre of mass above ground (m)
param.h_cgur = 0.320; %height of rear unsprung centre of mass above ground (m)
param.M = 300.7; %total mass (sprung + unsprung) (kg)
param.M_uf = 50.1; %front unsprung mass (kg) (I think of this is combined left and right)
param.M_ur = 40.7; %rear unsprung mass (kg)
param.I_xxs = 50.911;    %
param.I_xys = 0;          %
param.I_xzs = 2.54097;    %sprung mass moment
param.I_yys = 300.900;   %of inertia tensor
param.I_yzs = 0;          %
param.I_zzs = 300.28;    %
param.I_zzuf = param.M_uf*(param.t_f/2)^2; %front unsprung mass moment of inertia
param.I_zzur = param.M_ur*(param.t_r/2)^2; %rear unsprung mass moment of inertia
param.I_tlf = 0.8; %
param.I_trf = 0.8; %moment of inertia of tyres
param.I_tlr = 0.8; %(and I guess wheels too)
param.I_trr = 0.8; %

%% Stifness and damping

%spring/dampers
param.K_spf = 27.85; %front suspension stiffness (N/mm)
param.K_spr = 18.16; %rear suspension stiffness (N/mm)
param.B_f = 2.9915; %front suspension damping (Ns/mm)
param.B_r = 2.9915; %rear suspension damping (Ns/mm)

%anti-roll bars
param.K_rf = 384.0*180/pi; %front anti-roll bar stiffness (Nm/rad)
param.K_rr = 344.4*180/pi; %rear anti-roll bar stiffness (Nm/rad)

%roll stiffness
param.K_phif = 0.766*param.K_spf*1000*param.t_f^2/2 + param.K_rf; %(Nm/rad) not sure what 0.766 and 0.827 are
param.K_phir = 0.827*param.K_spr*1000*param.t_r^2/2 + param.K_rr; %(Nm/rad)
param.K_phi = (param.K_phif + param.K_phir);

%roll damping
param.B_phif = 0.766*param.B_f*1000*param.t_f^2/2; %(Nms/rad) again, not sure about 0.766 and 0.827
param.B_phir = 0.827*param.B_r*1000*param.t_r^2/2; %(Nms/rad)

param.K_sr = 15.97; %steering-to-wheel angle ratio (1/deg)

%% Tyre properties
param.t_wid = 0.175; %tyre width (m)
param.t_rad = 0.25; %tyre outer radius (m)
param.t_pressure = 275000; %tyre pressure (Pa)

%% Drag coefficents

param.Ax = 0.98;% surface area for drag
param.Ay = 2;

param.rho = 1.225; %air density
param.c_drag = 0.88; %drag coefficient

%% Brake Model Parameters

brake_pad_radius = 0.1; %m
n_pads = 2; %number of brake pads per wheel
mu_brake = 0.35; %coefficient of friction between brake pad and disc
pedal_ratio = 5.22;
master_cylinder_area = 3.3329E-4; %m^2
front_piston_area = 1.555284713E-3; %m^2
rear_piston_area = 1.017876020E-3; %m^2
brake_bias = 0.6; %proportion of braking on front axle

