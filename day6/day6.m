fid = fopen('day6_input.txt','rt');
fmt = repmat('%s',1,1);
M = textscan(fid,fmt,'Delimiter','\n');
fclose(fid);
C = [M{:}];
D = cell(484,1); % Change to 5 for test cases, 484 for problem input
r = 1;
for i = 1:numel(C)
    if(C{i} ~= "")
        D{r} = [D{r}, string(C{i})];
    else
        r=r+1;
    end
end

% Part 1
unique_rows = cellfun(@deep_unique,D,'UniformOutput',false);
sum_rows = cellfun(@numel,unique_rows);
sum(sum_rows,'all')

% Part 2
all_rows = cellfun(@deep_answer,D,'UniformOutput',false);
sum_rows = cellfun(@numel,all_rows);
sum(sum_rows,'all')

function u = deep_unique(r)
    u = unique(strcat(r{:}));
end

function a = deep_answer(r)
    a = mintersect(r{:});
end