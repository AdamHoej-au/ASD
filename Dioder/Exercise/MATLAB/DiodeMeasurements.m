clear
format short eng

VCC = 4.0

%% Loading Data
ZenerMeas = [...
            5, 1.02; ...
            10, 915e-3; ...
            40, 793e-3; ...
            100, 749e-3; ...
            1e3, 674e-3; ...
            10e3, 606e-3; ...
            100e3, 535e-3; ...
            1e6, 444e-3; ...
            ]
ZenerVoltageMeasure = ZenerMeas(:, 2);
ZenerCurrentMeasure = (VCC - ZenerMeas(:, 2)) ./ ZenerMeas(:, 1);

N914Measurements = [...
                    5, 0.975; ...
                    10, 0.914; ...
                    40, 0.849; ...
                    100, 0.818; ...
                    1e3, 0.735; ...
                    10e3, 0.650; ...
                    100e3, 0.562; ...
                    1e6, 0.464; ...
                    ]
N914VoltageMeasure = N914Measurements(:, 2);
N914CurrentMeasure = (VCC - N914Measurements(:, 2)) ./ N914Measurements(:, 1);

N914DATASHEETMeasurements = [...
                            1e-6, 0.275; ...
                            100e-6, 0.5; ...
                            1e-3, 0.620; ...
                            5e-3, 0.700; ...
                            10e-3, 0.730; ...
                            30e-3, 0.800; ...
                            50e-3, 0.840; ...
                            100e-3, 0.910; ...
                            200e-3, 1.020; ...
                            500e-3, 1.280; ...
                            700e-3, 1.400; ...
                            ]
N914DATASHEETVoltageMeasure = N914DATASHEETMeasurements(:, 2);
N914DATASHEETCurrentMeasure = N914DATASHEETMeasurements(:, 1);

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


%% Compare plot
figure(1); clf;
semilogx(...
    ZenerCurrentMeasure, ...
    ZenerMeas(:, 2), ...
    '-o', 'DisplayName', 'Z3B240CF')
hold

semilogx(...
    N914CurrentMeasure, ...
    N914Measurements(:, 2), ...
    '-o', 'DisplayName', '1N914')

semilogx(...
    N914DATASHEETCurrentMeasure, ...
    N914DATASHEETMeasurements(:, 2), ...
    '--', 'DisplayName', '~1N914 Datasheet')

semilogx(...
    LEDCurrentMeasure, ...
    RedLEDMeas(:, 2), ...
    '-or', 'DisplayName', 'Rød LED')

semilogx(...
    N5818Current, ...
    N5818Meas(:, 2), ...
    '-o', 'DisplayName', 'N5818')
ylabel('U_F [V]')
xlabel('I_{F} [A]');
title('Sammenligning af diodetyper.')
grid
hold off
legend('location','best');
figsave('DiodeComparison')



figure(2); clf;
semilogx(...
N914CurrentMeasure, ...
N914Measurements(:, 2), ...
    '-o', 'DisplayName', '1N914')
    hold
    semilogx(...
    N914DATASHEETCurrentMeasure, ...
    N914DATASHEETMeasurements(:, 2), ...
    '--', 'DisplayName', '~1N914 Datasheet')
    ylabel('U_F [V]')
    xlabel('I_{F} [A]');
grid
hold off
legend('location','best');
figsave('1N914Compare')
