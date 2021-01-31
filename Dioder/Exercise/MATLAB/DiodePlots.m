% Channel 1 = Measured at diode anode
% CHannel 3 = Measured at diode cathode - Measured across 10 ohm resistor
clear
VAR = 'Diode';
ResistorValue = 10;
Windowsize = 2048;

%%% LOADING THE MEASURED DATA
N914 = load('1N914_10ohmMeas', VAR); % Function output form of LOAD
N914 = N914.(VAR);
N914_V = movmean(N914(:, 1), Windowsize) .* 1000;
N914_I = movmean(N914(:, 2) ./ ResistorValue, Windowsize) .* 1000;

N5818 = load('1N5818_10ohmMeas', VAR); % Function output form of LOAD
N5818 = N5818.(VAR);
N5818_V = movmean(N5818(:, 1), Windowsize) .* 1000;
N5818_I = movmean(N5818(:, 2) ./ ResistorValue, Windowsize) .* 1000;

BC546_BC = load('BC546_BC_10ohmMeas', VAR); % Function output form of LOAD
BC546_BC = BC546_BC.(VAR);
BC546_BC_V = movmean(BC546_BC(:, 1), Windowsize) .* 1000;
BC546_BC_I = movmean(BC546_BC(:, 2) ./ ResistorValue, Windowsize) .* 1000;

BC546_BE = load('BC546_BE_10ohmMeas', VAR); % Function output form of LOAD
BC546_BE = BC546_BE.(VAR);
BC546_BE_V = movmean(BC546_BE(:, 1), Windowsize) .* 1000;
BC546_BE_I = movmean(BC546_BE(:, 2) ./ ResistorValue, Windowsize) .* 1000;

ZenerZB = load('ZenerZB_10ohmMeas', VAR); % Function output form of LOAD
ZenerZB = ZenerZB.(VAR);
ZenerZB_V = movmean(ZenerZB(:, 1), Windowsize) .* 1000;
ZenerZB_I = movmean(ZenerZB(:, 2) ./ ResistorValue, Windowsize) .* 1000;

KugleDiode = load('KugleDiode_10ohmMeas', VAR); % Function output form of LOAD
KugleDiode = KugleDiode.(VAR);
KugleDiode_V = movmean(KugleDiode(:, 1), Windowsize) .* 1000;
KugleDiode_I = movmean(KugleDiode(:, 2) ./ ResistorValue, Windowsize) .* 1000;

RocketDiode = load('RocketDiode_10ohmMeas', VAR); % Function output form of LOAD
RocketDiode = RocketDiode.(VAR);
RocketDiode_V = movmean(RocketDiode(:, 1), Windowsize) .* 1000;
RocketDiode_I = movmean(RocketDiode(:, 2) ./ ResistorValue, Windowsize) .* 1000;

Yellow5mmLED = load('Yellow5mmLED_10ohmMeas', VAR); % Function output form of LOAD
Yellow5mmLED = Yellow5mmLED.(VAR);
Yellow5mmLED_V = movmean(Yellow5mmLED(:, 1), Windowsize) .* 1000;
Yellow5mmLED_I = movmean(Yellow5mmLED(:, 2) ./ ResistorValue, Windowsize) .* 1000;

SquareREDLED = load('SquareREDLED_10ohmMeas', VAR); % Function output form of LOAD
SquareREDLED = SquareREDLED.(VAR);
SquareREDLED_V = movmean(SquareREDLED(:, 1), Windowsize) .* 1000;
SquareREDLED_I = movmean(SquareREDLED(:, 2) ./ ResistorValue, Windowsize) .* 1000;

Resistor = load('1kOhm_10ohmMeas', VAR); % Function output form of LOAD
Resistor = Resistor.(VAR);
Resistor_V = movmean(Resistor(:, 1), Windowsize) .* 1000;
Resistor_I = movmean(Resistor(:, 2) ./ ResistorValue, Windowsize) .* 1000;

%%%% Plotting the data.
figure(1); clf;
plot(N914_V, N914_I, '-', 'DisplayName', '1N914')
hold on
% plot(N914DATA_V, N914DATA_I, '--', 'DisplayName', '1N914 Datasheet')
plot(N5818_V, N5818_I, '-', 'DisplayName', '1N5818')
plot(BC546_BC_V, BC546_BC_I, '-', 'DisplayName', 'BC546_BC')
plot(BC546_BE_V, BC546_BE_I, '-', 'DisplayName', 'BC546_BE')
plot(ZenerZB_V, ZenerZB_I, '-', 'DisplayName', 'ZenerZB')
plot(Yellow5mmLED_V, Yellow5mmLED_I, '-oy', 'DisplayName', 'Yellow5mmLED')
plot(SquareREDLED_V, SquareREDLED_I, '-r', 'DisplayName', 'SquareREDLED')
plot(KugleDiode_V, KugleDiode_I, '-', 'DisplayName', 'KugleDiode')
plot(RocketDiode_V, RocketDiode_I, '-', 'DisplayName', 'RocketDiode')
plot(Resistor_V, Resistor_I, '--', 'DisplayName', 'Resistor')
hold off
ylim([0 60])
xlim([0 3e3])
legend('Location', 'best')
xlabel('Voltage [mV]');
ylabel('Current [mA]');
grid

figure(2); clf;
semilogy(N914_V, N914_I, '-', 'DisplayName', '1N914')
hold on
% semilogy(N914DATA_V, N914DATA_I, '--', 'DisplayName', '1N914 Datasheet')
semilogy(N5818_V, N5818_I, '-', 'DisplayName', '1N5818')
semilogy(BC546_BC_V, BC546_BC_I, '-', 'DisplayName', 'BC546_BC')
semilogy(BC546_BE_V, BC546_BE_I, '-', 'DisplayName', 'BC546_BE')
semilogy(ZenerZB_V, ZenerZB_I, '-', 'DisplayName', 'ZenerZB')
semilogy(Yellow5mmLED_V, Yellow5mmLED_I, '-oy', 'DisplayName', 'Yellow5mmLED')
semilogy(SquareREDLED_V, SquareREDLED_I, '-r', 'DisplayName', 'SquareREDLED')
semilogy(KugleDiode_V, KugleDiode_I, '-', 'DisplayName', 'KugleDiode')
semilogy(RocketDiode_V, RocketDiode_I, '-', 'DisplayName', 'RocketDiode')
semilogy(Resistor_V, Resistor_I, '--', 'DisplayName', 'Resistor')
hold off
legend('Location', 'best')
ylim([0.1 100])
xlim([0 3e3])
xlabel('Voltage [mV]');
ylabel('Current [mA]');
grid

figure(3); clf;
semilogx(N914_I, N914_V, '-', 'DisplayName', '1N914')
hold on
% semilogx(N914DATA_V, N914DATA_I, '--', 'DisplayName', '1N914 Datasheet')
semilogx(N5818_I, N5818_V, '-', 'DisplayName', '1N5818')
semilogx(BC546_BC_I, BC546_BC_V, '-', 'DisplayName', 'BC546_BC')
semilogx(BC546_BE_I, BC546_BE_V, '-', 'DisplayName', 'BC546_BE')
semilogx(ZenerZB_I, ZenerZB_V, '-', 'DisplayName', 'ZenerZB')
semilogx(Yellow5mmLED_I, Yellow5mmLED_V, '-oy', 'DisplayName', 'Yellow5mmLED')
semilogx(SquareREDLED_I, SquareREDLED_V, '-r', 'DisplayName', 'SquareREDLED')
semilogx(KugleDiode_I, KugleDiode_V, '-', 'DisplayName', 'KugleDiode')
semilogx(RocketDiode_I, RocketDiode_V, '-', 'DisplayName', 'RocketDiode')
semilogx(Resistor_I, Resistor_V, '--', 'DisplayName', 'Resistor')
hold off
ylim([0 3e3])
xlim([0.1 100])
legend('Location', 'best')
xlabel('Current [mA]');
ylabel('Voltage [mV]');
grid
