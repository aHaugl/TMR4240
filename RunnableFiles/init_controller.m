%% Reference model: Filter parameteres

t1 = 20;
t2 = 20;
t3 = 20;

% mass spring damper system
omega1 = pi/100;
omega2 = pi/100;
omega3 = pi/150;
zeta1 = 1;
zeta2 = 1;
zeta3 = 1.2;
gamma_m = [omega1^2 0 0; 0 omega2^2 0; 0 0 omega3^2];
omega_m = [2*zeta1*omega1 0 0; 0 2*zeta2*omega2 0;0 0 2*zeta3*omega3];

%% PID-Controller: Gain matrixes (part 1) 
%consists of [Kp_x 0 0 ; 0 kp_y ; 0 0 kp_psi] etc
%%Theese tuning parameters are good for simulation 3 and 4
Kp_matrix = [2*10^(5) 0 0 ; 0 4*10^(5) 0 ; 0 0 1*10^(7)];
% 
Ki_matrix = [2*10^(2) 0 0 ; 0 7*10^(2) 0 ; 0 0 1*10^(3)]; %Ki_surge = 5*10^3
% 
Kd_matrix = [4*10^(6) 0 0 ; 0 5*10^(6) 0 ; 0 0 8*10^(4)];

%%Theese tuning parameters are good for simulation 1 and 2
% Kp_matrix = [4*10^(5) 0 0 ; 0 2*10^(5) 0 ; 0 0 1*10^(7)];
% 
% Ki_matrix = [3*10^(3) 0 0 ; 0 2*10^(3) 0 ; 0 0 1*10^(3)]; %Ki_surge = 5*10^3
% 
% Kd_matrix = [6*10^(6) 0 0 ; 0 5*10^(6) 0 ; 0 0 8*10^(4)];

%% LQG-Controller: Calculation of matrixes and gains.

H_36 = zeros(3,6); % reduction matrix for i = 3
H_36(1,1) = 1;
H_36(2,2) = 1;
H_36(3,6) = 1;
H_33 = eye(3);

A_lqg = [-inv(M)*D, zeros(3); eye(3), zeros(3)]; % state space modell A matrix
B_lqg = [inv(M)*H_33; zeros(3)*H_33]; % state space modell B matrix
E_lqg = [inv(M);zeros(3)];
C_lqg = [zeros(3), eye(3)];
% Weighting matrices
Q_lqg = [0.04 0 0 0 0 0; ...   %Velocity
     0 0.04 0 0 0 0; ...   %
     0 0 9 0 0 0; ...    %
     0 0 0 10 0 0; ...     %Position
     0 0 0 0 200 0; ...    %
     0 0 0 0 0 3280];       %
P_lqg = [(2*10^4)^-2 0 0; ...'
     0 (2*10^4)^-2 0; ....
     0 0 (2*10^6)^-2];  


% Ricatti equation stationary(finding R_inf)
% 0 = -A*R_inf - A'*R_inf + R_inf*B*inv(P)*B'*R_inf-Q
k_lqg = lqr(A_lqg,B_lqg,Q_lqg,P_lqg);
% Stationary gain
% G = inv(P)*B'*R_inf

disp('Controller has been initialized.');
