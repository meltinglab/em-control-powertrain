
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 set(0,'DefaultFigureWindowStyle','docked') %%%% Figures 'normal' or 'docked'
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %%% SI UNITS
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 meters = 1; km=1000*meters; cm = 0.01*meters; mm = 0.001*meters; liters=0.001*meters^3;
 sec = 1; msec = 0.001*sec; microsec=0.001*msec; minutes = 60*sec; hours = 60*minutes;
 kg = 1; gr = 0.001*kg; Newton = 1; kN = 1000*Newton; Nm=Newton*meters;
 rad = 1; degrees =(pi/180)*rad; rounds=2*pi*rad; giri=2*pi; 
 rpm = 2*pi/minutes*rad/sec; g_acc = 9.81*meters/sec^2; kgf = g_acc;
 Volt=1; mVolt=0.001*Volt; Amp=1; mAmp=0.001*Amp; Ohm=Volt/Amp; mOhm=0.001*Ohm;  
 Watt=Volt*Amp; kWatt=1000*Watt; Weber=Volt*sec;
 Henry=Volt*sec/Amp; mHenry=0.001*Henry; Joule=1; kJoule=1000*Joule; 
 K=1; Celsius=1;  Pa=1; atm=101325*Pa;  mol=1;
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %%%% SIMULATION OF SYSTEM: POG_Car_Dumper_SS
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %%%%%%%%%%%%   SYSTEM PARAMETERS  %%%%%%%%%%%%%%%%%%%%%%%%%%
 M=300*kg;                  % 2. Mass. Internal parameter.
 K_d=3000*Newton/(5*cm);    % 3. Stiffness. Internal parameter.
 b_d=200*Newton/(10*cm/sec);% 4. Friction. Internal parameter.
 m=22*kg;                   % 5. Mass. Internal parameter.
 K_p=3000*Newton/(2*cm);    % 7. Stiffness. Internal parameter.
 Xp_In  = [     -7   -6      0  10]*cm;
 Fp_Out = [-16*K_p   -6*K_p  0   0]*cm;
 %Fp_Out = [0   0  0   0]*cm;
 b_p=1*Newton/(10*cm/sec);   % 8. Friction. Internal parameter.
 %%%%%%%%%%%%   INPUT VALUES  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 F_M=-M*g_acc;              % 1. Force. Input value.
 F_m = m*g_acc;              % 6. Force. Input value.
 v_g_t=[ 0                       0; ...
         2           0*cm/(0.1*sec); ...
         2.1                      0; ...
         3.9        -0*cm/(0.1*sec); ...
         4.0                      0; ...
         20.0                      0; ...
         ];            % 9. Ground Velocity.
 %%%%%%%%%%%%   INITIAL CONDITIONS  %%%%%%%%%%%%%%%%%%%%%%%%%
 P_2_0=0;       % 2. Momentum. Initial condition. 
 L_0=25*cm;     % 3. Displacement. Initial condition. 
 P_5_0=0;       % 5. Momentum. Initial c    ondition. 
 l_0=10*cm;     % 7. Displacement. Initial condition. 
 r_0=30*cm;     % Wheel Radius
 R1 = 0.05*meters;   % RAPPORTO 
 rho = 1.225; % kg/m^3
 A = 2; %m^2
 C_d = 0.82; %long cylinder shape
 g = 9.81; %m/s^2 acceleration g
 r = 0.3; % wheel radius
 b_a = 0.8; %friction asphalt
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 Tfin=10;
 Nr_Ts_Points=2000;
 Ts=Tfin/Nr_Ts_Points;
 SLX_Name = 'tire_model_s';
 Out_Sim=sim(SLX_Name,'stoptime',num2str(Tfin),'SaveOutput','on','SaveTime','off');
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 Variables=Out_Sim.get;
 Variables=setdiff(Variables,'t');
 Nr_Var=length(Variables);
 t=Out_Sim.get('t');
 omega=Out_Sim.get('omega_M');
 v=Out_Sim.get('v_M');
   

 