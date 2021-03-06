clear all
close all
clc

%% setting up input variables

R=1;        %wheel radius
Jm = 0.2;     %wheel inertia


%% observer matrices

A = [0 -1/Jm; 0 0];
B = [R/Jm; 0];
C = [1 0];

%% observer gains

l1 = 4;
l2 = 8;

K = [l1; -l2];