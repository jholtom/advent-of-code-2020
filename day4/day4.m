fid = fopen('day4_input.txt','rt');
fmt = repmat('%s',1,1);
M = textscan(fid,fmt,'Delimiter',' ');
fclose(fid);
C = [M{:}];
D = cell(260,1); % Change to 4 for test cases
r = 1;
for i = 1:numel(C)
    if(C{i} ~= "")
        D{r} = [D{r}, string(C{i})];
    else
        r=r+1;
    end
end

% Part 1
val_cnt = 0;
for i =1:size(D,1)
    val_cnt = val_cnt + is_valid(D(i,:));
end
% Number of valid passports
val_cnt

% Part 2
val_cnt = 0;
for i =1:size(D,1)
    val_cnt = val_cnt + is_valid_value(D(i,:));
end
% Number of valid passports with values
val_cnt

function val = is_valid(cell_arr)
fields= ["byr","iyr","eyr","hgt","hcl","ecl","pid"];
num_fields = contains(cell_arr{:},fields);
if sum(num_fields) >= 7
    val = 1;
else
    val = 0;
end
end

function val = is_valid_value(cell_arr)
fields= ["byr","iyr","eyr","hgt","hcl","ecl","pid"];
ecl_values = ["amb","blu","brn","gry","grn","hzl","oth"];
test_arr = cell_arr{:};
num_fields = contains(test_arr,fields);
if sum(num_fields) >= 7
    % Now since it is a valid passport by field, lets solve fo valid
    % passport by value
    % Check BYR
    byr_mask = contains(test_arr,'byr');
    byr_tuple = strsplit(test_arr(byr_mask),':');
    byr = str2double(byr_tuple(2));
    byr_val = (byr >= 1920) && (byr <= 2002);
    % Check IYR
    iyr_mask = contains(test_arr,'iyr');
    iyr_tuple = strsplit(test_arr(iyr_mask),':');
    iyr = str2double(iyr_tuple(2));
    iyr_val = (iyr >= 2010) && (iyr <= 2020);
    % Check EYR
    eyr_mask = contains(test_arr,'eyr');
    eyr_tuple = strsplit(test_arr(eyr_mask),':');
    eyr = str2double(eyr_tuple(2));
    eyr_val = (eyr >= 2020) && (eyr <= 2030);
    % Check HGT
    hgt_mask = contains(test_arr,'hgt');
    hgt_tuple = strsplit(test_arr(hgt_mask),':');
    if contains(hgt_tuple(2),'cm')
        hgt_inner = str2double(erase(hgt_tuple(2),'cm'));
        hgt_val = (hgt_inner >= 150) && (hgt_inner <= 193);
    elseif contains(hgt_tuple(2),'in')
        hgt_inner = str2double(erase(hgt_tuple(2),'in'));
        hgt_val = (hgt_inner >= 59) && (hgt_inner <= 76);
    else
        hgt_val = 0;
    end    
    % Check HCL
    hcl_mask = contains(test_arr,'hcl');
    hcl_tuple = strsplit(test_arr(hcl_mask),':');
    hcl_val = regexp(hcl_tuple(2),'^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$');
    if hcl_val >= 1
        hcl_val = true;
    else
        hcl_val = false;
    end
    % Check ECL
    ecl_mask = contains(test_arr,'ecl');
    ecl_tuple = strsplit(test_arr(ecl_mask),':');
    ecl_val = matches(ecl_tuple(2),ecl_values);    
    % Check PID
    pid_mask = contains(test_arr,'pid');
    pid_tuple = strsplit(test_arr(pid_mask),':');
    pid_val = (numel(char(pid_tuple(2))) == 9);
    
    % Determine if they are all true!
    val = byr_val && iyr_val && eyr_val && hgt_val && hcl_val && ecl_val && pid_val;
else
    val = 0;
end
end