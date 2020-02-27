clc;
clear;
clear all;

a = ["sub1" , "sub2" , "sub3" , "sub4"];
b = ["Aggressive" , "Normal"];

data1 = [];
data2 = [];
feat1 = [];
feat2 = [];

for i = 1:4
    for j = 1:2
        for k = 1:10
            if j == 1
                file = strcat(a(i),"\",b(j),"\txt");
                files = dir(fullfile(file,"*.txt"));
                data11 = importdata(files(k).name);
                for n = 1:666: length(data11)
                    disp(k);
                    datax = data11(n:min((n+666),length(data11)),:);
                    f1 = time_fec(datax);
                    f2 = lmf_moment(datax);
                    f3 = ics_fec(datax);
                    f4 = sbp_burg(datax,2);
                    ff = [f1 f2 f3 f4 1];
                    feat1 = [feat1' ff'];
                    feat1 = feat1';
                end
            end
            if j == 2
                file = strcat(a(i),"\",b(j),"\txt");
                files = dir(fullfile(file,"*.txt"));
                data22 = importdata(files(k).name);
                for n = 1:666: length(data22)
                    disp(k);
                    datax = data22(n:min((n+666),length(data22)),:);
                    f1 = time_fec(datax);
                    f2 = lmf_moment(datax);
                    f3 = ics_fec(datax);
                    f4 = sbp_burg(datax,2);
                    ff = [f1 f2 f3 f4 -1];
                    feat2 = [feat2' ff'];
                    feat2 = feat2';
                end
            end
        end
    end
en

N = min(length(feat1'),length(feat2'));

trainingdata(1:2:2*N-1,:) = feat1(1:N,:);
trainingdata(2:2:2*N,:) = feat2(1:N,:);




