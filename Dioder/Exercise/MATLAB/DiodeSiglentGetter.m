clear

[~, dataOutChannel1, ~] = acquireOscilloscopeData(1);
[~, dataOutChannel3, ~] = acquireOscilloscopeData(3);

Diode = [dataOutChannel1,dataOutChannel3];
save '1N4148_10ohmMeasFullRange.mat' Diode
