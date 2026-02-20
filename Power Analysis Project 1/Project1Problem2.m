Van = 1414;
Z_wye1 = 500 * exp(53.1i * pi/180);
Z_delta = 3000 * exp(53i * pi/180);
Z_wye2 = Z_delta / 3;

Ia1 = Van / Z_wye1;
S1_p = Van * conj(Ia1);
S1_total = 3 * S1_p

Ia2 = Van / Z_wye2;
S2_p = Van * conj(Ia1);
S2_total = 3 * S2_p

S_total = S1_total + S2_total

Q_total = imag(S_total)

P_total = real(S_total)

% Step 2
I_total = 3 * (Ia1 + Ia2)

% Step 3
clear
clc
x = 0:0.05:2 * pi;
Van = 1414 .* cosd((120 * pi) .* (x));
Z_wye1 = 500 * exp(-53.1i * pi/180);
Z_delta = 3000 * exp(53i * pi/180);
Z_wye2 = Z_delta / 3;

Ia1 = Van ./ Z_wye1;
S1_p = Van .* (Ia1);
S1_total = 3 * S1_p;

Ia2 = Van ./ Z_wye2;
S2_p = Van .* (Ia2);
S2_total = 3 * S2_p;

S_total = S1_total + S2_total;

Qtotal = imag(S_total);

Ptotal = real(S_total);

plot(x, Qtotal)
hold on
plot(x, Ptotal)
hold off
xlabel('Period (T)')
ylabel('Instantanious Power (Real/Reactive)')
legend('Q','P')