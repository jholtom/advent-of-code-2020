clear; clc; close all;
A = load('day10_input.txt');
my_joltage = max(A)+3;
B = sort(A);
C = [0; B; my_joltage];
D = diff(C);

% Part 1
[E,~,ix] = unique(D);
F = accumarray(ix,1).';
fprintf("%d differences of %d jolts\n",F(1),E(1));
fprintf("%d differences of %d jolts\n",F(2),E(2));
prod(F)

% Part 2
% Find number of possible arrangements
% Build adjacency matrix
A = [0; A];
ADJ = zeros(max(A)+1,max(A)+1);
for i = 0:max(A)
    for j = 0:max(A)
        if ismember(i,A) && ismember(j,A)
            k = j-i;
            if (k < 4) && (k > 0)
                ADJ(i+1,j+1) = 1;
            end
        end
    end
end
% S = (I-ADJ)^1
S = inv(eye(size(ADJ))-ADJ);
% Solution S(1,end)
S(1,end)