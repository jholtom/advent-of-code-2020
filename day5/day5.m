M = importdata('day5_input.txt');

[seat_row,seat_col] = cellfun(@eval_bsp,M);

% Part 1
seat_id = seat_row*8 + seat_col;
max(seat_id)

% Part2
plane_ids = min(seat_id):max(seat_id);
lia = ismember(plane_ids,seat_id);
% My seat id
plane_ids(lia == 0)

function [r,c] = eval_bsp(char_arr)
plane_rows = 0:1:127;
plane_cols = 0:1:7;
curr_row = plane_rows;
curr_col = plane_cols;
i = 1;
curr_char = char_arr(i);
while (curr_char ~= 'L') && (curr_char ~= 'R')
    if curr_char == 'F'
        curr_row = curr_row(1:end/2);
    elseif curr_char == 'B'
        curr_row = curr_row(end/2+1:end);
    end
    i = i + 1;
    curr_char = char_arr(i);
end
r = curr_row;
while (i <= 10)
    curr_char = char_arr(i);
    if curr_char == 'L'
        curr_col = curr_col(1:end/2);
    elseif curr_char == 'R'
        curr_col = curr_col(end/2+1:end);
    end
    i = i + 1;
end
c = curr_col;
end