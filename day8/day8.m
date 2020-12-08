A = importdata('day8_test_input.txt');
B = {A.textdata,A.data};

ptr = 1;
halt = 0;

seen = zeros(size(A.textdata));

[accumulator,~] = run_case(B);

% Part 1
fprintf("Accumulator value is: %d\n",accumulator);

% Part 2

% [k,halt] = run_case(B)



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