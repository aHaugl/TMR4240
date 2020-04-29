NuArray = Nu.data(:,:)';

%Position surge, sway and heading:
close all;
f1 = figure('Name','Position_in_North');
hold on
plot(Eta.Time(:),Eta.Data(:,1));
plot(Eta.Time(:),KalmanObs.Data(:,1));
legend('Eta measurements','NP observer');
xlabel('Time');
ylabel('North position [m]');
grid on;

f2 = figure('Name','Position_in_East');
hold on;
plot(Eta.Time(:),Eta.Data(:,2));
plot(Eta.Time(:),KalmanObs.Data(:,2));
legend('Eta measurements','Kalman observer');
xlabel('Time');
ylabel('East position [m]');
grid on;

f3 = figure('Name','Heading');
hold on;
plot(Eta.Time(:),Eta.Data(:,3));
plot(Eta.Time(:),KalmanObs.Data(:,3));
legend('Eta measurements','Kalman observer');
xlabel('Time');
ylabel('Heading [rad]');
grid on;

f4 = figure('Name','X-Y_plot_position_in_NED');
hold on;
plot(Eta.Data(:,2),Eta.Data(:,1));
plot(KalmanObs.Data(:,2),KalmanObs.Data(:,1));
legend('Eta measurements','Kalman observer');
xlabel('North position [m]');
ylabel('East position [m]');
grid on;



%Position vs desired position (Trajectory)
f5 = figure('Name','Surge_trajectory_and_reference_trajectory');
hold on;
plot(Eta.Time(:),Eta.Data(:,1));
plot(Eta.Time(:),RefEta.Data(:,1));
xlabel('Time [s]');
ylabel('North position [m]');
legend('Actual trajectory','Reference trajectory');
grid on;


f6 = figure('Name','Sway_trajectory_and_reference_trajectory');
hold on;
plot(Eta.Time(:),Eta.Data(:,2));
plot(Eta.Time(:),RefEta.Data(:,2));
xlabel('Time [s]');
ylabel('East position [m]');
legend('Actual trajectory','Reference trajectory');
grid on;


f7 = figure('Name','Heading_trajectory_and_reference_trajectory');
hold on;
plot(Eta.Time,Eta.Data(:,3));
plot(Eta.Time,RefEta.Data(:,3));
xlabel('Time [s]');
ylabel('Heading [rad]');
legend('Actual trajectory','Reference trajectory');
grid on;




%Velocities in surge, sway and heading vs reference velocity
f8 = figure('Name','Reference_Surge_Velocity_and_actual_velocity_Body_frame');
hold on;
plot(Eta.Time,NuArray(:,1));
plot(Eta.Time,RefNu.Data(:,1));
xlabel('Time [s]');
ylabel('Surge velocity');
legend('Actual velocity','Reference velocity');
grid on;

f9 = figure('Name','Reference_Sway_Velocity_and_actual_velocity_Body_frame');
hold on;
plot(Eta.Time,NuArray(:,2));
plot(Eta.Time,RefNu.Data(:,2));
xlabel('Time [s]');
ylabel('Sway velocity');
legend('Actual velocity','Reference velocity');
grid on;

f10 = figure('Name','Reference_Heading_Velocity_and_actual_velocity_Body_frame');
hold on;
plot(Eta.Time,NuArray(:,3));
plot(Eta.Time,RefNu.Data(:,3));
xlabel('Time [s]');
ylabel('Heading velocity');
legend('Actual velocity','Reference velocity');
grid on;

%%

% figures = [f1 f2 f3 f4 f5 f6 f7 f8 f9 f10]; 
% 
% % Generate figures
% % Resize and output figures
% figSize = [100,100];            % [width, height]
% figUnits = 'm';
% c = clock();
% for f = 1:length(figures)
%       fig = figures(f);
%       % Resize the figure
%       pos = get(fig, 'Position');
%       pos = [pos(1), pos(4)+figSize(2), pos(3)+figSize(1), pos(4)];
%       set(fig, 'Position', pos);
%       % Output the figure
%       filename = sprintf('Simulation5EKF_%s_%i_%i_%i%i.eps', fig.Name,c(3),c(2),c(4),c(5));
%       print( fig, '-depsc',filename);
% end