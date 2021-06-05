clc; clear all; close all;

%% Part 1 - Analysis of data and estimation of parameters

% Italian Population (About 60 milions)
N = 60e6;

data = websave("data.csv", 'https://tinyurl.com/ucc27p65');
table = readtable("data.csv");

days = datetime(2020,02,24) + caldays(0:size(table,1)-1);

start_day =  datetime(2020,10,12);
end_day = datetime(2020,10,18);

%start_day =  datetime(2021,05,28);
%end_day = datetime(2021,06,04);

start = find(days==start_day);
finish = find(days==end_day);

positives = table2array(table(start:finish,5));
deceaseds = table2array(table(start:finish,11));
healeds = table2array(table(start:finish,10));

% Vectors for SIR model
Infectious = positives;
Removed = deceaseds + healeds;
Susceptible = N - Removed - Infectious;

% Vector of time (for log-regression)
t = 1:size(positives,1);

% Linear regression in logarithmic scale
% log(I) = r*t + log(Io)
p = polyfit(t,log(Infectious),1);

% Set of coefficient r
r = p(1);

% Vector of daily gamma parameters
gamma = (Removed(2:end)-Removed(1:end-1)) ./ Infectious(1:end-1);

% Setting gamma equal to average value
gamma = sum(gamma)/length(gamma);

% Beta
beta = gamma + r;

% Rt
Rt = beta/gamma;

%% Part 2 - Simulation of SIR Model

% Vector of initial conditions
x0 = [Susceptible(1),Infectious(1)];

% Simulation of SIR model with estimated parameters beta and gamma
model = @(t,x) SIR_model(x, beta, gamma, N);
[t,y] = ode45(model, 1:length(t), x0);

S = y(:,1);
I = y(:,2);
R = N-S-I;

subplot(2,2,1);
bar(days(start:finish),Susceptible)
hold on
plot(days(start:finish),S,'LineWidth',2)
title(['\beta=', num2str(beta),', \gamma=', num2str(gamma),', R_t=', num2str(Rt)])
xlabel("Time Period");
ylabel("Susceptible");
legend("Real Data","SIR Model")
ylim([min(min(Susceptible),min(S)) max(max(Susceptible),max(S))])

subplot(2,2,2);
bar(days(start:finish),Infectious)
hold on
plot(days(start:finish),I,'LineWidth',2)
title(['\beta=', num2str(beta),', \gamma=', num2str(gamma),', R_t=', num2str(Rt)])
xlabel("Time Period");
ylabel("Infectious");
legend("Real Data","SIR Model")
ylim([min(min(Infectious),min(I)) max(max(Infectious),max(I))])

subplot(2,2,[3,4]);
bar(days(start:finish),Removed)
hold on
plot(days(start:finish),R,'LineWidth',2)
title(['\beta=', num2str(beta),', \gamma=', num2str(gamma),', R_t=', num2str(Rt)])
xlabel("Time Period");
ylabel("Removed");
legend("Real Data","SIR Model")
ylim([min(min(Removed),min(R)) max(max(Removed),max(R))])
