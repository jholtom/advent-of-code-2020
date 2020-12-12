A = importdata('day11_test_input.txt');
B = cell(10); % Day input is 98
for i = 1:numel(A)
    k = split(A{i},'');
    k = k(2:end-1);
    for j = 1:numel(k)
        B{i,j} = k(j);
    end
end

C = cell(size(B));

% If empty, and no occupied next to it, seat becomes occupied
check_adjacency(B,2,2);

% If seat occupied and >=4 seats adjacent occupied, seat becomes empty


% Otherwise, no state change

function c = check_adjacency(mat,i,j)
c = 0;
[ul,up,ur,l,k,r,dl,d,dr] = mat{i-1:i+1,j-1:j+1};
a = [ul{:},up{:},ur{:},l{:},k{:},r{:},dl{:},d{:},dr{:}]

end