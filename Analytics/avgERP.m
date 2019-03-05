%ERPs Average and or Grandaverage 
%all dependen on the amount of loaded datasets 
function [averageERP, avgWObaseline] = avgERP(EEG,baseline)
baselinesamples = baseline/(1000/256); 
totalDatasets = length(EEG);
averageERP = zeros(length(EEG(1).data(:,1,1)),length(EEG(1).data(1,:,1)));
avgWObaseline = zeros(length(EEG(1).data(:,1,1)),length(EEG(1).data(1,:,1)));
totEpochs = 0; 
    for s = 1:totalDatasets
        for e = 1: length(EEG(s).data(:,1,1))
            for ep = 1: length(EEG(s).data(e,1,:))
                for t = 1: length(EEG(1).data(e,:,ep))
                    averageERP(e,t) = averageERP(e,t) + EEG(s).data(e,t,ep);
                end
            end
        end
        totEpochs = totEpochs + length(EEG(s).data(1,1,:));
    end
    
    for e = 1: length(EEG(1).data(:,1,1))
        for t = 1: length(EEG(1).data(1,:,1))
            averageERP(e,t) = averageERP(e,t)/totEpochs; 
            if t>baselinesamples 
                avgWObaseline(e,t) = averageERP(e,t);
            end
        end
    end
    
end