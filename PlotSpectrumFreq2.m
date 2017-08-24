function [residual] = PlotSpectrumFreq2(k1, k2, T, np, npp,ns)

% This function reads the data from the given file into an array
% Input: 
%		filename
% Output:
% k is the data in complex numbers
% Author: David McAllindon

    Fs = (1/T);
    freqstep=Fs/np
    scalfreq = 0:freqstep:Fs-freqstep;
    scalfreqf=scalfreq-Fs/2;
    scaltime=0:T:(np-1)*T;
    size(scaltime)
    size(scalfreqf)
    zerofill(1:np-npp) = 0;
    k1=[k1(ns+1:npp+ns); zerofill'];
    k2=[k2(ns+1:npp+ns); zerofill'];
   ftk1 = fftshift(fft(k1))/1000;
    expon = exp(-i*2*pi*ns*T*scalfreqf);
    size(expon)
    size(ftk1)
    ftk1 = ftk1./expon;
%   size(ftk1)
    figure; clf; plot(scalfreqf,real(ftk1))
   ftk2 = fftshift(fft(k2))/1000;
   ftk2=ftk2./expon;
%   size(ftk2)
   hold on
    plot(scalfreqf,real(ftk2), 'color','g')
%    figure; clf; plot(scalfreq,imag(ftk))
%    hold on
%    plot(scalfreq,imag(fft(k)), 'color','g')
%    figure; clf; plot(scaltime,real(k))

%specshift = ifft((ftk));
%origspec = ifft(ifftshift(ftk));
%figure(3); clf; plot(scaltime,real(specshift))
%hold on
%plot(scaltime,real(origspec), 'color','g')
%figure(4); clf; plot(scaltime,real(k))
%figure(5); clf; plot(scaltime,imag(specshift))
%hold on
%plot(scaltime,imag(origspec), 'color', 'g')
residual = ftk1-ftk2;
return
