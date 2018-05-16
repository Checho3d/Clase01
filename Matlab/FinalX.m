%% Calculo del voltaje linea linea de la turbina para un bus DC de 500v
VDC  = 500;
Vm   = VDC*pi/(3*sqrt(3)); 
Vmll = Vm*(2/sqrt(3));

%% Cálculo de la capacitancia del filtro según frecuencia de corte Fc, inductancia escojida.
Rd = 1e3
RL = 24e-3
L = 3e-3;
fc = 500;
C = (1/L)*(1/(2*pi*fc))^2;

% Función de tranferencia del filtro pasabajos:

NUM = [1/(Rd*C) (Rd+RL)/(L*Rd*C)];
DEN = [1 RL/L+1/(Rd*C) RL/(L*Rd*C)+1/(L*C)];

G = tf(NUM,DEN);
bode(G)




    
%% Parámetros generales del Proyecto    
ma=0.8;
fsw=30000;
f1=60;
mf=fsw/f1;

VrmsLoad = 208;
Vphase = VrmsLoad*(sqrt(3/2));
VppLoad = Vphase*2;

%% Ganancias proporcional e integral parte Lazo de potencia.
Pp=20;
PIp=10;

%% Ganancias proporcional e integral Inner Loop
Pl=30;
PIl=1500;

%% tiempo de entrada del switch
T=2e-7;
Ts=4/60;

%% Cálculo del capacitor del DClink
I=20000/VrmsLoad;
R=VrmsLoad/I
Cdc =1/(4*500*R)*(1+1/(sqrt(2)*0.03));

%%Actualizacion