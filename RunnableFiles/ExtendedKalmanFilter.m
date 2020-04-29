function estimatedEtaAndNu = ExtendedKalmanFilter(y,tau, Q, R, x0, P0, D, M_inverse,B, E, H, h)
persistent x_bar
persistent P_bar

if isempty(x_bar) % TODO
    x_bar= x0;
end

if isempty(P_bar)
    P_bar = P0;
end


%%%%%%%%%%%%%%%%%%%%% Update A matrix%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s_psi = sin(x_bar(8));
c_psi = cos(x_bar(8));

R_psi = [   c_psi   -s_psi  0;
            s_psi   c_psi   0;
            0       0       1; ];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%% Kalman state matrices %%%%%%%%%%%%%%%%%%%%%%%%%%%
% x =[xi_1 til x_6, N(7), E(8), psi(9),b1(10), b2(11), b3(12), u(13),
% v(14),r(15)
% [J]=Jac(psi,b1,b2,u,v, M_inv,D)
PHI=eye(15) + J(x_bar(9), x_bar(10), x_bar(11), x_bar(13), x_bar(14), M_inverse, D)*h;
GAMMA = h*E;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%% Kalman algorithm%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Kalman gain matrix
K = P_bar*H'*inv(H*P_bar*H'+R);
% Update state estimate
x_hat = x_bar + K*(y-H*x_bar);
% corrector - compute error covariance
P_hat = (eye(15)-K*H)*P_bar*(eye(15)-K*H)'+K*R*K';

x_bar= x_hat + h*(f(x_hat, R_psi, M_inverse, D) + B*tau);
P_bar=PHI*P_hat*PHI' + GAMMA*Q*GAMMA';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%Output of the desired estimates (eta and nu)%%%%%%%%%%%%%
estimatedEtaAndNu=[x_hat(7);x_hat(8);x_hat(9);x_hat(13);x_hat(14);x_hat(15)];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end
