function [J]=Jacobi(psi,b1,b2,u,v, M_inv,D,Zetan, Wn, Kw, Tb)
J = zeros(15);

%To do: Definere wn, zetan og Tn ut i fra sea state og div. Se side 159 i
%marcyb

J(1,:) = [0 0 0 1 0 0    0 0 0      0 0 0       0 0 0];
J(2,:) = [0 0 0 0 1 0    0 0 0      0 0 0       0 0 0];
J(3,:) = [0 0 0 0 0 1    0 0 0      0 0 0       0 0 0];
J(4,:) = [-(Wn(1))^2-2*Zetan(1)*Wn(1) 0 0      0 0 0   0 0 0   0 0 0   0 0 0];
J(5,:) = [0 -(Wn(2))^2-2*Zetan(2)*Wn(2) 0      0 0 0   0 0 0   0 0 0   0 0 0];
J(6,:) = [0 0 -(Wn(3))^2-2*Zetan(3)*Wn(3)      0 0 0   0 0 0   0 0 0   0 0 0];

J(7,:) = [0 0 0 0 0 0   0 0 -sin(psi)*u-cos(psi)*v     0 0 0   cos(psi) -sin(psi) 0]; 
J(8,:) = [0 0 0 0 0 0   0 0 cos(psi)*u-sin(psi)*v       0 0 0   sin(psi) cos(psi)  0];
J(9,:) = [0 0 0 0 0 0   0 0 0                           0 0 0   0 0 1];

J(10,:) = [0 0 0 0 0 0  0 0 0   -Tb(1) 0 0    0 0 0];
J(11,:) = [0 0 0 0 0 0  0 0 0   0 -Tb(2) 0    0 0 0];
J(12,:) = [0 0 0 0 0 0  0 0 0   0 0 -Tb(3)    0 0 0];

J(13,:) = [0 0 0 0 0 0  0 0 M_inv(1,1)*(-sin(psi)*b1+cos(psi)*b2)   M_inv(1,1)*cos(psi) M_inv(1,1)*sin(psi) 0               -M_inv(1,1)*D(1,1) 0 0];
J(14,:) = [0 0 0 0 0 0  0 0 M_inv(2,2)*(-cos(psi)*b1-sin(psi)*b2)   M_inv(2,2)*sin(psi) M_inv(2,2)*cos(psi) M_inv(2,3)      0 -M_inv(2,2)*D(2,2) -M_inv(2,3)*D(3,3)];
J(15,:) = [0 0 0 0 0 0  0 0 M_inv(3,2)*(-cos(psi)*b1-cos(psi)*b2)   M_inv(3,2)*(-sin(psi)) M_inv(3,2)*cos(psi) M_inv(3,3)    0 M_inv(3,2) M_inv(3,3)*D(3,3)];
end