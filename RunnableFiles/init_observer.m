%%%%%%%%%%%%%%%% Given matrices %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
M_inv = inv(M);
%% Wave frequency constants
%%%%%%%%%%%%%%%%%%%%%%%Wave frequency constants %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   
%Fossen page 217: Assuming jonswap
zetan_1 = 0.1; zetan_2 = 0.1; zetan_3 = 0.1;
wn_1 = 2*pi/9; wn_2 = 2*pi/9; wn_3 = 2*pi/9; %(Tp = 9 sec)
Kw_1 = 1; Kw_2 = 1; Kw_3 = 1;

%Bias time constants
%Studass sa dette var typisk høy grad, for å kunne garantere at b_dot går mot null når t går mot inf
Tb_1 = 1000; Tb_2 = 1000; Tb_3 = 1000;

% Putting stuff into a vector
Zetan = [zetan_1, zetan_2, zetan_3];
Wn =[wn_1, wn_2, wn_3];
Kw = [Kw_1, Kw_2,Kw_3];
Tb = [Tb_1,Tb_2, Tb_3];

%% Kalman filter %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Step Length
h_step=0.1; 

%measurement noise
noise_scalar = 1;

%%%%%%%%%%%%%%% Design Parameters %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Position and heading measurement noise
R_kf = diag([1, 1, 0.1]);  
%Process noise variance
Q_kf = diag([0.06,0.06,0.25,2*10^(6),2*10^(6),1*10^(6)]);

%Initial conditions:[Ksi, eta, b, nu]   
x0 = zeros(15,1); 
P0 = diag(ones(1,15));

%% State Matrices for observer state space
%%%%%%%%%%%%%%% State Matrices %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% x_dot = f(x) + Bu + Ew, y = Hx +v
Aw = [zeros(3,3) eye(3) ; 
    -diag([Wn(1), Wn(2), Wn(3)])*diag([Wn(1), Wn(2), Wn(3)])',...
    diag([-2*Zetan(1)*Wn(1) -2*Zetan(2)*Wn(2), -2*Zetan(3)*Wn(3)])];

B_kf = [zeros(6,3) ; zeros(3,3) ; zeros(3,3) ; M_inv];

%Diagonal bias scaling matrix parameters
E_b1 = 1; E_b2 = 1; E_b3 = 1;
E_b = diag([E_b1, E_b2, E_b3]);

E_w = [zeros(3,3) ; diag([Kw_1, Kw_2, Kw_3])];
E_kf = [E_w zeros(6,3) ;...
 zeros(3,3) zeros(3,3) ;...
 zeros(3,3) E_b ; zeros(3,3) zeros(3,3)];

Cw = [zeros(3,3) eye(3)];
H_kf = [Cw eye(3) zeros(3,6)]; 

EKFData = struct('Aw', Aw,'B_kf', B_kf,'E_kf', E_kf,'H_kf', H_kf,...
    'Q_kf', Q_kf, 'R_kf', R_kf,'x0', x0,'P0', P0,'D', D,'M_inv', M_inv,...
    'h_step', h_step, 'Zetan', Zetan,'Wn', Wn,'Kw', Kw,'Tb', Tb);
 

%% Nonlinear passive observer

k1 = -2*(1-zetan_1)*1.2*wn_1/wn_1; k2 = k1; k3 = k1;
k4 = 2*wn_1*(1-zetan_1); k5 = k4; k6 = k4;
k7 = 1.2*wn_1; k8 = k7; k9 = k7;

K1 = [diag([k1,k2,k3]); diag([k4 k5 k6])]   ;
K2 = diag([k7,k8,k9]);
K4 = 0.01*diag([1 0.3 1]).*diag(M);
K3 = 0.1*K4;

disp('Observers has been initialized.');

