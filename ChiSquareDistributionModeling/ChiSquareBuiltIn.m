n = 1000;
k = 5;
V2 = chi2rnd(k, 1, n);

m = mean(V2);
d = var(V2);

fprintf('М. о.: %.4f\n', m);
fprintf('Дисперсія: %.4f\n', d);

figure;
histogram(V2, 20, 'Normalization', 'pdf');
title('Гістограма χ²-розподілу (chi2rnd, k = 5)');
xlabel('Значення');
ylabel('Щільність ймовірності');
grid on;
