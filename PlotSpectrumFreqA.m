function PlotSpectrumFreqA(k, T, np)

% This function reads the data from the given file into an array
% Input: 
%		filename
% Output:
% k is the data in complex numbers
% Author: David McAllindon

    Fs = (1/T);
    freqstep=Fs/np
    scalfreq = 0:freqstep:Fs-freqstep;
%    scalfreq = 0:freqstep:Fs;
    scalfreq=squeeze(scalfreq-Fs/2);
    scaltime=squeeze(0:T:(np-1)*T);
    size(scaltime)
    size(scalfreq)
    scalppm=scalfreq/172.2;
%    scaltime = 0:T:(np)*T;
   ftk = squeeze(fftshift(fft(k))/1000);
   size(ftk)
    figure; clf; plot(scalfreq,real(ftk))
%    hold on
%    plot(scalfreq,real(fft(k)), 'color','g')
    figure; clf; plot(scalfreq,imag(ftk))
%    hold on
%    plot(scalfreq,imag(fft(k)), 'color','g')
    figure; clf; plot(scaltime,real(k))
    figure; clf; plot(scalppm, abs(ftk))
    figure; clf; plot(scalppm, angle(ftk))
%specshift = ifft((ftk));
%origspec = ifft(ifftshift(ftk));
%figure(3); clf; plot(scaltime,real(specshift))
%hold on
%plot(scaltime,real(origspec), 'color','g')
%figure(4); clf; plot(scaltime,real(k))
%figure(5); clf; plot(scaltime,imag(specshift))
%hold on
%plot(scaltime,imag(origspec), 'color', 'g')

return
