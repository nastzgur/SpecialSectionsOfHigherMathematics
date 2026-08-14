n = 1000;
V1 = zeros(1, n);
for i = 1:5
    V = randn(1, n);
    V1 = V1 + V.^2;
end

m = mean(V1);
s = std(V1); 

figure;
histogram(V1, 20, 'Normalization', 'pdf');
title('Гістограма χ²-розподілу (k = 5)');
xlabel('Значення');
ylabel('Щільність ймовірності');
grid on;

count_inside = sum(V1 >= (m - 3*s) & V1 <= (m + 3*s));
percent_inside = (count_inside / n) * 100;

fprintf('Кількість значень у межах ±3σ: %d (%.2f%%)\n', count_inside, percent_inside);
