function IsolateSignificantAreasFrom3Comp (locations, avr1,avr1Name, stat_1_2, stat_1_3, stat_1_4 ) 
electrodes = length(locations); 
y = 200; 
x = 793; 
isoSignAvr1 = zeros(x, y); 

isoSignAvr1maps = zeros(electrodes,x, y);
for e = 1:electrodes
    electrodeInfo = locations(1,e);
    
     titleAbs = 'Isolated Significant in ';
    titleAbs = strcat(titleAbs, ' - ');
    titleAbs = strcat(titleAbs, avr1Name);
    titleAbs = strcat(titleAbs, ' - ');
    titleAbs = strcat(titleAbs,electrodeInfo.labels);
    titleAbs = strcat(titleAbs, ' - ');
    titleAbs = strcat(titleAbs, avr1Name);
    titleAbs = strcat(titleAbs, 'vs');
    titleAbs = strcat(titleAbs, ' - all');
    
     for xpos = 1:x
        for ypos = 1:y
            if stat_1_2(e, xpos, ypos) < 0.05 
                isoSignAvr1(xpos, ypos) = avr1(e,xpos,ypos);      
                isoSignAvr1maps(e,xpos, ypos) = avr1(e,xpos,ypos);
            else
                isoSignAvr1(xpos, ypos) = 0.0; 
                isoSignAvr1maps(e,xpos, ypos) = 0.0; 
            end
            
            if stat_1_3(e, xpos, ypos) < 0.05
                isoSignAvr1(xpos, ypos) = isoSignAvr1(xpos, ypos);
                isoSignAvr1maps(e,xpos, ypos) = isoSignAvr1maps(e,xpos, ypos); 
            else
                isoSignAvr1(xpos, ypos) = 0.0; 
                 isoSignAvr1maps(e,xpos, ypos) = 0.0; 
            end
            
            if stat_1_4(e, xpos, ypos) < 0.05
                isoSignAvr1(xpos, ypos) = isoSignAvr1(xpos, ypos);
                isoSignAvr1maps(e,xpos, ypos) =isoSignAvr1maps(e,xpos, ypos);
            else
                isoSignAvr1(xpos, ypos) = 0.0; 
                 isoSignAvr1maps(e,xpos, ypos) = 0.0; 
            end
        end
    end
    figure 
    imagesc(isoSignAvr1)
    RightImagePropertiesArts(titleAbs, gca, 2);
    
end
filename = avr1Name; 
    filename = strcat(filename, ' - ');
    filename = strcat(filename, 'agaist all');
save(filename,'isoSignAvr1maps');
end