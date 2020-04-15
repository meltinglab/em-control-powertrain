%%  ELECTRIC POWERTRAIN PARAMETERS FILE %%
close all;

%% SI UNITS
meters = 1; km=1000*meters; cm = 0.01*meters; dm = 0.1*meters; mm = 0.001*meters; liters=0.001*meters^3;
sec = 1; msec = 0.001*sec; microsec=0.001*msec; minutes = 60*sec; hours = 60*minutes;
kg = 1; gr = 0.001*kg; Newton = 1; kN = 1000*Newton; Nm=Newton*meters;
rad = 1; degrees =(pi/180)*rad; rounds=2*pi*rad; giri=2*pi; 
rpm = 2*pi/minutes*rad/sec; g_acc = 9.81*meters/sec^2; kgf = g_acc;
Volt=1; mVolt=0.001*Volt; Amp=1; mAmp=0.001*Amp; Ohm=Volt/Amp; mOhm=0.001*Ohm;  
Watt=Volt*Amp; kWatt=1000*Watt; Weber=Volt*sec;
Henry=Volt*sec/Amp; mHenry=0.001*Henry; Joule=1; kJoule=1000*Joule; 
K=1; Celsius=1;  Pa=1; atm=101325*Pa;  mol=1; Farad=1;

%% BATTERY
Cap_initial = 10;                   % Initial Battery capacitance. [Ah] 
Cap_rated = 100;                    % Rated Battery capacitance. [Ah]
N_cell_series = 100;                % Number of cells in series.
N_cell_parallel = 1;                % Number of cells in parallel.

%% CONTROLLER
pwm_switch_period = 2e-5;           % PWM control switching frequency.
T_sample_torque_control = 1e-5;     % Sample period of the torque controller. [sec]
inverter_efficiency = 98;           % Efficiency of the inverter. [%]

%% ELECTRIC MOTOR 
J_r=0.089*kg*meters^2;              % Rotor inertia.      	    
b_r=4.924e-4*(Nm/rad);              % Rotor angular friction coefficient.
r_r=1*cm;                           % Rotor radius. 
R_s=4.23*mOhm;                      % Stator resistance.
L_s_d=0.171*mHenry;                 % d-axis stator inductance.
L_s_q=0.391*mHenry;                 % q-axis stator inductance.
L_s = 0.391*mHenry;                 % Stator inductance.
np=12;                              % Number of poles.
pp=4;                               % Number of pole-pairs.
lambda_pm=0.1039*Weber;             % Permanent flux linkage constant.
max_torque_motor=250*Nm;            % Max torque deliverable by the motor.

% Initial conditions
P_2_0=0;                            % Angular momentum. Initial condition.  
x_5_0=0;                            % Displacement. Initial condition.

%% GEARBOX
K_rg=10^13*(Newton/meters);         % Translational stiffness of the gear matching.
b_rg=4.924e-4;                      % Translational friction coefficient of the gear matching.
r_g=9.7*r_r;                        % Gearbox transmission ratio: 9.7. Usual choice in most common electric vehicles. 

%% VEHICLE DYNAMICS - FORCES

M=1300*kg;                          % Volkswagen Golf mass.
rho=1.225*(kg/(meters^3));          % Air density.
A=1452*mm*1799*mm;                  % Front area of Volkswagen Golf.
C_d=0.27;                           % Drag coeff of Volkswagen Golf.
g=9.81*(meters/(sec^2));            % Gravity acceleration coefficient.
r_w=32*cm;                          % Wheel radius.
c_roll=0.0125;                      % Rolling coeffcient: ordinary tyre on concrete. Note: it is indicative as the real number varies

% Initial conditions
P_4_0=0;                            % Car momentum of inertia. Initial condition.

%% SAMPLING
x_in = [ 0 12 38 65 78 100 112 138 165 178 200] * meters;                       %Distances of sampling.
slope_out = tan(-0.3*[ 0  0  0  0  0  0  0  0  0  0 0]*degrees);                %Sampled slopes at the distances above.
%slope_out = 4*tan(-0.3*[ 0  5 12  5  -5 -12 -10 10  5   0 0]*degrees);         %Sampled slopes at the distances above.
