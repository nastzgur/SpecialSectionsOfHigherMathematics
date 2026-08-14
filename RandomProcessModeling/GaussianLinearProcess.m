clear;
N = 1000;
mU = 2; sigmaU = 1;
mV = 1; sigmaV = 1;
U = normrnd(mU, sigmaU, 1, N);
V = normrnd(mV, sigmaV, 1, N);

figure(1)
subplot(2, 1, 1)
plot(U)
title(['Послідовність значень U \sim \mathcal{N}(', num2str(mU), ',', num2str(sigmaU), ')'])
xlabel('n')
ylabel('U')
grid on
subplot(2, 1, 2)
plot(V)
title(['Послідовність значень V \sim \mathcal{N}(', num2str(mV), ',', num2str(sigmaV), ')'])
xlabel('n')
ylabel('V')
grid on

figure(2)
subplot(1, 2, 1)
[aU, bU] = hist(U, 20);
dxU = (max(U) - min(U)) / 20;
pU = aU / (N * dxU);
bar(bU, pU, 'r')
hold on
x = linspace(min(U), max(U), 100);
fU = 1/(sigmaU * sqrt(2*pi)) * exp(-(x - mU).^2 / (2 * sigmaU^2));
plot(x, fU, 'b', 'LineWidth', 2)
title(['Гістограма U \sim \mathcal{N}(', num2str(mU), ',', num2str(sigmaU), ')'])
xlabel('U')
ylabel('Щільність')
grid on

subplot(1, 2, 2)
[aV, bV] = hist(V, 20);
dxV = (max(V) - min(V)) / 20;
pV = aV / (N * dxV);
bar(bV, pV, 'r')
hold on
fV = 1/(sigmaV * sqrt(2*pi)) * exp(-(x - mV).^2 / (2 * sigmaV^2));
plot(x, fV, 'b', 'LineWidth', 2)
title(['Гістограма V \sim \mathcal{N}(', num2str(mV), ',', num2str(sigmaV), ')'])
xlabel('V')
ylabel('Щільність')
grid on

mU_est = mean(U); dU = var(U); sigmaU_est = std(U);
mV_est = mean(V); dV = var(V); sigmaV_est = std(V);
disp('Характеристики U:')
disp(['Математичне очікування: ', num2str(mU_est)])
disp(['Дисперсія: ', num2str(dU)])
disp(['Середнє квадратичне відхилення: ', num2str(sigmaU_est)])
disp('Характеристики V:')
disp(['Математичне очікування: ', num2str(mV_est)])
disp(['Дисперсія: ', num2str(dV)])
disp(['Середнє квадратичне відхилення: ', num2str(sigmaV_est)])

N = 100;
a = 1;
T = 0:0.1:10;
Y = zeros(N, length(T));
for i = 1:N
    U_i = normrnd(mU, sigmaU);
    V_i = normrnd(mV, sigmaV);
    Y(i, :) = a + U_i * T + V_i * T;
end

M = mean(Y);

figure(3)
plot(T, M, 'r', 'LineWidth', 2)
title(['Математичне очікування Y(t) (U \sim \mathcal{N}(', num2str(mU), ',', num2str(sigmaU), ...
    '), V \sim \mathcal{N}(', num2str(mV), ',', num2str(sigmaV), '))'])
xlabel('t')
ylabel('M[Y(t)]')
grid on

figure(4)
hold on
for i = 1:5
    plot(T, Y(i, :), 'DisplayName', ['Реалізація ', num2str(i)])
end
plot(T, M, 'r', 'LineWidth', 2, 'DisplayName', 'Математичне очікування')
title(['Сімейство реалізацій Y(t) (U \sim \mathcal{N}(', num2str(mU), ',', num2str(sigmaU), ...
    '), V \sim \mathcal{N}(', num2str(mV), ',', num2str(sigmaV), '))'])
xlabel('t')
ylabel('Y(t)')
legend show
grid on

N_t = length(T);
R = zeros(1, 20);
for tau = 1:20
    for k = 1:(N_t - tau)
        R(tau) = R(tau) + mean(Y(:, k) .* Y(:, k + tau - 1));
    end
    R(tau) = R(tau) / (N_t - tau);
end

figure(5)
plot(0:19, R)
title(['Кореляційна функція R(\tau) (U \sim \mathcal{N}(', num2str(mU), ',', num2str(sigmaU), ...
    '), V \sim \mathcal{N}(', num2str(mV), ',', num2str(sigmaV), '))'])
xlabel('\tau')
ylabel('R(\tau)')
grid on
