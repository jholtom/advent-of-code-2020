A = importdata('day11_input.txt');
B = cell(10); % Day input is 98
for i = 1:numel(A)
    k = split(A{i},'');
    k = k(2:end-1);
    for j = 1:numel(k)
        B{i,j} = k{j};
    end
end

same = 0;
rounds = 0;
while ~same
C = cell(size(B));
for i = 1:size(B,1)
    for j = 1:size(B,2)
        [adj_occupied,seat_occupied] = check_adjacency(B,i,j);
        % If empty, and no occupied next to it, seat becomes occupied
        if seat_occupied == 0 && (adj_occupied == 0)
            C{i,j} = '#';
        elseif seat_occupied == 1 && (adj_occupied >= 4)
            % If seat occupied and >=4 seats adjacent occupied, seat becomes empty
            C{i,j} = 'L';
        else
            % -1 means its floor, do nothing
            % Otherwise, no state change
            C{i,j} = B{i,j};
        end
    end
end
if sum(cellfun(@strcmp,B,C),'all') == numel(C)
    same = 1;
end
B = C;
rounds = rounds + 1;
end

occupied = sum(count(B,'#'),'all')

function [c,oc] = check_adjacency(mat,i,j)
al = i-1;
ar = i+1;
au = j-1;
ad = j+1;
if al < 1
    al = 1;
end
if ar > size(mat,1)
    ar = size(mat,1);
end
if au < 1
    au = 1;
end
if ad > size(mat,2)
    ad = size(mat,2);
end
z = mat(al:ar,au:ad);
k = mat{i,j};
if k == '.'
    c = -1;
    oc = 0;
    return;
end
a = [z{:}];
c = count(a,'#');
if k == 'L'
    oc = 0;
elseif k == '#'
    oc = 1;
    c = c - 1;
end
end