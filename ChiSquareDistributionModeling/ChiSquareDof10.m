n = 1000;
k = 10;
V = chi2rnd(k, 1, n);

m = mean(V);     
d = var(V);      
s = std(V);      

fprintf('Математичне сподівання: %.4f\n', m);
fprintf('Дисперсія: %.4f\n', d);

figure;
histogram(V, 20, 'Normalization', 'pdf');
title('Гістограма χ²-розподілу (k = 10)');
xlabel('Значення');
ylabel('Щільність ймовірності');
grid on;

count_inside = sum(V >= (m - 3*s) & V <= (m + 3*s));
percent_inside = (count_inside / n) * 100;

fprintf('Значень у межах ±3σ: %d із %d (%.2f%%)\n', count_inside, n, percent_inside);
