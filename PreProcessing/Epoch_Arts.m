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
            EEG = pop_loadset('filename', [files(n).name], 'filepath', 'D:\\ArtInHosp\\EEGLAB_Ready\\processed\\NoBadCh\\ica\\Cleaned');
            
            setname = EEG.setname; 
            fprintf('\n\n\n**** %s: Filtering Respondent ****\n\n\n');
            fprintf(files(n).name);
           setname = strcat(EEG.setname, '_Epochs');
            %epoched
            EEG = pop_epoch( EEG, {  '1'  '10'  '11'  '12'  '13'  '14'  '15'  '16'  '17'  '18'  '19'  '2'  '20'  '21'  '22'  '23'  '24'  '25'  '26'  '27'  '28'  '29'  '3'  '30'  '31'  '32'  '33'  '34'  '35'  '36'  '37'  '38'  '39'  '4'  '40'  '5'  '6'  '7'  '8'  '9'  }, [-5  40], 'newname', setname, 'epochinfo', 'yes');

            EEG = pop_rmbase( EEG, [-5000     0]);
             
            EEG.setname = setname                  
            EEG = pop_saveset(EEG, 'filename', [EEG.setname '.set'], 'filepath', ['D:\ArtInHosp\\EEGLAB_Ready\\processed\\NoBadCh\\ica\\Cleaned\\epoched']);
            fprintf('\n\n\n**** %s: DONE AND SAVED ****\n\n\n');
            fprintf(files(n).name);
    end
