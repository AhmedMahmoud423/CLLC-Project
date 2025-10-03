% Clear workspace, command window, and close all figures
clear;
clc;
close all;

% The CLLC ratings definition

P = 1000;          % the rated power in Watts

Vin_max = 110;     % the maximum input voltage in Volts
Vin_nom = 100 ;    % the nominal input voltage in volts
Vin_min = 90;     % the minimum input voltage in Volts

Vout_max = 110;    % the maximum output voltage in Volts
Vout_nom = 100 ;   % the nominal output voltage in volts
Vout_min = 90;    % the minimum output voltage in Volts

fr = 10e3;        % natural resonant frequency in Hz

% Calculating the turn ratio for the transformer
Nf = Vout_nom / Vin_nom;   % turns ratio in forward direction
Nr = 1 / Nf;               % turns ratio in reverse direction

% Calculating the minimum and maximum voltage gain

Gf_min = (Nf * Vout_min) / Vin_max ; % minimum voltage gain in forward
Gf_max = (Nf * Vout_max) / Vin_min ; % maximum voltage gain in forward
Gr_min = (Nr * Vout_min) / Vin_max ; % minimum voltage gain in reverse
Gr_max = (Nr * Vout_max) / Vin_min ; % maximum voltage gain in reverse

% Choosing the suitable k and Q factors from GainCurves.m
K = 2;
Q = 0.55;

% Calculating the effective resistance
R0 = (8 * Nf^2 * Vout_nom^2) / (pi^2 * P);

% Calculating the resonant capacitor C1
C1 = 1 / (2*pi*Q*fr*R0);

% Calculating the resonant inductor L1
L1 = 1 / ((2*pi*fr)^2 * C1);

% Calculating magnetizing inductance Lm
Lm = K * L1;

% Assuming a and b values
a = 1;
b = 1 / a;

% Calculating the secondary-side resonant inductor and capacitor L2,C2
L2 = (a * L1) / Nf^2;
C2 = b * C1 * Nf^2;



