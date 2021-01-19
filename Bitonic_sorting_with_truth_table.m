function [arr, truth_table] = Bitonic_sorting_with_truth_table(in)
    %Bitonic_sorting - Description
    %
    % Syntax: arr = Bitonic_sorting(in)
    %
    % Long description
    len = size(in, 2);


    [arr, truth_table] = Bitonic_sort(in, 1, size(in, 2), len);
end

function [arr, truth_table] = Bitonic_sort(in, left, right, total_length)
    len = right - left + 1;
    
    if len == 2
        truth_table = zeros(2, 2);
        truth_table(1, :) = in(left : right);
        arr = compare(in, left, right);
        arr = arr(left : right);
        truth_table(2, :) = arr(:);
        return;
    end
    
    [left_arr, left_truth_table] = Bitonic_sorting_with_truth_table(in(left : left + len / 2 - 1));
    
    [right_arr, right_truth_table] = Bitonic_sorting_with_truth_table(fliplr(in(left + len / 2 : right)));
    
    arr = [left_arr, fliplr(right_arr)];
    
    truth_table = [left_truth_table, fliplr(right_truth_table)];

    [arr, truth_table] = merge(arr, 1, len, total_length, size(truth_table, 1) + 1, truth_table);
    % TODO: truth_table here
end

function [in, truth_table] = merge(in, left, right, total_length, dim, truth_table)
    if (right == left)
        return;
    end

    len = right - left + 1;
    step = len / 2;
    for i = left:1:right - step
        in = compare(in, i, i + step);
    end

    truth_table(dim, left : right) = in(left : right);

    [in, truth_table] = merge(in, left, left + len / 2 - 1, total_length, dim + 1, truth_table);
    [in, truth_table] = merge(in, left + len / 2, right, total_length, dim + 1, truth_table);

end

function in = compare(in, a, b)
    if in(a) < in(b)
        t = in(a);
        in(a) = in(b);
        in(b) = t;
    end
end


