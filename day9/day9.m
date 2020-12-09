A = load('day9_input.txt');

depth = 25;
ptr = 1+depth;
fail = 0;
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