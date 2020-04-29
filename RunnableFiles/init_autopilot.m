%% Autopilot:
    %Initializing changing parameters: 
    global p
    p = 1;          %Counter for set points
    global time 
    time = 0;       %Initializing time counter
    global start_time
    start_time = 0; %Initializing start time 
    %Set points 
    eta_set = [0 0 0; 50 0 0;50 -50 0; 50 -50 -pi/4; 0 -50 -pi/4; 0 0 0];
    
    disp('Auto pilot has been initialized.');