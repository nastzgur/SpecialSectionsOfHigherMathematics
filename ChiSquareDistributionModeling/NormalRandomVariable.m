n = 1000;
X = randn(1, n);
m = mean(X)
d = var(X)
figure;
histogram(X, 20, 'Normalization', 'pdf');  % Побудова гістограми
title('Гістограма стандартної нормальної випадкової величини');
xlabel('Значення');
ylabel('Ймовірність');
grid on;
