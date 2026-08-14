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

