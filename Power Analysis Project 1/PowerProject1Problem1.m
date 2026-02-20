close all; % it will close previous open figure
clear all; % it will clear workspace variable
clc; % clear the command window
R=4; % Resistance R
X=8; % Reactance of Line 
del=-25:3:5; % Change in Delta angle 
V1=150*exp(1j*del*pi/180); % Given V1 voltage source
V2=120*exp(1j*0); % Given V2 Voltage source
I=(V2-V1)/(R+1j*X); % Current from V1 to V2
S1=V1.*conj(I); % Complex power of source 1
S2=V1.*(-conj(I)); % Complex power of source 2
P1=real(S1); % Active or Real power of S1
P2=real(S2); % Real power of S2
Ploss=R*abs(I.^2); % Power loss in transmission line
varNames={'delta','P1','P2','Ploss'} % Variable names
table(del',P1',P2',Ploss','VariableNames',varNames) % Creates the table
figure(1)
plot(del,P1,'LineWidth',1.5);
xlabel('\delta');
ylabel('P1');
figure(2)
plot(del,P2,'LineWidth',1.5);
xlabel('\delta');
ylabel('P2')
figure(3)
plot(del,Ploss,'LineWidth',1.5);
xlabel('\delta');
ylabel('P_{loss}')