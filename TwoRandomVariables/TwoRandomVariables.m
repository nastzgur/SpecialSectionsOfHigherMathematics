clear;
N = 1000;
k = 3;
X = poissrnd(10, 1, N);
Y = poissrnd(3, 1, N);
figure(1);
plot(X);
title('Графік випадкової величини X');

figure(2);
plot(Y);
title('Графік випадкової величини Y');

figure(3);
[a, b] = hist(X, 20);
bar(b, a/N);
title('Гістограма розподілу X');

figure(4);
[a, b] = hist(Y, 20);
bar(b, a/N);
title('Гістограма розподілу Y');
mx = mean(X)
dx = mean((X - mx).^2)
skox = sqrt(dx)

my = mean(Y)
dy = mean((Y - my).^2)
skoy = sqrt(dy)

Rxy = mean((X - mx) .* (Y - my))
rxy = Rxy / (skox * skoy)
Y = k * X;

my = mean(Y)
dy = mean((Y - my).^2)
skoy = sqrt(dy)

figure(5);
plot(Y);
title('Графік випадкової величини Y = k*X');

figure(6);
[a, b] = hist(Y, 20);
bar(b, a/N);
title('Гістограма розподілу Y = k*X');

Rxy = mean((X - mx) .* (Y - my))
rxy = Rxy / (skox * skoy)
