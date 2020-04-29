angles = [];
for i = 1:36  %Degrees to rad vector
    angles = [angles 10*i*pi/180]; 
end
close all; 
polar(angles, u_mean);
xtickformat('degrees')
view([90 -90])