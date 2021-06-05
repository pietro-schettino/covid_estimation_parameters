function dx_dt = SIR_model(x, beta, gamma, N)

dS_dt = - beta/N * x(1) * x(2);
dI_dt = beta/N * x(1) * x(2) - gamma *x(2);

dx_dt = [dS_dt; dI_dt];

end
 