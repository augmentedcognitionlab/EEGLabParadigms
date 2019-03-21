function [pvals,effectsize] = PsdSignAnalysis (spectg1, spectg2, channel, chanLocs, name1, name2)

s = size(spectg1);
 deltaspectg1 = spectg1(:,:,2:4);  
  thetaspectg1 = spectg1(:,:,5:8);
  alphaspectg1 = spectg1(:,:,9:13);
  betaspectg1 = spectg1(:,:,14:33);
  gammaspectg1 = spectg1(:,:,34:49);
  for i=1:s(1)
      for j= 1:s(2)
          sumDelta1(i,j) = sum(deltaspectg1(i,j,:));
          sumTheta1(i,j) = sum(thetaspectg1(i,j,:));
          sumAlpha1(i,j) = sum(alphaspectg1(i,j,:));
          sumBeta1(i,j) = sum(betaspectg1(i,j,:));
          sumGamma1(i,j) = sum(gammaspectg1(i,j,:));
      end
  end

s = size(spectg2);
 deltaspectg2 = spectg2(:,:,2:4);  
  thetaspectg2 = spectg2(:,:,5:8);
  alphaspectg2 = spectg2(:,:,9:23);
  betaspectg2 = spectg2(:,:,24:33);
  gammaspectg2 = spectg2(:,:,34:49);
  for i=1:s(1)
      for j= 1:s(2)
          sumDelta2(i,j) = sum(deltaspectg2(i,j,:));
          sumTheta2(i,j) = sum(thetaspectg2(i,j,:));
          sumAlpha2(i,j) = sum(alphaspectg2(i,j,:));
          sumBeta2(i,j) = sum(betaspectg2(i,j,:));
          sumGamma2(i,j) = sum(gammaspectg2(i,j,:));
      end
  end

 
  pvals(1) = ranksum(sumDelta1(:,channel), sumDelta2(:,channel));
  effectsize(1) = plotAndEffect(sumDelta1, sumDelta2, ' Delta', chanLocs, name1, name2);
  pvals(2) = ranksum(sumTheta1(:,channel), sumTheta2(:,channel));
  effectsize(2) = plotAndEffect(sumTheta1, sumTheta2, ' Theta', chanLocs, name1, name2);
  pvals(3) = ranksum(sumAlpha1(:,channel), sumAlpha2(:,channel));
  effectsize(3) = plotAndEffect(sumAlpha1, sumAlpha2, ' Alpha', chanLocs, name1, name2);
  pvals(4) = ranksum(sumBeta1(:,channel), sumBeta2(:,channel));
  effectsize(4) = plotAndEffect(sumBeta1, sumBeta2, ' Beta', chanLocs, name1, name2);
  pvals(5) = ranksum(sumGamma1(:,channel), sumGamma2(:,channel));
  effectsize(5) = plotAndEffect(sumGamma1, sumGamma2, ' Gamma', chanLocs, name1, name2);
  
  

end
function [d] = effectSize(mean1, mean2, std1, std2)

d = (mean2 - mean1)/(sqrt((std1^2+ std2^2)/2));
d = abs(d);
end

function [effect] = plotAndEffect ( dataset1, dataset2, testvariable, chanlocs, dataName1,dataName2)
effect = 1; 
s = size(chanlocs);
dimplot = ceil(sqrt(s(2)));
figure('units','normalized','outerposition',[0 0 1 1])
for i=1:s(2)
subplot(dimplot,dimplot,i)
data1 = dataset1(:,i); 
data2 = dataset2(:,i); 
pos = [ones(size(data1)); 2* ones(size(data2))]; 
  boxplot([data1; data2], pos); 

  dataLabel1 = strcat(dataName1, testvariable);
  dataLabel2 = strcat(dataName2, testvariable );
  set(gca,'XTickLabel',{dataLabel1,dataLabel2});
  
  avrDelta1 = mean(dataset1(:,i));
  stdDelta1 = std(dataset1(:,i));
  avrDelta2 = mean(dataset2(:,i));
  stdDelta2 = std(dataset2(:,i));
  effect = effectSize (avrDelta1, avrDelta2, stdDelta1, stdDelta2);
  d = effect; 
  dval = num2str(d);
  p = ranksum(dataset1(:,i), dataset2(:,i));
  pval = num2str(p);
  sigVal = strcat('p = ', pval);
  sigVal = strcat(sigVal, ' d = ');
  sigVal = strcat(sigVal, dval);
  
  title({chanlocs(i).labels , sigVal});  
end
namePng = strcat(testvariable, dataName1);
namePng = strcat(namePng, dataName2);
namePng = strcat(namePng,'.png');

namefig = strcat(testvariable, dataName1);
namefig = strcat(namefig, dataName2);
namefig = strcat(namefig, '.fig');
  saveas(gcf,namePng)
  saveas(gcf,namefig)

end
