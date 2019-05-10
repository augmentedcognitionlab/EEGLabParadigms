%******WRITTEN BY ANDREAS WULFF-ABRAMSSON*****

%creates maps of the stds, average and the tests and format everyone of
%them so they follow the same standard as the the maps created by the ERSP
%maps
%function Light_createTSEmaps (locations, avrBlue, avrDarkness, avrRed, avrGreen, stdBlue, stdDarkness, stdRed, stdGreen, stat_Blue_Darkness, stat_Blue_Red, stat_Blue_Green, stat_Red_Darkness, stat_Red_Green, stat_Darkness_Green)

function Light_createTSEmaps (locations,avrDarkness , avrBlue,avrRed, avrGreen)

y = 200; 
x = 793; 

for e = 1:16 %the number of electrodes  
    electrodeInfo = locations(1,e);
    
    %Average Blue 
    titleAbs = 'Average Blue  ';
    titleAbs = strcat(titleAbs, ' - ');
    titleAbs = strcat(titleAbs,electrodeInfo.labels);
    
    avrBlueE = avrBlue(e,:,:);
    avrBlueE = reshape(avrBlueE, [x y]);
    figure 
    imagesc(avrBlueE)
    RightImagePropertiesArts(titleAbs, gca, 2);
    
    %Average Darkness 
    titleFig = 'Average Darkness  ';
    titleFig = strcat(titleFig, ' - ');
    titleFig = strcat(titleFig,electrodeInfo.labels);
    
    avrDarknessE = avrDarkness(e,:,:);
    avrDarknessE = reshape(avrDarknessE, [x y]);
    figure 
    imagesc(avrDarknessE)
    RightImagePropertiesArts(titleFig, gca, 2);
    
    %Average Red
    titleFig = 'Average Red  ';
    titleFig = strcat(titleFig, ' - ');
    titleFig = strcat(titleFig,electrodeInfo.labels);
    
    avrRedE = avrRed(e,:,:);
    avrRedE = reshape(avrRedE, [x y]);
    figure 
    imagesc(avrRedE)
    RightImagePropertiesArts(titleFig, gca, 2);
    
    %Average Green
    titleFig = 'Average Green  ';
    titleFig = strcat(titleFig, ' - ');
    titleFig = strcat(titleFig,electrodeInfo.labels);
    
    avrGreenE = avrGreen(e,:,:);
    avrGreenE = reshape(avrGreenE, [x y]);
    figure 
    imagesc(avrGreenE)
    RightImagePropertiesArts(titleFig, gca, 2);
    
    %Standard deviation Blue 
    %titleStdAbs = 'Standard deviation Blue  ';
    %titleStdAbs = strcat(titleStdAbs, ' - ');
    %titleStdAbs = strcat(titleStdAbs,electrodeInfo.labels);
    
    %stdBlueE = stdBlue(e,:,:);
    %stdBlueE = reshape(stdBlueE, [x y]);
    %figure 
    %imagesc(stdBlueE)
    %RightImagePropertiesArts(titleStdAbs , gca);
    
    %Standard deviation Darkness 
    %titleStdFig = 'Standard deviation Darkness  ';
    %titleStdFig = strcat(titleStdFig, ' - ');
    %titleStdFig = strcat(titleStdFig,electrodeInfo.labels);
    
    %stdDarknessE = stdDarkness(e,:,:);
    %stdDarknessE = reshape(stdDarknessE, [x y]);
    %figure 
    %imagesc(stdDarknessE)
    %RightImagePropertiesArts(titleStdFig , gca);
    
    %Standard deviation Red 
   % titleStdFig = 'Standard deviation Red  ';
   % titleStdFig = strcat(titleStdFig, ' - ');
   % titleStdFig = strcat(titleStdFig,electrodeInfo.labels);
    
   % stdRedE = stdRed(e,:,:);
   % stdRedE = reshape(stdRedE, [x y]);
   % figure 
   % imagesc(stdRedE)
   % RightImagePropertiesArts(titleStdFig , gca);
    
    %Standard deviation Green 
   % titleStdFig = 'Standard deviation Green  ';
   % titleStdFig = strcat(titleStdFig, ' - ');
   % titleStdFig = strcat(titleStdFig,electrodeInfo.labels);
   % 
   % stdGreenE = stdGreen(e,:,:);
   % stdGreenE = reshape(stdGreenE, [x y]);
   % figure 
   % imagesc(stdGreenE)
   % RightImagePropertiesArts(titleStdFig , gca, 3);
    
    
    %wilcoxon Ranked sum Blue vs Darkness
    %titleStdFig = 'Wilcoxon Ranked-sum test alpha=0.05 Blue vs Darkness ';
    %titleStdFig = strcat(titleStdFig, ' - ');
    %titleStdFig = strcat(titleStdFig,electrodeInfo.labels);
    
    %stat_Blue_DarknessE = stat_Blue_Darkness(e,:,:);
    %stat_Blue_DarknessE = reshape(stat_Blue_DarknessE, [x y]);
    %figure 
    %imagesc(stat_Blue_DarknessE)
    %RightImagePropertiesArts(titleStdFig , gca);
    
    %for xPos = 1:x
    %    for yPos = 1:y 
    %      if stat_Blue_DarknessE(xPos,yPos) < 0.05
    %         stat_Blue_DarknessE(xPos,yPos) = 2.0;  
    %      end
    %    end
    %end 
    %titleStdFig = 'Wilcoxon Ranked-sum test alpha=0.05  marked with value 2.0 Blue vs Darkness';
    %titleStdFig = strcat(titleStdFig, ' - ');
    %titleStdFig = strcat(titleStdFig,electrodeInfo.labels);
    %figure 
    %imagesc(stat_Blue_DarknessE)
    %RightImagePropertiesArts(titleStdFig , gca);
    
    %wilcoxon Ranked sum Blue vs Red 
   % titleStdFig = 'Wilcoxon Ranked-sum test alpha=0.05 Blue vs Red ';
   % titleStdFig = strcat(titleStdFig, ' - ');
   % titleStdFig = strcat(titleStdFig,electrodeInfo.labels);
    
   % stat_Blue_RedE = stat_Blue_Red(e,:,:);
   % stat_Blue_RedE = reshape(stat_Blue_RedE, [x y]);
   % figure 
   % imagesc(stat_Blue_RedE)
   % RightImagePropertiesArts(titleStdFig , gca);
    
   % for xPos = 1:x
   %     for yPos = 1:y 
   %       if stat_Blue_RedE(xPos,yPos) < 0.05
   %          stat_Blue_RedE(xPos,yPos) = 2.0;  
   %       end
   %     end
   % end 
   % titleStdFig = 'Wilcoxon Ranked-sum test alpha=0.05  marked with value 2.0 Blue vs Red';
   % titleStdFig = strcat(titleStdFig, ' - ');
   % titleStdFig = strcat(titleStdFig,electrodeInfo.labels);
   % figure 
   % imagesc(stat_Blue_RedE)
   % RightImagePropertiesArts(titleStdFig , gca);
    
     %wilcoxon Ranked sum Blue vs Green 
   % titleStdFig = 'Wilcoxon Ranked-sum test alpha=0.05 Blue vs Green ';
   % titleStdFig = strcat(titleStdFig, ' - ');
   % titleStdFig = strcat(titleStdFig,electrodeInfo.labels);
    
   % stat_Blue_GreenE = stat_Blue_Green(e,:,:);
   % stat_Blue_GreenE = reshape(stat_Blue_GreenE, [x y]);
   % figure 
   % imagesc(stat_Blue_GreenE)
   % RightImagePropertiesArts(titleStdFig , gca, 1);
    
   % for xPos = 1:x
   %     for yPos = 1:y 
   %       if stat_Blue_GreenE(xPos,yPos) < 0.05
   %          stat_Blue_GreenE(xPos,yPos) = 2.0;  
   %       end
   %     end
   % end 
   % titleStdFig = 'Wilcoxon Ranked-sum test alpha=0.05  marked with value 2.0 Blue vs Green';
   % titleStdFig = strcat(titleStdFig, ' - ');
   % titleStdFig = strcat(titleStdFig,electrodeInfo.labels);
   % figure 
   % imagesc(stat_Blue_GreenE)
   % RightImagePropertiesArts(titleStdFig , gca, 1);
   % 
     %wilcoxon Ranked sum Red vs Darkness 
   % titleStdFig = 'Wilcoxon Ranked-sum test alpha=0.05 Red vs Darkness ';
   % titleStdFig = strcat(titleStdFig, ' - ');
   % titleStdFig = strcat(titleStdFig,electrodeInfo.labels);
   % 
   % stat_Red_DarknessE = stat_Red_Darkness(e,:,:);
   % stat_Red_DarknessE = reshape(stat_Red_DarknessE, [x y]);
   % figure 
   % imagesc(stat_Red_DarknessE)
   % RightImagePropertiesArts(titleStdFig , gca);
   % 
   % for xPos = 1:x
   %     for yPos = 1:y 
   %       if stat_Red_DarknessE(xPos,yPos) < 0.05
   %          stat_Red_DarknessE(xPos,yPos) = 2.0;  
   %       end
   %     end
   % end 
   % titleStdFig = 'Wilcoxon Ranked-sum test alpha=0.05  marked with value 2.0 Red vs Darkness';
   % titleStdFig = strcat(titleStdFig, ' - ');
   % titleStdFig = strcat(titleStdFig,electrodeInfo.labels);
   % figure 
   % imagesc(stat_Red_DarknessE)
   % RightImagePropertiesArts(titleStdFig , gca);
    
    %wilcoxon Ranked sum Red vs Green 
   % titleStdFig = 'Wilcoxon Ranked-sum test alpha=0.05 Red vs Green ';
   % titleStdFig = strcat(titleStdFig, ' - ');
   % titleStdFig = strcat(titleStdFig,electrodeInfo.labels);
    
   % stat_Red_GreenE = stat_Red_Green(e,:,:);
   % stat_Red_GreenE = reshape(stat_Red_GreenE, [x y]);
   % figure 
   % imagesc(stat_Red_GreenE)
   % RightImagePropertiesArts(titleStdFig , gca, 1);
    
   % for xPos = 1:x
   %     for yPos = 1:y 
   %       if stat_Red_GreenE(xPos,yPos) < 0.05
   %          stat_Red_GreenE(xPos,yPos) = 2.0;  
   %       end
   %     end
   % end 
   % titleStdFig = 'Wilcoxon Ranked-sum test alpha=0.05  marked with value 2.0 Red vs Green';
   % titleStdFig = strcat(titleStdFig, ' - ');
   % titleStdFig = strcat(titleStdFig,electrodeInfo.labels);
   % figure 
   % imagesc(stat_Red_GreenE)
   % RightImagePropertiesArts(titleStdFig , gca, 1);
    
    %wilcoxon Ranked sum Darkness vs Green 
   % titleStdFig = 'Wilcoxon Ranked-sum test alpha=0.05 Darkness vs Green ';
   % titleStdFig = strcat(titleStdFig, ' - ');
   % titleStdFig = strcat(titleStdFig,electrodeInfo.labels);
   % 
   % stat_Darkness_GreenE = stat_Darkness_Green(e,:,:);
   % stat_Darkness_GreenE = reshape(stat_Darkness_GreenE, [x y]);
   % figure 
   % imagesc(stat_Darkness_GreenE)
   % RightImagePropertiesArts(titleStdFig , gca, 1);
   % 
   % for xPos = 1:x
   %     for yPos = 1:y 
   %       if stat_Darkness_GreenE(xPos,yPos) < 0.05
   %          stat_Darkness_GreenE(xPos,yPos) = 2.0;  
   %       end
   %     end
   % end 
   % titleStdFig = 'Wilcoxon Ranked-sum test alpha=0.05  marked with value 2.0 Darkness vs Green';
   % titleStdFig = strcat(titleStdFig, ' - ');
   % titleStdFig = strcat(titleStdFig,electrodeInfo.labels);
   % figure 
   % imagesc(stat_Darkness_GreenE)
   % RightImagePropertiesArts(titleStdFig , gca, 1);
    
end 
