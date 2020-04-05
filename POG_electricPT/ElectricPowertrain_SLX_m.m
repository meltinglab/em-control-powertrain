clear all; close all
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% SI UNITS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
meters = 1; km=1000*meters; cm = 0.01*meters; dm = 0.1*meters; mm = 0.001*meters; liters=0.001*meters^3;
sec = 1; msec = 0.001*sec; microsec=0.001*msec; minutes = 60*sec; hours = 60*minutes;
kg = 1; gr = 0.001*kg; Newton = 1; kN = 1000*Newton; Nm=Newton*meters;
rad = 1; degrees =(pi/180)*rad; rounds=2*pi*rad; giri=2*pi; 
rpm = 2*pi/minutes*rad/sec; g_acc = 9.81*meters/sec^2; kgf = g_acc;
Volt=1; mVolt=0.001*Volt; Amp=1; mAmp=0.001*Amp; Ohm=Volt/Amp; mOhm=0.001*Ohm;  
Watt=Volt*Amp; kWatt=1000*Watt; Weber=Volt*sec;
Henry=Volt*sec/Amp; mHenry=0.001*Henry; Joule=1; kJoule=1000*Joule; 
K=1; Celsius=1;  Pa=1; atm=101325*Pa;  mol=1; Farad=1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% SIMULATION OF SYSTEM: ElectricPowertrain
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%   SYSTEM PARAMETERS  %%%%%%%%%%%%%%%%%%%%%%%%%%
J_mc=1*kg*meters^2;    		% 2. Inertia. Internal parameter.
b_mc=1*(Nm/rad);        	% 3. Angular friction. Internal parameter. 
r_1=1*cm;                 	% 4. Parameter. Transformer/Gyrator. 
K_c=10^7*(Newton/meters); 	% 5. Stiffness. Internal parameter. 
r_2=9.7*cm;                	% 6. Parameter. Transformer/Gyrator. 
%%%%%%%%%%%%   INPUT VALUES  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
T_m_0=20*Nm;             	% 1. Torque. Input value. 
W_w_0=0*Nm;                 % 9. Torque. Input value.
%%%%%%%%%%%%   INITIAL CONDITIONS  %%%%%%%%%%%%%%%%%%%%%%%%%
P_2_0=0;                   	% 2. Angular momentum. Initial condition.  
x_5_0=0;                 	% 5. Displacement. Initial condition.  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Tfin=5;
Nr_Ts_Points=2000;
Ts=Tfin/Nr_Ts_Points;
SLX_Name = [mfilename '.m']; SLX_Name = strrep(SLX_Name,'_m.m','');
Out_Sim=sim(SLX_Name,'stoptime',num2str(Tfin),'SaveOutput','on','SaveTime','off');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Vars=Out_Sim.get;
Vars=setdiff(Vars,'t');
t=Out_Sim.get('t');
%%%%%% PLOT THE OUTPUT VARIABLES Y  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
S=[2,1]; Ns=S(1)*S(2); Nr=Ns;
for ii=1:length(Vars); Name(ii)={Vars{ii}}; Unit(ii)={'1'}; Meaning(ii)={['Var\_' num2str(ii)]}; end
Nr_Var=length(Name);
for ii=0:Ns:Nr_Var
    if ii+Ns>Nr_Var; Nr=Nr_Var-ii; end
    for jj=1:Nr
        figure(900+ii/Ns)
        y=Out_Sim.get(Name{ii+jj});
        eval([Name{ii+jj} ' = y;'])
        subplot(S(1),S(2),jj)
        plot(t,y/eval(['(' Unit{ii+jj} ')'])); grid on
        ylabel([strrep(Name{ii+jj},'_','\_') ' [' Unit{ii+jj} ']'])
        title(Meaning{ii+jj})
        if jj>Nr-S(2); xlabel('Time [s]'); end
    end
end