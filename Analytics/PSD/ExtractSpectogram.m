% EEGLAB history file generated on the 13-Mar-2019
% ------------------------------------------------
% Clear memory and the command WinningLeveldow
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
            EEG = pop_loadset('filename', [files(n).name], 'filepath', 'D:\\AAU\\Experiments\\MarioERP\\ERPS\\Epochs\\WinningLevel');
            
            setname = EEG.setname; 
        
nChans = EEG.nbchan; 
figure; 
[specOut] = pop_spectopo(EEG, 1, [-199.2188  996.0938], 'EEG' , 'freq', [6 10 22], 'freqrange',[0.5 100],'electrodes','off');
for i=1:nChans
    for j=1:length(specOut)
WinningLevelSpecs(n,i,j) = specOut(i,j); 
    end
end
    end
 s = size(WinningLevelSpecs);
 % extract the power of the bands per person 
   %Delta 0 - 3 Hz, Theta 4- 7Hz, Alpha 8 - 12 Hz, Beta 13 - 32Hz,  
   %Gamma 33 - 48Hz
   %plot shows that Hz 50 = index 51, therefore everthing has to denoted
   %one higher than what we want. 
  deltaWinningLevelSpecs = WinningLevelSpecs(:,:,2:4);  
  thetaWinningLevelSpecs = WinningLevelSpecs(:,:,5:8);
  alphaWinningLevelSpecs = WinningLevelSpecs(:,:,9:13);
  betaWinningLevelSpecs = WinningLevelSpecs(:,:,14:33);
  gammaWinningLevelSpecs = WinningLevelSpecs(:,:,34:49);
  for i=1:s(1)
      for j= 1:s(2)
          sumWinningLevelDelta(i,j) = sum(deltaWinningLevelSpecs(i,j,:));
          sumWinningLevelTheta(i,j) = sum(thetaWinningLevelSpecs(i,j,:));
          sumWinningLevelAlpha(i,j) = sum(alphaWinningLevelSpecs(i,j,:));
          sumWinningLevelBeta(i,j) = sum(betaWinningLevelSpecs(i,j,:));
          sumWinningLevelGamma(i,j) = sum(gammaWinningLevelSpecs(i,j,:));
      end
  end
      
  for i=1:s(2)
     avrSumWinningLevelDelta(i) = mean(sumWinningLevelDelta(:,i));   
      avrSumWinningLevelTheta(i) = mean(sumWinningLevelTheta(:,i)); 
     avrSumWinningLevelAlpha(i) = mean(sumWinningLevelAlpha(:,i));
     avrSumWinningLevelBeta(i) = mean(sumWinningLevelBeta(:,i));
     avrSumWinningLevelGamma(i) = mean(sumWinningLevelGamma(:,i));

  end
  chanLocs = EEG.chanlocs; 
  plotTopo (avrSumWinningLevelDelta, 'Delta WinningLevel', chanLocs, -20)
   plotTopo (avrSumWinningLevelTheta, 'Theta WinningLevel', chanLocs, -30)
  plotTopo (avrSumWinningLevelAlpha, 'Alpha WinningLevel', chanLocs, -50)
  plotTopo (avrSumWinningLevelBeta, 'Beta WinningLevel', chanLocs, -250)
   plotTopo (avrSumWinningLevelGamma, 'Gamma WinningLevel', chanLocs, -275)
  
  
  
   for i=1:s(3)
       for j= 1:nChans
   stdWinningLevelSpecs(j,i) = std(WinningLevelSpecs(:,j,i));        
   averageWinningLevelSpecs(j,i) = mean(WinningLevelSpecs(:,j,i));
       end
   end
  
  save('WinningLevelSpec','WinningLevelSpecs','deltaWinningLevelSpecs', 'thetaWinningLevelSpecs', 'alphaWinningLevelSpecs', 'betaWinningLevelSpecs', 'gammaWinningLevelSpecs','sumWinningLevelDelta','sumWinningLevelTheta','sumWinningLevelAlpha','sumWinningLevelBeta','sumWinningLevelGamma','averageWinningLevelSpecs','stdWinningLevelSpecs');  
   
function plotTopo (data, dataTypeTitle, chanLocs, negativelimits)
 figure
  topoplot(data, chanLocs,'electrodes','labels', 'maplimits',[negativelimits abs(negativelimits)]);
  title(dataTypeTitle);
  colorbar
  namePng = strcat(dataTypeTitle,'.png');
  namefig = strcat(dataTypeTitle,'.fig');
  saveas(gcf,namePng)
  saveas(gcf,namefig)
end
