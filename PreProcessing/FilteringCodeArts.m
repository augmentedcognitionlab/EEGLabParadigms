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
            EEG = pop_loadset('filename', [files(n).name], 'filepath', 'D:\\ArtInHosp\\EEGLAB_Ready');
            
            setname = EEG.setname; 
            fprintf('\n\n\n**** %s: Filtering Respondent ****\n\n\n');
            fprintf(files(n).name);
           
            %filtering
            EEG = pop_eegfiltnew(EEG, 0.5, 0);
            EEG = pop_eegfiltnew(EEG, 0, 100);
            
            %notch filter
            EEG = pop_eegfiltnew(EEG, 48, 52, 424, 1,[],0);
            
            %Select only art stimuli and remove first baseline and questionnaire setting the limmets -5s to 40s and naming a new file  
            EEG = pop_rmdat( EEG, {'1' '2' '3' '4' '5' '6' '7' '8' '9' '10' '11' '12' '13' '14' '15' '16' '17' '18' '19' '20' '21' '22' '23' '24' '25' '26' '27' '28' '29' '30' '31' '32' '33' '34' '35' '36' '37' '38' '39' '40'},[-5 40] ,0);
            setname = strcat (setname,'_filtered'); 
            EEG.setname= setname;
                  
            EEG = pop_saveset(EEG, 'filename', [EEG.setname '.set'], 'filepath', ['D:\\ArtInHosp\\EEGLAB_Ready\\processed']);
            fprintf('\n\n\n**** %s: DONE AND SAVED ****\n\n\n');
            fprintf(files(n).name);
    end
