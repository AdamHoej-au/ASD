format short eng
clear


[timeOutChannel1, dataOutChannel1, sRateChannel1] = acquireOscilloscopeData(1);
[timeOutChannel3, dataOutChannel3, sRateChannel3] = acquireOscilloscopeData(3);


Diode = [dataOutChannel1,dataOutChannel3];
save 1N914_10OhmMeas Diode


% load('1n914_10OhmMeas.MAT')
