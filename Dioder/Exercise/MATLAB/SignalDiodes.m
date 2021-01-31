% Channel 1 = Measured at diode anode
% CHannel 3 = Measured at diode cathode - Measured across 10 ohm resistor
clear
VAR = 'Diode';
ResistorValue = 10;
Windowsize = 9048;

N4148EXAMPLE_V = [0.45, 0.5, 0.6, 0.8, 1, 1.05] .* 1000;
N4148EXAMPLE_I = [4e-8, 1e-7, 4e-6, 4e-3, 7e-2, 1e-1] .* 1000;

%%% LOADING THE MEASURED DATA
N4148 = load('1N4148_10ohmMeas', VAR); % Function output form of LOAD
N4148 = N4148.(VAR);
N4148_V = movmean(N4148(:, 1), Windowsize) .* 1000;
N4148_I = movmean(N4148(:, 2) ./ ResistorValue, Windowsize) .* 1000;

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

Resistor = load('1kOhm_10ohmMeas', VAR); % Function output form of LOAD
Resistor = Resistor.(VAR);
Resistor_V = movmean(Resistor(:, 1), Windowsize) .* 1000;
Resistor_I = movmean(Resistor(:, 2) ./ ResistorValue, Windowsize) .* 1000;

%%%% Plotting the data.
figure(4); clf;
plot(N4148_V, N4148_I, '-', 'DisplayName', '1N4148')
hold on
% plot(N4148DATA_V, N4148DATA_I, '--', 'DisplayName', '1N4148 Datasheet')
plot(N4148EXAMPLE_V, N4148EXAMPLE_I, '-o', 'DisplayName', '1N4148 Tore')
plot(N5818_V, N5818_I, '-', 'DisplayName', '1N5818')
plot(BC546_BC_V, BC546_BC_I, '-', 'DisplayName', 'BC546_{BC}')
plot(BC546_BE_V, BC546_BE_I, '-', 'DisplayName', 'BC546_{BE}')
plot(Resistor_V, Resistor_I, '--', 'DisplayName', 'Resistor')
hold off
ylim([0 60])
xlim([0 2e3])
legend('Location', 'best')
xlabel('Voltage [mV]');
ylabel('Current [mA]');
grid
figsave('SignalDiodesLinear')

figure(5); clf;
semilogy(N4148_V, N4148_I, '-', 'DisplayName', '1N4148')
hold on
% semilogy(N4148DATA_V, N4148DATA_I, '--', 'DisplayName', '1N4148 Datasheet')
semilogy(N4148EXAMPLE_V, N4148EXAMPLE_I, '-o', 'DisplayName', '1N4148 Tore')
semilogy(N5818_V, N5818_I, '-', 'DisplayName', '1N5818')
semilogy(BC546_BC_V, BC546_BC_I, '-', 'DisplayName', 'BC546_{BC}')
semilogy(BC546_BE_V, BC546_BE_I, '-', 'DisplayName', 'BC546_{BE}')
semilogy(Resistor_V, Resistor_I, '--', 'DisplayName', 'Resistor')
hold off
legend('Location', 'best')
ylim([0.1 100])
xlim([400 1600])
xlabel('Voltage [mV]');
ylabel('Current [mA]');
grid
figsave('SignalDiodesVI')

figure(6); clf;
semilogx(N4148_I, N4148_V, '-', 'DisplayName', '1N4148')
hold on
% semilogx(N4148DATA_V, N4148DATA_I, '--', 'DisplayName', '1N4148 Datasheet')
semilogx(N4148EXAMPLE_I, N4148EXAMPLE_V, '-o', 'DisplayName', '1N4148 Tore')
semilogx(N5818_I, N5818_V, '-', 'DisplayName', '1N5818')
semilogx(BC546_BC_I, BC546_BC_V, '-', 'DisplayName', 'BC546_{BC}')
semilogx(BC546_BE_I, BC546_BE_V, '-', 'DisplayName', 'BC546_{BE}')
semilogx(Resistor_I, Resistor_V, '--', 'DisplayName', 'Resistor')
hold off
ylim([400 1.6e3])
xlim([0.1 100])
legend('Location', 'best')
xlabel('Current [mA]');
ylabel('Voltage [mV]');
grid
figsave('SignalDiodesIV')

figure(7); clf;
loglog(N4148_I, N4148_V, '-', 'DisplayName', '1N4148')
hold on
% loglog(N4148DATA_V, N4148DATA_I, '--', 'DisplayName', '1N4148 Datasheet')
loglog(N4148EXAMPLE_I, N4148EXAMPLE_V, '-o', 'DisplayName', '1N4148 Tore')
loglog(N5818_I, N5818_V, '-', 'DisplayName', '1N5818')
loglog(BC546_BC_I, BC546_BC_V, '-', 'DisplayName', 'BC546_{BC}')
loglog(BC546_BE_I, BC546_BE_V, '-', 'DisplayName', 'BC546_{BE}')
loglog(Resistor_I, Resistor_V, '--', 'DisplayName', 'Resistor')
hold off
ylim([1e2 1e4])
xlim([1e-1 1e2])
legend('Location', 'best')
xlabel('Current [mA]');
ylabel('Voltage [mV]');
grid
figsave('SignalDiodesLogLogIV')

figure(8); clf;
loglog(N4148_V, N4148_I, '-', 'DisplayName', '1N4148')
hold on
% loglog(N4148DATA_I, N4148DATA_V, '--', 'DisplayName', '1N4148 Datasheet')
loglog(N4148EXAMPLE_V, N4148EXAMPLE_I, '-o', 'DisplayName', '1N4148 Tore')
loglog(N5818_V, N5818_I, '-', 'DisplayName', '1N5818')
loglog(BC546_BC_V, BC546_BC_I, '-', 'DisplayName', 'BC546_{BC}')
loglog(BC546_BE_V, BC546_BE_I, '-', 'DisplayName', 'BC546_{BE}')
loglog(Resistor_V, Resistor_I, '--', 'DisplayName', 'Resistor')
hold off
xlim([1e2 1e4])
ylim([1e-1 1e2])
legend('Location', 'best')
ylabel('Current [mA]');
xlabel('Voltage [mV]');
grid
figsave('SignalDiodesLogLogVI')
