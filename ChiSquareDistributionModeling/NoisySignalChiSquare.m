clear;
n = 1000;
V1 = zeros(1, n);

for i = 1:5
    S = sin(2*pi*(0:n-1)/50);
    noise = randn(1, n);
    V = S + noise;
    V1 = V1 + V.^2;
end

m = mean(V1);
d = var(V1);

fprintf('Математичне сподівання: %.4f\n', m);
fprintf('Дисперсія: %.4f\n', d);

figure;
plot(V);
title('Один із зашумлених сигналів');
xlabel('Номер відліку');
ylabel('Амплітуда');
grid on;

figure;
subplot(1,2,1);
plot(V1);
title('Графік значень суми квадратів 5 зашумлених сигналів');
xlabel('Номер відліку');
ylabel('Сума квадратів');
grid on;

subplot(1,2,2);
histogram(V1, 20, 'Normalization', 'pdf');
title('Гістограма розподілу V1');
xlabel('Значення');
ylabel('Щільність');
grid on;
