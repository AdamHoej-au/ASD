% Channel 1 = Measured at diode anode
% CHannel 3 = Measured at diode cathode - Measured across 10 ohm resistor
clear
VAR = 'Diode';
ResistorValue = 10;
Windowsize = 1024;

N4148EXAMPLE_V = [0.45, 0.5, 0.6, 0.8, 1, 1.05] .* 1000;
N4148EXAMPLE_I = [4e-8, 1e-7, 4e-6, 4e-3, 7e-2, 1e-1] .* 1000;

%%% LOADING THE MEASURED DATA
N4148 = load('1N4148_10ohmMeasFullRange', VAR); % Function output form of LOAD
N4148 = N4148.(VAR);
N4148_V = movmean(N4148(:, 1) - N4148(:, 2), Windowsize) .* 1000;
N4148_I = movmean(N4148(:, 2) ./ ResistorValue, Windowsize) .* 1000;

N5818 = load('1N5818_10ohmMeasFullRange', VAR); % Function output form of LOAD
N5818 = N5818.(VAR);
N5818_V = movmean(N5818(:, 1) - N5818(:, 2), Windowsize) .* 1000;
N5818_I = movmean(N5818(:, 2) ./ ResistorValue, Windowsize) .* 1000;

BipolarLED = load('BipolarLED_10ohmMeasFullRange', VAR); % Function output form of LOAD
BipolarLED = BipolarLED.(VAR);
BipolarLED_V = movmean(BipolarLED(:, 1) - BipolarLED(:, 2), Windowsize) .* 1000;
BipolarLED_I = movmean(BipolarLED(:, 2) ./ ResistorValue, Windowsize) .* 1000;

Zener3V = load('Zener3V_10ohmMeasFullRange', VAR); % Function output form of LOAD
Zener3V = Zener3V.(VAR);
Zener3V_V = movmean(Zener3V(:, 1) - Zener3V(:, 2), Windowsize) .* 1000;
Zener3V_I = movmean(Zener3V(:, 2) ./ ResistorValue, Windowsize) .* 1000;

KugleDiode = load('KugleDiode_10ohmMeasFullRange', VAR); % Function output form of LOAD
KugleDiode = KugleDiode.(VAR);
KugleDiode_V = movmean(KugleDiode(:, 1) - KugleDiode(:, 2), Windowsize) .* 1000;
KugleDiode_I = movmean(KugleDiode(:, 2) ./ ResistorValue, Windowsize) .* 1000;

ZenerZB = load('ZenerZB_10ohmMeasFullRange', VAR); % Function output form of LOAD
ZenerZB = ZenerZB.(VAR);
ZenerZB_V = movmean(ZenerZB(:, 1) - ZenerZB(:, 2), Windowsize) .* 1000;
ZenerZB_I = movmean(ZenerZB(:, 2) ./ ResistorValue, Windowsize) .* 1000;

%%%% Plotting the data.
figure(4); clf;
plot(N4148_V, N4148_I, '-', 'DisplayName', '1N4148')
hold on
xline(0)
plot(N4148EXAMPLE_V, N4148EXAMPLE_I, '-o', 'DisplayName', '1N4148 Tore')
plot(N5818_V, N5818_I, '-', 'DisplayName', '1N5818')
% plot(BipolarLED_V, BipolarLED_I, ':', 'DisplayName', 'BipolarLED')
plot(Zener3V_V, Zener3V_I, '-.', 'DisplayName', 'Zener3V')
plot(KugleDiode_V, KugleDiode_I, '-.', 'DisplayName', 'Kuglediode')
plot(ZenerZB_V, ZenerZB_I, '-.', 'DisplayName', 'Zener ZB')
hold off
ylim([-30 50])
xlim([-3.5e3 1.5e3])
legend('Location', 'best')
xlabel('Voltage [mV]');
ylabel('Current [mA]');
title({'Diode sammenligning', 'Påtrykt 50Hz 10V_{pp} Sinus.m','50\Omega gen. modstand','Målt over 10\Omega'})
grid
figsave('SignalDiodesLinearFULLRANGE10Vpp')

figure(5); clf;
semilogy(N4148_V, N4148_I, '-', 'DisplayName', '1N4148')
hold on
xline(0)
semilogy(N4148EXAMPLE_V, N4148EXAMPLE_I, '-o', 'DisplayName', '1N4148 Tore')
semilogy(N5818_V, N5818_I, '-', 'DisplayName', '1N5818')
% semilogy(BipolarLED_V, BipolarLED_I, ':', 'DisplayName', 'BipolarLED')
semilogy(Zener3V_V, Zener3V_I, '-.', 'DisplayName', 'Zener3V')
semilogy(KugleDiode_V, KugleDiode_I, '-.', 'DisplayName', 'Kuglediode')
semilogy(ZenerZB_V, ZenerZB_I, '-.', 'DisplayName', 'Zener ZB')
hold off
legend('Location', 'best')
ylim([1e-2 1e2])
xlim([-2.3e3 1.5e3])
xlabel('Voltage [mV]');
ylabel('Current [mA]');
title({'Diode sammenligning', 'Påtrykt 50Hz 10V_{pp} Sinus.m','50\Omega gen. modstand','Målt over 10\Omega'})
grid
figsave('SignalDiodesVIFULLRANGE10Vpp')

figure(51); clf;
semilogy(N4148_V, N4148_I, '-', 'DisplayName', '1N4148')
hold on
xline(0)
semilogy(N4148EXAMPLE_V, N4148EXAMPLE_I, '-o', 'DisplayName', '1N4148 Tore')
semilogy(N5818_V, N5818_I, '-', 'DisplayName', '1N5818')
% semilogy(BipolarLED_V, BipolarLED_I, ':', 'DisplayName', 'BipolarLED')
semilogy(Zener3V_V, Zener3V_I, '-.', 'DisplayName', 'Zener3V')
semilogy(KugleDiode_V, KugleDiode_I, '-.', 'DisplayName', 'Kuglediode')
semilogy(ZenerZB_V, ZenerZB_I, '-.', 'DisplayName', 'Zener ZB')
hold off
legend('Location', 'best')
ylim([1e-2 1e2])
xlim([200 1e3])
xlabel('Voltage [mV]');
ylabel('Current [mA]');
title({'Diode sammenligning', 'Påtrykt 50Hz 10V_{pp} Sinus.m','50\Omega gen. modstand','Målt over 10\Omega'})
grid
figsave('SignalDiodesVIHALFRANGE10Vpp')

figure(6); clf;
semilogx(N4148_I, N4148_V, '-', 'DisplayName', '1N4148')
hold on
yline(0)
semilogx(N4148EXAMPLE_I, N4148EXAMPLE_V, '-o', 'DisplayName', '1N4148 Tore')
semilogx(N5818_I, N5818_V, '-', 'DisplayName', '1N5818')
% semilogx(BipolarLED_I, BipolarLED_V, ':', 'DisplayName', 'BipolarLED')
semilogx(Zener3V_I, Zener3V_V, '-.', 'DisplayName', 'Zener3V')
semilogx(KugleDiode_I, KugleDiode_V, '-.', 'DisplayName', 'Kuglediode')
semilogx(ZenerZB_I, ZenerZB_V, '-.', 'DisplayName', 'ZenerZB')
hold off
xlim([1e-2 1e2])
ylim([-2.3e3 1.5e3])
legend('Location', 'best')
xlabel('Current [mA]');
ylabel('Voltage [mV]');
grid
title({'Diode sammenligning', 'Påtrykt 50Hz 10V_{pp} Sinus.m','50\Omega gen. modstand','Målt over 10\Omega'})
figsave('SignalDiodesIVFULLRANGE10Vpp')



figure(7); clf;
semilogx(N4148_I, N4148_V, '-', 'DisplayName', '1N4148')
hold on
semilogx(N4148EXAMPLE_I, N4148EXAMPLE_V, '-o', 'DisplayName', '1N4148 Tore')
semilogx(N5818_I, N5818_V, '-', 'DisplayName', '1N5818')
% semilogx(BipolarLED_I, BipolarLED_V, ':', 'DisplayName', 'BipolarLED')
semilogx(Zener3V_I, Zener3V_V, '-.', 'DisplayName', 'Zener3V')
semilogx(KugleDiode_I, KugleDiode_V, '-.', 'DisplayName', 'Kuglediode')
semilogx(ZenerZB_I, ZenerZB_V, '-.', 'DisplayName', 'ZenerZB')
hold off
xlim([1e-2 1e2])
ylim([0 1.5e3])
legend('Location', 'best')
xlabel('Current [mA]');
ylabel('Voltage [mV]');
grid
title({'Diode sammenligning', 'Påtrykt 50Hz 10V_{pp} Sinus.m','50\Omega gen. modstand','Målt over 10\Omega'})
figsave('SignalDiodesIVHalfRANGE10Vpp')




figure(4148); clf;
semilogx(N4148_I, N4148_V, '-', 'DisplayName', '1N4148')
hold on
semilogx(N4148EXAMPLE_I, N4148EXAMPLE_V, '-o', 'DisplayName', '1N4148 Tore')
hold off
title({'1N4148 sammenligning', 'Påtrykt 50Hz 10V_{pp} Sinus.m','50\Omega gen. modstand','Målt over 10\Omega'})
xlim([0.01 1e2])
ylim([0 1.5e3])
legend('Location', 'best')
xlabel('Current [mA]');
ylabel('Voltage [mV]');
grid
figsave('1N4148Compare')



figure(3000); clf;
plot(BipolarLED_V, BipolarLED_I, '-', 'DisplayName', 'BipolarLED')
hold on;
plot(N4148_V, N4148_I, '-', 'DisplayName', '1N4148')
hold off;
xlim([-2.1e3 2.5e3])
ylim([-40 50])
xline(0)
legend('Location', 'best')
xlabel('Current [mA]');
ylabel('Voltage [mV]');
grid
title({'Bipolar Red/Green LED og 1N4148', 'Påtrykt 50Hz 10V_{pp} Sinus.m', '50\Omega gen. modstand', 'Målt over 10\Omega'})
figsave('BipolarLED')
