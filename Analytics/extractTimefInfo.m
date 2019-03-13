%******WRITTEN BY ANDREAS WULFF-ABRAMSSON*****

%getting the relative power data out of the time-frequency analysis 
%each electrode will have a matrix each with time and power of the
%different frequencies
 function [ERPSdata,ERPSbootData, freqs] = extractTimefInfo (EEG , ch, minfreq, maxfreq)
 
[ERPSdata,itc,powerbaseline,times,freqs,ERPSbootData,Rboot,phase]=timef(EEG.data(ch,:),EEG.pnts,...
    [EEG.times(1,1),EEG.times(1,length(EEG.times))],EEG.srate,0, 'minfreq', 0.5, 'maxfreq', 48, 'alpha', 0.05);

for i = 1:length(freqs)
   if i < (minfreq*16)
       ERPSdata(i,:) = -100;
   end
   if i > (maxfreq*16)
       ERPSdata(i,:) = -100;
   end
end
newfreqs = zeros(length(freqs)/8); 
for i = 1:length(newfreqs)
   newfreqs(i) = i/2; 
end
for i = 1:length(freqs)
    for n = 1:200
   if i < (minfreq*16)
       ERPSdata(i,:) = -100;
   end
   if i > (maxfreq*16)
       ERPSdata(i,:) = -100;
   end
    end
    
end


end
