I1_vals = linspace(1,63,64);
I1_zeros = zeros(size(I1_vals));
VR_vals = zeros(size(I1_vals));
VR2_vals = zeros(size(I1_vals));
VR3_vals = zeros(size(I1_vals));
I1 = exp(1i*-36.87*pi/180); % 0.8 lag
I2 = exp(1i*36.87*pi/180); % 0.8 lead
I3 = exp(1i*0*pi/180);
VNL2 = 2400;
ZE = 0.4 + 1i*0.9;
VL1 = 0;

for i = 1:length(I1_vals)
    VFL1 = (i*I1)*ZE + VNL2;
    VR = 100*(abs(VFL1) - VNL2)/(VNL2);
    VR_vals(i) = VR;

end

for j = 1:length(I1_vals)
    VFL12 = (j*I2)*ZE + VNL2;
    VR2 = 100*((abs(VFL12) - VNL2)/(VNL2));
    VR2_vals(j) = VR2;

end

for k = 1:length(I1_vals)
    VFL13 = (k*I3)*ZE + VNL2;
    VR3 = 100*(abs(VFL13) - VNL2)/(VNL2);
    VR3_vals(k) = VR3;

end

plot(I1_vals,VR_vals);
hold on;
plot(I1_vals,VR2_vals); 
plot(I1_vals,VR3_vals);
xlabel('Zero Load to Full Load (A)');
ylabel('Vr (%)');
legend('VR 0.8 lag', 'VR 0.8 lead', 'VR unity');