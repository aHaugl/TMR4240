
Time = Eta.Time(:);
%Force calculated by controller and thruster dynamics:
f1 = figure('Name','Force_from_controller_and_thruster_dynamics_in_Surge');
hold on;
plot(Time,TauController.Data(:,1));
plot(Time,ForceTD.Data(:,1));
legend('Controller thrust','Thruster dynamics');
xlabel('Time [s]');
ylabel('Focre [N]');
grid on;

f2 = figure('Name','Force_from_controller_and_thruster_dynamics_in_Sway');
hold on;
plot(Time,TauController.Data(:,2));
plot(Time,ForceTD.Data(:,2));
legend('Controller thrust','Thruster dynamics');
xlabel('Time [s]');
ylabel('Force [N]');
grid on;

f3 = figure('Name','Force_from_controller_and_thruster_dynamics_in_Yaw');
hold on;
plot(Time,TauController.Data(:,6));
plot(Time,ForceTD.Data(:,6));
legend('Controller thrust','Thruster dynamics');
xlabel('Time [s]');
ylabel('Force [N]');
grid on;


%Force set-point for each thruster
f4 = figure('Name','Force_set-point_to_each_thruster');
hold on;
plot(Time,ForceThruster.Data(:,1));
plot(Time,ForceThruster.Data(:,2));
plot(Time,ForceThruster.Data(:,3));
plot(Time,ForceThruster.Data(:,4));
plot(Time,ForceThruster.Data(:,5));
legend('Thruster 1','Thruster 2','Thruster 3','Thruster 4','Thruster 5');
xlabel('Time [s]');
ylabel('Focre [N]');
grid on;



%Position surge, sway and heading:
f5 = figure('Name','Position_in_North');
plot(Eta.Time(:),Eta.Data(:,1));
xlabel('Time');
ylabel('North position [m]');
grid on;

f6 = figure('Name','Position_in_East');
plot(Eta.Time(:),Eta.Data(:,2));
xlabel('Time');
ylabel('East position [m]');
grid on;

f7 = figure('Name','Heading');
plot(Eta.Time(:),Eta.Data(:,3));
xlabel('Time');
ylabel('Heading [rad]');
grid on;

f8 = figure('Name','X-Y_plot_position_in_NED');
plot(Eta.Data(:,2),Eta.Data(:,1));
xlabel('North position [m]');
ylabel('East position [m]');
grid on;

%Position vs desired position (Trajectory)
f9 = figure('Name','Surge_trajectory_and_reference_trajectory');
hold on;
plot(Eta.Time(:),Eta.Data(:,1));
plot(Eta.Time(:),RefEta.Data(:,1));
xlabel('Time [s]');
ylabel('North position [m]');
legend('Actual trajectory','Reference trajectory');
grid on;


f10 = figure('Name','Sway_trajectory_and_reference_trajectory');
hold on;
plot(Eta.Time(:),Eta.Data(:,2));
plot(Eta.Time(:),RefEta.Data(:,2));
xlabel('Time [s]');
ylabel('East position [m]');
legend('Actual trajectory','Reference trajectory');
grid on;


f11 = figure('Name','Heading_trajectory_and_reference_trajectory');
hold on;
plot(Eta.Time(:),Eta.Data(:,3));
plot(Eta.Time(:),RefEta.Data(:,3));
xlabel('Time [s]');
ylabel('Heading [rad]');
legend('Actual trajectory','Reference trajectory');
grid on;

%Velocities in surge, sway and heading vs reference velocity
f12 = figure('Name','Reference_Surge_Velocity_and_actual_velocity_(Body_frame)');
hold on;
plot(Eta.Time(:),Nu.Data(:,1));
plot(Eta.Time(:),RefNu.Data(:,1));
xlabel('Time [s]');
ylabel('Surge velocity');
legend('Actual velocity','Reference velocity');
grid on;

f13 = figure('Name','Reference_Sway_Velocity_and_actual_velocity_(Body_frame)');
hold on;
plot(Eta.Time(:),Nu.Data(:,2));
plot(Eta.Time(:),RefNu.Data(:,2));
xlabel('Time [s]');
ylabel('Sway velocity');
legend('Actual velocity','Reference velocity');
grid on;

f14 = figure('Name','Reference_Heading_Velocity_and_actual_velocity_(Body_frame)');
hold on;
plot(Eta.Time(:),Nu.Data(:,3));
plot(Eta.Time(:),RefNu.Data(:,3));
xlabel('Time [s]');
ylabel('Heading velocity');
legend('Actual velocity','Reference velocity');
grid on;


%%


% figures = [f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11 f12 f13 f14]; 
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
%       filename = sprintf('Simulation2_%s_%i_%i_%i%i.eps', fig.Name,c(3),c(2),c(4),c(5));
%       print( fig, '-depsc',filename);
% end