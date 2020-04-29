%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Loading files
%Pos = load('simen1.mat')
%a = Pos.data{2}.Values
Sim2 = load('SIM2Test01.mat');

eta_number = 12;
alpha_number = 18; 
u_number = 16;

%Scaling 
scale_tunnel = 10^0; 
scale_azi = 10^(-5); 

Pos = [Sim2.data{eta_number}.Values.Data(:,1), Sim2.data{eta_number}.Values.Data(:,2), Sim2.data{eta_number}.Values.Data(:,3)];
time = Sim2.data{eta_number}.Values.time;
angle = Sim2.data{alpha_number}.Values.Data(:, :);
mag = Sim2.data{u_number}.Values.Data(:, :);
mag = mag*scale_azi;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Defining vessel and axis 

%Vessel figure:
X = 50*[-0.6 -0.6 0 0  -0.3 -0.3 0.3 0.3 0 0 0 0   0.6 0.6 0 3 0.6 0.6 -0.6];
Y = 100*[-0.8 0.4 1 0.5 0.5 0.3 0.3 0.5 0.5 0 3 1 0.4 0   0   0 0   -0.8 -0.8];

xlen = 250; %Lenghth of xaxis
ylen = 250; %Length of y axis
figure(1)
hold on
ani = plot(X,Y,'k');
ax = plot([-xlen xlen],[0,0],'b', [0 0],[-ylen,ylen],'b');
hold on
traj = plot([0,0],[0,0],'.r');
hold off
axis equal
axis([-xlen xlen -ylen ylen])
xlabel('South')
ylabel('West')

figure(2)
hold on
X_t = 12*[-0.6 -0.6 0 0.6 0.6  0.6 -0.6];
Y_t = 80*[-0.8  0.4 1 0.4 0.4 -0.8 -0.8];
plot([-10, 25], [0, 0], 'w', [0 0], [-60, 60], 'w')
grid on
plot(X_t,Y_t,'k');
%Azimuth
azi_x = [0 -0.5   -0.5  0 0 -0.1 0    0.1 0 0 0.5     0.5  0];
azi_y = [0 -0.5 0.5 0 2  2   2.1  2   2 0 0.5 -0.5 0];
azi_f = plot(azi_x, azi_y, 'k');
azi_s = plot(azi_x, azi_y, 'k');
azi_p = plot(azi_x, azi_y, 'k');
%Tunnel
tunnel_X = scale_tunnel*[0 0.5 0.5 0.6 0.5 0.5];
tunnel_Y = scale_tunnel*[0 0   0.1 0  -0.1 0];
tunnel_1 = plot(tunnel_X, tunnel_Y, 'k');
tunnel_2 = plot(tunnel_X, tunnel_Y, 'k');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plotting vessel 
 x_cord = [];
 y_cord = []; 
 counter = 1; 

for i = 1:10:(10*floor(length(Pos(:,1))/ 10))
    
    %Figure 1 - Ship pos
    Xth = Pos(i,1) + X*cos(Pos(i,3)) + Y*sin(Pos(i,3));
    Yth = Pos(i,2) + -X*sin(Pos(i,3)) + Y*cos(Pos(i,3));
    set(ani,'Xdata',Xth,'Ydata',Yth)
    str = sprintf('Time: %.2f', time(i) );
    title(str)
    set(get(gca,'title'),'Position',[15 0 0])
    
    %Figure 2 - Azimuth 
    azi_f_x = mag(i, 3)*azi_x*cos(angle(i, 3)) + mag(i, 3)*azi_y*sin(angle(i, 3));
    azi_f_y = 30 - mag(i, 3)*azi_x*sin(angle(i,3)) + mag(i, 3)*azi_y*cos(angle(i,3));
    set(azi_f, 'Xdata', azi_f_x, 'Ydata', azi_f_y)
    azi_s_x = 5+ mag(i, 4)*azi_x*cos(angle(i, 4)) + mag(i, 4)*azi_y*sin(angle(i, 4));
    azi_s_y = -35 -mag(i, 4)*azi_x*sin(angle(i,4)) + mag(i, 4)*azi_y*cos(angle(i,4));
    set(azi_s, 'Xdata', azi_s_x, 'Ydata', azi_s_y)
    azi_p_x = -5 + mag(i, 5)*azi_x*cos(angle(i, 5)) + mag(i, 5)*azi_y*sin(angle(i, 5));
    azi_p_y = -35 -azi_x*sin(angle(i,5)) + azi_y*cos(angle(i,5));
    set(azi_p, 'Xdata', azi_p_x, 'Ydata', azi_p_y)
    
    str1 = sprintf('Azi forward  : %.2f [deg]', angle(i, 3)*180/pi); 
    str2 = sprintf('Azi starboard: %.2f [deg]', angle(i ,4)*180/pi); 
    str3 = sprintf('Azi port     : %.2f [deg]', angle(i ,5)*180/pi); 
    title({str, str1, str2, str3})
    
    %Figure 2 - Tunnel
    set(tunnel_1, 'Xdata', tunnel_X*mag(i, 1), 'Ydata', 45+ mag(i, 1)*tunnel_Y)
    set(tunnel_2, 'Xdata', tunnel_X*mag(i, 2), 'Ydata', 40+ mag(i, 2)*tunnel_Y)
    
    drawnow
    x_cord(i) = Pos(i,1);
    y_cord(i) = Pos(i,2);
    counter = counter + 1; 
end

set(traj,'Xdata',x_cord(1:100:i),'Ydata',y_cord(1:100:i))
drawnow
