A = importdata('day12_input.txt');

northing = 0;
easting = 0;
curr_dir = 90; % East is 90 degrees

% Part 1
for i = 1:numel(A)
    action = A{i}(1);
    step = str2double(A{i}(2:end));
    switch action
        case 'N'
            northing = northing + step;
        case 'S'
            northing = northing - step;
        case 'E'
            easting = easting + step;
        case 'W'
            easting = easting - step;
        case 'L'
            curr_dir = mod(curr_dir - step,360);
        case 'R'
            curr_dir = mod(curr_dir + step,360);
        case 'F'
            switch curr_dir
                case 0
                    northing = northing+step;
                case 90
                    easting = easting+step;
                case 180
                    northing = northing - step;
                case 270
                    easting = easting - step;
            end
    end
end

manhattan_dist = abs(northing) + abs(easting)

% Part 2

wpn = 1;
wpe = 10;
northing = 0;
easting = 0;

for i = 1:numel(A)
    action = A{i}(1);
    step = str2double(A{i}(2:end));
    switch action
        case 'N'
            wpn = wpn + step;
        case 'S'
            wpn = wpn - step;
        case 'E'
            wpe = wpe + step;
        case 'W'
            wpe = wpe - step;
        case 'L'
            step = -step;
            R = [cosd(step) -sind(step); sind(step) cosd(step)];
            wp = R*[wpn; wpe];
            wpn = wp(1);
            wpe = wp(2);
        case 'R'
            R = [cosd(step) -sind(step); sind(step) cosd(step)];
            wp = R*[wpn; wpe];
            wpn = wp(1);
            wpe = wp(2);
        case 'F'
            northing = northing + step*wpn;
            easting = easting + step*wpe;
    end
end

manhattan_dist = abs(northing) + abs(easting)