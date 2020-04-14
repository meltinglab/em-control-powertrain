
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
 P_4_0=0;                    % 1. Momentum. Initial condition.
 M=1300*kg;                  % 2. Mass. Internal parameter.
 rho = 1.225*(kg/(meters^3));     % Density of air
 A = 1452*mm*1799*mm;        % Front area of Volkswagen Golf
 C_d = 0.27;                 % Drag coeff of Volkswagen Golf
 g = 9.81*(meters/(sec^2));         % Gravity acceleration
 r_w = 32*cm;                % wheel radius
 c_roll = 0.0125;            %ordinary tyre on concrete. Note: it is indicative as the real number varies
 
 x_in = [ 0 12 38 65 78 100 112 138 165 178 200]*meters;         %Distances of sampling.
 slope_out = tan(-0.3*[ 0  0  0  0  0  0  0  0  0  0 0]*degrees);    %Sampled slopes at the distances above.
 %slope_out = 4*tan(-0.3*[ 0  5 12  5  -5 -12 -10 10  5   0 0]*degrees);    %Sampled slopes at the distances above.
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
   

 