clear;
N = 1000;
c = -pi; d = pi;
X = c + (d - c) * rand(1, N);

figure(1)
plot(X)
title('Послідовність значень X')
xlabel('n')
ylabel('X')
grid on

figure(2)
[a, b] = hist(X, 20);
dx = (max(X) - min(X)) / 20;
p1 = a / (N * dx);
bar(b, p1, 'r')
hold on

f = ones(1, 100) * 1/(d - c);
x = linspace(c, d, 100);
plot(x, f, 'b', 'LineWidth', 2)
title('Гістограма X та теоретична щільність')
xlabel('X')
ylabel('Щільність')
grid on

mX = mean(X);
dX = var(X);
sigmaX = std(X);
disp(['Математичне очікування: ', num2str(mX)])
disp(['Дисперсія: ', num2str(dX)])
disp(['Середнє квадратичне відхилення: ', num2str(sigmaX)])

N = 100;
omega = 3;
T = 0:0.1:10;
Y = zeros(N, length(T));
for i = 1:N
    X_i = c + (d - c) * rand;
    Y(i, :) = cos(omega * T + X_i);
end

M = mean(Y);

figure(3)
plot(T, M, 'r', 'LineWidth', 2)
title(['Математичне очікування Y(t) (\omega = ', num2str(omega), ')'])
xlabel('t')
ylabel('M[Y(t)]')
grid on

figure(4)
hold on
for i = 1:5
    plot(T, Y(i, :), 'DisplayName', ['Реалізація ', num2str(i)])
end
plot(T, M, 'r', 'LineWidth', 2, 'DisplayName', 'Математичне очікування')
title(['Сімейство реалізацій Y(t) (\omega = ', num2str(omega), ')'])
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
title(['Кореляційна функція R(\tau) (\omega = ', num2str(omega), ')'])
xlabel('\tau')
ylabel('R(\tau)')
grid on
