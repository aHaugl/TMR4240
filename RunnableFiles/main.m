clear all; close all; 
clc
Selection = 0;

% while Selection <8
Selection=menu('Choose simulation from 1 to 7 or 8 to exit simulation',...
    '[1] Simulation 1 - Environmental Loads',...
    '[2] Simulation 2 - DP and Thrust Allocation',...
    '[3] Simulation 2 - DP and Thrust Allocation with thruster failure',...
    '[4] Simulation 3 - DP and Environmental Forces without observer',...
    '[5] Simulation 4 - Observer selection: NPO vs Kalman',...
    '[6] Simulation 5 - Complete Simulation with NP observer',...
    '[7] Simulation 5 - Complete Simulation with Kalman filter',...
    '[8] Simulation 6 - Capability Plot with NP observer',...
    '[9] Simulation 6 - Capability Plot with Kalman filter',...
    '[10] Simulation 7 - Observer Robustness, NP observer',...
    '[11] Simulation 7 - Observer Robustness, Kalman filter',...
    '[12] exit simulation');

switch Selection
    case 1
%         Selection = 1;
        init;
        disp('Running simulation 1. This may take some time.');
        sim('part2_sim1');
        disp('Simulation 1 is complete. Runing plotting functions for the vessel from simulation 1.');
        part2_sim1_script;
        plotVessel;
        disp('Plotting functions for simulation 1 are complete.');
    
    case 2
%         Selection = 2;
        init;
        disp('Running simulation 2. This may take some time.');
        sim('part2_sim2');
        disp('Simulation 2 is complete. Runing plotting functions for the vessel from simulation 2.');
        part2_sim2_script;
        plotVessel;
        disp('Plotting functions for simulation 2 are complete.');
    case 3
%         Selection = 3;
        init;
        disp('Running simulation 2 with thruster failure. This may take some time.');
        sim('part2_sim2_TF');
        disp('Simulation 2 with thrust failure is complete. Runing plotting functions for the vessel from simulation 2.');
        part2_sim2_script;
        plotVessel;
        disp('Plotting functions for simulation 2 with thruster failure are complete.');


    case 4
%         Selection = 4;
        init;
        disp('Running simulation 3. This may take some time.');
        sim('part2_sim3');
        disp('Simulation 3 is complete. Runing plotting functions for the vessel from simulation 3.');
        part2_sim3_script;
        plotVessel;
        disp('Plotting functions for simulation 3 are complete.');
    
    
    case 5
%         Selection = 5;
        init;
        disp('Running simulation 4. This may take some time.')
        sim('part2_sim4');
        disp('Simulation 4 w/NPO is complete. Runing plotting functions for the vessel from simulation 4');
        part2_sim4_script;
        plotVessel;
        disp('Plotting functions for simulation 4 w/NPO are complete.');
    
    case 6
%         Selection = 6;
        init;
        disp('Running simulation 5 with NP observer. This may take some time.')
        sim('part2_sim5');
        disp('Simulation 5 is complete. Runing plotting functions for the vessel from simulation 5');
        part2_sim5_script;
        plotVessel;
        disp('Plotting functions for simulation 5 are complete');
        
    case 7
%         Selection = 7;
        init;
        disp('Running simulation 5 with Kalman filter. This may take some time.')
        sim('part2_sim5_KF');
        disp('Simulation 5 is complete. Runing plotting functions for the vessel from simulation 5');
        part2_sim5_script_KF;
        plotVessel;
        disp('Plotting functions for simulation 5 are complete');
    
    case 8
%       Selection = 7;
        init;
        disp('Running simulation 6 with NP observer. This may take some time.'); 
        u_mean = [];
        eta_set = [0 0 0; 0 0 0]; 
        for deg_set = 10:10:360
            Direction = deg_set*pi/180;
            Direction_wind = deg_set*pi/180;
            
            sim('part2_sim6'); 
            calc_mean_script;
            fprintf('Simulation run number %i complete \n', deg_set/10); 
        end
        disp('Simulation 6 is complete. Runing plotting functions for the vessel from simulation 7');
        part2_sim6_script;
        disp('Plotting functions for simulation 6 are complete');
   case 9
%       Selection = 7;
        init;
        disp('Running simulation 6 with Kalman filter. This may take some time.'); 
        u_mean = [];
        eta_set = [0 0 0; 0 0 0]; 
        for deg_set = 10:10:360
            Direction = deg_set*pi/180;
            Direction_wind = deg_set*pi/180;
            
            sim('part2_sim6_KF'); 
            calc_mean_script;
            fprintf('Simulation run number %i complete \n', deg_set/10); 
        end
        disp('Simulation 6 is complete. Runing plotting functions for the vessel from simulation 7');
        part2_sim6_script;
        disp('Plotting functions for simulation 6 are complete');
    
    case 10
%         Selection = 8;
        init;
         disp('Running simulation 7 with NP observer. This may take some time.')
         sim('part2_sim7');
        disp('Simulation 7 is complete. Runing plotting functions for the vessel from simulation 7');
        part2_sim7_script;
        plotVessel;
        disp('Plotting functions for simulation 7 are complete');
    case 11
%         Selection = 8;
        init;
         disp('Running simulation 7 with Kalman filter. This may take some time.')
         sim('part2_sim7_KF');
        disp('Simulation 7 is complete. Runing plotting functions for the vessel from simulation 7');
        part2_sim7_script_KF;
        plotVessel;
        disp('Plotting functions for simulation 7 are complete');    
    case 12
%     Selection = 9;
    disp('Exiting system');
        
end

% Selection=menu2('Run another simulation?',...
%     '[1] Yes',...
%     '[9] No');
    
 
% end
    
