%******WRITTEN BY ANDREAS WULFF-ABRAMSSON*****

kruskalWalERSP  = 1;
kruskalWalERSPStat = 1;
total = yPos*xPos*electrodes; 

f = waitbar(0,'1','Name','Approximating pi...',...
    'CreateCancelBtn','setappdata(gcbf,''canceling'',1)');

for e = 1:electrodes 
        for x = 1:xPos
            for y = 1:yPos
               % groups = {'A+M+','A+M-','A-M+','A-M-'};
               % ERSPdat = [ApMpersp(:,e,x,y),ApMmersp(:,e,x,y),AmMpersp(:,e,x,y), AmMmersp(:,e,x,y)];
               % ERSPStatData = [ApMperspStat(:,e,x,y),ApMmerspStat(:,e,x,y),AmMperspStat(:,e,x,y), AmMmerspStat(:,e,x,y)];
               % anova2ERSP(e,x,y) = anova2(ERSPdat,groups,'off');
               % close 
                
               % anova2ERSPStat(e,x,y) = anova2(ERSPStatData,groups,'off');
               % close 
                
                wilcoxERSP_ApMp_ApMm(e,x,y) = ranksum(ApMpersp(:,e,x,y),ApMmersp(:,e,x,y));
                wilcoxERSPStat_ApMp_ApMm(e,x,y) = ranksum(ApMperspStat(:,e,x,y),ApMmerspStat(:,e,x,y));
                
                wilcoxERSP_ApMp_AmMp(e,x,y) = ranksum(ApMpersp(:,e,x,y),AmMpersp(:,e,x,y));
                wilcoxERSPStat_ApMp_AmMp(e,x,y) = ranksum(ApMperspStat(:,e,x,y),AmMperspStat(:,e,x,y));
                
                wilcoxERSP_ApMp_AmMm(e,x,y) = ranksum(ApMpersp(:,e,x,y),AmMmersp(:,e,x,y));
                wilcoxERSPStat_ApMp_AmMm(e,x,y) = ranksum(ApMperspStat(:,e,x,y),AmMmerspStat(:,e,x,y));
                
                wilcoxERSP_ApMm_AmMm(e,x,y) = ranksum(ApMmersp(:,e,x,y),AmMmersp(:,e,x,y));
                wilcoxERSPStat_ApMm_AmMm(e,x,y) = ranksum(ApMmerspStat(:,e,x,y),AmMmerspStat(:,e,x,y));
                
                wilcoxERSP_AmMp_AmMm(e,x,y) = ranksum(AmMpersp(:,e,x,y),AmMmersp(:,e,x,y));
                wilcoxERSPStat_AmMp_AmMm(e,x,y) = ranksum(AmMperspStat(:,e,x,y),AmMmerspStat(:,e,x,y));
                
                wilcoxERSP_AmMp_ApMm(e,x,y) = ranksum(AmMpersp(:,e,x,y),ApMmersp(:,e,x,y));
                wilcoxERSPStat_AmMp_ApMm(e,x,y) = ranksum(AmMperspStat(:,e,x,y),ApMmerspStat(:,e,x,y));
                
                % wilcoxontestERSP(e,x,y) = ranksum(figERSP(:,e,x,y),absERSP(:,e,x,y));
       % wilcoxontestERSPStat(e,x,y) = ranksum(figERSPStat(:,e,x,y),absERSPStat(:,e,x,y));
                timeSpend = y*x*e;
                waitbar(timeSpend/total,f,'please wait');
                close
            end
        end
end
