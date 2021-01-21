clf;
clear;
clc;

n = 16;
xLen = 3;
yLen = 6;

load(strcat('counts_', num2str(n)));

total_max = 1;
len = size(counts, 2);
% x = 0 : len - 1;
figure(1);
for i = 1:n + 1
    local_max = 1;
    for j = 1:len
        if counts(i, j) ~= 0
            local_max = j;
        end
    end
    if local_max > total_max
        total_max = local_max;
    end
    x = 0 : local_max - 1;
    
    subplot(xLen, yLen, i + 1);
    plot(x, counts(i, 1:local_max));
    
    title(strcat(num2str(i - 1), ' bit switch'));
    xlabel('num of wires flipped');
    ylabel('occurence');
end

x = 0 : total_max - 1;
subplot(xLen, yLen, 1);
hold on;
for i = 1:n + 1
    plot(x, counts(i, 1:total_max), 'Displayname', strcat(num2str(i - 1), ' switch'));
end
title('total');
hold off;
lgd = legend;
lgd.NumColumns = 2;


figure(2);
hold on;
for i = 1:n + 1
    plot(x, counts(i, 1:total_max), 'Displayname', strcat(num2str(i - 1), ' switch'));
end
title('total');
hold off;
lgd = legend;
lgd.NumColumns = 2;