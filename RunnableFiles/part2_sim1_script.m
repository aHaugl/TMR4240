% sim('part2_sim1.slx');
%%

f1 = figure('Name','Position_in_North');
plot(Eta.Time(:),Eta.Data(:,1));
xlabel('Time');
ylabel('North position [m]');
grid on;

f2 = figure('Name','Position_in_East');
plot(Eta.Time(:),Eta.Data(:,2));
xlabel('Time');
ylabel('East position [m]');
grid on;

f3 = figure('Name','Heading');
plot(Eta.Time(:),Eta.Data(:,3));
xlabel('Time');
ylabel('Heading [rad]');
grid on;

f4 = figure('Name','X-Y_plot_position_in_NED');
plot(Eta.Data(:,1),Eta.Data(:,2));
xlabel('North position [m]');
ylabel('East position [m]');
grid on;

f5 = figure('Name','Force_in_yaw');
hold on;
plot(Eta.Time,Fwave.Data(:,6));
plot(Eta.Time,Fwind.Data(:,6));
plot(Eta.Time,Fcurrent.Data(:,6));
legend('Wave','Wind','Current');
xlabel('Time [s]');
ylabel('Force [N]');
grid on;




% %%
% figures = [f1 f2 f3 f4 f5]; 
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
%       filename = sprintf('Simulation1_%s_%i_%i_%i%i.eps', fig.Name,c(3),c(2),c(4),c(5));
%       print( fig, '-depsc',filename);
% end