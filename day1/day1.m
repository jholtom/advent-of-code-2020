load day1_input.txt;
res2 = nchoosek(day1_input,2);
S2 = sum(res2,2);
two_nums = res2(S2 == 2020,:);
prod(two_nums)

res3 = nchoosek(day1_input,3);
S3 = sum(res3,2);
three_nums = res3(S3 == 2020,:);
prod(three_nums)