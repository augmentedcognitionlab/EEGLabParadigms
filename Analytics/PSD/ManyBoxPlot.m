function ManyBoxPlot (featureName, chanlocs,  data1, dataname1, data2, dataname2,...
    data3, dataname3, data4, dataname4, data5, dataname5, data6, dataname6,...
    data7, dataname7, data8, dataname8, data9, dataname9, data10, dataname10,...
    data11, dataname11,data12, dataname12,data13, dataname13,data14, dataname14,...
    data15, dataname15,data16, dataname16,data17, dataname17,data18, dataname18,...
    data19, dataname19,data20, dataname20,data21, dataname21,data22, dataname22,...
    data23, dataname23,data24, dataname24,data25, dataname25,data26, dataname26,...
    data27, dataname27,data28, dataname28,data29, dataname29,data30, dataname30,...
    data31, dataname31,data32, dataname32,data33, dataname33)

s = size(chanlocs);

for i=1:s(2)
figure('units','normalized','outerposition',[0 0 1 1])

ndata1 = data1(:,i); 
ndata2 = data2(:,i); 
ndata3 = data3(:,i); 
ndata4 = data4(:,i); 
ndata5 = data5(:,i); 
ndata6 = data6(:,i); 
ndata7 = data7(:,i); 
ndata8 = data8(:,i); 
ndata9 = data9(:,i); 
ndata10 = data10(:,i); 
ndata11 = data11(:,i); 
ndata12 = data12(:,i); 
ndata13 = data13(:,i); 
ndata14 = data14(:,i); 
ndata15 = data15(:,i); 
ndata16 = data16(:,i); 
ndata17 = data17(:,i); 
ndata18 = data18(:,i); 
ndata19 = data19(:,i); 
ndata20 = data20(:,i); 
ndata21 = data21(:,i); 
ndata22 = data22(:,i); 
ndata23 = data23(:,i); 
ndata24 = data24(:,i); 
ndata25 = data25(:,i); 
ndata26 = data26(:,i); 
ndata27 = data27(:,i); 
ndata28 = data28(:,i); 
ndata29 = data29(:,i); 
ndata30 = data30(:,i); 
ndata31 = data31(:,i); 
ndata32 = data32(:,i); 
ndata33 = data33(:,i); 

[collectedData, TM] = padcat(ndata1,ndata2,ndata3,ndata4,ndata5, ndata6, ndata7, ndata8, ndata9, ndata10, ndata11,...
    ndata12, ndata13, ndata14, ndata15, ndata16, ndata17, ndata18, ndata19, ndata20, ndata21,ndata22, ndata23, ...
    ndata24, ndata25, ndata26, ndata27, ndata28, ndata29, ndata30, ndata31, ndata32, ndata33);

for k=1:34
      for j=1:34
          if k == 34 || j == 34
              pvals(k,j) = 1; 
          else
          pvals(k,j) = ranksum(collectedData(:,k),collectedData(:,j));
          end 
      end
end

for k=1:33
      for j=1:33
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
  dataLabel6 = strcat(dataname6, featureName);
  dataLabel7 = strcat(dataname7, featureName);
  dataLabel8 = strcat(dataname8, featureName);
  dataLabel9 = strcat(dataname9, featureName);
  dataLabel10 = strcat(dataname10, featureName);
  dataLabel11 = strcat(dataname11, featureName);
  dataLabel12 = strcat(dataname12, featureName);
  dataLabel13 = strcat(dataname13, featureName);
  dataLabel14 = strcat(dataname14, featureName);
  dataLabel15 = strcat(dataname15, featureName);
  dataLabel16 = strcat(dataname16, featureName);
  dataLabel17 = strcat(dataname17, featureName);
  dataLabel18 = strcat(dataname18, featureName);
  dataLabel19 = strcat(dataname19, featureName);
  dataLabel20 = strcat(dataname20, featureName);
  dataLabel21 = strcat(dataname21, featureName);
  dataLabel22 = strcat(dataname22, featureName);
  dataLabel23 = strcat(dataname23, featureName);
  dataLabel24 = strcat(dataname24, featureName);
  dataLabel25 = strcat(dataname25, featureName);
  dataLabel26 = strcat(dataname26, featureName);
  dataLabel27 = strcat(dataname27, featureName);
  dataLabel28 = strcat(dataname28, featureName);
  dataLabel29 = strcat(dataname29, featureName);
  dataLabel30 = strcat(dataname30, featureName);
  dataLabel31 = strcat(dataname31, featureName);
  dataLabel32 = strcat(dataname32, featureName);
  dataLabel33 = strcat(dataname33, featureName);
xticks([1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33]);
set(gca,'XTickLabel',{dataLabel1,dataLabel2,dataLabel3,dataLabel4...
      ,dataLabel5,dataLabel6,dataLabel7,dataLabel8,dataLabel9...
      ,dataLabel10,dataLabel11,dataLabel12,dataLabel13,dataLabel14...
      ,dataLabel15,dataLabel16,dataLabel17,dataLabel18,dataLabel19...
      ,dataLabel20,dataLabel21,dataLabel22,dataLabel23,dataLabel24...
      ,dataLabel25,dataLabel26,dataLabel27,dataLabel28,dataLabel29...
      ,dataLabel30,dataLabel31,dataLabel32,dataLabel33});
  xtickangle(45)
  yticks([1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33]);
  set(gca,'YTickLabel',{dataLabel1,dataLabel2,dataLabel3,dataLabel4...
      ,dataLabel5,dataLabel6,dataLabel7,dataLabel8,dataLabel9...
      ,dataLabel10,dataLabel11,dataLabel12,dataLabel13,dataLabel14...
      ,dataLabel15,dataLabel16,dataLabel17,dataLabel18,dataLabel19...
      ,dataLabel20,dataLabel21,dataLabel22,dataLabel23,dataLabel24...
      ,dataLabel25,dataLabel26,dataLabel27,dataLabel28,dataLabel29...
      ,dataLabel30,dataLabel31,dataLabel32,dataLabel33});
  
  tit = strcat (chanlocs(i).labels , featureName);
  tit = strcat (tit, ' Wilcoxon ranked sum test p values');
  
  title(tit); 
  
  titp = strcat(tit, '.png');
  saveas(gcf,titp)
  titf = strcat(tit, '.fig');
  saveas(gcf,titf)
  
figure('units','normalized','outerposition',[0 0 1 1])
pos = [ones(size(ndata1)); 2* ones(size(ndata2)); 3* ones(size(ndata3))...
    ; 4* ones(size(ndata4)); 5* ones(size(ndata5)); 6* ones(size(ndata6))...
    ; 7* ones(size(ndata7)); 8* ones(size(ndata8)); 9* ones(size(ndata9))...
    ; 10* ones(size(ndata10)); 11* ones(size(ndata11)); 12* ones(size(ndata12))...
    ; 13* ones(size(ndata13)); 14* ones(size(ndata14)); 15* ones(size(ndata15))...
    ; 16* ones(size(ndata16)); 17* ones(size(ndata17)); 18* ones(size(ndata18))...
    ; 19* ones(size(ndata19)); 20* ones(size(ndata20)); 21* ones(size(ndata21))...
    ; 22* ones(size(ndata22)); 23* ones(size(ndata23)); 24* ones(size(ndata24))...
    ; 25* ones(size(ndata25)); 26* ones(size(ndata26)); 27* ones(size(ndata27))...
    ; 28* ones(size(ndata28)); 29* ones(size(ndata29)); 30* ones(size(ndata30))...
    ; 31* ones(size(ndata31)); 32* ones(size(ndata32)); 33* ones(size(ndata33))]; 
  
boxplot([ndata1; ndata2; ndata3; ndata4; ndata5; ndata6; ndata7; ndata8; ndata9...
      ; ndata10; ndata11; ndata12; ndata13; ndata14; ndata15; ndata16; ndata17...
      ; ndata18; ndata19; ndata20; ndata21; ndata22; ndata23; ndata24; ndata25...
      ; ndata26; ndata27; ndata28; ndata29; ndata30; ndata31; ndata32; ndata33], pos); 

  
  set(gca,'XTickLabel',{dataLabel1,dataLabel2,dataLabel3,dataLabel4...
      ,dataLabel5,dataLabel6,dataLabel7,dataLabel8,dataLabel9...
      ,dataLabel10,dataLabel11,dataLabel12,dataLabel13,dataLabel14...
      ,dataLabel15,dataLabel16,dataLabel17,dataLabel18,dataLabel19...
      ,dataLabel20,dataLabel21,dataLabel22,dataLabel23,dataLabel24...
      ,dataLabel25,dataLabel26,dataLabel27,dataLabel28,dataLabel29...
      ,dataLabel30,dataLabel31,dataLabel32,dataLabel33});
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