function IsolateSignificantAreas (locations, avr1,avr1Name, avr2,avr2Name, stat_1_2 ) 
electrodes = length(locations); 
y = 200; 
x = 793; 
isoSignAvr1 = zeros(x, y); 
isoSignAvr2 = zeros(x, y);
isoSignAvr1maps = zeros(electrodes,x, y);
isoSignAvr2maps = zeros(electrodes,x, y);

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
    titleAbs = strcat(titleAbs, avr2Name);
    
    titleAbs2 = 'Isolated Significant in ';
    titleAbs2 = strcat(titleAbs2, ' - ');
    titleAbs2 = strcat(titleAbs2, avr2Name);
    titleAbs2 = strcat(titleAbs2, ' - ');
    titleAbs2 = strcat(titleAbs2,electrodeInfo.labels);
    titleAbs2 = strcat(titleAbs2, ' - ');
    titleAbs2 = strcat(titleAbs2, avr1Name);
    titleAbs2 = strcat(titleAbs2, 'vs');
    titleAbs2 = strcat(titleAbs2, avr2Name);
    
    for xpos = 1:x
        for ypos = 1:y
            if stat_1_2(e, xpos, ypos) < 0.05 
                isoSignAvr1(xpos, ypos) = avr1(e,xpos,ypos);
                isoSignAvr2(xpos, ypos) = avr2(e,xpos,ypos); 
                isoSignAvr1maps(e,xpos, ypos) = avr1(e,xpos,ypos);
                isoSignAvr2maps(e,xpos, ypos) = avr2(e,xpos,ypos);
            else
                isoSignAvr1(xpos, ypos) = 0.0; 
                isoSignAvr2(xpos, ypos) = 0.0; 
                isoSignAvr1maps(e,xpos, ypos) = 0.0; 
                isoSignAvr2maps(e,xpos, ypos) = 0.0; 
            end
            
        end
    end
   
    figure 
    imagesc(isoSignAvr1)
    RightImagePropertiesArts(titleAbs, gca, 2);
    
     figure 
    imagesc(isoSignAvr2)
    RightImagePropertiesArts(titleAbs2, gca, 2);
    
    
end
filename = avr1Name; 
    filename = strcat(filename, ' - ');
    filename = strcat(filename, avr2Name);
save(filename,'isoSignAvr1maps', 'isoSignAvr2maps'); 

end