%******WRITTEN BY ANDREAS WULFF-ABRAMSSON*****

%creates maps of the stds, average and the tests and format everyone of
%them so they follow the same standard as the the maps created by the ERSP
%maps
function A_M_createTSEmaps (locations, avrApMp, avrApMm, avrAmMP, avrAmMm, stdApMp, stdApMm, stdAmMP, stdAmMm, stat_ApMp_ApMm, stat_ApMp_AmMp, stat_ApMp_AmMm, stat_AmMp_ApMm, stat_AmMp_AmMm, stat_ApMm_AmMm)

y = 200; 
x = 793; 

for e = 1:20 %the number of electrodes  
    electrodeInfo = locations(1,e);
    
    %Average A+M+ 
    titleAbs = 'Average A+M+  ';
    titleAbs = strcat(titleAbs, ' - ');
    titleAbs = strcat(titleAbs,electrodeInfo.labels);
    
    avrApMpE = avrApMp(e,:,:);
    avrApMpE = reshape(avrApMpE, [x y]);
    figure 
    imagesc(avrApMpE)
    RightImagePropertiesArts(titleAbs, gca, 2);
    
    %Average A+M- 
    titleFig = 'Average A+M-  ';
    titleFig = strcat(titleFig, ' - ');
    titleFig = strcat(titleFig,electrodeInfo.labels);
    
    avrApMmE = avrApMm(e,:,:);
    avrApMmE = reshape(avrApMmE, [x y]);
    figure 
    imagesc(avrApMmE)
    RightImagePropertiesArts(titleFig, gca, 2);
    
    %Average A-M+
    titleFig = 'Average A-M+  ';
    titleFig = strcat(titleFig, ' - ');
    titleFig = strcat(titleFig,electrodeInfo.labels);
    
    avrAmMPE = avrAmMP(e,:,:);
    avrAmMPE = reshape(avrAmMPE, [x y]);
    figure 
    imagesc(avrAmMPE)
    RightImagePropertiesArts(titleFig, gca ,2);
    
    %Average A-M-
    titleFig = 'Average A-M-  ';
    titleFig = strcat(titleFig, ' - ');
    titleFig = strcat(titleFig,electrodeInfo.labels);
    
    avrAmMmE = avrAmMm(e,:,:);
    avrAmMmE = reshape(avrAmMmE, [x y]);
    figure 
    imagesc(avrAmMmE)
    RightImagePropertiesArts(titleFig, gca, 2);
    
    %Standard deviation A+M+ 
    titleStdAbs = 'Standard deviation A+M+  ';
    titleStdAbs = strcat(titleStdAbs, ' - ');
    titleStdAbs = strcat(titleStdAbs,electrodeInfo.labels);
    
    stdApMpE = stdApMp(e,:,:);
    stdApMpE = reshape(stdApMpE, [x y]);
    figure 
    imagesc(stdApMpE)
    RightImagePropertiesArts(titleStdAbs , gca, 3);
    
    %Standard deviation A+M- 
    titleStdFig = 'Standard deviation A+M-  ';
    titleStdFig = strcat(titleStdFig, ' - ');
    titleStdFig = strcat(titleStdFig,electrodeInfo.labels);
    
    stdApMmE = stdApMm(e,:,:);
    stdApMmE = reshape(stdApMmE, [x y]);
    figure 
    imagesc(stdApMmE)
    RightImagePropertiesArts(titleStdFig , gca, 3);
    
    %Standard deviation A-M+ 
    titleStdFig = 'Standard deviation A-M+  ';
    titleStdFig = strcat(titleStdFig, ' - ');
    titleStdFig = strcat(titleStdFig,electrodeInfo.labels);
    
    stdAmMPE = stdAmMP(e,:,:);
    stdAmMPE = reshape(stdAmMPE, [x y]);
    figure 
    imagesc(stdAmMPE)
    RightImagePropertiesArts(titleStdFig , gca, 3);
    
    %Standard deviation A-M- 
    titleStdFig = 'Standard deviation A-M-  ';
    titleStdFig = strcat(titleStdFig, ' - ');
    titleStdFig = strcat(titleStdFig,electrodeInfo.labels);
    
    stdAmMmE = stdAmMm(e,:,:);
    stdAmMmE = reshape(stdAmMmE, [x y]);
    figure 
    imagesc(stdAmMmE)
    RightImagePropertiesArts(titleStdFig , gca, 3);
    
    
    %wilcoxon Ranked sum ApMp vs ApMm
    titleStdFig = 'Wilcoxon Ranked-sum test alpha=0.05 A+M+ vs A+M- ';
    titleStdFig = strcat(titleStdFig, ' - ');
    titleStdFig = strcat(titleStdFig,electrodeInfo.labels);
    
    stat_ApMp_ApMmE = stat_ApMp_ApMm(e,:,:);
    stat_ApMp_ApMmE = reshape(stat_ApMp_ApMmE, [x y]);
    figure 
    imagesc(stat_ApMp_ApMmE)
    RightImagePropertiesArts(titleStdFig , gca, 1);
    
    for xPos = 1:x
        for yPos = 1:y 
          if stat_ApMp_ApMmE(xPos,yPos) < 0.05
             stat_ApMp_ApMmE(xPos,yPos) = 2.0;  
          end
        end
    end 
    titleStdFig = 'Wilcoxon Ranked-sum test alpha=0.05  marked with value 2.0 A+M+ vs A+M-';
    titleStdFig = strcat(titleStdFig, ' - ');
    titleStdFig = strcat(titleStdFig,electrodeInfo.labels);
    figure 
    imagesc(stat_ApMp_ApMmE)
    RightImagePropertiesArts(titleStdFig , gca, 1);
    
    %wilcoxon Ranked sum ApMp vs AmMp 
    titleStdFig = 'Wilcoxon Ranked-sum test alpha=0.05 A+M+ vs A-M+ ';
    titleStdFig = strcat(titleStdFig, ' - ');
    titleStdFig = strcat(titleStdFig,electrodeInfo.labels);
    
    stat_ApMp_AmMpE = stat_ApMp_AmMp(e,:,:);
    stat_ApMp_AmMpE = reshape(stat_ApMp_AmMpE, [x y]);
    figure 
    imagesc(stat_ApMp_AmMpE)
    RightImagePropertiesArts(titleStdFig , gca, 1);
    
    for xPos = 1:x
        for yPos = 1:y 
          if stat_ApMp_AmMpE(xPos,yPos) < 0.05
             stat_ApMp_AmMpE(xPos,yPos) = 2.0;  
          end
        end
    end 
    titleStdFig = 'Wilcoxon Ranked-sum test alpha=0.05  marked with value 2.0 A+M+ vs A-M+';
    titleStdFig = strcat(titleStdFig, ' - ');
    titleStdFig = strcat(titleStdFig,electrodeInfo.labels);
    figure 
    imagesc(stat_ApMp_AmMpE)
    RightImagePropertiesArts(titleStdFig , gca, 1);
    
     %wilcoxon Ranked sum ApMp vs AmMm 
    titleStdFig = 'Wilcoxon Ranked-sum test alpha=0.05 A+M+ vs A-M- ';
    titleStdFig = strcat(titleStdFig, ' - ');
    titleStdFig = strcat(titleStdFig,electrodeInfo.labels);
    
    stat_ApMp_AmMmE = stat_ApMp_AmMm(e,:,:);
    stat_ApMp_AmMmE = reshape(stat_ApMp_AmMmE, [x y]);
    figure 
    imagesc(stat_ApMp_AmMmE)
    RightImagePropertiesArts(titleStdFig , gca, 1);
    
    for xPos = 1:x
        for yPos = 1:y 
          if stat_ApMp_AmMmE(xPos,yPos) < 0.05
             stat_ApMp_AmMmE(xPos,yPos) = 2.0;  
          end
        end
    end 
    titleStdFig = 'Wilcoxon Ranked-sum test alpha=0.05  marked with value 2.0 A+M+ vs A-M-';
    titleStdFig = strcat(titleStdFig, ' - ');
    titleStdFig = strcat(titleStdFig,electrodeInfo.labels);
    figure 
    imagesc(stat_ApMp_AmMmE)
    RightImagePropertiesArts(titleStdFig , gca, 1);
    
     %wilcoxon Ranked sum AmMp vs ApMm 
    titleStdFig = 'Wilcoxon Ranked-sum test alpha=0.05 A-M+ vs A+M- ';
    titleStdFig = strcat(titleStdFig, ' - ');
    titleStdFig = strcat(titleStdFig,electrodeInfo.labels);
    
    stat_AmMp_ApMmE = stat_AmMp_ApMm(e,:,:);
    stat_AmMp_ApMmE = reshape(stat_AmMp_ApMmE, [x y]);
    figure 
    imagesc(stat_AmMp_ApMmE)
    RightImagePropertiesArts(titleStdFig , gca, 1);
    
    for xPos = 1:x
        for yPos = 1:y 
          if stat_AmMp_ApMmE(xPos,yPos) < 0.05
             stat_AmMp_ApMmE(xPos,yPos) = 2.0;  
          end
        end
    end 
    titleStdFig = 'Wilcoxon Ranked-sum test alpha=0.05  marked with value 2.0 A-M+ vs A+M-';
    titleStdFig = strcat(titleStdFig, ' - ');
    titleStdFig = strcat(titleStdFig,electrodeInfo.labels);
    figure 
    imagesc(stat_AmMp_ApMmE)
    RightImagePropertiesArts(titleStdFig , gca, 1);
    
    %wilcoxon Ranked sum AmMp vs AmMm 
    titleStdFig = 'Wilcoxon Ranked-sum test alpha=0.05 A-M+ vs A-M- ';
    titleStdFig = strcat(titleStdFig, ' - ');
    titleStdFig = strcat(titleStdFig,electrodeInfo.labels);
    
    stat_AmMp_AmMmE = stat_AmMp_AmMm(e,:,:);
    stat_AmMp_AmMmE = reshape(stat_AmMp_AmMmE, [x y]);
    figure 
    imagesc(stat_AmMp_AmMmE)
    RightImagePropertiesArts(titleStdFig , gca, 1);
    
    for xPos = 1:x
        for yPos = 1:y 
          if stat_AmMp_AmMmE(xPos,yPos) < 0.05
             stat_AmMp_AmMmE(xPos,yPos) = 2.0;  
          end
        end
    end 
    titleStdFig = 'Wilcoxon Ranked-sum test alpha=0.05  marked with value 2.0 A-M+ vs A-M-';
    titleStdFig = strcat(titleStdFig, ' - ');
    titleStdFig = strcat(titleStdFig,electrodeInfo.labels);
    figure 
    imagesc(stat_AmMp_AmMmE)
    RightImagePropertiesArts(titleStdFig , gca, 1);
    
    %wilcoxon Ranked sum ApMm vs AmMm 
    titleStdFig = 'Wilcoxon Ranked-sum test alpha=0.05 A+M- vs A-M- ';
    titleStdFig = strcat(titleStdFig, ' - ');
    titleStdFig = strcat(titleStdFig,electrodeInfo.labels);
    
    stat_ApMm_AmMmE = stat_ApMm_AmMm(e,:,:);
    stat_ApMm_AmMmE = reshape(stat_ApMm_AmMmE, [x y]);
    figure 
    imagesc(stat_ApMm_AmMmE)
    RightImagePropertiesArts(titleStdFig , gca, 1);
    
    for xPos = 1:x
        for yPos = 1:y 
          if stat_ApMm_AmMmE(xPos,yPos) < 0.05
             stat_ApMm_AmMmE(xPos,yPos) = 2.0;  
          end
        end
    end 
    titleStdFig = 'Wilcoxon Ranked-sum test alpha=0.05  marked with value 2.0 A+M- vs A-M-';
    titleStdFig = strcat(titleStdFig, ' - ');
    titleStdFig = strcat(titleStdFig,electrodeInfo.labels);
    figure 
    imagesc(stat_ApMm_AmMmE)
    RightImagePropertiesArts(titleStdFig , gca, 1);
    
    
    
end
%isolate the ERD And ERS responding to the significant areas. 

    IsolateSignificantAreas(locations, avrApMp, 'A+M+', avrAmMm, 'A-M-', stat_ApMp_AmMm);
    IsolateSignificantAreas(locations, avrApMp, 'A+M+', avrApMm, 'A+M-', stat_ApMp_ApMp);
    IsolateSignificantAreas(locations, avrApMp, 'A+M+', avrAmMp, 'A-M+', stat_ApMp_AmMp);
    IsolateSignificantAreas(locations, avrAmMp, 'A-M+', avrApMm, 'A+M-', stat_AmMp_ApMm);
    IsolateSignificantAreas(locations, avrAmMp, 'A-M+', avrAmMm, 'A-M-', stat_AmMp_AmMm);
    IsolateSignificantAreas(locations, avrApMm, 'A+M-', avrAmMm, 'A-M-', stat_ApMm_AmMm);

% now find the significant components which are agreed among the
% comparissons 

    IsolateSignificantAreasFrom3Comp(locations, avrAmMp, 'A-M+', stat_ApMp_AmMp, stat_AmMp_AmMm, stat_AmMp_ApMm);
    IsolateSignificantAreasFrom3Comp(locations, avrAmMm, 'A-M-', stat_ApMp_AmMm, stat_AmMp_AmMm, stat_AmMp_ApMm);
    IsolateSignificantAreasFrom3Comp(locations, avrApMp, 'A+M+', stat_ApMp_AmMp, stat_ApMp_AmMm, stat_ApMp_ApMm);
    IsolateSignificantAreasFrom3Comp(locations, avrAmMm, 'A-M-', stat_AmMp_AmMm, stat_ApMp_AmMm, stat_AmMm_ApMm);
    
end