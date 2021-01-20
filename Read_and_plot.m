clear;
clc;

n = 16;

load(strcat('Truth_table_', num2str(n), '.mat'));


len = size(truth_table, 3);

max_number = 200;
counts = zeros(n + 1, max_number);

% before = truth_table(:,:,5);
% after = truth_table(:,:,7);

% arr = before ~= after
% arr(1,:)
% sum(arr(1,:))

for i = 1:len
    disp(i);
    for j = 1:len
        before = truth_table(:,:,i);
        after = truth_table(:,:,j);

        arr = before ~= after;
        input_total = sum(arr(1,:));
        total = sum(arr, 'all') - input_total;
        counts(input_total + 1, total + 1) = counts(input_total + 1, total + 1) + 1;
    end
end

save(strcat('Counts_', num2str(n), '.mat'), 'counts');

x = 0:max_number - 1;
hold on;
for i = 1:n + 1
    plot(x, counts(i, :));
end