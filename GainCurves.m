% Clear workspace, command window, and close all figures
clear;
clc;
close all;

% -------------------------------------------------------------------------
% Define the main parameters for the CLLC converter
% -------------------------------------------------------------------------
% You can adjust these values to see how they affect the curves.

fr1 = 73e3;          % Resonant Frequency in Hz (e.g., 73 kHz)
k = 4.45;            % Coupling Factor (k = Lm / L1)
a = 0.95;            % Parameter 'a' from the equation (a = n^2 * L2 / L1)
Q_values = [2.25,0.4,0.35,0.3,0.25,1.5]; % Array of Quality Factor (Q) values to plot

% -------------------------------------------------------------------------
% Calculations based on primary parameters
% -------------------------------------------------------------------------
wr1 = 2 * pi * fr1; % Resonant angular frequency in rad/s

% From the condition wr1 = wr2, it is derived that ab = 1
b = 1 / a;

% Define the frequency range for the plot
% We'll plot from 0.2 to 3.0 times the resonant frequency
f_norm = linspace(0.2, 3.0, 1000); % Normalized frequency vector
f_hz = f_norm * fr1;               % Frequency vector in Hz
ws = 2 * pi * f_hz;                % Angular frequency vector in rad/s

% -------------------------------------------------------------------------
% Plotting the Gain Curves
% -------------------------------------------------------------------------
figure('Name', 'CLLC Gain Curves Forward');
hold on; % Hold the plot to draw multiple curves

legend_entries = {}; % Initialize a cell array for legend entries

% Loop through each specified Q value
for i = 1:length(Q_values)
    Q = Q_values(i);
    
    % Define the coefficients of the transfer function G(s) = num(s) / den(s)
    % Based on the equation: nVout/Vin = (s^3*N3) / (s^4*D4 + s^3*D3 + s^2*D2 + s*D1 + D0)
    
    % Numerator coefficients (only s^3 term is non-zero)
    num_coeffs = [
        k / (a * wr1^3 * Q), ...  % s^3
        0, ...                   % s^2
        0, ...                   % s^1
        0                        % s^0
    ];

    % Denominator coefficients
    den_coeffs = [
        (1 + k + k/a) / wr1^4, ...         % s^4
        (b * (1 + k)) / (wr1^3 * Q), ...   % s^3
        (2 + k + k/a) / wr1^2, ...         % s^2
        b / (wr1 * Q), ...                 % s^1
        1                                  % s^0
    ];
    
    % Evaluate the transfer function for s = j*ws
    s = 1j * ws;
    numerator_poly   = polyval(num_coeffs, s);
    denominator_poly = polyval(den_coeffs, s);
    
    % Calculate the gain (magnitude of the transfer function)
    Gain = abs(numerator_poly ./ denominator_poly);
    
    % Plot the gain vs. normalized frequency
    plot(f_norm, Gain, 'LineWidth', 2);
    
    % Add an entry for the legend
    legend_entries{end+1} = sprintf('Q = %.2f', Q);
end

% -------------------------------------------------------------------------
% Finalize the plot with labels, title, and formatting
% -------------------------------------------------------------------------
hold off; % Release the plot
grid on;  % Add a grid
box on;   % Draw a box around the plot

% Set titles and labels
title('Gain Characteristics of a CLLC Resonant Converter', 'FontSize', 14);
xlabel('Normalized Frequency (f_s / f_r)', 'FontSize', 12);
ylabel('Gain |nVout / Vin|', 'FontSize', 12);

% Set plot limits
xlim([min(f_norm), max(f_norm)]);
ylim([0, 1.5]); % Adjust Y-axis limit if needed

% Add the legend
legend(legend_entries, 'Location', 'NorthEast');

% Improve font appearance
set(gca, 'FontName', 'Arial', 'FontSize', 10);
