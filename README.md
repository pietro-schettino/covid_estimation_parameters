# Estimation of SIR model’s parameters of COVID‑19 in Italy
In this project, the standard SIR model was adopted to estimate the rate of transmission, the recovery rate and the reproduction number of the COVID-19 epidemic in Italy.

# Steps
**Step 1**:
The specific description of the SIR model is as follows:

![SIR model1](/images/sir_model.png)

where β represents the actual transmission rate and γ represents the rate of removal or recovery. It is known that the total population size (N = S + I + R) is independent of time. Initially, in the absence of infection we have I + R = 0 and S≈N. We then obtain the following equation:

![SIR model2](/images/eq1.png)

The integration of this equation give us:

![SIR model3](/images/eq2.png)

**Step 2**:
When infection occurs, the susceptible population is almost equal to the population total population (S≈N). Subsequently, the number of infected individuals I(t) first increases exponentially.

![SIR model4](/images/eq3.png)

Moving on to logarithms:

![SIR model5](/images/eq4.png)

It is a linear link in logarithmic scale and therefore we can estimate the value of r from the data represented in logarithmic scale using for example the method of least squares squares.

**Step 3**:

From the third equation of the SIR model:

![SIR model6](/images/eq5.png)

Discretizing the derivative to the first member:

![SIR model7](/images/eq6.png)

whence:

![SIR model8](/images/eq7.png)

Calculating the values of γ referred to the single days and carrying out the arithmetic average of these values we obtain the average value of γ in the period considered.

**Step 4**:
The value of the parameter β can be calculated based on the knowledge of r and γ:

![eq8](/images/eq8.png)

**Step 5**:
The value of the basic reproduction number R_0 mathematically represents the ratio of the transmission rate to the recovery rate.

![eq9](/images/eq9.png)
 





# Requires
- [MATLAB R2020b](https://www.mathworks.com/products/matlab.html)

[![](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](#)


Copyright 2021 - 2021 The MathWorks, Inc.
