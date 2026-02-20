E1 = input('Source # 1 Voltage Mag. = ');   % 150
a1 = input('Source # 1 Phase Angle = ');    % -5
E2 = input('Source # 2 Voltage Mag. = ');   % 120
a2 = input('Source # 2 Phase Angle = ');    % 0
R = input('Line Resistance = ');            % 4
X = input('Line Reactance = ');             % 8
Z = R + j*X; % Line impedance
E1 = (0.60*E1:1:E1)'; % Change E1 form 60% to 100% E1
a1r = a1*pi/180; % Convert degree to radian
k = length(E1);
E2 = ones(k,1)*E2;%create col. Array of same length for E2
a2r = a2*pi/180; % Convert degree to radian
V1=E1.*cos(a1r) + j*E1.*sin(a1r);
V2=E2.*cos(a2r) + j*E2.*sin(a2r);
I12 = (V1 - V2)./Z; I21=-I12;
S1= V1.*conj(I12); P1 = real(S1); Q1 = imag(S1);
S2= V2.*conj(I21); P2 = real(S2); Q2 = imag(S2);
SL= S1+S2; PL = real(SL); QL = imag(SL);
Result1=[E1, Q1, Q2, QL];
disp(' E1 Q-1 Q-2 Q-L ')
disp(Result1)
plot(E1, Q1, E1, Q2, E1, QL), grid
xlabel(' Source #1 Voltage Magnitude')
ylabel(' Q, var')
text(112.5, -180, 'Q2')
text(112.5, 5,'QL'), text(112.5, 197, 'Q1')