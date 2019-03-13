% EEGLAB history file generated on the 13-Mar-2019
% ------------------------------------------------
% Clear memory and the command window
    clear;
    clc;

    % Go into that folder and look for all.set files
    files = dir ('*.set'); 
    
    % Loop through all files
    for n = 1:length(files)

        fprintf('\n******\nProcessing data %s\n******\n\n');
        fprintf(files(n).name);
        
            %% Load Data
            % Load original dataset
            %
            fprintf('\n\n\n**** %s: Loading dataset ****\n\n\n');
            fprintf(files(n).name);
            EEG = pop_loadset('filename', [files(n).name], 'filepath', 'D:\\AAU\\Experiments\\MarioERP\\ERPS\\Epochs\\LosingLevel');
            
            setname = EEG.setname; 
        
nChans = EEG.nbchan; 
figure; 
[specOut] = pop_spectopo(EEG, 1, [-199.2188  996.0938], 'EEG' , 'freq', [6 10 22], 'freqrange',[0.5 100],'electrodes','off');
for i=1:nChans
    for j=1:length(specOut)
LoseSpecs(n,i,j) = specOut(i,j); 
    end
end
   save('LoseSpec','LoseSpecs');  
    end
%[eegspecdB,freqs,compeegspecdB,resvar,specstd] = spectopo(EEG.data(chanNr, [199 990]),1,256);