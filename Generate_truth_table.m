n = 16;

arr = zeros(1, n);
truth_table = [];
[~, truth_table, ~] = helper(arr, 1, n, truth_table, 1);
truth_table
save(strcat('Truth_table_', num2str(n), '.mat'), 'truth_table');

function [arr, truth_table, i] = helper(arr, index, n, truth_table, i)
    if (index > n)
        % TODO: generate one line of truth table
        [~, ret] = Bitonic_sorting_with_truth_table(arr);
        truth_table(:,:, i) = ret;
        i = i + 1;
        return;
    end

    arr(index) = 1;
    [arr, truth_table, i] = helper(arr, index + 1, n, truth_table, i);
    arr(index) = 0;
    [arr, truth_table, i] = helper(arr, index + 1, n, truth_table, i);
end