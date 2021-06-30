%% Tail
x=static_data(:,2);
y=static_data(:,3);
z=static_data(:,4);
aa=find(x/Rm>=-2-0.2 & x/Rm<=-2+0.2 & sqrt(y.^2+z.^2)/Rm >=1.5-0.2 & sqrt(y.^2+z.^2)/Rm <=1.5+0.2);
fixed_data=static_data(aa(1:end),:);
nH=fixed_data(:,5);
nO=fixed_data(:,7);
nO2=fixed_data(:,8);
n1=(nH./(nO+nH+nO2));
%% Magnetosheath
fixed_data=[];
aa=find(x/Rm>=-1.1-0.2 & x/Rm<=-1.1+0.2 & sqrt(y.^2+z.^2)/Rm >=2.3-0.2 & sqrt(y.^2+z.^2)/Rm <=2.3+0.2);
fixed_data=static_data(aa(1:end),:);
nH=fixed_data(:,5);
nO=fixed_data(:,7);
nO2=fixed_data(:,8);
n2=(nH./(nO+nH+nO2));
%% Near Mars
fixed_data=[];
aa=find(x/Rm>=-1-0.2 & x/Rm<=-1+0.2 & sqrt(y.^2+z.^2)/Rm >=1-0.2 & sqrt(y.^2+z.^2)/Rm <=1+0.2);
fixed_data=static_data(aa(1:end),:);
nH=fixed_data(:,5);
nO=fixed_data(:,7);
nO2=fixed_data(:,8);
n3=(nH./(nO+nH+nO2));
%% Bow Shock
fixed_data=[];
aa=find(x/Rm>=1.2-0.2 & x/Rm<=1.2+0.2 & sqrt(y.^2+z.^2)/Rm >=1.2-0.2 & sqrt(y.^2+z.^2)/Rm <=1.2+0.2);
fixed_data=static_data(aa(1:end),:);
nH=fixed_data(:,5);
nO=fixed_data(:,7);
nO2=fixed_data(:,8);
n4=(nH./(nO+nH+nO2));
%%
figure('Position',[40,40,1500,400],'Visible','on');
ax1=subplot(141)
ax=gca;
ax.FontName='Times New Roman';
ax.FontSize=11;
ax.FontWeight='bold';
set(gca,'linewidth',1.5);
set(gcf,'color','white');
histogram(n1,10,'linewidth',1);
xlabel('Density Ratio(n_{H}/n_{H}+n_{O}+n_{O_{2}})');      
ylabel('Numbers');
title('MAVEN Tail boundary')
ax=gca;
ax.FontName='Times New Roman';
ax.FontSize=11;
ax.FontWeight='bold';
set(gca,'linewidth',1.5);

ax2=subplot(142)
histogram(n2,20,'linewidth',1)
ax=gca;
ax.FontName='Times New Roman';
ax.FontSize=11;
ax.FontWeight='bold';
set(gca,'linewidth',1.5);
set(gcf,'color','white');
histogram(n2,10,'linewidth',1);
xlabel('Density Ratio(n_{H}/n_{H}+n_{O}+n_{O_{2}})');      
ylabel('Numbers');
title('MAVEN Magnetosheath')
ax=gca;
ax.FontName='Times New Roman';
ax.FontSize=11;
ax.FontWeight='bold';
set(gca,'linewidth',1.5)

ax3=subplot(143)
histogram(n3,20,'linewidth',1)
ax=gca;
ax.FontName='Times New Roman';
ax.FontSize=11;
ax.FontWeight='bold';
set(gca,'linewidth',1.5);
set(gcf,'color','white');
histogram(n3,10,'linewidth',1);
xlabel('Density Ratio(n_{H}/n_{H}+n_{O}+n_{O_{2}})');      
ylabel('Numbers');
title('MAVEN Near Mars');
ax=gca;
ax.FontName='Times New Roman';
ax.FontSize=11;
ax.FontWeight='bold';
set(gca,'linewidth',1.5)

ax4=subplot(144)
histogram(n3,20,'linewidth',1)
ax=gca;
ax.FontName='Times New Roman';
ax.FontSize=11;
ax.FontWeight='bold';
set(gca,'linewidth',1.5);
set(gcf,'color','white');
histogram(n4,10,'linewidth',1);
xlabel('Density Ratio(n_{H}/n_{H}+n_{O}+n_{O_{2}})');      
ylabel('Numbers');
title('MAVEN Bow Shock');
ax=gca;
ax.FontName='Times New Roman';
ax.FontSize=11;
ax.FontWeight='bold';
set(gca,'linewidth',1.5)