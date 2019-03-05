% EEGLAB 
% Before running this script please open all datasets you would like to
% analyse in EEGLAB
% ------------------------------------------------
    

    % Go into that folder and look for all.set files
    files = dir ('*.set'); 
    noComp = 1; 
    locations = EEG.chanlocs;
    % Loop through all files
    for n = 1:length(files)

EEG.etc.eeglabvers = '14.1.1'; % this tracks which version of EEGLAB is being used, you may ignore it
EEG = pop_loadset('filename',[files(n).name],'filepath','D:\\AAU\\Experiments\\Trial\\');
EEG = eeg_checkset( EEG );

for e = 1:20 %the number of electrodes  
    electrodeInfo = locations(1,e);
    %No. of electrodes
%collecting all the ERPS data from each subject and each electrode in ersp
%in the difErsp the difference maps are stored, be aware that the difErsp
%are cells and that it is the third matrix in the cell that is the
%comparrisson. 
    figure; 
    newTitle = electrodeInfo.labels; 
    newTitle = strcat(newTitle,'A-M+');
   
   % m = n+1;
   % if mod(m,2) == 0
   %     newTitle = strcat(nameOfFile,'Fig');
   % else
   %     newTitle = strcat(nameOfFile,'Abs');
   % end

    [AmMperspStat(n,e,:,:),itc,powbase,times,freqs,erspboot,itcboot] = newtimef( EEG.data(e,:,:), EEG.pnts, [EEG.xmin EEG.xmax]*1000, EEG.srate, [3 0.5],  'baseline',[-5000 0], 'alpha',0.05, 'freqs', [0.5 50], 'title', newTitle);
    
    sub = num2str(noComp);
    
    nameOfFile = 'Sub';
    nameOfFile = strcat(nameOfFile,sub);
    nameOfFile = strcat(nameOfFile,'Electrode');
    nameOfFile = strcat(nameOfFile,electrodeInfo.labels);
   nameOfFile = strcat(nameOfFile,'A-M+');
    %if mod(m,2) == 0
    %    nameOfFile = strcat(nameOfFile,'Fig');
    %else
    %    nameOfFile = strcat(nameOfFile,'Abs');
    %end
    nameOfFile = strcat(nameOfFile,'Alpha=0.05');
    nameOfFile = strcat(nameOfFile,'.fig');
    
    saveas(gcf,nameOfFile)
     close 
    
    %without bootstrap comparisson. 
    
    [AmMpersp(n,e,:,:),itc,powbase,times,freqs,erspboot,itcboot] = newtimef( EEG.data(e,:,:), EEG.pnts, [EEG.xmin EEG.xmax]*1000, EEG.srate, [3 0.5],  'baseline',[-5000 0], 'freqs', [0.5 50], 'title', newTitle);
            pop_newtimef( EEG, e, 2, [-5000  39996], [3         0.5] , 'topovec', 2, 'elocs', EEG.chanlocs, 'chaninfo', EEG.chaninfo, 'caption', electrodeInfo.labels, 'baseline',[-5000 0], 'freqs', [0.5 50], 'plotphase', 'off', 'padratio', 1);
           % pop_newtimef( EEG, 1, 13, [-5000  39996], [3         0.5] , 'topovec', 13, 'elocs', EEG.chanlocs, 'chaninfo', EEG.chaninfo, 'caption', 'T8', 'baseline',[-5000 0], 'plotphase', 'off', 'padratio', 1, 'winsize', 1280);
    sub = num2str(noComp);
    
    nameOfFile = 'Sub';
    nameOfFile = strcat(nameOfFile,sub);
    nameOfFile = strcat(nameOfFile,'Electrode');
    nameOfFile = strcat(nameOfFile,electrodeInfo.labels);
    nameOfFile = strcat(nameOfFile,'A-M+');
    
   % if mod(m,2) == 0
   %     nameOfFile = strcat(nameOfFile,'Fig');
   % else
   %     nameOfFile = strcat(nameOfFile,'Abs');
   % end
    nameOfFile = strcat(nameOfFile,'NoAlpha');
    nameOfFile = strcat(nameOfFile,'.fig');
    
    saveas(gcf,nameOfFile)
    close all
    
    % we would only like to compare the outputs if the current dataset is
    % the abstract, so the order of compasson is the same. 
   % if(n+1 <= length(files))
   %     if mod(m,2) == 0
   %     figure; 
   %     [difErsp{noComp,e},itc2,powbase2,times2,freqs2,erspboot2,itcboot2] = newtimef( {ALLEEG(n).data(1,:,:) ALLEEG(n+1).data(1,:,:)}, EEG.pnts, [EEG.xmin EEG.xmax]*1000, EEG.srate, [3 0.5],  'baseline',[-5000 - 0], 'alpha',0.05, 'freqs', [0.5 50]);
        
   %     sub = num2str(noComp);
    
   % nameOfFile = 'Comp';
   % nameOfFile = strcat(nameOfFile,sub);
   % nameOfFile = strcat(nameOfFile,'Electrode');
   % nameOfFile = strcat(nameOfFile,electrodeInfo.labels);
   % nameOfFile = strcat(nameOfFile,'ComparedAbsWithFig');
   % nameOfFile = strcat(nameOfFile,'.fig');
   % saveas(gcf,nameOfFile)
   %     close all
   %     end
   % end

end


    noComp = noComp + 1; 

    end
    %%
    % The following analysis will give the following. 
    % a matrix with averages for Figurative, abstracts and comparissons one
    % for each electrodes. 
    % Matrices for the variance found at the different pixel areas, for all
    % three types of maps and for all electrodes. 
    %Wilcoxon ranged sum test will be performed to compare Abs TSE maps
    %with Fig TSE maps to elucidate significant differences between them. 
    
    %ersp(session abs (odd) or fig (even),electrode,x(793),y(200))
    %difErsp{subject,electrode}{1,3}(x(793),y(200))
    % 
    sessions = length(files);
   % comparissons = sessions/2; 
    electrodes = 20; % the number of electrodes 
    xPos = 793;
    yPos = 200; 
    
    AmMpERSP = 1;
    AmMpERSPStat = 1;
    %figERSP = 1;
    %figERSPStat = 1;
    
    averageERSPAmMp = 1;
    %averageERSPabs = 1;
    averageERSPAmMpStat = 1; 
    %averageERSPabsStat = 1; 
    
    stdERSPAmMp = 1; 
    %stdERSPabs = 1; 
    stdERSPAmMpStat = 1; 
   % stdERSPfigStat = 1; 
    
  %  for s = 1:sessions
  %      
  %      for e = 1:electrodes
  %          for x = 1:xPos
  %              for y = 1:yPos
  %                  if mod(s,2) == 1
  %                          s2 = s*0.5+0.5;
  %                  absERSP(s2,e,x,y) = ersp(s,e,x,y);
  %                  absERSPStat(s2,e,x,y) = erspStat(s,e,x,y);
  %                  else
  %                  figERSP(s/2,e,x,y) = ersp(s,e,x,y);
  %                  figERSPStat(s/2,e,x,y) = erspStat(s,e,x,y);
  %                  end
  %              end
  %          end
  %      end
        
  %  end
    
    %getting the info out of the cells in the difErsp
   % for c = 1:comparissons
   %     for e = 1:electrodes
   %         for x = 1:xPos
   %             for y = yPos
   %                 
   %                 noCelldiffERSP(c,e,x,y) = difErsp{c,e}{1,3}(x,y);
   %                 
   %             end
   %         end
   %     end
   % end
    
    for e = 1:electrodes 
        for x = 1:xPos
            for y = 1:yPos
        averageERSPAmMp(e,x,y) = mean(AmMpersp(:,e,x,y));
        averageERSPAmMpStat(e,x,y) = mean(AmMperspStat(:,e,x,y)); 
       % averageERSPabs(e,x,y) = mean(absERSP(:,e,x,y));
       % averageERSPabsStat(e,x,y) = mean(absERSPStat(:,e,x,y)); 
        
        stdERSPAmMp(e,x,y) = std(AmMpersp(:,e,x,y));
        stdERSPAmMpStat(e,x,y) = std(AmMperspStat(:,e,x,y)); 
       % stdERSPabs(e,x,y) = std(absERSP(:,e,x,y));
       % stdERSPabsStat(e,x,y) = std(absERSPStat(:,e,x,y)); 
        
       % wilcoxontestERSP(e,x,y) = signrank(figERSP(:,e,x,y),absERSP(:,e,x,y));
       % wilcoxontestERSPStat(e,x,y) = signrank(figERSPStat(:,e,x,y),absERSPStat(:,e,x,y));
        
       % averageCompERSP(e,x,y) = mean(noCelldiffERSP(:,e,x,y));
       % stdCompERSP(e,x,y) = std(noCelldiffERSP(:,e,x,y));
            end
        end
    end
    
    