%% Wind constant

global U_mean;
global S;
global U_gust;
global C_w;
global  counter;
counter = 1;
C_w = importdata('wind_coefficients.txt',' ',1);
C_w = C_w.data; % [alpha, Cx, Cy, Cz, C_theta, C_phi, C_phi] 

k_wind = 0.003;
mu = 0.001;
U10 = 12;
z = 3;
h = 1;
w = 0.005;
w_angle = 5*pi/180;

z0 = 10*exp(-2/(5*sqrt(k_wind)));
%U_mean = U10 * 5/2 * sqrt(k) * log(z/z0);
U_mean = 10;    

nfreq = 100;
L = 1800;
k_wind = 0.0026;

for i = 1:nfreq
    f(i) = 0.01 + (i-1)/(nfreq-1) * 0.99;
    ftilde = L*f(i)/U10;
    S(i) = (4*k_wind*L*U10) / ((2+ftilde^2)^(5/6));
end
phi = 2*pi * rand(nfreq,1);
counter2 = 0;

for t = 0:0.1:50000
    counter2 = counter2 +1;
    U_gust(counter2+1) = 0;
    for i = 1:nfreq
        U_gust(counter2+1) = U_gust(counter2+1) + sqrt(2*S(i)*(f(2)-f(1))) * cos(2*pi*f(i)*t + phi(i));
    end
end

disp('Wind model has been initialized.');