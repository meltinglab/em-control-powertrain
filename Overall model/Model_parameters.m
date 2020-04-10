% Parameters file
close all;

% SI units
meters = 1; km=1000*meters; cm = 0.01*meters; dm = 0.1*meters; mm = 0.001*meters; liters=0.001*meters^3;
sec = 1; msec = 0.001*sec; microsec=0.001*msec; minutes = 60*sec; hours = 60*minutes;
kg = 1; gr = 0.001*kg; Newton = 1; kN = 1000*Newton; Nm=Newton*meters;
rad = 1; degrees =(pi/180)*rad; rounds=2*pi*rad; giri=2*pi; 
rpm = 2*pi/minutes*rad/sec; g_acc = 9.81*meters/sec^2; kgf = g_acc;
Volt=1; mVolt=0.001*Volt; Amp=1; mAmp=0.001*Amp; Ohm=Volt/Amp; mOhm=0.001*Ohm;  
Watt=Volt*Amp; kWatt=1000*Watt; Weber=Volt*sec;
Henry=Volt*sec/Amp; mHenry=0.001*Henry; Joule=1; kJoule=1000*Joule; 
K=1; Celsius=1;  Pa=1; atm=101325*Pa;  mol=1; Farad=1;

% Parameters for the battery
Cap_initial = 10;     %[Ah] 
Cap_rated = 100;        %[Ah]
N_cell_series = 100;
N_cell_parallel = 1;

% Parameters for the controller
pwm_switch_period=2e-5;
T_sample_torque_control = 1e-5;
inverter_efficiency = 98; %[%]

% Parameters for the motor 
J_r=0.089*kg*meters^2;    		% 2. Inertia. Internal parameter.       	    
b_r=4.924e-4*(Nm/rad);          % 3. Angular friction. Internal parameter.
r_r=1*cm;                 	% 4. Parameter. Transformer/Gyrator. 
P_2_0=0;                   	% 2. Angular momentum. Initial condition.  
x_5_0=0;                 	% 5. Displacement. Initial condition. 
R_s=4.23*mOhm;                    % Stator resistance
L_s_d=0.171*mHenry;         % d-axis stator inductance
L_s_q=0.391*mHenry;         % q-axis stator inductance
L_s = 0.391*mHenry;
np=12;                      % Number of poles
pp=4;                       % Number of pole-pairs
lambda_pm=0.1039*Weber;               % Permanent flux linkage constant   
max_torque_motor=250*Nm;   % Max torque deliverable by the motor


% Parameters for the gearbox
K_rg=10^13*(Newton/meters); 	% 1. Stiffness. Internal parameter. 
b_rg=4.924e-4;
r_g=9.7*r_r;                	% 6. Parameter. Transformer/Gyrator --> usual choice in most common electric vehicles 

% % Parameters for force calculation (last block of the chain)
P_4_0=0;                    % 1. Momentum. Initial condition.
M=1300*kg;                  % 2. Mass. Internal parameter.
rho = 1.225*(kg/(meters^3));     % Density of air
A = 1452*mm*1799*mm;        % Front area of Volkswagen Golf
C_d = 0.27;                 % Drag coeff of Volkswagen Golf
g = 9.81*(meters/(sec^2));         % Gravity acceleration
r_w = 32*cm;                % wheel radius
c_roll = 0.0125;            %ordinary tyre on concrete. Note: it is indicative as the real number varies


