%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% init()                                                                  %
%                                                                         %              
% Set initial parameters for part1.slx and part2.slx                      %
%                                                                         %
% Created:      2018.07.12	Jon Bjørnø                                    %
%                                                                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
%% loading parameters
load('supply.mat');
load('supplyABC.mat');
load('thrusters_sup.mat')


%% initial parameters

% Initial position x, y, z, phi, theta, psi
eta0 = [0,0,0,0,0,0]';
% Initial velocity u, v, w, p, q, r
nu0 = [0,0,0,0,0,0]';   

%% Given matrixes

M = [6.8177e6, 0, 0; 0, 7.8784e6 -2.5955e6; 0, -2.5955e6 3.57e9];
% Mass matrix(rigid body + added mass) in surge, sway, yaw

D = [2.6486e5, 0, 0; 0, 8.8164e5 0; 0,0, 3.3774e8];
% Damping matrix (DL + Dm)

%% Initialization of systems
init_autopilot;
init_controller;
init_observer;
init_wind;
init_thrustalloc;

disp('System has been initialized');


    











