clear;
N = 1000;
U = normrnd(0, 1, 1, N);
V = normrnd(0, 1, 1, N);

figure(1)
subplot(2, 1, 1)
plot(U)
title('Послідовність значень U')
xlabel('n')
ylabel('U')
grid on
subplot(2, 1, 2)
plot(V)
title('Послідовність значень V')
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
f = 1/sqrt(2*pi) * exp(-x.^2/2);
plot(x, f, 'b', 'LineWidth', 2)
title('Гістограма U та теоретична щільність')
xlabel('U')
ylabel('Щільність')
grid on

subplot(1, 2, 2)
[aV, bV] = hist(V, 20);
dxV = (max(V) - min(V)) / 20;
pV = aV / (N * dxV);
bar(bV, pV, 'r')
hold on
plot(x, f, 'b', 'LineWidth', 2)
title('Гістограма V та теоретична щільність')
xlabel('V')
ylabel('Щільність')
grid on

mU = mean(U); dU = var(U); sigmaU = std(U);
mV = mean(V); dV = var(V); sigmaV = std(V);
disp('Характеристики U:')
disp(['Математичне очікування: ', num2str(mU)])
disp(['Дисперсія: ', num2str(dU)])
disp(['Середнє квадратичне відхилення: ', num2str(sigmaU)])
disp('Характеристики V:')
disp(['Математичне очікування: ', num2str(mV)])
disp(['Дисперсія: ', num2str(dV)])
disp(['Середнє квадратичне відхилення: ', num2str(sigmaV)])

N = 100;
a = pi/4;
T = 0:0.1:10;
Y = zeros(N, length(T));
for i = 1:N
    U_i = normrnd(0, 1);
    V_i = normrnd(0, 1);
    Y(i, :) = U_i * cos(a * T) + V_i * sin(a * T);
end

M = mean(Y);

figure(3)
plot(T, M, 'r', 'LineWidth', 2)
title(['Математичне очікування Y(t) (a = \pi/4)'])
xlabel('t')
ylabel('M[Y(t)]')
grid on

figure(4)
hold on
for i = 1:5
    plot(T, Y(i, :), 'DisplayName', ['Реалізація ', num2str(i)])
end
plot(T, M, 'r', 'LineWidth', 2, 'DisplayName', 'Математичне очікування')
title(['Сімейство реалізацій Y(t) (a = \pi/4)'])
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
title(['Кореляційна функція R(\tau) (a = \pi/4)'])
xlabel('\tau')
ylabel('R(\tau)')
grid on
