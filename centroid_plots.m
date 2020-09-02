%% THIS ONE MAKES THE CENTROID PLOTS %% 
clear all
%set positions of target, BPMs, quads, points used for slope calc
bpm4a = 1305.446;
bpm4e = 1310.592;
target = 1312.97;
bpm12 = target-72.63;
bpm11 = target-77.84;
bpm1x = 1294.12;
slope_in1 = 287; %index of 4A after cutting first bit of data
slope_in2 = 313; %index of 4E after cutting first bit of data
target_in = 320;

%read in all data from relevant text files
cen08H = readmatrix("coil08H_CL_6.txt");
cen08V = readmatrix("coil08V_CL_6.txt");
cen10H = readmatrix("coil10H_CL_6.txt");
cen10V = readmatrix("coil10V_CL_6.txt");
cen02H = readmatrix("coil02H_CL_6.txt");
cen03V = readmatrix("coil03V_CL_6.txt");
cennokick = readmatrix("cennokick.txt");

%define cenroid, distance sets
s08H = cen08H(2138:2459, 1);
c08H = cen08H(2138:2459, 2);
s08V = cen08V(2138:2459, 1);
c08V = cen08V(2138:2459, 3);
s10H = cen10H(2138:2459, 1);
c10H = cen10H(2138:2459, 2);
s10V = cen10V(2138:2459, 1);
c10V = cen10V(2138:2459, 3);
s02H = cen02H(2138:2459, 1);
c02H = cen02H(2138:2459, 2);
s03V = cen03V(2138:2459, 1);
c03V = cen03V(2138:2459, 3);
snone = cennokick(2138:end, 1);
cxnone = cennokick(2138:end, 2);
cynone = cennokick(2138:end, 3);

%group related data sets
sxdata = [s08H, s10H, s02H, snone];
sydata = [s08V, s10V, s03V, snone];
cxdata = [c08H, c10H, c02H, cxnone];
cydata = [c08V, c10V, c03V, cynone];

%calculate slopes
cdata = [c08H, c10H, c02H, c08V, c10V, c03V, cxnone, cynone];
cleg = ["08H", "10H", "02H", "08V", "10V", "03V", "No kick X", ...
    "No kick Y"];
c_4a = cdata(slope_in1, :);
c_4e = cdata(slope_in2, :);
s_4a = s08H(slope_in1);
s_4e = s08H(slope_in2);
slopes = (c_4e-c_4a)/(s_4e-s_4a);
slopes = slopes'; 
targetpos = cdata(target_in, : );



%plot c versus s for vertical coils
figure;
cyleg = ["08V", "10V", "03V", "No kick"];
plot(sydata, cydata, ".");
targetline = xline(target, 'r', 'Target');
targetline.LabelHorizontalAlignment = 'center';
%bpm11line = xline(bpm11, 'k', 'BPM11');
%bpm11line.LabelHorizontalAlignment = 'center';
bpm12line = xline(bpm12, 'k', 'BPM12');
bpm12line.LabelHorizontalAlignment = 'center';
bpm4aline = xline(bpm4a, 'k', 'BPM4A');
bpm4aline.LabelHorizontalAlignment = 'center';
bpm4eline = xline(bpm4e, 'k', 'BPM4E');
bpm4eline.LabelHorizontalAlignment = 'center';
legend(cyleg);
title("CREx: centroid v distance for vertical coils");
xlabel("Distance (m)");
ylabel("Centroid (m)");
hold off;

%plot c versus s for horizontal coils
figure;
cxleg = ["08H", "10H", "02H", "No kick"];
plot(sxdata, cxdata, ".");
targetline = xline(target, 'r', 'Target');
targetline.LabelHorizontalAlignment = 'center';
%bpm11line = xline(bpm11, 'k', 'BPM11');
%bpm11line.LabelHorizontalAlignment = 'center';
bpm12line = xline(bpm12, 'k', 'BPM12');
bpm12line.LabelHorizontalAlignment = 'center';
bpm4aline = xline(bpm4a, 'k', 'BPM4A');
bpm4aline.LabelHorizontalAlignment = 'center';
bpm4eline = xline(bpm4e, 'k', 'BPM4E');
bpm4eline.LabelHorizontalAlignment = 'center';
%bpm1xline = xline(bpm1x, 'k', 'BPM1X');
%bpm1xline.LabelHorizontalAlignment = 'center';
legend(cxleg);
title("CREx: centroid v distance for horizontal coils");
xlabel("Distance (m)");
ylabel("Centroid (m)");
hold off;








