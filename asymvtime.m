mean3523 = fileread("mean3523.txt");
byline = regexp(mean3523, '\n', 'split');
filebyfield = regexp(byline, ' ', 'split');
maxfields = 4;
fieldpattern = repmat({[]}, 1, maxfields);
firstN = @(S,N) S(1:N);
filebyfield = cellfun(@(S) firstN([S,fieldpattern], maxfields), filebyfield, 'Uniform', 0);
fieldarray = vertcat(filebyfield{:});
run3523 = str2double(fieldarray);

mean3525 = fileread("mean3525.txt");
byline = regexp(mean3525, '\n', 'split');
filebyfield = regexp(byline, ' ', 'split');
maxfields = 4;
fieldpattern = repmat({[]}, 1, maxfields);
firstN = @(S,N) S(1:N);
filebyfield = cellfun(@(S) firstN([S,fieldpattern], maxfields), filebyfield, 'Uniform', 0);
fieldarray = vertcat(filebyfield{:});
run3525 = str2double(fieldarray);

mean3553 = fileread("mean3553.txt");
byline = regexp(mean3553, '\n', 'split');
filebyfield = regexp(byline, ' ', 'split');
maxfields = 4;
fieldpattern = repmat({[]}, 1, maxfields);
firstN = @(S,N) S(1:N);
filebyfield = cellfun(@(S) firstN([S,fieldpattern], maxfields), filebyfield, 'Uniform', 0);
fieldarray = vertcat(filebyfield{:});
run3553 = str2double(fieldarray);

mean3557 = fileread("mean3557.txt");
byline = regexp(mean3557, '\n', 'split');
filebyfield = regexp(byline, ' ', 'split');
maxfields = 4;
fieldpattern = repmat({[]}, 1, maxfields);
firstN = @(S,N) S(1:N);
filebyfield = cellfun(@(S) firstN([S,fieldpattern], maxfields), filebyfield, 'Uniform', 0);
fieldarray = vertcat(filebyfield{:});
run3557 = str2double(fieldarray);

mean3558 = fileread("mean3558.txt");
byline = regexp(mean3558, '\n', 'split');
filebyfield = regexp(byline, ' ', 'split');
maxfields = 4;
fieldpattern = repmat({[]}, 1, maxfields);
firstN = @(S,N) S(1:N);
filebyfield = cellfun(@(S) firstN([S,fieldpattern], maxfields), filebyfield, 'Uniform', 0);
fieldarray = vertcat(filebyfield{:});
run3558 = str2double(fieldarray);

mean3569 = fileread("mean3569.txt");
byline = regexp(mean3569, '\n', 'split');
filebyfield = regexp(byline, ' ', 'split');
maxfields = 4;
fieldpattern = repmat({[]}, 1, maxfields);
firstN = @(S,N) S(1:N);
filebyfield = cellfun(@(S) firstN([S,fieldpattern], maxfields), filebyfield, 'Uniform', 0);
fieldarray = vertcat(filebyfield{:});
run3569 = str2double(fieldarray);

%get data into usable format
pol3523 = run3523(:, 2);
pol3525 = run3525(:, 2);
pol3553 = run3553(:, 2);
pol3557 = run3557(:, 2);
pol3558 = run3558(:, 2);
pol3569 = run3569(:, 2);
mean3523 = run3523(:, 3);
mean3525 = run3525(:, 3);
mean3553 = run3553(:, 3);
mean3557 = run3557(:, 3);
mean3558 = run3558(:, 3);
mean3569 = run3569(:, 3);
err3523 = run3523(:, 4);
err3525 = run3525(:, 4);
err3553 = run3553(:, 4);
err3557 = run3557(:, 4);
err3558 = run3558(:, 4);
err3569 = run3569(:, 4);

runs = [3523, 3525, 3553, 3557, 3558, 3569];
means = [mean3523, mean3525, mean3553, mean3557, mean3558, mean3569];
err = [err3523, err3525, err3553, err3557, err3558, err3569];
leg = ["P0C0", "P0C1", "P1C0", "P1C1"];
%plot all runs on x axis, y axis is mean, error bars 
%bcm_an_us (first 4 numbers in each row)
figure;
for i=1:4
  errorbar(runs, means(i, :), err(i, :), "o");
  hold on;
end
legend(leg);
xlabel("Run number");
ylabel("Mean");
title("Mean measurement for an us");
hold off;

%bcm_an_ds (rows 5-8)
figure;
for i=5:8
  errorbar(runs, means(i, :), err(i, :), "o");
  hold on;
end
legend(leg);
xlabel("Run number");
ylabel("Mean");
title("Mean measurement for an ds");
hold off;

%bcm0l02 (rows 9-12)
figure;
for i=9:12
  errorbar(runs, means(i, :), err(i, :), "o");
  hold on;
end
legend(leg);
xlabel("Run number");
ylabel("Mean");
title("Mean measurement for bcm0l02");
hold off;

%bcm_dg_us (rows 13-16)
figure;
for i=13:16
  errorbar(runs, means(i, :), err(i, :), "o");
  hold on;
end
legend(leg);
xlabel("Run number");
ylabel("Mean");
title("Mean measurement for dg us");
hold off;

%bcm_dg_ds (rows 17-20)
figure;
for i=17:20
  errorbar(runs, means(i, :), err(i, :), "o");
  hold on;
end
legend(leg);
xlabel("Run number");
ylabel("Mean");
title("Mean measurement for dg ds");
hold off;


%{
%plot all standard deviations for single differences
figure;
plot(run, err3523, "o", run, an_ds_std, "*", ...
    run, dg_us_std, "+", run, dg_ds_std, "s");
xlim([3398, 3407]);
legend("an us", "an ds", "dg us", "dg ds");
legend("Location", "southeast");
title("Standard deviations for all BCMs");
xlabel("Run number");
ylabel("Standard deviation");
hold off;

%}