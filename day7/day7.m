A = importdata('day7_input.txt');

rules = struct;

for i = 1:numel(A)
    r = strsplit(A{i},' ');
    bag_name = strcat(r{1},r{2});
    if mod(numel(r),4) ~= 0
        rules.(bag_name) = 0;
    else
        s = struct;
        re = (numel(r)-4)/4;
        for k = 1:re
            ind = k*4+1;
            num_in = str2double(r{ind});
            bg_in = strcat(r{ind+1},r{ind+2});
            s.(bg_in) = num_in;
        end
        rules.(bag_name) = s;
    end
end

search = 'shinygold';
count = 0;

f = fieldnames(rules);
for i = 1:numel(f)
    m = find_container(rules,f{i},search,0);
    count = m + count;
end

% Part 1
% How many bag colors can eventually contain at least one shiny gold bag?
count

% Part 2
% How many bags are required inside a single shiny gold bag?


function m = find_container(ruleset,field,search_str,m)
k = ruleset.(field);
if class(k) ~= 'struct'
    return;
else
    c = fieldnames(k);
    if sum(contains(c,search_str)) >= 1
        m = 1;
        return
    else
        for i = 1:numel(c)
            m = find_container(ruleset,c{i},search_str,m);
        end
    end
end
end