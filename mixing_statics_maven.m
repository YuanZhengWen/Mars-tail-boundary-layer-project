% Statistical investigations of mixing (20%-80%) occurrence frequency in Mars X-R plot
% Author: Yuanzheng Wen (ÎÄÔ¨Õý)
% Email: wenyuanzheng@stu.cdut.edu.cn
% 2021-06-01
% =======================================================================
%%
dRx=0.2;
dRyz=0.2;
nRx = -4 :dRx:4;
nRyz= 4:-dRyz:0;
[X1,Y1] = meshgrid(nRx,nRyz');
[nY1Len,nX1Len] = size(X1);
%%
% Ion density
% load('data_m7.mat')
% data0101=data_m1;
nH=static_data(:,5);
nO=static_data(:,7);
nO2=static_data(:,8);
nHe=static_data(:,6);
ratio=nH./(nH+nO+nO2);
data0101=[static_data,ratio];
%%
[c,~] = size(data0101);
[e,f] = size(X1);
mixing_number= zeros(1,e*f);
mixing_ratio = zeros(1,e*f);
count = zeros(1,e*f); % Every count in each cell
count1 = 0; % Count1 in count
for lon = -4 :0.2:4
    for lat = 4 :-0.2:0
        count1 = count1 + 1;
        ct = 0; % For calc the average
        for i = 1: c
            x=data0101(i,2)/Rm;
            r=sqrt(data0101(i,3)^2+data0101(i,4)^2)/Rm ;
            if  (x>= lon )  && (x<= lon + dRx ) && (r>= lat )  && (r <= lat + dRyz)
                ct = ct + 1;
                mixing_number(1,count1) =mixing_number(1,count1) +double((data0101(i,9)>=0.2)&&(data0101(i,9)<=0.8));
            end
            count(1,count1) = ct;
            mixing_ratio(1,count1) = mixing_number(1,count1)/ct;
            
        end
    end
end
% Changing the one-dimensional data into two-dimensional data
% And they are both average values
[e,f] = size(X1);
value_mixing = zeros(e,f);
for i = 1:e
    for j = 1:f
        value_mixing(i,j) = mixing_ratio((j-1)*e + i);
    end
end
%%
%  figure('Position',[40,40,1200,400],'Visible','on');
% subplot(121)
set(gcf,'color','white');
% H+ Flux
geoshow(Y1,X1,value_mixing ,'DisplayType', 'texturemap','FaceColor','flat');
hold on;
%
area(cosd(0:90),sind(0:90),'facecolor','r');
hold on
area(cosd(90:180),sind(90:180),'facecolor','k');
axis equal; 
box on;
% Bow shock
Xo=0.64;
e=1.03;
l=2.04;
x_bs=cos(theta)*l./(1+e*cos(theta))+Xo;
y_bs=sin(theta)*l./(1+e*cos(theta));
plot(x_bs,y_bs,'k-','linewidth',3.5);
% IMB
Xo=0.78;
e=0.90;
l=0.96;
x_imb=cos(theta)*l./(1+e*cos(theta))+Xo;
y_imb=sin(theta)*l./(1+e*cos(theta));
plot(x_imb,y_imb,'k-','linewidth',3.5);
axis([-4,3,0,4]);
set(gca,'linewidth',1);
str='$$X_{MSO} [R_{M}]$$';
xlabel(str,'Interpreter','latex');
str = '$$ \sqrt{Y_{MSO}^{2}+Z_{MSO}^{2}}[R_{M}] $$';
ylabel(str,'Interpreter','latex','fontname','times new roman');
c=colorbar;
colormap jet
set(gca,'Clim',[0,0.4]);
% title(num2str(data(1,1)));
time=datevec(static_data(:,1));
title([num2str(time(1)),' MAVEN']);
c = colorbar;
c.Label.String = 'Mixing ratio (20%-80%) relative occurrence';
ax=gca;
ax.FontName='Times New Roman';
ax.FontSize=12;
ax.FontWeight='bold';
rectangle('position',[-2.2,1.3,0.4,0.4],'edgecolor','k','linewidth',2);
rectangle('position',[-1.3,2.1,0.4,0.4],'edgecolor','k','linewidth',2);
rectangle('position',[-1.2,0.8,0.4,0.4],'edgecolor','k','linewidth',2);
rectangle('position',[1,1,0.4,0.4],'edgecolor','k','linewidth',2);