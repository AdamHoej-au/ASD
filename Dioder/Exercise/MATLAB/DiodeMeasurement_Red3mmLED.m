format short eng
% First col = Resistor  - second col = Voltage output.
RedLEDMeas = [...
                5, 3.60; ...
                10, 3.24; ...
                40, 2.46; ...
                100, 2.15; ...
                1e3, 1.86; ...
                10e3, 1.75; ...
                100e3, 1.64; ...
                1e6, 1.52; ...
                ]
LEDVoltageMeasure = RedLEDMeas(:, 2);
LEDCurrentMeasure = (VCC - RedLEDMeas(:, 2)) ./ RedLEDMeas(:, 1);
% LEDCurrentMeasure = LEDCurrentMeasure * 1000

figure(1); clf;
semilogx(...
LEDCurrentMeasure * 1000, ...
RedLEDMeas(:, 2)*1000, ...
'-o')
ylabel('U_F [mV]')
xlabel('I_{F} [mA]');
grid
title('Red 3mm LED');

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