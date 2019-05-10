function ManyBoxPlot_forLightConditions (featureName, chanlocs,  data1, dataname1, data2, dataname2,...
    data3, dataname3, data4, dataname4, data5, dataname5)

s = size(chanlocs);

for i=1:s(2)
figure('units','normalized','outerposition',[0 0 1 1])

ndata1 = data1(:,i); 
ndata2 = data2(:,i); 
ndata3 = data3(:,i); 
ndata4 = data4(:,i); 
ndata5 = data5(:,i); 


[collectedData, TM] = padcat(ndata1,ndata2,ndata3,ndata4,ndata5);

for k=1:6
      for j=1:6
          if k == 6 || j == 6
              pvals(k,j) = 1; 
          else
          pvals(k,j) = ranksum(collectedData(:,k),collectedData(:,j));
          end 
      end
end

for k=1:5
      for j=1:5
          if pvals(k,j) > 0.05 && pvals(k,j) < 0.3
          pvals(k,j) = 0.3;
          end 
          
          if pvals(k,j) < 0.01
              pvals(k,j) = 0.005;
          end
          
          if pvals(k,j) < 0.05
              pvals(k,j) = 0.02;
          end
      end
end

pcolor(pvals)
colorbar

dataLabel1 = strcat(dataname1, featureName);
  dataLabel2 = strcat(dataname2, featureName);
  dataLabel3 = strcat(dataname3, featureName);
  dataLabel4 = strcat(dataname4, featureName);
  dataLabel5 = strcat(dataname5, featureName);

xticks([1 2 3 4 5]);
set(gca,'XTickLabel',{dataLabel1,dataLabel2,dataLabel3,dataLabel4...
      ,dataLabel5});
  xtickangle(45)
  yticks([1 2 3 4 5 ]);
  set(gca,'YTickLabel',{dataLabel1,dataLabel2,dataLabel3,dataLabel4...
      ,dataLabel5});
  
  tit = strcat (chanlocs(i).labels , featureName);
  tit = strcat (tit, ' Wilcoxon ranked sum test p values');
  
  title(tit); 
  
  titp = strcat(tit, '.png');
  saveas(gcf,titp)
  titf = strcat(tit, '.fig');
  saveas(gcf,titf)
  
figure('units','normalized','outerposition',[0 0 1 1])
pos = [ones(size(ndata1)); 2* ones(size(ndata2)); 3* ones(size(ndata3))...
    ; 4* ones(size(ndata4)); 5* ones(size(ndata5))]; 
  
boxplot([ndata1; ndata2; ndata3; ndata4; ndata5], pos); 

  
  set(gca,'XTickLabel',{dataLabel1,dataLabel2,dataLabel3,dataLabel4...
      ,dataLabel5});
 xtickangle(45);
 
  title({chanlocs(i).labels , featureName}); 
  namePng = strcat(featureName, ' ');
  namePng = strcat(namePng, chanlocs(i).labels);
  namePng = strcat(namePng, ' AllCondition.png' );
  
    namefig = strcat(featureName, ' ');
  namefig = strcat(namefig, chanlocs(i).labels);
  namefig = strcat(namefig, ' AllCondition.fig' );
  
  saveas(gcf,namePng)
  saveas(gcf,namefig)
  
   
end

end