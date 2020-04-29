%% Thrust allocation

l_aa = -28.85;
l_bt1 = 39.3;
l_bt2 = 35.3;
l_af = 31.3;
b_s = 5;
b_p = -5;

global thrust_loc
thrust_loc = [l_bt1, l_bt2, l_af, l_aa, b_s, b_p]; 
global K_t
K_t = eye(8);

disp('Thrust allocation model has been initialized.');