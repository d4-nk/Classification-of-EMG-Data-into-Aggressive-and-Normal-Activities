function[fec]=time_fec(data)

fec = [];
for i = 1:8
    me=mean(data(:,i)');
    var1=var(data(:,i)');
    ske=skewness(data(:,i)');
    kur=kurtosis(data(:,i)');
    fe=[me var1 ske kur];
    fec = [fec fe];
end
end

