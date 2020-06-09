% Entrenamiento de una red multicapa para realizar la operación Xor
% Red con 2 neuronas de entradas, dos neuronas de capa oculta y una neurona de salida
% Función sigmoide logistico
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% tabla de función de la compuerta XOR
%  X1    X2   Salida
%   0    0       0
%   0    1       1
%   1    0       1
%   1    1       0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 
clc
clear all

%Variables que serán capas y salida
Neurona1=0;
Neurona2=0;
SalidaN=0;

TasaDeAprendizaje=0.8;

%El usuario ingresa la cantidad de épocas a realizar
Epocas= '¿Cuál es el valor de epocas desea realizar? ';
Epoc=input(Epocas);

%Pesos definidos al azar
%Pesos de la capa oculta
W11=3;
W12=5;
W21=-1;
W22=0.3;

%Pesos de la salida
WS1=-2;
WS2=4;

%Entradas
E1=0;
E2=0;

Target=0;

for i=1:Epoc
%operación en la R.N.A.
%Función de la neurona y función sigmoide logistico
NeuronaE1=(W11*E1)+((W21)*E2);
SalidaE1=1/(1+(exp(-NeuronaE1)));

NeuronaE2=(W12*E1)+((W22)*E2);
SalidaE2=1/(1+(exp(-NeuronaE2)));

SalidaN=(WS1*SalidaE1)+((WS2)*SalidaE2);
SalidaF=1/(1+(exp(-SalidaN)));

%Se dispara la salida de la red
disp(SalidaF);

%Error de la salida
E=SalidaF*(1-SalidaF)*(Target-SalidaF);

%Nuevos pesos en neurona de sal1ida
WS1=WS1+(TasaDeAprendizaje*SalidaE1*E);
WS2=WS2+(TasaDeAprendizaje*SalidaE2*E);

%Error en Capa oculta
ERR1=SalidaE1*(1-SalidaE1)*(WS1*E);
ERR2=SalidaE2*(1-SalidaE2)*(WS2*E);

%Nuevos pesos en capa oculta
W11=W11+(TasaDeAprendizaje*E1*ERR1);
W12=W12+(TasaDeAprendizaje*E2*ERR1);

W21=W21+(TasaDeAprendizaje*E1*ERR2);
W22=W22+(TasaDeAprendizaje*E2*ERR2);

%Delay aplicado para observar los resultado detalladamente
pause(1);
end