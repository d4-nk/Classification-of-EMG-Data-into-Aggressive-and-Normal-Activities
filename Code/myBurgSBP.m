function idata = myBurgSBP(pattern,SegmLen,wn,ModelOrder)


             seg_emg = pattern((sx-1)*floor(SegmLen)+1:(sx)*floor(SegmLen));
%--------------------------------------------------------------------------        
        % AR coefficients 
%           
%--------------------------------------------------------------------------
           abs_seg1 = (seg_emg);
           Ls = length(abs_seg1);
%            wn = 10;
% abseg = [];
            Nw = floor(Ls/wn);
% 
abseg = abs_seg1;      
winLen = floor(Nw/8);
Noverlap = winLen-10;
%        Pseg = pwelch(abseg,winLen,Noverlap)0;
Pseg  = pburg(abseg,ModelOrder);
             Lp = length(Pseg);
       %disp(Lp);
       pwn = floor(Lp/Npwin);
       for px = 1:Npwin
            pwind = Pseg((px-1)*pwn+1:px*pwn);
            pseg_av(px) = mean(pwind);
       end
       idata = log(pseg_av);
return; 