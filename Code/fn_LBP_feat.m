function idata = fn_LBP_feat(pattern,Nsigval)
Ndown = 2;
Lbp = 1;
lbx = [-Nsigval/2:-1, 1:Nsigval/2];
% nsigvec = [-1:-1:-Nsigval/2,0,Nsigval/2:-1:1];
basisvec = 2.^(0:Ndown:(2*Nsigval-1)*Ndown);
abseg = abs(pattern);
Ls = length(abseg);
% Nw = floor(Ls/wn);
% for nx = 1:Nw
% wind = abs(seg_emg1((nx-1)*wn+1:nx*wn));
% abseg(nx) = mean(wind);
% end
seg_emg = downsample(abseg,Ndown);
% Ls = length(abs_seg1);
% Nw = floor(Ls/wn);
% nsigvec = [-1:-1:-Nsigval/2,Nsigval/2:-1:1];
for gx1 = 1:length(seg_emg)-Nsigval
gx = gx1+Nsigval/2;
sig_local_vec = seg_emg(gx+lbx);
sig_local_vec = seg_emg(gx+lbx);
Cv = mean(seg_emg(gx-Lbp:gx+Lbp));
tempvec = s_fn(sig_local_vec - Cv);
LCCP(gx) = sum(basisvec.*tempvec);
end
idata = hist(LCCP(:),2);
return