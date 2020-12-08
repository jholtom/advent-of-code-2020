A = importdata('day8_input.txt');
B = {A.textdata,A.data};

[accumulator,~] = run_case(B);

% Part 1
fprintf("Accumulator value is: %d\n",accumulator);

% Part 2
permutations = {};
% Generate Permutations
for i = 1:numel(A.textdata)
    k = B;
    instruction = B{1}{i};
    switch instruction
        case 'nop'
            k{1}{i} = 'jmp';
        case 'jmp'
            k{1}{i} = 'nop';
    end
    permutations{i} = k;
end
for i = 1:numel(permutations)
    [k,halt] = run_case(permutations{i});
    if halt == 2
        fprintf("Accumulator value for normal halt: %d\n",k);
        break;
    end
end

function [a,halt] = run_case(in)
halt = 0;
a = 0;
ptr = 1;
seen = zeros(size(in{1}));
while ~halt
    if ptr > numel(in{1})
        halt = 2;
        break;
    end
    instruction = in{1}{ptr};
    if seen(ptr) == 1
        halt = 1;
        break;
    end
    switch instruction
        case 'nop'
            seen(ptr) = 1;
            ptr = ptr+1;
        case 'acc'
            seen(ptr) = 1;
            a = a + in{2}(ptr);
            ptr = ptr+1;
        case 'jmp'
            seen(ptr) = 1;
            ptr = ptr + in{2}(ptr);
    end
end
end