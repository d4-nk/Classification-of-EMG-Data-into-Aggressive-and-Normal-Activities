function cross_corr=ics_fec(data)
y=[];
for i=1:1:3
    for j=i+1:1:4
        if(i~=j)
            x=max(xcorr(data(:,i),data(:,j)));
            y=[y x];
        end
    end
end
for i=5:1:7
    for j=i+1:1:8
        if(i~=j)
            x=max(xcorr(data(:,i),data(:,j)));
            y=[y x];
        end
    end
end
cross_corr=y;
            
end