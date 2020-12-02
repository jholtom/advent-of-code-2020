M = readtable('day2_input.txt');

res = rowfun(@is_pass_valid,M);
res_sum_p1 = sum(logical(res.Var1))

res2 = rowfun(@is_pass_valid_part2,M);
res_sum_p2 = sum(logical(res2.Var1))

function err = is_pass_valid(limits,char,password)
    repeat_range = strsplit(limits{1},'-');
    low = str2double(repeat_range{1});
    high = str2double(repeat_range{2});
    char_col = strsplit(char{1},':');
    cnt_char = char_col{1};
    k = count(password{1},cnt_char);
    err = (k >= low) && (k <= high);
end

function err = is_pass_valid_part2(limits,char,password)
    repeat_range = strsplit(limits{1},'-');
    pos1 = str2double(repeat_range{1});
    pos2 = str2double(repeat_range{2});
    char_col = strsplit(char{1},':');
    cnt_char = char_col{1};
    pw = password{1};
    pos1_chk = cnt_char == pw(pos1);
    pos2_chk = cnt_char == pw(pos2);
    err = xor(pos1_chk,pos2_chk);
end