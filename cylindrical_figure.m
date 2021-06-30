% Cylindrical plot of ion distribution of Mars
% Figure plot part
% Author: Yuanzheng Wen (ÎÄÔ¨Õý)
% Email: wenyuanzheng@stu.cdut.edu.cn
% 2021-04-02
% 2021-04-03 Updated
% =======================================================================
close all
clc
%% Densities distributions
figure('Position',[40,40,1000,500],'Visible','on');
set(gcf,'color','white');
% H+ desnity
subplot(221)
% geoshow(Y1,X1,value_FH ,'DisplayType', 'texturemap','FaceColor','flat');
geoshow(Y1,X1,value_H ,'DisplayType', 'texturemap','FaceColor','flat');
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
plot(x_bs,y_bs,'k-','linewidth',3);
% IMB
Xo=0.78;
e=0.90;
l=0.96;
x_imb=cos(theta)*l./(1+e*cos(theta))+Xo;
y_imb=sin(theta)*l./(1+e*cos(theta));
plot(x_imb,y_imb,'k-','linewidth',3);
axis([-4,3,0,4]);
set(gca,'linewidth',1);
str='$$X_{MSO} [R_{M}]$$';
xlabel(str,'Interpreter','latex');
str = '$$ \sqrt{Y_{MSO}^{2}+Z_{MSO}^{2}} [R_{M}] $$';
ylabel(str,'Interpreter','latex','fontname','times new roman');
colorbar;
colormap jet
set(gca,'Clim',[1e4,1e9]);
c = colorbar;
c.Label.String = 'H^{+} Density (/m^{3})';
ax=gca;
ax.FontName='Times New Roman';
ax.FontSize=12;
ax.FontWeight='bold';
set(gca,'colorscale','log');
% He++
subplot(222);
geoshow(Y1,X1,value_He ,'DisplayType', 'texturemap','FaceColor','flat');
hold on;
box on;
area(cosd(0:90),sind(0:90),'facecolor','r');
hold on
area(cosd(90:180),sind(90:180),'facecolor','k');
axis equal; 
%
% Bow shock
Xo=0.64;
e=1.03;
l=2.04;
x_bs=cos(theta)*l./(1+e*cos(theta))+Xo;
y_bs=sin(theta)*l./(1+e*cos(theta));
plot(x_bs,y_bs,'k-','linewidth',3);
% IMB
Xo=0.78;
e=0.90;
l=0.96;
x_imb=cos(theta)*l./(1+e*cos(theta))+Xo;
y_imb=sin(theta)*l./(1+e*cos(theta));
plot(x_imb,y_imb,'k-','linewidth',3);
axis([-4,3,0,4]);
set(gca,'linewidth',1);
str='$$X_{MSO} [R_{M}]$$';
xlabel(str,'Interpreter','latex');
str = '$$ \sqrt{Y_{MSO}^{2}+Z_{MSO}^{2}} [R_{M}] $$';
ylabel(str,'Interpreter','latex','fontname','times new roman');
colorbar;
colormap jet
set(gca,'Clim',[1e3,1e8]);
ax=gca;
ax.FontName='Times New Roman';
ax.FontSize=12;
ax.FontWeight='bold';
set(gca,'colorscale','log');
c = colorbar;
c.Label.String = 'He^{++} Density (/m^{3})';
%
subplot(223)
geoshow(Y1,X1,value_O,'DisplayType', 'texturemap','FaceColor','flat');
hold on;
box on;
%
area(cosd(0:90),sind(0:90),'facecolor','r');
hold on
area(cosd(90:180),sind(90:180),'facecolor','k');
axis equal; 
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
str = '$$ \sqrt{Y_{MSO}^{2}+Z_{MSO}^{2}} [R_{M}] $$';
ylabel(str,'Interpreter','latex','fontname','times new roman');
colorbar;
colormap jet
set(gca,'Clim',[1e3,1e9]);
ax=gca;
ax.FontName='Times New Roman';
ax.FontSize=12;
ax.FontWeight='bold';
set(gca,'colorscale','log');
c = colorbar;
c.Label.String = 'O^{+} Density (/m^{3})';

subplot(224)
geoshow(Y1,X1,value_O2 ,'DisplayType', 'texturemap','FaceColor','flat');
hold on;
box on;
%
area(cosd(0:90),sind(0:90),'facecolor','r');
hold on
area(cosd(90:180),sind(90:180),'facecolor','k');
axis equal; 
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
str = '$$ \sqrt{Y_{MSO}^{2}+Z_{MSO}^{2}} [R_{M}] $$';
ylabel(str,'Interpreter','latex','fontname','times new roman');
colorbar;
colormap jet
set(gca,'Clim',[1e3,1e9]);
ax=gca;
ax.FontName='Times New Roman';
ax.FontSize=12;
ax.FontWeight='bold';
set(gca,'colorscale','log');
c = colorbar;
c.Label.String = 'O_{2}^{+} Density (/m^{3})';
% title('ASPERA-3 IMA Data from 2007-01-01 to 2007-06-31');
% cb = colorbar;
% cb.Ruler.Scale = 'log';
% cb.Ruler.MinorTick = 'on';
%% Flux distribution
figure('Position',[40,40,1000,500],'Visible','on');
set(gcf,'color','white');
% H+ Flux
subplot(221)
geoshow(Y1,X1,value_FH ,'DisplayType', 'texturemap','FaceColor','flat');
hold on;
% rectangle('position',[-2,1.5,0.4,0.4],'edgecolor','k','linewidth',2);
% rectangle('position',[-1.5,2.5,0.4,0.4],'edgecolor','k','linewidth',2);
% rectangle('position',[-1,1,0.4,0.4],'edgecolor','k','linewidth',2);
% rectangle('position',[1,1,0.4,0.4],'edgecolor','k','linewidth',2);
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
plot(x_bs,y_bs,'k-','linewidth',3);
% IMB
Xo=0.78;
e=0.90;
l=0.96;
x_imb=cos(theta)*l./(1+e*cos(theta))+Xo;
y_imb=sin(theta)*l./(1+e*cos(theta));
plot(x_imb,y_imb,'k-','linewidth',3);
axis([-4,3,0,4]);
set(gca,'linewidth',1);
str='$$X_{MSO} [R_{M}]$$';
xlabel(str,'Interpreter','latex');
str = '$$ \sqrt{Y_{MSO}^{2}+Z_{MSO}^{2}} [R_{M}] $$';
ylabel(str,'Interpreter','latex','fontname','times new roman');
colorbar;
colormap jet
% set(gca,'Clim',[1e3,1e7]);
c = colorbar;
% c = colorbar('vertical','Ticks',[1e8,1*10^(8.5),1e9,1*10^(9.5),1e10,10^(10.5),10^(11),10^(11.5)],'ticklabels',{'8','8.5','9','9.5','10','10.5','11','11.5'});
set(gca,'Clim',[10^(8),10^(13)]);
c.Label.String = 'H^{+} Flux, log_{10} (m^{-2}s^{-1})';
set(gca,'Clim',[10^(10),10^(12.5)]);
title(num2str(data(1,1)));
ax=gca;
ax.FontName='Times New Roman';
ax.FontSize=12;
ax.FontWeight='bold';
set(gca,'colorscale','log');
[x,y] = meshgrid(-4:0.2:4,4:-0.2:0);
u = value_VHx;
v = value_VHyz;
q=quiver(x,y,-u,v,'color','black','linewidth',0.5,'AutoScaleFactor',1.2);
% He++
subplot(222);
geoshow(Y1,X1,value_FHe ,'DisplayType', 'texturemap','FaceColor','flat');
hold on;
% rectangle('position',[-2,1.5,0.4,0.4],'edgecolor','k','linewidth',2);
% rectangle('position',[-1.5,2.5,0.4,0.4],'edgecolor','k','linewidth',2);
% rectangle('position',[-1,1,0.4,0.4],'edgecolor','k','linewidth',2);
% rectangle('position',[1,1,0.4,0.4],'edgecolor','k','linewidth',2);
box on;
area(cosd(0:90),sind(0:90),'facecolor','r');
hold on
area(cosd(90:180),sind(90:180),'facecolor','k');
axis equal; 
%
% Bow shock
Xo=0.64;
e=1.03;
l=2.04;
x_bs=cos(theta)*l./(1+e*cos(theta))+Xo;
y_bs=sin(theta)*l./(1+e*cos(theta));
plot(x_bs,y_bs,'k-','linewidth',3);
% IMB
Xo=0.78;
e=0.90;
l=0.96;
x_imb=cos(theta)*l./(1+e*cos(theta))+Xo;
y_imb=sin(theta)*l./(1+e*cos(theta));
plot(x_imb,y_imb,'k-','linewidth',3);
axis([-4,3,0,4]);
set(gca,'linewidth',1);
str='$$X_{MSO} [R_{M}]$$';
xlabel(str,'Interpreter','latex');
str = '$$ \sqrt{Y_{MSO}^{2}+Z_{MSO}^{2}} [R_{M}] $$';
ylabel(str,'Interpreter','latex','fontname','times new roman');
colorbar;
colormap jet
% set(gca,'Clim',[1e2,1e6]);
title(num2str(data(1,1)));
ax=gca;
ax.FontName='Times New Roman';
ax.FontSize=12;
ax.FontWeight='bold';
set(gca,'colorscale','log');
c = colorbar;
c = colorbar('vertical','Ticks',[1e8,1*10^(8.5),1e9,1*10^(9.5),1e10,10^(10.5),10^(11),10^(11.5)],'ticklabels',{'8','8.5','9','9.5','10','10.5','11','11.5'});
set(gca,'Clim',[10^(8),10^(11)]);
c.Label.String = 'He^{++} Flux, log_{10} (m^{-2}s^{-1})';
u = value_VHex;
v = value_VHeyz;
q=quiver(x,y,-u,v,'color','black','linewidth',0.5,'AutoScaleFactor',1.2);
%
subplot(223)
geoshow(Y1,X1,value_FO,'DisplayType', 'texturemap','FaceColor','flat');
hold on;
% rectangle('position',[-2,1.5,0.4,0.4],'edgecolor','k','linewidth',2);
% rectangle('position',[-1.5,2.5,0.4,0.4],'edgecolor','k','linewidth',2);
% rectangle('position',[-1,1,0.4,0.4],'edgecolor','k','linewidth',2);
% rectangle('position',[1,1,0.4,0.4],'edgecolor','k','linewidth',2);
box on;
%
area(cosd(0:90),sind(0:90),'facecolor','r');
hold on
area(cosd(90:180),sind(90:180),'facecolor','k');
axis equal; 
% Bow shock
Xo=0.64;
e=1.03;
l=2.04;
x_bs=cos(theta)*l./(1+e*cos(theta))+Xo;
y_bs=sin(theta)*l./(1+e*cos(theta));
plot(x_bs,y_bs,'k-','linewidth',3);
% IMB
Xo=0.78;
e=0.90;
l=0.96;
x_imb=cos(theta)*l./(1+e*cos(theta))+Xo;
y_imb=sin(theta)*l./(1+e*cos(theta));
plot(x_imb,y_imb,'k-','linewidth',3);
axis([-4,3,0,4]);
set(gca,'linewidth',1);
str='$$X_{MSO} [R_{M}]$$';
xlabel(str,'Interpreter','latex');
str = '$$ \sqrt{Y_{MSO}^{2}+Z_{MSO}^{2}} [R_{M}] $$';
ylabel(str,'Interpreter','latex','fontname','times new roman');
colorbar;
colormap jet
% set(gca,'Clim',[1e2,1e6]);
title(num2str(data(1,1)));
ax=gca;
ax.FontName='Times New Roman';
ax.FontSize=12;
ax.FontWeight='bold';
set(gca,'colorscale','log');
c = colorbar;
c = colorbar('vertical','Ticks',[1e8,1*10^(8.5),1e9,1*10^(9.5),1e10,10^(10.5),10^(11),10^(11.5)],'ticklabels',{'8','8.5','9','9.5','10','10.5','11','11.5'});
set(gca,'Clim',[10^(8),10^(11)]);
c.Label.String = 'O^{+} Flux, log_{10} (m^{-2}s^{-1})';
u = value_VOx;
v = value_VOyz;
q=quiver(x,y,-u,v,'color','black','linewidth',0.5,'AutoScaleFactor',1.2);

subplot(224)
geoshow(Y1,X1,value_FO2 ,'DisplayType', 'texturemap','FaceColor','flat');
hold on;
% rectangle('position',[-2,1.5,0.4,0.4],'edgecolor','k','linewidth',2);
% rectangle('position',[-1.5,2.5,0.4,0.4],'edgecolor','k','linewidth',2);
% rectangle('position',[-1,1,0.4,0.4],'edgecolor','k','linewidth',2);
% rectangle('position',[1,1,0.4,0.4],'edgecolor','k','linewidth',2);
box on;
%
area(cosd(0:90),sind(0:90),'facecolor','r');
hold on
area(cosd(90:180),sind(90:180),'facecolor','k');
axis equal; 
% Bow shock
Xo=0.64;
e=1.03;
l=2.04;
x_bs=cos(theta)*l./(1+e*cos(theta))+Xo;
y_bs=sin(theta)*l./(1+e*cos(theta));
plot(x_bs,y_bs,'k-','linewidth',3);
% IMB
Xo=0.78;
e=0.90;
l=0.96;
x_imb=cos(theta)*l./(1+e*cos(theta))+Xo;
y_imb=sin(theta)*l./(1+e*cos(theta));
plot(x_imb,y_imb,'k-','linewidth',3);
axis([-4,3,0,4]);
set(gca,'linewidth',1);
str='$$X_{MSO} [R_{M}]$$';
xlabel(str,'Interpreter','latex');
str = '$$ \sqrt{Y_{MSO}^{2}+Z_{MSO}^{2}} [R_{M}] $$';
ylabel(str,'Interpreter','latex','fontname','times new roman');
colorbar;
colormap jet
% set(gca,'Clim',[1e2,1e6]);
title(num2str(data(1,1)));
ax=gca;
ax.FontName='Times New Roman';
ax.FontSize=12;
ax.FontWeight='bold';
set(gca,'colorscale','log');
c = colorbar;
c = colorbar('vertical','Ticks',[1e8,1*10^(8.5),1e9,1*10^(9.5),1e10,10^(10.5),10^(11),10^(11.5)],'ticklabels',{'8','8.5','9','9.5','10','10.5','11','11.5'});
set(gca,'Clim',[10^(8),10^(11)]);
c.Label.String = 'O_{2}^{+} Flux, log_{10} (m^{-2}s^{-1})';
u = value_VO2x;
v = value_VO2yz;
q=quiver(x,y,-u,v,'color','black','linewidth',0.5,'AutoScaleFactor',1.2);
%% Velocity distributions
figure('Position',[40,40,1000,500],'Visible','on');
set(gcf,'color','white');
% H+ Flux
subplot(221)
geoshow(Y1,X1,value_VH ,'DisplayType', 'texturemap','FaceColor','flat');
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
plot(x_bs,y_bs,'k-','linewidth',3);
% IMB
Xo=0.78;
e=0.90;
l=0.96;
x_imb=cos(theta)*l./(1+e*cos(theta))+Xo;
y_imb=sin(theta)*l./(1+e*cos(theta));
plot(x_imb,y_imb,'k-','linewidth',3);
axis([-4,3,0,4]);
set(gca,'linewidth',1);
str='$$X_{MSO} [R_{M}]$$';
xlabel(str,'Interpreter','latex');
str = '$$ \sqrt{Y_{MSO}^{2}+Z_{MSO}^{2}} [R_{M}] $$';
ylabel(str,'Interpreter','latex','fontname','times new roman');
colorbar;
colormap jet
% set(gca,'Clim',[1e3,1e7]);
c = colorbar;
c.Label.String = 'H^{+} Velocity (km/s)';
ax=gca;
ax.FontName='Times New Roman';
ax.FontSize=12;
ax.FontWeight='bold';
% set(gca,'colorscale','log');
[x,y] = meshgrid(-4:0.2:4,4:-0.2:0);
u = value_VHx;
v = value_VHyz;
q=quiver(x,y,-u,v,'color','black','linewidth',0.5,'AutoScaleFactor',1.2);
% He++
subplot(222);
geoshow(Y1,X1,value_VHe ,'DisplayType', 'texturemap','FaceColor','flat');
hold on;
box on;
area(cosd(0:90),sind(0:90),'facecolor','r');
hold on
area(cosd(90:180),sind(90:180),'facecolor','k');
axis equal; 
%
% Bow shock
Xo=0.64;
e=1.03;
l=2.04;
x_bs=cos(theta)*l./(1+e*cos(theta))+Xo;
y_bs=sin(theta)*l./(1+e*cos(theta));
plot(x_bs,y_bs,'k-','linewidth',3);
% IMB
Xo=0.78;
e=0.90;
l=0.96;
x_imb=cos(theta)*l./(1+e*cos(theta))+Xo;
y_imb=sin(theta)*l./(1+e*cos(theta));
plot(x_imb,y_imb,'k-','linewidth',3);
axis([-4,3,0,4]);
set(gca,'linewidth',1);
str='$$X_{MSO} [R_{M}]$$';
xlabel(str,'Interpreter','latex');
str = '$$ \sqrt{Y_{MSO}^{2}+Z_{MSO}^{2}} [R_{M}] $$';
ylabel(str,'Interpreter','latex','fontname','times new roman');
colorbar;
colormap jet
% set(gca,'Clim',[1e2,1e6]);
ax=gca;
ax.FontName='Times New Roman';
ax.FontSize=12;
ax.FontWeight='bold';
% set(gca,'colorscale','log');
c = colorbar;
c.Label.String = 'He^{++} Velocity(km/s)';
u = value_VHex;
v = value_VHeyz;
q=quiver(x,y,-u,v,'color','black','linewidth',0.5,'AutoScaleFactor',1.2);
%
subplot(223)
geoshow(Y1,X1,value_VO,'DisplayType', 'texturemap','FaceColor','flat');
hold on;
box on;
%
area(cosd(0:90),sind(0:90),'facecolor','r');
hold on
area(cosd(90:180),sind(90:180),'facecolor','k');
axis equal; 
% Bow shock
Xo=0.64;
e=1.03;
l=2.04;
x_bs=cos(theta)*l./(1+e*cos(theta))+Xo;
y_bs=sin(theta)*l./(1+e*cos(theta));
plot(x_bs,y_bs,'k-','linewidth',3);
% IMB
Xo=0.78;
e=0.90;
l=0.96;
x_imb=cos(theta)*l./(1+e*cos(theta))+Xo;
y_imb=sin(theta)*l./(1+e*cos(theta));
plot(x_imb,y_imb,'k-','linewidth',3);
axis([-4,3,0,4]);
set(gca,'linewidth',1);
str='$$X_{MSO} [R_{M}]$$';
xlabel(str,'Interpreter','latex');
str = '$$ \sqrt{Y_{MSO}^{2}+Z_{MSO}^{2}} [R_{M}] $$';
ylabel(str,'Interpreter','latex','fontname','times new roman');
colorbar;
colormap jet
% set(gca,'Clim',[1e2,1e6]);
ax=gca;
ax.FontName='Times New Roman';
ax.FontSize=12;
ax.FontWeight='bold';
% set(gca,'colorscale','log');
c = colorbar;
c.Label.String = 'O^{+} Velocity (km/s)';
u = value_VOx;
v = value_VOyz;
q=quiver(x,y,-u,v,'color','black','linewidth',0.5,'AutoScaleFactor',1.2);

subplot(224)
geoshow(Y1,X1,value_VO2 ,'DisplayType', 'texturemap','FaceColor','flat');
hold on;
box on;
%
area(cosd(0:90),sind(0:90),'facecolor','r');
hold on
area(cosd(90:180),sind(90:180),'facecolor','k');
axis equal; 
% Bow shock
Xo=0.64;
e=1.03;
l=2.04;
x_bs=cos(theta)*l./(1+e*cos(theta))+Xo;
y_bs=sin(theta)*l./(1+e*cos(theta));
plot(x_bs,y_bs,'k-','linewidth',3);
% IMB
Xo=0.78;
e=0.90;
l=0.96;
x_imb=cos(theta)*l./(1+e*cos(theta))+Xo;
y_imb=sin(theta)*l./(1+e*cos(theta));
plot(x_imb,y_imb,'k-','linewidth',3);
axis([-4,3,0,4]);
set(gca,'linewidth',1);
str='$$X_{MSO} [R_{M}]$$';
xlabel(str,'Interpreter','latex');
str = '$$ \sqrt{Y_{MSO}^{2}+Z_{MSO}^{2}} [R_{M}] $$';
ylabel(str,'Interpreter','latex','fontname','times new roman');
colorbar;
colormap jet
% set(gca,'Clim',[1e2,1e6]);
ax=gca;
ax.FontName='Times New Roman';
ax.FontSize=12;
ax.FontWeight='bold';
% set(gca,'colorscale','log');
c = colorbar;
c.Label.String = 'O_{2}^{+} Velocity (km/s)';
u = value_VO2x;
v = value_VO2yz;
q=quiver(x,y,-u,v,'color','black','linewidth',0.5,'AutoScaleFactor',1.2);
clc%%
figure
set(gcf,'color','white');
% H+ Flux
geoshow(Y1,X1,value_density_ratio ,'DisplayType', 'texturemap','FaceColor','flat');
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
str = '$$ \sqrt{Y_{MSO}^{2}+Z_{MSO}^{2}} [R_{M}] $$';
ylabel(str,'Interpreter','latex','fontname','times new roman');
c=colorbar;
colormap rainbow
set(gca,'Clim',[0,1]);
title(num2str(data(1,1)));
c = colorbar;
c.Label.String = 'Density Ratio';
ax=gca;
ax.FontName='Times New Roman';
ax.FontSize=12;
ax.FontWeight='bold';