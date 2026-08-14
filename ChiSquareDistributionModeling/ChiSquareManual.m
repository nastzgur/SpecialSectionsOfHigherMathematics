n = 1000;
V1 = zeros(1, n);

for i = 1:5
    V = randn(1, n);
    V1 = V1 + V.^2;   
end

m = mean(V1)             
d = var(V1)            

figure;
histogram(V1, 20, 'Normalization', 'pdf');
title('Гістограма хі-квадрат розподілу (k=5)');
xlabel('Значення');
ylabel('Ймовірність');
grid on;
