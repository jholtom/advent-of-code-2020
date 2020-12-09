A = load('day9_input.txt');

depth = 25;
ptr = 1+depth;
fail = 0;
% Part 1
while ~fail
    t = A(ptr);
    p = nchoosek(A(ptr-depth:ptr),2);
    s = sum(p,2);
    if ismember(t,s)
        ptr = ptr+1;
    else
        fail = 1;
        t
    end
end

% Part 2
found = 0;
ptr = 1;
r = 2;
while ~found
    k = sum(A(ptr:ptr+r),'all');
    if k == t
        found = 1;
        rn = A(ptr:ptr+r);
        ew = min(rn) + max(rn)
    elseif k > t
        ptr = ptr+1;
        r = 2;
    else
        r = r+1;
    end
end