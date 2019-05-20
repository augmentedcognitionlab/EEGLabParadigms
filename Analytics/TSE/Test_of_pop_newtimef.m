figure(2);
%Second variable is channel and third is typeplot (like it is in the script
%currently).
subplot(1,3,1)
pop_newtimef( EEG, 1, 1, [-5000  39999], 0, 'topovec', 1, 'elocs', EEG.chanlocs, 'chaninfo', EEG.chaninfo, 'caption', electrodeInfo.labels, 'baseline', 0, 'freqs', [0.5 50], 'plotphase', 'off', 'timesout', 200, 'padratio', 4, 'winsize', 128);
subplot(1,3,2)
pop_newtimef( EEG, 2, 1, [-5000  39999], 0, 'topovec', 1, 'elocs', EEG.chanlocs, 'chaninfo', EEG.chaninfo, 'caption', electrodeInfo.labels, 'baseline', 0, 'freqs', [0.5 50], 'plotphase', 'off', 'timesout', 200, 'padratio', 4, 'winsize', 128);
subplot(1,3,3)
pop_newtimef( EEG, 3, 1, [-5000  39999], 0, 'topovec', 1, 'elocs', EEG.chanlocs, 'chaninfo', EEG.chaninfo, 'caption', electrodeInfo.labels, 'baseline', 0, 'freqs', [0.5 50], 'plotphase', 'off', 'timesout', 200, 'padratio', 4, 'winsize', 128);
figure(3)
%Second variable is typeplot and third is channel (like it is described in
%documentation.
subplot(1,3,1)
pop_newtimef( EEG, 1, 1, [-5000  39999], 0, 'topovec', 1, 'elocs', EEG.chanlocs, 'chaninfo', EEG.chaninfo, 'caption', electrodeInfo.labels, 'baseline', 0, 'freqs', [0.5 50], 'plotphase', 'off', 'timesout', 200, 'padratio', 4, 'winsize', 128);
subplot(1,3,2)
pop_newtimef( EEG, 1, 2, [-5000  39999], 0, 'topovec', 1, 'elocs', EEG.chanlocs, 'chaninfo', EEG.chaninfo, 'caption', electrodeInfo.labels, 'baseline', 0, 'freqs', [0.5 50], 'plotphase', 'off', 'timesout', 200, 'padratio', 4, 'winsize', 128);
subplot(1,3,3)
pop_newtimef( EEG, 1, 3, [-5000  39999], 0, 'topovec', 1, 'elocs', EEG.chanlocs, 'chaninfo', EEG.chaninfo, 'caption', electrodeInfo.labels, 'baseline', 0, 'freqs', [0.5 50], 'plotphase', 'off', 'timesout', 200, 'padratio', 4, 'winsize', 128);
