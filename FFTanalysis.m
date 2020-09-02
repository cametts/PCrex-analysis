%read in all data from relevant text files
%double peaked runs
anus3523 = readmatrix("freq3523_bcm_an_us.txt");
ands3523 = readmatrix("freq3523_bcm_an_ds.txt");
dgus3523 = readmatrix("freq3523_bcm_dg_us.txt");
dgds3523 = readmatrix("freq3523_bcm_dg_ds.txt");
anus3525 = readmatrix("freq3525_bcm_an_us.txt");
ands3525 = readmatrix("freq3525_bcm_an_ds.txt");
dgus3525 = readmatrix("freq3525_bcm_dg_us.txt");
dgds3525 = readmatrix("freq3525_bcm_dg_ds.txt");
anus3553 = readmatrix("freq3553_bcm_an_us.txt");
ands3553 = readmatrix("freq3553_bcm_an_ds.txt");
dgus3553 = readmatrix("freq3553_bcm_dg_us.txt");
dgds3553 = readmatrix("freq3553_bcm_dg_ds.txt");
anus3557 = readmatrix("freq3557_bcm_an_us.txt");
ands3557 = readmatrix("freq3557_bcm_an_ds.txt");
dgus3557 = readmatrix("freq3557_bcm_dg_us.txt");
dgds3557 = readmatrix("freq3557_bcm_dg_ds.txt");
anus3558 = readmatrix("freq3558_bcm_an_us.txt");
ands3558 = readmatrix("freq3558_bcm_an_ds.txt");
dgus3558 = readmatrix("freq3558_bcm_dg_us.txt");
dgds3558 = readmatrix("freq3558_bcm_dg_ds.txt");

%normal runs
anus3543 = readmatrix("freq3543_bcm_an_us.txt");
ands3543 = readmatrix("freq3543_bcm_an_ds.txt");
dgus3543 = readmatrix("freq3543_bcm_dg_us.txt");
dgds3543 = readmatrix("freq3543_bcm_dg_ds.txt");
anus3545 = readmatrix("freq3545_bcm_an_us.txt");
ands3545 = readmatrix("freq3545_bcm_an_ds.txt");
dgus3545 = readmatrix("freq3545_bcm_dg_us.txt");
dgds3545 = readmatrix("freq3545_bcm_dg_ds.txt");
anus3546 = readmatrix("freq3546_bcm_an_us.txt");
ands3546 = readmatrix("freq3546_bcm_an_ds.txt");
dgus3546 = readmatrix("freq3546_bcm_dg_us.txt");
dgds3546 = readmatrix("freq3546_bcm_dg_ds.txt");
anus3551 = readmatrix("freq3551_bcm_an_us.txt");
ands3551 = readmatrix("freq3551_bcm_an_ds.txt");
dgus3551 = readmatrix("freq3551_bcm_dg_us.txt");
dgds3551 = readmatrix("freq3551_bcm_dg_ds.txt");
anus3562 = readmatrix("freq3562_bcm_an_us.txt");
ands3562 = readmatrix("freq3562_bcm_an_ds.txt");
dgus3562 = readmatrix("freq3562_bcm_dg_us.txt");
dgds3562 = readmatrix("freq3562_bcm_dg_ds.txt");
anus3569 = readmatrix("freq3569_bcm_an_us.txt");
ands3569 = readmatrix("freq3569_bcm_an_ds.txt");
dgus3569 = readmatrix("freq3569_bcm_dg_us.txt");
dgds3569 = readmatrix("freq3569_bcm_dg_ds.txt");

%legends
dpleg = ["3525 (DP)", "3553 (DP)", "3557 (DP)", "3558 (DP)", "3543 (N)",...
    "3545 (N)", "3546 (N)", "3551 (N)", "3562 (N)", "3569 (N)"];

%plot frequencies for bcm an us
figure;
hold on;
plot(round(anus3525), ones(size(anus3525))*1.2, "bo");
plot(round(anus3553), ones(size(anus3553))*1.1, "g.");
plot(round(anus3557), ones(size(anus3557))*1.0, "r.");
plot(round(anus3558), ones(size(anus3558))*0.9, "m.");
plot(round(anus3543), ones(size(anus3543))*1.3, "b*");
legend(dpleg);
title("Dominant frequencies for bcm an us");
xlabel("Frequency");
ylim([0.85, 1.35]);
hold off;

%frequencies for bcm dg us 
figure;
hold on;
plot(round(dgus3525), ones(size(dgus3525))*1.2, "b.");
plot(round(dgus3553), ones(size(dgus3553))*1.1, "g.");
plot(round(dgus3557), ones(size(dgus3557))*1.0, "r.");
plot(round(dgus3558), ones(size(dgus3558))*0.9, "m.");
legend(dpleg);
title("Dominant frequencies for bcm dg us");
xlabel("Frequency");
ylim([0.85, 1.25]);
hold off;

%frequencies for bcm an ds
figure;
hold on;
plot(round(ands3525), ones(size(ands3525))*1.2, "b.");
plot(round(ands3553), ones(size(ands3553))*1.1, "g.");
plot(round(ands3557), ones(size(ands3557))*1.0, "r.");
plot(round(ands3558), ones(size(ands3558))*0.9, "m.");
legend(dpleg);
title("Dominant frequencies for bcm an ds");
xlabel("Frequency");
ylim([0.85, 1.25]);
hold off;

%frequencies for bcm dg ds
figure;
hold on;
plot(round(dgds3525), ones(size(dgds3525))*1.2, "b.");
plot(round(dgds3553), ones(size(dgds3553))*1.1, "g.");
plot(round(dgds3557), ones(size(dgds3557))*1.0, "r.");
plot(round(dgds3558), ones(size(dgds3558))*0.9, "m.");
legend(dpleg);
title("Dominant frequencies for bcm dg ds");
xlabel("Frequency");
ylim([0.85, 1.25]);
hold off;




