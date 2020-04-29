%close all
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Loading files
Pos = [Eta.Data(:,1), Eta.Data(:,2), Eta.Data(:,3)];
time = Eta.time(:);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Defining vessel and axis 

%Vessel figure:
X = 50*[-0.6 -0.6 0 0  -0.3 -0.3 0.3 0.3 0 0 0 0   0.6 0.6 0 3 0.6 0.6 -0.6];
Y = 100*[-0.8 0.4 1 0.5 0.5 0.3 0.3 0.5 0.5 0 3 1 0.4 0   0   0 0   -0.8 -0.8];

xlen = 250; %Lenghth of xaxis
ylen = 250; %Length of y axis
figure(1000);
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plotting vessel 
 x_cord = [];
 y_cord = []; 
counter = 1; 

for k = 1:10:(10*floor(length(Pos(:,1))/ 10))
    
    Xth = Pos(k,1) + X*cos(Pos(k,3)) + Y*sin(Pos(k,3));
    Yth = Pos(k,2) + -X*sin(Pos(k,3)) + Y*cos(Pos(k,3));
    set(ani,'Xdata',Xth,'Ydata',Yth)
    
    str = sprintf('Time: %.2f', time(k) );
    title(str)

    drawnow
    x_cord(k) = Pos(k,1);
    y_cord(k) = Pos(k,2);
    counter = counter + 1; 
end

set(traj,'Xdata',x_cord(1:100:k),'Ydata',y_cord(1:100:k))
drawnow
