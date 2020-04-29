close all;

%Downsampling of Eta and NPO since Kalman is ten times slower in calulating the estimates:

NPOArray = NPO.data(:,:)';
Time = KalmanObs.Time(:);


%Position surge, sway and heading Kalman vs NPO
f1 = figure('Name','Kalman_observer_vs_Non_linear_passiv_observer_North');
hold on;
plot(Time,KalmanObs.Data(:,1));
plot(Time,NPOArray(:,1));
xlabel('Time');
ylabel('North position [m]');
legend('Kalman','NPO');
grid on;


f2 = figure('Name','Kalman_observer_vs_Non_linear_passiv_observer_East');
hold on;
plot(Time,KalmanObs.Data(:,2));
plot(Time,NPOArray(:,2));
xlabel('Time');
ylabel('East position [m]');
legend('Kalman','NPO');
grid on;

f3 = figure('Name','Kalman_observer_vs_Non_linear_passiv_observer_Heading');
hold on;
plot(Time,KalmanObs.Data(:,3));
plot(Time,NPOArray(:,3));
xlabel('Time');
ylabel('Heading [rad]');
legend('Kalman','NPO');
grid on;

%Position surge, sway and heading Kalman vs Actual:
f4 = figure('Name','Kalman_observer_vs_actual_measurements,_North');
hold on;
plot(Time,KalmanObs.Data(:,1));
plot(Time,Eta.Data(:,1));
xlabel('Time');
ylabel('North position [m]');
legend('Kalman','North actual');
grid on;


f5 = figure('Name','Kalman_observer_vs_actual_measurements,_East');
hold on;
plot(Time,KalmanObs.Data(:,2));
plot(Time,Eta.Data(:,2));
xlabel('Time');
ylabel('East position [m]');
legend('Kalman','East actual');
grid on;

f6 = figure('Name','Kalman_observer_vs_actual_measurements,_Heading');
hold on;
plot(Time,KalmanObs.Data(:,3));
plot(Time,Eta.Data(:,3));
xlabel('Time');
ylabel('Heading [rad]');
legend('Kalman','Heading actual');
grid on;


%Position surge, sway and heading NPO vs Actual:
f7 = figure('Name','NPO_observer_vs_actual_measurements,_North');
hold on;
plot(Time,NPOArray(:,1));
plot(Time,Eta.Data(:,1));
xlabel('Time');
ylabel('North position [m]');
legend('NPO','North actual');
grid on;


f8 = figure('Name','NPO_observer_vs_actual_measurements,_East');
hold on;
plot(Time,NPOArray(:,2));
plot(Time,Eta.Data(:,2));
xlabel('Time');
ylabel('East position [m]');
legend('NPO','East actual');
grid on;

f9 = figure('Name','NPO_observer_vs_actual_measurements,_Heading');
hold on;
plot(Time,NPOArray(:,3));
plot(Time,Eta.Data(:,3));
xlabel('Time');
ylabel('Heading [rad]');
legend('NPO','Heading actual');
grid on;

%%
% 
% figures = [f1 f2 f3 f4 f5 f6 f7 f8 f9]; 
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
%       filename = sprintf('Simulation4_%s_%i_%i_%i%i.eps', fig.Name,c(3),c(2),c(4),c(5));
%       print( fig, '-depsc',filename);
% end