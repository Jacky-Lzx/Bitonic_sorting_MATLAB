function arr = Bitonic_sorting(in)
    %Bitonic_sorting - Description
    %
    % Syntax: arr = Bitonic_sorting(in)
    %
    % Long description
        arr = Bitonic_sort(in, 1, size(in, 2));
    end

function arr = Bitonic_sort(in, left, right)
    len = right - left + 1;
    
    if len == 2
        arr = compare(in, left, right);
        arr = arr(left : right);
        return;
    end
    
    left_arr = Bitonic_sort(in, left, left + len / 2 - 1);
    
    right_arr = Bitonic_sort(in, left + len / 2, right);
    
    arr = [left_arr, fliplr(right_arr)];
    arr = merge(arr, 1, len);
end

function in = merge(in, left, right)
    if (right == left)
        return;
    end

    len = right - left + 1;
    step = len / 2;
    for i = left:1:right - step
        in = compare(in, i, i + step);
    end

    in = merge(in, left, left + len / 2 - 1);
    in = merge(in, left + len / 2, right);
end




function in = compare(in, a, b)
    if in(a) > in(b)
        t = in(a);
        in(a) = in(b);
        in(b) = t;
    end
end


