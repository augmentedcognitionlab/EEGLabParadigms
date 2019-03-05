% Clear memory and the command window
    

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
            EEG = pop_loadset('filename', [files(n).name], 'filepath', 'D:\\ArtInHosp\\EEGLAB_Ready\\processed\\NoBadCh\\ica\\Cleaned\\epoched');
            % please change the last part of the name, trigger numbers and
            % file paths to fit your experiment and data. 
            setname = EEG.setname; 
            fprintf('\n\n\n**** %s: Filtering Respondent ****\n\n\n');
            fprintf(files(n).name);
           setname = strcat(EEG.setname, '_Abstract');
            %epoched
            EEG = pop_selectevent( EEG, 'type',[1 10 11:19 2 20 3 4:9] ,'deleteevents','off','deleteepochs','on','invertepochs','off');
             
            EEG.setname = setname;                  
            EEG = pop_saveset(EEG, 'filename', [EEG.setname '.set'], 'filepath', ['D:\\ArtInHosp\\EEGLAB_Ready\\processed\\NoBadCh\\ica\\Cleaned\\epoched\\AbsFig']);
            % same as last long comment 
            EEG = ALLEEG(n);
            EEG = pop_selectevent( EEG, 'type',[21:40] ,'deleteevents','off','deleteepochs','on','invertepochs','off');
           
            setname = strcat(EEG.setname, '_Figurative');
            EEG.setname = setname;                  
            EEG = pop_saveset(EEG, 'filename', [EEG.setname '.set'], 'filepath', ['D:\\ArtInHosp\\EEGLAB_Ready\\processed\\NoBadCh\\ica\\Cleaned\\epoched\\AbsFig']);
            
            fprintf('\n\n\n**** %s: DONE AND SAVED ****\n\n\n');
            
            
            
            fprintf(files(n).name);
    end
