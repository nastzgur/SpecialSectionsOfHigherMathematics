clear;
N = 1000;
lamd = 2;
U = exprnd(1/lamd, 1, N);

figure(1)
plot(U)
title('Послідовність значень U')
xlabel('n')
ylabel('U')

figure(2)
[a, b] = hist(U, 20);
dx = (max(U) - min(U)) / 20;
p1 = a / (N * dx);
bar(b, p1, 'r')
hold on

x = 0:0.01:max(U);
f = lamd * exp(-lamd * x);
plot(x, f, 'b', 'LineWidth', 2)
title('Гістограма U та теоретична щільність')
xlabel('U')
ylabel('Щільність')
grid on

mU = mean(U);
dU = var(U);
sigmaU = std(U);
disp(['Математичне очікування: ', num2str(mU)])
disp(['Дисперсія: ', num2str(dU)])
disp(['Середнє квадратичне відхилення: ', num2str(sigmaU)])
N = 100;
T = 0:0.1:10;
Y = zeros(N, length(T));
for i = 1:N
    U_i = exprnd(1/lamd);
    Y(i, :) = cos(U_i * T);
end

M = mean(Y);

figure(3)
plot(T, M, 'r', 'LineWidth', 2)
title('Математичне очікування Y(t)')
xlabel('t')
ylabel('M[Y(t)]')
grid on

figure(4)
hold on
for i = 1:5
    plot(T, Y(i, :), 'DisplayName', ['Реалізація ', num2str(i)])
end
plot(T, M, 'r', 'LineWidth', 2, 'DisplayName', 'Математичне очікування')
title('Сімейство реалізацій Y(t)')
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
title('Кореляційна функція R(\tau)')
xlabel('\tau')
ylabel('R(\tau)')
grid on
