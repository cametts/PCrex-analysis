%% Calculates alphas and stores them in variable dets
clear all
num_bpms = 4;
bpm4a_pos = 1305.446;
bpm4e_pos = 1310.592;
bpm4a_in = 2427; %index of 4A 
bpm4e_in = 2453; %index of 4E 

all08H_1 = readmatrix("coil08H_CL_1.txt");
all08H_2 = readmatrix("coil08H_CL_2.txt");
all08H_3 = readmatrix("coil08H_CL_3.txt");
all08H_4 = readmatrix("coil08H_CL_4.txt");
all08H_5 = readmatrix("coil08H_CL_5.txt");
all08H_6 = readmatrix("coil08H_CL_6.txt");

all08V_1 = readmatrix("coil08V_CL_1.txt");
all08V_2 = readmatrix("coil08V_CL_2.txt");
all08V_3 = readmatrix("coil08V_CL_3.txt");
all08V_4 = readmatrix("coil08V_CL_4.txt");
all08V_5 = readmatrix("coil08V_CL_5.txt");
all08V_6 = readmatrix("coil08V_CL_6.txt");

all10H_1 = readmatrix("coil10H_CL_1.txt");
all10H_2 = readmatrix("coil10H_CL_2.txt");
all10H_3 = readmatrix("coil10H_CL_3.txt");
all10H_4 = readmatrix("coil10H_CL_4.txt");
all10H_5 = readmatrix("coil10H_CL_5.txt");
all10H_6 = readmatrix("coil10H_CL_6.txt");

all10V_1 = readmatrix("coil10V_CL_1.txt");
all10V_2 = readmatrix("coil10V_CL_2.txt");
all10V_3 = readmatrix("coil10V_CL_3.txt");
all10V_4 = readmatrix("coil10V_CL_4.txt");
all10V_5 = readmatrix("coil10V_CL_5.txt");
all10V_6 = readmatrix("coil10V_CL_6.txt");

all02H_1 = readmatrix("coil02H_CL_1.txt");
all02H_2 = readmatrix("coil02H_CL_2.txt");
all02H_3 = readmatrix("coil02H_CL_3.txt");
all02H_4 = readmatrix("coil02H_CL_4.txt");
all02H_5 = readmatrix("coil02H_CL_5.txt");
all02H_6 = readmatrix("coil02H_CL_6.txt");

all03V_1 = readmatrix("coil03V_CL_1.txt");
all03V_2 = readmatrix("coil03V_CL_2.txt");
all03V_3 = readmatrix("coil03V_CL_3.txt");
all03V_4 = readmatrix("coil03V_CL_4.txt");
all03V_5 = readmatrix("coil03V_CL_5.txt");
all03V_6 = readmatrix("coil03V_CL_6.txt");

all08Hx = [all08H_1(:, 2), all08H_2(:, 2), all08H_3(:, 2),...
    all08H_4(:, 2), all08H_5(:, 2), all08H_6(:, 2)];
all08Hy = [all08H_1(:, 3), all08H_2(:, 3), all08H_3(:, 3),...
    all08H_4(:, 3), all08H_5(:, 3), all08H_6(:, 3)];
all08Vx = [all08V_1(:, 2), all08V_2(:, 2), all08V_3(:, 2),...
    all08V_4(:, 2), all08V_5(:, 2), all08V_6(:, 2)];
all08Vy = [all08V_1(:, 3), all08V_2(:, 3), all08V_3(:, 3),...
    all08V_4(:, 3), all08V_5(:, 3), all08V_6(:, 3)];
all10Hx = [all10H_1(:, 2), all10H_2(:, 2), all10H_3(:, 2),...
    all10H_4(:, 2), all10H_5(:, 2), all10H_6(:, 2)];
all10Hy = [all10H_1(:, 3), all10H_2(:, 3), all10H_3(:, 3),...
    all10H_4(:, 3), all10H_5(:, 3), all10H_6(:, 3)];
all10Vx = [all10V_1(:, 2), all10V_2(:, 2), all10V_3(:, 2),...
    all10V_4(:, 2), all10V_5(:, 2), all10V_6(:, 2)];
all10Vy = [all10V_1(:, 3), all10V_2(:, 3), all10V_3(:, 3),...
    all10V_4(:, 3), all10V_5(:, 3), all10V_6(:, 3)];
all02Hx = [all02H_1(:, 2), all02H_2(:, 2), all02H_3(:, 2),...
    all02H_4(:, 2), all02H_5(:, 2), all02H_6(:, 2)];
all02Hy = [all02H_1(:, 3), all02H_2(:, 3), all02H_3(:, 3),...
    all02H_4(:, 3), all02H_5(:, 3), all02H_6(:, 3)];
all03Vx = [all03V_1(:, 2), all03V_2(:, 2), all03V_3(:, 2),...
    all03V_4(:, 2), all03V_5(:, 2), all03V_6(:, 2)];
all03Vy = [all03V_1(:, 3), all03V_2(:, 3), all03V_3(:, 3),...
    all03V_4(:, 3), all03V_5(:, 3), all03V_6(:, 3)];


c08h_kick = [3.50E-06; 7.00E-06; 1.05E-05; 1.40E-05; 1.75E-05; 2.10E-05];
c08v_kick = [5.00E-06; 1.00E-05; 1.50E-05; 2.00E-05; 2.50E-05; 3.00E-05];
c10h_kick = [5.00E-06; 1.00E-05; 1.50E-05; 2.00E-05; 2.50E-05; 3.00E-05];
c10v_kick = [5.00E-06; 1.00E-05; 1.50E-05; 2.00E-05; 2.50E-05; 3.00E-05];
c02h_kick = [2.50E-06; 5.00E-06; 7.50E-06; 1.00E-05; 1.25E-05; 1.50E-05];
c03v_kick = [2.50E-06; 5.00E-06; 7.50E-06; 1.00E-05; 1.25E-05; 1.50E-05];

c08h_4ax_raw = all08Hx(bpm4a_in, :)';
c08h_4ay_raw = all08Hy(bpm4a_in, :)';
c08h_4ex_raw = all08Hx(bpm4e_in, :)';
c08h_4ey_raw = all08Hy(bpm4e_in, :)';

c08v_4ax_raw = all08Vx(bpm4a_in, :)';
c08v_4ay_raw = all08Vy(bpm4a_in, :)';
c08v_4ex_raw = all08Vx(bpm4e_in, :)';
c08v_4ey_raw = all08Vy(bpm4e_in, :)';

c10h_4ax_raw = all10Hx(bpm4a_in, :)';
c10h_4ay_raw = all10Hy(bpm4a_in, :)';
c10h_4ex_raw = all10Hx(bpm4e_in, :)';
c10h_4ey_raw = all10Hy(bpm4e_in, :)';

c10v_4ax_raw = all10Vx(bpm4a_in, :)';
c10v_4ay_raw = all10Vy(bpm4a_in, :)';
c10v_4ex_raw = all10Vx(bpm4e_in, :)';
c10v_4ey_raw = all10Vy(bpm4e_in, :)';

c02h_4ax_raw = all02Hx(bpm4a_in, :)';
c02h_4ay_raw = all02Hy(bpm4a_in, :)';
c02h_4ex_raw = all02Hx(bpm4e_in, :)';
c02h_4ey_raw = all02Hy(bpm4e_in, :)';

c03v_4ax_raw = all03Vx(bpm4a_in, :)';
c03v_4ay_raw = all03Vy(bpm4a_in, :)';
c03v_4ex_raw = all03Vx(bpm4e_in, :)';
c03v_4ey_raw = all03Vy(bpm4e_in, :)';

%% Find values of dM/dC 
slopes = zeros(4, 6);

kicks = [c08h_kick c08v_kick c10h_kick c10v_kick c02h_kick c03v_kick];
raw_4ax = [c08h_4ax_raw c08v_4ax_raw c10h_4ax_raw c10v_4ax_raw...
    c02h_4ax_raw c03v_4ax_raw];
raw_4ay = [c08h_4ay_raw c08v_4ay_raw c10h_4ay_raw c10v_4ay_raw...
    c02h_4ay_raw c03v_4ay_raw];
raw_4ex = [c08h_4ex_raw c08v_4ex_raw c10h_4ex_raw c10v_4ex_raw...
    c02h_4ex_raw c03v_4ex_raw];
raw_4ey = [c08h_4ey_raw c08v_4ey_raw c10h_4ey_raw c10v_4ey_raw...
    c02h_4ey_raw c03v_4ey_raw];

rawvals(:, :, 1) = raw_4ax;
rawvals(:, :, 2) = raw_4ay;
rawvals(:, :, 3) = raw_4ex;
rawvals(:, :, 4) = raw_4ey;

for i=1:4 %row, BPM
    for j=1:6 %column, coil
        testfit = polyfit(kicks(:, j), rawvals(:, j, i), 1);
        slopes(i, j) = testfit(1);
        xint(i, j) = testfit(2);
    end
end

%% Thesis purposes: plot BPMs vs kicks (visual of dM/dC)
%{
plot(kicks(:, 1), rawvals(:, 1, 3), 'r*');
hold on;
plot(kicks(:, 1), rawvals(:, 1, 3));
ylabel("BPM4Ex reading (mm)");
xlabel("Coil 08H kick");
title("BPM4Ex reading versus coil 08H kick");
xlim([0 2.5E-5]);
ylim([0 5E-4]);
legend("elegant predictions", "Line of best fit");
%}




%% fill the determinant matrix with the coil names
Hcolumns = [1 3 5];
Vcolumns = [2 4 6];
matrices = zeros(4, 4, 9);
dets = zeros(9, 7);
for i=1:9
    
    if i<=6 %figure out first H coil
        Hind1 = 1;
        dets(i, 1) = 8;
    else
        Hind1 = 2;
        dets(i, 1) = 10;
    end
    if i<=3 %second H coil
        Hind2 = 2;
        dets(i, 2) = 10;
    else
        Hind2 = 3;
        dets(i, 2) = 2;
    end
    if mod(i, 3) == 0 %first V coil
        Vind1 = 2;
        dets(i, 3) = 10;
    else
        Vind1 = 1;
        dets(i, 3) = 8;
    end
    if mod(i, 3) == 1 %second V coil
        Vind2 = 2;
        dets(i, 4) = 10;
    else
        Vind2 = 3;
        dets(i, 4) = 3;
    end
    
    %% Calculate the alpha values 
    %swap the order of coils: it's now H1, H2, V1, V2
    indices = [Hind1, Hind2, Vind1, Vind2];
    cropped_indices = sub2ind(size(slopes), [1, 1, 1, 1], ...
        [Hcolumns(Hind1), Hcolumns(Hind2), Vcolumns(Vind1), ...
        Vcolumns(Vind2)]);
    %cropped_indices indicates the first linear index for eaCL column
    cin1 = cropped_indices(1); 
    cin2 = cropped_indices(2);
    cin3 = cropped_indices(3);
    cin4 = cropped_indices(4);
    col1 = slopes(cin1:cin1+num_bpms-1)';
    col2 = slopes(cin2:cin2+num_bpms-1)';
    col3 = slopes(cin3:cin3+num_bpms-1)';
    col4 = slopes(cin4:cin4+num_bpms-1)';
    matrices(:, :, i) = [col1, col2, col3, col4];
    dets(i, 5) = det(matrices(:, :, i));
    matrix = matrices(:, :, i);
    dets(i, 6) = 1-(matrix(3)*matrix(5))/(matrix(1)*matrix(7));
    dets(i, 7) = 1-(matrix(12)*matrix(14))/(matrix(10)*matrix(16));
end


