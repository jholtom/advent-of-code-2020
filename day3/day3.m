% Setup data structure
A = importdata('day3_input.txt');
B = cellfun(@num2cell,A,'UniformOutput',false);
C = vertcat(B{:});
D = repmat(C,1,ceil((size(A,1)*3)/size(C,2)));
E = cell2mat(D);

% Part 1
x_ind = 1:3:size(A,1)*3;
y_ind = 1:1:size(A,1);
ind = sub2ind(size(E),y_ind,x_ind);
F = E(ind);
% Count encountered trees
tree_cnt = sum(F=='#','all')

% Part 2, repeat for more slopes and multiply together
right = [1,3,5,7,1];
down = [1,1,1,1,2];
tree_cnt = [];
for i = 1:numel(right)
    D = repmat(C,1,ceil((size(A,1)*right(i))/size(C,2)));
    E = cell2mat(D);
    x_ind = 1:right(i):ceil(size(A,1)*right(i)/down(i));
    y_ind = 1:down(i):size(A,1);
    ind = sub2ind(size(E),y_ind,x_ind);
    F = E(ind);
    % Count encountered trees
    tree_cnt(i) = sum(F=='#','all');
end
% Product of encountered trees
tree_prod = prod(tree_cnt)