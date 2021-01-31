format short eng
% First col = Resistor  - second col = Voltage output.
ZenerMeas = [...
                5, 1.02; ...
                10, 915e-3; ...
                40, 793e-3; ...
                100, 749e-3; ...
                1e3, 674e-3; ...
                10e3, 606e-3; ...
                100e3,  535e-3; ...
                1e6, 444-3; ...
                ]
ZenerVoltageMeasure = ZenerMeas(:, 2);
ZenerCurrentMeasure = (VCC - ZenerMeas(:, 2)) ./ ZenerMeas(:, 1);
% ZenerCurrentMeasure = ZenerCurrentMeasure * 1000

figure(1); clf;
semilogx(...
ZenerCurrentMeasure * 1000, ...
ZenerMeas(:, 2)*1000, ...
'-o',DisplayName,'Zener')
ylabel('U_F [mV]')
xlabel('I_{F} [mA]');
grid
title('Zener diode');

U_temp = 26e-3

% % Ud fra målinger fåes
% U_D1 = VoltageMeasure(7);
% i_f1 = CurrentMeasure(7);

% U_D2 = VoltageMeasure(6);
% i_f2 = CurrentMeasure(6);

% n = (U_D2-U_D1)/(U_temp*log(i_f2/i_f1))
% is = i_f1 / exp(U_D1/n*U_temp)



% U_D3 = VoltageMeasure(1);
% i_f3 = CurrentMeasure(1);

% U_F2_estimate = (n * U_temp * log(i_f3 / i_f1)) + U_D1
% U_RD3 = U_D3 - U_F2_estimate

% R_D = U_RD2/i_f3