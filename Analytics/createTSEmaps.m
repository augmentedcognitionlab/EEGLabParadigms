%creates maps of the stds, average and the tests and format everyone of
%them so they follow the same standard as the the maps created by the ERSP
%maps
function createTSEmaps (locations, avrAbs, avrFig, stdAbs, stdFig, stat)

y = 200; 
x = 793; 

for e = 1:20 %the number of electrodes  
    electrodeInfo = locations(1,e);
    
    titleAbs = 'Average Abs  ';
    titleAbs = strcat(titleAbs, ' - ');
    titleAbs = strcat(titleAbs,electrodeInfo.labels);
    
    avrAbsE = avrAbs(e,:,:);
    avrAbsE = reshape(avrAbsE, [x y]);
    figure 
    imagesc(avrAbsE)
    RightImagePropertiesArts(titleAbs, gca);
    
    titleFig = 'Average Fig  ';
    titleFig = strcat(titleFig, ' - ');
    titleFig = strcat(titleFig,electrodeInfo.labels);
    
    avrFigE = avrFig(e,:,:);
    avrFigE = reshape(avrFigE, [x y]);
    figure 
    imagesc(avrFigE)
    RightImagePropertiesArts(titleFig, gca);
    
    titleStdAbs = 'Standard deviation Abs  ';
    titleStdAbs = strcat(titleStdAbs, ' - ');
    titleStdAbs = strcat(titleStdAbs,electrodeInfo.labels);
    
    stdAbsE = stdAbs(e,:,:);
    stdAbsE = reshape(stdAbsE, [x y]);
    figure 
    imagesc(stdAbsE)
    RightImagePropertiesArts(titleStdAbs , gca);
    
    titleStdFig = 'Standard deviation Fig  ';
    titleStdFig = strcat(titleStdFig, ' - ');
    titleStdFig = strcat(titleStdFig,electrodeInfo.labels);
    
    stdFigE = stdFig(e,:,:);
    stdFigE = reshape(stdFigE, [x y]);
    figure 
    imagesc(stdFigE)
    RightImagePropertiesArts(titleStdFig , gca);
    
    titleStdFig = 'Wilcoxon Ranked-sum test alpha=0.05  ';
    titleStdFig = strcat(titleStdFig, ' - ');
    titleStdFig = strcat(titleStdFig,electrodeInfo.labels);
    
    statE = stat(e,:,:);
    statE = reshape(statE, [x y]);
    figure 
    imagesc(statE)
    RightImagePropertiesArts(titleStdFig , gca);
    
    for xPos = 1:x
        for yPos = 1:y 
          if statE(xPos,yPos) < 0.05
             statE(xPos,yPos) = 2.0;  
          end
        end
    end 
    titleStdFig = 'Wilcoxon Ranked-sum test alpha=0.05 marked with value 2.0';
    titleStdFig = strcat(titleStdFig, ' - ');
    titleStdFig = strcat(titleStdFig,electrodeInfo.labels);
    figure 
    imagesc(statE)
    RightImagePropertiesArts(titleStdFig , gca);
end 
