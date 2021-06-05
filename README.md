# Estimation of SIR model’s parameters of COVID‑19 in Italy
In this project, the standard SIR model was adopted to estimate the rate of transmission, the recovery rate and the reproduction number of the COVID-19 epidemic in Italy.

# Steps
**Step 1**:
The specific description of the SIR model is as follows:

![SIR model](/images/sir_model.png)
where β represents the actual transmission rate and γ represents the rate of removal or recovery. It is known that the total population size (N = S + I + R) is independent of time. Initially, in the absence of infection we have I + R = 0 and S≈N. We then obtain the following equation:

![SIR model](/images/eq1.png)
The integration of this equation give us:

![SIR model](/images/eq2.png)

# Requires
- [MATLAB R2020b](https://www.mathworks.com/products/matlab.html)

[![](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](#)


Copyright 2021 - 2021 The MathWorks, Inc.
