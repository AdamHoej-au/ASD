format short eng
% First col = Resistor  - second col = Voltage output.
N914Measurements = [...
                5, 0.975; ...
                10, 0.914; ...
                20, 0.879; ...
                40, 0.849; ...
                100, 0.818; ...
                1e3, 0.735; ...
                10e3, 0.650; ...
                100e3, 0.562; ...
                1e6, 0.464; ...
                ]
N914VoltageMeasure = N914Measurements(:, 2);
N914CurrentMeasure = (VCC - N914Measurements(:, 2)) ./ N914Measurements(:, 1);
% N914CurrentMeasure = N914CurrentMeasure * 1000

figure(1);clf;
semilogx(...
N914CurrentMeasure * 1000, ...
N914Measurements(:, 2)*1000, ...
'-o')
ylabel('U_F [mV]')
xlabel('I_{F} [mA]');
grid
title('1N914');
hold
U_temp = 26e-3

% Ud fra målinger fåes
U_D1 = VoltageMeasure(7);
i_f1 = CurrentMeasure(7);

U_D2 = VoltageMeasure(6);
i_f2 = CurrentMeasure(6);

n = (U_D2-U_D1)/(U_temp*log(i_f2/i_f1))
is = i_f1 / exp(U_D1/n*U_temp)



U_D3 = VoltageMeasure(1);
i_f3 = CurrentMeasure(1);

U_F2_estimate = (n * U_temp * log(i_f3 / i_f1)) + U_D1
U_RD3 = U_D3 - U_F2_estimate

R_D = U_RD2/i_f3