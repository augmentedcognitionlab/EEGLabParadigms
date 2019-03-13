%******WRITTEN BY ANDREAS WULFF-ABRAMSSON*****
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
            % remember to change the directory to fit your experiment. 
            fprintf('\n\n\n**** %s: Loading dataset ****\n\n\n');
            fprintf(files(n).name);
            EEG = pop_loadset('filename', [files(n).name], 'filepath', 'D:\\ArtInHosp\\EEGLAB_Ready\\processed\\NoBadCh');
            
            setname = EEG.setname; 
            fprintf('\n\n\n**** %s: Filtering Respondent ****\n\n\n');
            fprintf(files(n).name);
           
            %re-reference
            EEG = pop_reref( EEG, []);
            
            %run ica
            EEG = pop_runica(EEG, 'extended',1,'stop',1e-07,'interupt','on');
            %plase rememeber to change directory. 
            EEG.setname = strcat(EEG.setname, '_ICA');                  
            EEG = pop_saveset(EEG, 'filename', [EEG.setname '.set'], 'filepath', ['D:\ArtInHosp\EEGLAB_Ready\processed\NoBadCh\\ica']);
            fprintf('\n\n\n**** %s: DONE AND SAVED ****\n\n\n');
            fprintf(files(n).name);
    end
