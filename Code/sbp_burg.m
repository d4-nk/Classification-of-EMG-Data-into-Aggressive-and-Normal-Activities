function [sbp]=sbp_burg(data,order)
sbp=[];
for j=1:1:8
    si=pburg(data(:,j),order);
    k1=length(si);
    k2=length(si)/10;
    k2=floor(k2);
    k=1;
    for i=1:k2:k1-k2
        f1=sum(si(i:i+k2-1,:));
        sbp=[sbp f1];
    end
end

return
    