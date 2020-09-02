%%%%% THE FINAL VERSION OF THIS FILE                        %%%%%
%%%%% CALCULATES VALUES OF ALPHA BASED ON ELEGANT DATA      %%%%%

%%%%% Final output: 9x6 matrix "alphas"                     %%%%%
%%%%% Columns 1-4: H coil 1, H coil 2, V coil 1, V coil 2   %%%%%
%%%%% Column 5: alpha_x (for H coils)                       %%%%%
%%%%% Column 6: alpha_y (for V coils)                       %%%%%

%% SETUP
clear all
num_bpms = 4;

% Positions: what elegant says the s value is 
bpm4a_pos = 1305.446; %index 2427 with these files
bpm4e_pos = 1310.592; %index 2453

% Size of kicks applied to each coil
% NOTE: in future iterations, take the first column to be 0 
% (requires rerunning simulations in elegant)
c08h_kick = [3.50E-06; 2.10E-05];
c08v_kick = [5.00E-06; 3.00E-05];
c10h_kick = [5.00E-06; 3.00E-05];
c10v_kick = [5.00E-06; 3.00E-05];
c02h_kick = [2.50E-06; 1.50E-05];
c03v_kick = [2.50E-06; 1.50E-05];

%% READ ALL TEXT FILES
% Text files should have s, Cx, Cy
% In elegant: sddsprintout file.cen -column=s -column=Cx -column=Cy
%             file.txt
% variable_0 is file with no kick (NOTE: current files have small kick)
% If transitioning to no kick (recommended), change kicks in setup
% variable_k is file with kick applied
all08H_0 = readmatrix("coil08H_CL_1.txt");
all08H_k = readmatrix("coil08H_CL_6.txt");

all08V_0 = readmatrix("coil08V_CL_1.txt");
all08V_k = readmatrix("coil08V_CL_6.txt");

all10H_0 = readmatrix("coil10H_CL_1.txt");
all10H_k = readmatrix("coil10H_CL_6.txt");

all10V_0 = readmatrix("coil10V_CL_1.txt");
all10V_k = readmatrix("coil10V_CL_6.txt");

all02H_0 = readmatrix("coil02H_CL_1.txt");
all02H_k = readmatrix("coil02H_CL_6.txt");

all03V_0 = readmatrix("coil03V_CL_1.txt");
all03V_k = readmatrix("coil03V_CL_6.txt");

%% FIND INDICES OF BPMS
s = all08H_0(:, 1);
bpm4a_in = find((bpm4a_pos-s < 0.1), 1);
bpm4e_in = find((bpm4e_pos-s < 0.1), 1);

%% SORT ALL DATA
% Matrices of all elegant centroid readings for a given coil, axis
% One column for each kick
all08Hx = [all08H_0(:, 2), all08H_k(:, 2)];
all08Hy = [all08H_0(:, 3), all08H_k(:, 3)];
all08Vx = [all08V_0(:, 2), all08V_k(:, 2)];
all08Vy = [all08V_0(:, 3), all08V_k(:, 3)];
all10Hx = [all10H_0(:, 2), all10H_k(:, 2)];
all10Hy = [all10H_0(:, 3), all10H_k(:, 3)];
all10Vx = [all10V_0(:, 2), all10V_k(:, 2)];
all10Vy = [all10V_0(:, 3), all10V_k(:, 3)];
all02Hx = [all02H_0(:, 2), all02H_k(:, 2)];
all02Hy = [all02H_0(:, 3), all02H_k(:, 3)];
all03Vx = [all03V_0(:, 2), all03V_k(:, 2)];
all03Vy = [all03V_0(:, 3), all03V_k(:, 3)];

% Extract values at the given BPMs
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

%% FIND VALUES OF DM/DC
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

%% Visualization purposes: plot BPMs vs kicks (visual of dM/dC)
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

%% FILL ALPHA MATRIX WITH COIL NAMES
Hcolumns = [1 3 5];
Vcolumns = [2 4 6];
matrices = zeros(4, 4, 9);
alphas = zeros(9, 6);
for i=1:9
    if i<=6 %figure out first H coil
        Hind1 = 1;
        alphas(i, 1) = 8;
    else
        Hind1 = 2;
        alphas(i, 1) = 10;
    end
    if i<=3 %second H coil
        Hind2 = 2;
        alphas(i, 2) = 10;
    else
        Hind2 = 3;
        alphas(i, 2) = 2;
    end
    if mod(i, 3) == 0 %first V coil
        Vind1 = 2;
        alphas(i, 3) = 10;
    else
        Vind1 = 1;
        alphas(i, 3) = 8;
    end
    if mod(i, 3) == 1 %second V coil
        Vind2 = 2;
        alphas(i, 4) = 10;
    else
        Vind2 = 3;
        alphas(i, 4) = 3;
    end
    
    %% CALCULATE ALPHA
    % Order of coils: H1, H2, V1, V2
    indices = [Hind1, Hind2, Vind1, Vind2];
    cropped_indices = sub2ind(size(slopes), [1, 1, 1, 1], ...
        [Hcolumns(Hind1), Hcolumns(Hind2), Vcolumns(Vind1), ...
        Vcolumns(Vind2)]);
    % Cropped_indices indicates the first linear index for each column
    cin1 = cropped_indices(1); 
    cin2 = cropped_indices(2);
    cin3 = cropped_indices(3);
    cin4 = cropped_indices(4);
    col1 = slopes(cin1:cin1+num_bpms-1)';
    col2 = slopes(cin2:cin2+num_bpms-1)';
    col3 = slopes(cin3:cin3+num_bpms-1)';
    col4 = slopes(cin4:cin4+num_bpms-1)';
    matrices(:, :, i) = [col1, col2, col3, col4];
    matrix = matrices(:, :, i);
    % Fifth column: alpha_x
    alphas(i, 5) = 1-(matrix(3)*matrix(5))/(matrix(1)*matrix(7));
    % Sixth column: alpha_y
    alphas(i, 6) = 1-(matrix(12)*matrix(14))/(matrix(10)*matrix(16));
end


