format short eng
% First col = Resistor  - second col = Voltage output.
N5818Meas = [...
                5, 420e-3; ...
                10, 380e-3; ...
                40, 320e-3; ...
                100, 300e-3; ...
                1e3, 240e-3; ...
                10e3, 180e-3; ...
                100e3, 200e-6; ...
                1e6, 60e-3; ...
                ]
VoltageMeasure = N5818Meas(:, 2);
N5818Current = (VCC - N5818Meas(:, 2)) ./ N5818Meas(:, 1);
% N5818Current = N5818Current * 1000

figure(1); clf;
semilogx(...
N5818Current * 1000, ...
N5818Meas(:, 2)*1000, ...
'-o','DisplayName','N5818')
ylabel('U_F [mV]')
xlabel('I_{F} [mA]');
grid

U_temp = 26e-3

% % Ud fra målinger fåes
% U_D1 = VoltageMeasure(7);
% i_f1 = N5818Current(7);

% U_D2 = VoltageMeasure(6);
% i_f2 = CurrentMeasure(6);

% n = (U_D2-U_D1)/(U_temp*log(i_f2/i_f1))
% is = i_f1 / exp(U_D1/n*U_temp)



% U_D3 = VoltageMeasure(1);
% i_f3 = CurrentMeasure(1);

% U_F2_estimate = (n * U_temp * log(i_f3 / i_f1)) + U_D1
% U_RD3 = U_D3 - U_F2_estimate

% R_D = U_RD2/i_f3