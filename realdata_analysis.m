clear all
slug100 = readmatrix("slug100_new.txt");
slug101 = readmatrix("slug101_new.txt");
slug102 = readmatrix("slug102_new.txt");
slug103 = readmatrix("slug103_new.txt");
slug104 = readmatrix("slug104_new.txt");
slug105 = NaN(1, 9);
slug106 = readmatrix("slug106_new.txt");
slug107 = readmatrix("slug107_new.txt");
slug108 = readmatrix("slug108_new.txt");
slug109 = readmatrix("slug109_new.txt");
slug110 = readmatrix("slug110_new.txt");
slug111 = readmatrix("slug111_new.txt");
slug112 = readmatrix("slug112_new.txt");
slug113 = readmatrix("slug113_new.txt");
slug114 = readmatrix("slug114_new.txt");
slug115 = readmatrix("slug115_new.txt");
slug116 = readmatrix("slug116_new.txt");
slug117 = readmatrix("slug117_new.txt");
slug118 = readmatrix("slug118_new.txt");
slug119 = readmatrix("slug119_new.txt");
slug120 = readmatrix("slug120_new.txt");
slug121 = readmatrix("slug121_new.txt");
slug122 = readmatrix("slug122_new.txt");
slug123 = readmatrix("slug123_new.txt");
slug124 = readmatrix("slug124_new.txt");
slug125 = readmatrix("slug125_new.txt");
slug126 = readmatrix("slug126_new.txt");
slug127 = readmatrix("slug127_new.txt");
slug128 = readmatrix("slug128_new.txt");
slug129 = readmatrix("slug129_new.txt");
slug130 = readmatrix("slug130_new.txt");
slug131 = readmatrix("slug131_new.txt");
slug132 = readmatrix("slug132_new.txt");
slug133 = readmatrix("slug133_new.txt");
slug134 = readmatrix("slug134_new.txt");
slug135 = readmatrix("slug135_new.txt");
slug136 = readmatrix("slug136_new.txt");
slug137 = readmatrix("slug137_new.txt");
slug138 = readmatrix("slug138_new.txt");
slug139 = readmatrix("slug139_new.txt");
slug140 = readmatrix("slug140_new.txt");
slug141 = readmatrix("slug141_new.txt");
slug142 = readmatrix("slug142_new.txt");
slug143 = readmatrix("slug143_new.txt");
slug144 = readmatrix("slug144_new.txt");
slug145 = readmatrix("slug145_new.txt");
slug146 = readmatrix("slug146_new.txt");
slug147 = readmatrix("slug147_new.txt");
slug148 = readmatrix("slug148_new.txt");
slug149 = readmatrix("slug149_new.txt");
slug150 = readmatrix("slug150_new.txt");
slug151 = readmatrix("slug151_new.txt");
slug152 = readmatrix("slug152_new.txt");
slug153 = readmatrix("slug153_new.txt");
slug154 = readmatrix("slug154_new.txt");
slug155 = readmatrix("slug155_new.txt");
slug156 = readmatrix("slug156_new.txt");
slug157 = readmatrix("slug157_new.txt");
slug158 = readmatrix("slug158_new.txt");
slug159 = readmatrix("slug159_new.txt");
slug160 = readmatrix("slug160_new.txt");
slug161 = readmatrix("slug161_new.txt");
slug162 = readmatrix("slug162_new.txt");
slug163 = readmatrix("slug163_new.txt");
slug164 = readmatrix("slug164_new.txt");
slug165 = readmatrix("slug165_new.txt");
slug166 = readmatrix("slug166_new.txt");
slug167 = readmatrix("slug167_new.txt");
slug168 = readmatrix("slug168_new.txt");
slug169 = readmatrix("slug169_new.txt");
slug170 = readmatrix("slug170_new.txt");
slug171 = readmatrix("slug171_new.txt");
slug172 = readmatrix("slug172_new.txt");
slug173 = readmatrix("slug173_new.txt");
slug174 = readmatrix("slug174_new.txt");
slug175 = readmatrix("slug175_new.txt");
slug176 = readmatrix("slug176_new.txt");
slug177 = readmatrix("slug177_new.txt");
slug178 = readmatrix("slug178_new.txt");
slug179 = readmatrix("slug179_new.txt");
slug180 = readmatrix("slug180_new.txt");
slug181 = readmatrix("slug181_new.txt");
slug182 = readmatrix("slug182_new.txt");
slug183 = readmatrix("slug183_new.txt");
slug184 = readmatrix("slug184_new.txt");
slug185 = readmatrix("slug185_new.txt");

means = zeros(86, 7);
stds = zeros(86, 7);

allslugs = {slug100; slug101; slug102; slug103; slug104; ...
    slug105; slug106; slug107; slug108; slug109; ...
    slug110; slug111; slug112; slug113; slug114; ...
    slug115; slug116; slug117; slug118; slug119; ...
    slug120; slug121; slug122; slug123; slug124; ...
    slug125; slug126; slug127; slug128; slug129; ...
    slug130; slug131; slug132; slug133; slug134; ...
    slug135; slug136; slug137; slug138; slug139; ...
    slug140; slug141; slug142; slug143; slug144; ...
    slug145; slug146; slug147; slug148; slug149; ...
    slug150; slug151; slug152; slug153; slug154; ...
    slug155; slug156; slug157; slug158; slug159; ...
    slug160; slug161; slug162; slug163; slug164; ...
    slug165; slug166; slug167; slug168; slug169; ...
    slug170; slug171; slug172; slug173; slug174; ...
    slug175; slug176; slug177; slug178; slug179; ...
    slug180; slug181; slug182; slug183; slug184; ...
    slug185; };
tune1_slugs = [100:104];
tune2_slugs = [106:108, 118:121, 133:134];
tune3_slugs = [109:117];
tune4_slugs = [122:133];
tune5_slugs = [135:185];
tune1_vals = NaN(1, 6);
tune2_vals = NaN(1, 6);
tune3_vals = NaN(1, 6);
tune4_vals = NaN(1, 6);
tune5_vals = NaN(1, 6);
for num=1:86
    slugnum = num+99;
    nowslug = allslugs{num};
    means(num, 1) = slugnum;
    means(num, 2:7) = mean(nowslug(:, 3:8), 1);
    stds(num, 1) = slugnum;
    stds(num, 2:7) = std(nowslug(:, 3:8), 0, 1);
    if ismember(slugnum, tune1_slugs)
        tune1_vals = [tune1_vals; nowslug(:, 3:8)];
    elseif ismember(slugnum, tune2_slugs)
        tune2_vals = [tune2_vals; nowslug(:, 3:8)];
    elseif ismember(slugnum, tune3_slugs)
        tune3_vals = [tune3_vals; nowslug(:, 3:8)];
    elseif ismember(slugnum, tune4_slugs)
        tune4_vals = [tune4_vals; nowslug(:, 3:8)];
    elseif ismember(slugnum, tune5_slugs)
        tune5_vals = [tune5_vals; nowslug(:, 3:8)];
    end
end

slugs = means(:, 1);
means_13 = means(:, 2);
means_46 = means(:, 6);
std_13 = stds(:, 2);
std_46 = stds(:, 6);

%Split means and stdevs by the beam tune
means_tune1_13 = means_13(1:5);
means_tune2_13 = means_13([7:9 19:22 34:35]);
means_tune3_13 = means_13(10:18);
means_tune4_13 = means_13(23:34);
means_tune5_13 = means_13(36:86);

stds_tune1_13 = std_13([1:5]);
stds_tune2_13 = std_13([7:9 19:22 34:35]);
stds_tune3_13 = std_13(10:18);
stds_tune4_13 = std_13(23:34);
stds_tune5_13 = std_13(36:86);

means_tune1_46 = means_46(1:5);
means_tune2_46 = means_46([7:9 19:22 34:35]);
means_tune3_46 = means_46(10:18);
means_tune4_46 = means_46(23:34);
means_tune5_46 = means_46(36:86);

stds_tune1_46 = std_46([1:5]);
stds_tune2_46 = std_46([7:9 19:22 34:35]);
stds_tune3_46 = std_46(10:18);
stds_tune4_46 = std_46(23:34);
stds_tune5_46 = std_46(36:86);


%find means and stdevs by beam tune
mean_tunes_13 = zeros(5, 1);
std_tunes_13 = zeros(5, 1);
mean_tunes_46 = zeros(5, 1);
std_tunes_46 = zeros(5, 1);

mean_tunes_13(1) = mean(tune1_vals(2:end, 1));
std_tunes_13(1) = std(tune1_vals(2:end, 1));
mean_tunes_13(2) = mean(tune2_vals(2:end, 1));
std_tunes_13(2) = std(tune2_vals(2:end, 1));
mean_tunes_13(3) = mean(tune3_vals(2:end, 1));
std_tunes_13(3) = std(tune3_vals(2:end, 1));
mean_tunes_13(4) = mean(tune4_vals(2:end, 1));
std_tunes_13(4) = std(tune4_vals(2:end, 1));
mean_tunes_13(5) = mean(tune5_vals(2:end, 1));
std_tunes_13(5) = std(tune5_vals(2:end, 1));

mean_tunes_46(1) = mean(tune1_vals(2:end, 5));
std_tunes_46(1) = std(tune1_vals(2:end, 5));
mean_tunes_46(2) = mean(tune2_vals(2:end, 5));
std_tunes_46(2) = std(tune2_vals(2:end, 5));
mean_tunes_46(3) = mean(tune3_vals(2:end, 5));
std_tunes_46(3) = std(tune3_vals(2:end, 5));
mean_tunes_46(4) = mean(tune4_vals(2:end, 5));
std_tunes_46(4) = std(tune4_vals(2:end, 5));
mean_tunes_46(5) = mean(tune5_vals(2:end, 5));
std_tunes_46(5) = std(tune5_vals(2:end, 5));

%add elegant-generated values 
tune_list = [1; 2; 3; 4; 5];
%elegant_13 = [-0.155; -0.151; -0.731; -0.269; -0.134]; %original (wrong) values
elegant_13 = [0.1342; 0.1314; 0.4223; 0.2123; 0.1184]; %inverted values
%elegant_46 = [-0.388; 0.661; 0.246; 0.377; 0.178]; %original (wrong)
elegant_46 = [0.2794; -1.9527; -0.3265; -0.6053; -0.2166]; %revised
%make figures by slug
figure;
hold on;
errorbar(tune1_slugs, means_tune1_13, stds_tune1_13, '*');
errorbar(tune2_slugs, means_tune2_13, stds_tune2_13, '*');
errorbar(tune3_slugs, means_tune3_13, stds_tune3_13, '*');
errorbar(tune4_slugs, means_tune4_13, stds_tune4_13, '*');
errorbar(tune5_slugs, means_tune5_13, stds_tune5_13, '*');
legend("Tune 1", "Tune 2", "Tune 3", "Tune 4", "Tune 5");
xlabel("Slug number");
ylabel("\alpha_{X13}");
title("Value of \alpha_{X13} versus slug number");
hold off;

figure;
hold on;
errorbar(tune1_slugs, means_tune1_46, stds_tune1_46, '*');
errorbar(tune2_slugs, means_tune2_46, stds_tune2_46, '*');
errorbar(tune3_slugs, means_tune3_46, stds_tune3_46, '*');
errorbar(tune4_slugs, means_tune4_46, stds_tune4_46, '*');
errorbar(tune5_slugs, means_tune5_46, stds_tune5_46, '*');
legend("Tune 1", "Tune 2", "Tune 3", "Tune 4", "Tune 5");
xlabel("Slug number");
ylabel("\alpha_{Y46}");
title("Value of \alpha_{Y46} versus slug number");
hold off;

%make figures by tune
figure;
errorbar(tune_list, mean_tunes_13, std_tunes_13, 'b.');
hold on;
plot(tune_list, elegant_13, 'r*');
xlabel("Tune number");
ylabel("\alpha_{X13}");
xlim([0 6]);
ylim([0 0.45]);
legend("Experimental value", "elegant prediction");
title("Value of \alpha_{X13} versus beam tune number");
hold off;

figure;
errorbar(tune_list, mean_tunes_46, std_tunes_46, 'b.');
hold on;
plot(tune_list, elegant_46, 'r*');
xlabel("Tune number");
ylabel("\alpha_{Y46}");
xlim([0 6]);
%ylim([-3 5]);
legend("Experimental value", "elegant prediction");
title("Value of \alpha_{Y46} versus beam tune number");
hold off;






