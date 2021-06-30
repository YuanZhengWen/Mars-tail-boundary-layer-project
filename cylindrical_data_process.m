% Cylindrical plot of ion distribution of Mars
% Data process part
% Author: Yuanzheng Wen (ÎÄÔ¨Õı)
% Email: wenyuanzheng@stu.cdut.edu.cn
% 2021-03-31
% 2021-04-01 Updated
% =======================================================================

close all
clc
% Constant Define
Rm=3397; % Radius of Mars
theta=0:0.005:2*pi;
%%
% data = load('2007.mat');
% data = data.data;
%% Select data range
data0101=data;
% data0101=[];
% for j = 1:length(data)
%     if data(j,2)> 6&& data(j,3)<=31
%         data0101=[data0101;data(j,:)];
%     end
% end

%%
dRx=0.2;
dRyz=0.2;
nRx = -4 :dRx:4;
nRyz= 4:-dRyz:0;
[X1,Y1] = meshgrid(nRx,nRyz');
[nY1Len,nX1Len] = size(X1);
%%
[c,~] = size(data0101);
[e,f] = size(X1);
% Density
sum_H = zeros(1,e*f);
sum_He = zeros(1,e*f);
sum_O = zeros(1,e*f);
sum_O2 = zeros(1,e*f);
anv_H = zeros(1,e*f);
anv_He=zeros(1,e*f);
anv_O=zeros(1,e*f);
anv_O2=zeros(1,e*f);
% Flux
sum_FH = zeros(1,e*f);
sum_FHe = zeros(1,e*f);
sum_FO = zeros(1,e*f);
sum_FO2 = zeros(1,e*f);

anv_FH = zeros(1,e*f);
anv_FHe=zeros(1,e*f);
anv_FO=zeros(1,e*f);
anv_FO2=zeros(1,e*f);
% Velocity
% H
sum_VH = zeros(1,e*f);
sum_VHx = zeros(1,e*f);
sum_VHy = zeros(1,e*f);
sum_VHz = zeros(1,e*f);
sum_VHyz = zeros(1,e*f);

anv_VH = zeros(1,e*f);
anv_VHx = zeros(1,e*f);
anv_VHy = zeros(1,e*f);
anv_VHz = zeros(1,e*f);
anv_VHyz = zeros(1,e*f);
% He
sum_VHe = zeros(1,e*f);
sum_VHex = zeros(1,e*f);
sum_VHey = zeros(1,e*f);
sum_VHez = zeros(1,e*f);
sum_VHeyz = zeros(1,e*f);

anv_VHe = zeros(1,e*f);
anv_VHex = zeros(1,e*f);
anv_VHey = zeros(1,e*f);
anv_VHez = zeros(1,e*f);
anv_VHeyz = zeros(1,e*f);
% O
sum_VO = zeros(1,e*f);
sum_VOx = zeros(1,e*f);
sum_VOy = zeros(1,e*f);
sum_VOz = zeros(1,e*f);
sum_VOyz = zeros(1,e*f);

anv_VO = zeros(1,e*f);
anv_VOx = zeros(1,e*f);
anv_VOy = zeros(1,e*f);
anv_VOz = zeros(1,e*f);
anv_VOyz = zeros(1,e*f);

% O
sum_VO2 = zeros(1,e*f);
sum_VO2x = zeros(1,e*f);
sum_VO2y = zeros(1,e*f);
sum_VO2z = zeros(1,e*f);
sum_VO2yz = zeros(1,e*f);

anv_VO2 = zeros(1,e*f);
anv_VO2x = zeros(1,e*f);
anv_VO2y = zeros(1,e*f);
anv_VO2z = zeros(1,e*f);
anv_VO2yz = zeros(1,e*f);
count = zeros(1,e*f); % Every count in each cell
count1 = 0; % Count1 in count
%% For solar wind ions and planetary ion densities
count = zeros(1,e*f); % Every count in each cell
count1 = 0; % Count1 in count
for lon = -4 :0.2:4
    for lat = 4 :-0.2:0
        count1 = count1 + 1;
        ct = 0; % For calc the median
        for i = 1: c
            if  (data0101(i,13)/Rm >= lon )  && (data0101(i,13)/Rm <= lon + dRx ) && (sqrt(data0101(i,14)^2+data0101(i,15)^2)/Rm >= lat )  && (sqrt(data0101(i,14)^2+data0101(i,15)^2)/Rm <= lat + dRyz)
                ct = ct + 1;
                % Density
                sum_H(1,count1) = sum_H(1,count1) + data0101(i,16)*10^6;
                sum_He(1,count1) = sum_He(1,count1) + data0101(i,27)*10^6;
                sum_O(1,count1) = sum_O(1,count1) + data0101(i,38)*10^6;
                sum_O2(1,count1) = sum_O2(1,count1) + data0101(i,49)*10^6;
            end
            count(1,count1) = ct;
            % Density
            anv_H(1,count1) = sum_H(1,count1) / ct;
            anv_He(1,count1) = sum_He(1,count1) / ct;
            anv_O(1,count1) = sum_O(1,count1) / ct;
            anv_O2(1,count1) = sum_O2(1,count1) / ct;
            
        end
    end
end
%% For H+ flux and velocity
count = zeros(1,e*f); % Every count in each cell
count1 = 0; % Count1 in count
for lon = -4 :0.2:4
    for lat = 4 :-0.2:0
        count1 = count1 + 1;
        ct = 0; % For calc the median
        for i = 1: c
            if  (data0101(i,13)/Rm >= lon )  && (data0101(i,13)/Rm <= lon + dRx ) && (sqrt(data0101(i,14)^2+data0101(i,15)^2)/Rm >= lat )  && (sqrt(data0101(i,14)^2+data0101(i,15)^2)/Rm <= lat + dRyz) && (data0101(i,16)~=0)
                ct = ct + 1;
                % Velocity
                sum_VH(1,count1) = sum_VH(1,count1) + sqrt(data0101(i,17)^2+data0101(i,18)^2+data0101(i,19)^2);
                sum_VHx(1,count1) = sum_VHx(1,count1) + data0101(i,17);
                sum_VHy(1,count1) = sum_VHy(1,count1) + data0101(i,18);
                sum_VHz(1,count1) = sum_VHz(1,count1) + data0101(i,19);
                sum_VHyz(1,count1)= sum_VHyz(1,count1) + sqrt(data0101(i,18)^2+data0101(i,19)^2);
                % Flux
                sum_FH(1,count1)=sum_FH(1,count1)+data0101(i,16)*sqrt(data0101(i,17)^2+data0101(i,18)^2+data0101(i,19)^2)*10^9;
            end
            count(1,count1) = ct;
            % Flux
            anv_FH(1,count1)=sum_FH(1,count1)/ct;
            % Velocity
            anv_VH(1,count1) =(sum_VH(1,count1))/ct;
            anv_VHx(1,count1) =(sum_VHx(1,count1))/ct;
            anv_VHy(1,count1) =(sum_VHy(1,count1))/ct;
            anv_VHz(1,count1) =(sum_VHz(1,count1))/ct;
            anv_VHyz(1,count1) =(sum_VHyz(1,count1))/ct;
        end
    end
end
%% For He++ flux and velocity
count = zeros(1,e*f); % Every count in each cell
count1 = 0; % Count1 in count
for lon = -4 :0.2:4
    for lat = 4 :-0.2:0
        count1 = count1 + 1;
        ct = 0; % For calc the median
        for i = 1: c
            if  (data0101(i,13)/Rm >= lon )  && (data0101(i,13)/Rm <= lon + dRx ) && (sqrt(data0101(i,14)^2+data0101(i,15)^2)/Rm >= lat )  && (sqrt(data0101(i,14)^2+data0101(i,15)^2)/Rm <= lat + dRyz) && (data0101(i,27)~=0)
                ct = ct + 1;
                % Velocity
                sum_VHe(1,count1) = sum_VHe(1,count1) + sqrt(data0101(i,28)^2+data0101(i,29)^2+data0101(i,30)^2);
                sum_VHex(1,count1) = sum_VHex(1,count1) + data0101(i,28);
                sum_VHey(1,count1) = sum_VHey(1,count1) + data0101(i,29);
                sum_VHez(1,count1) = sum_VHez(1,count1) + data0101(i,30);
                sum_VHeyz(1,count1)= sum_VHeyz(1,count1) + sqrt(data0101(i,29)^2+data0101(i,30)^2);
                % Flux
                sum_FHe(1,count1)=sum_FHe(1,count1)+data0101(i,27)*sqrt(data0101(i,28)^2+data0101(i,29)^2+data0101(i,30)^2)*10^9;
            end
            count(1,count1) = ct;
            % Flux
            anv_FHe(1,count1)=sum_FHe(1,count1)/ct;
            % Velocity
            anv_VHe(1,count1) =(sum_VHe(1,count1))/ct;
            anv_VHex(1,count1) =(sum_VHex(1,count1))/ct;
            anv_VHey(1,count1) =(sum_VHey(1,count1))/ct;
            anv_VHez(1,count1) =(sum_VHez(1,count1))/ct;
            anv_VHeyz(1,count1) =(sum_VHeyz(1,count1))/ct;
        end
    end
end
%% For O+ flux and velocity
count = zeros(1,e*f); % Every count in each cell
count1 = 0; % Count1 in count
for lon = -4 :0.2:4
    for lat = 4 :-0.2:0
        count1 = count1 + 1;
        ct = 0; % For calc the median
        for i = 1: c
            if  (data0101(i,13)/Rm >= lon )  && (data0101(i,13)/Rm <= lon + dRx ) && (sqrt(data0101(i,14)^2+data0101(i,15)^2)/Rm >= lat )  && (sqrt(data0101(i,14)^2+data0101(i,15)^2)/Rm <= lat + dRyz) && (data0101(i,38)~=0)
                ct = ct + 1;
                % Velocity
                sum_VO(1,count1) = sum_VO(1,count1) + sqrt(data0101(i,39)^2+data0101(i,40)^2+data0101(i,41)^2);
                sum_VOx(1,count1) = sum_VOx(1,count1) + data0101(i,39);
                sum_VOy(1,count1) = sum_VOy(1,count1) + data0101(i,40);
                sum_VOz(1,count1) = sum_VOz(1,count1) + data0101(i,41);
                sum_VOyz(1,count1)= sum_VOyz(1,count1) + sqrt(data0101(i,40)^2+data0101(i,41)^2);
                % Flux
                sum_FO(1,count1)=sum_FO(1,count1)+data0101(i,38)*sqrt(data0101(i,39)^2+data0101(i,40)^2+data0101(i,41)^2)*10^9;
            end
            count(1,count1) = ct;
            %             % Flux
            anv_FO(1,count1)=sum_FO(1,count1)/ct;
            % Velocity
            anv_VO(1,count1) =(sum_VO(1,count1))/ct;
            anv_VOx(1,count1) =(sum_VOx(1,count1))/ct;
            anv_VOy(1,count1) =(sum_VOy(1,count1))/ct;
            anv_VOz(1,count1) =(sum_VOz(1,count1))/ct;
            anv_VOyz(1,count1) =(sum_VOyz(1,count1))/ct;
        end
    end
end
%% For O2+ flux and velocity
count = zeros(1,e*f); % Every count in each cell
count1 = 0; % Count1 in count
for lon = -4 :0.2:4
    for lat = 4 :-0.2:0
        count1 = count1 + 1;
        ct = 0; % For calc the median
        for i = 1: c
            if  (data0101(i,13)/Rm >= lon )  && (data0101(i,13)/Rm <= lon + dRx ) && (sqrt(data0101(i,14)^2+data0101(i,15)^2)/Rm >= lat )  && (sqrt(data0101(i,14)^2+data0101(i,15)^2)/Rm <= lat + dRyz) && (data0101(i,49)~=0)
                ct = ct + 1;
                % Velocity
                sum_VO2(1,count1) = sum_VO2(1,count1) + sqrt(data0101(i,50)^2+data0101(i,51)^2+data0101(i,52)^2);
                sum_VO2x(1,count1) = sum_VO2x(1,count1) + data0101(i,50);
                sum_VO2y(1,count1) = sum_VO2y(1,count1) + data0101(i,51);
                sum_VO2z(1,count1) = sum_VO2z(1,count1) + data0101(i,52);
                sum_VO2yz(1,count1)= sum_VO2yz(1,count1) + sqrt(data0101(i,51)^2+data0101(i,52)^2);
                % Flux
                sum_FO2(1,count1)=sum_FO2(1,count1)+data0101(i,49)*sqrt(data0101(i,50)^2+data0101(i,51)^2+data0101(i,52)^2)*10^9;
            end
            count(1,count1) = ct;
            % Flux
            anv_FO2(1,count1)=sum_FO2(1,count1)/ct;
            % Velocity
            anv_VO2(1,count1) =(sum_VO2(1,count1))/ct;
            anv_VO2x(1,count1) =(sum_VO2x(1,count1))/ct;
            anv_VO2y(1,count1) =(sum_VO2y(1,count1))/ct;
            anv_VO2z(1,count1) =(sum_VO2z(1,count1))/ct;
            anv_VO2yz(1,count1) =(sum_VO2yz(1,count1))/ct;
        end
    end
end
%% For density ratio
sum_density_ratio=zeros(1,e*f);
anv_density_ratio=zeros(1,e*f);
count = zeros(1,e*f); % Every count in each cell
count1 = 0; % Count1 in count
for lon = -4 :0.2:4
    for lat = 4 :-0.2:0
        count1 = count1 + 1;
        ct = 0; % For calc the median
        for i = 1: c
            if  (data0101(i,13)/Rm >= lon )  && (data0101(i,13)/Rm <= lon + dRx ) && (sqrt(data0101(i,14)^2+data0101(i,15)^2)/Rm >= lat )  && (sqrt(data0101(i,14)^2+data0101(i,15)^2)/Rm <= lat + dRyz) && ((data0101(i,38)~=0) && (data0101(i,16)~=0) && (data0101(i,49)~=0))
                ct = ct + 1;
                % Density
                sum_density_ratio(1,count1) = sum_density_ratio(1,count1) + data0101(i,16)*10^6/(data0101(i,16)*10^6+data0101(i,38)*10^6+data0101(i,49)*10^6);
            end
            count(1,count1) = ct;
            % Density
            anv_density_ratio(1,count1) = sum_density_ratio(1,count1) / ct;
            
        end
    end
end
%% Changing the one-dimensional data into two-dimensional data
% And they are both average values

[e,f] = size(X1);
% Density
value_H = zeros(e,f);
value_He = zeros(e,f);
value_O = zeros(e,f);
value_O2 = zeros(e,f);
% Flux
value_FH = zeros(e,f);
value_FHe = zeros(e,f);
value_FO = zeros(e,f);
value_FO2 = zeros(e,f);
% Velocity
% H
value_VH = zeros(e,f);
value_VHx = zeros(e,f);
value_VHy = zeros(e,f);
value_VHz = zeros(e,f);
value_VHyz = zeros(e,f);
% He
value_VHe = zeros(e,f);
value_VHex = zeros(e,f);
value_VHey = zeros(e,f);
value_VHez = zeros(e,f);
value_VHeyz = zeros(e,f);
% O
value_VO = zeros(e,f);
value_VOx = zeros(e,f);
value_VOy = zeros(e,f);
value_VOz = zeros(e,f);
value_VOyz = zeros(e,f);
% O
value_VO2 = zeros(e,f);
value_VO2x = zeros(e,f);
value_VO2y = zeros(e,f);
value_VO2z = zeros(e,f);
value_VO2yz = zeros(e,f);
% Density ratio
value_density_ratio = zeros(e,f);
for i = 1:e
    
    for j = 1:f
        % Density
        value_H(i,j) = anv_H((j-1)*e + i);
        value_He(i,j) = anv_He((j-1)*e + i);
        value_O(i,j) = anv_O((j-1)*e + i);
        value_O2(i,j) = anv_O2((j-1)*e + i);
        % Velocity
        value_VH(i,j) = anv_VH((j-1)*e + i);
        value_VHx(i,j) = anv_VHx((j-1)*e + i);
        value_VHy(i,j) = anv_VHy((j-1)*e + i);
        value_VHz(i,j) = anv_VHz((j-1)*e + i);
        value_VHyz(i,j) = anv_VHyz((j-1)*e + i);
        
        value_VHe(i,j) = anv_VHe((j-1)*e + i);
        value_VHex(i,j) = anv_VHex((j-1)*e + i);
        value_VHey(i,j) = anv_VHey((j-1)*e + i);
        value_VHez(i,j) = anv_VHez((j-1)*e + i);
        value_VHeyz(i,j) = anv_VHeyz((j-1)*e + i);
        
        value_VO(i,j) = anv_VO((j-1)*e + i);
        value_VOx(i,j) = anv_VOx((j-1)*e + i);
        value_VOyz(i,j) = anv_VOyz((j-1)*e + i);
        
        value_VO2(i,j) = anv_VO2((j-1)*e + i);
        value_VO2x(i,j) = anv_VO2x((j-1)*e + i);
        value_VO2yz(i,j) = anv_VO2yz((j-1)*e + i);
        % Flux
        value_FH(i,j) = anv_FH((j-1)*e + i);
        value_FHe(i,j) = anv_FHe((j-1)*e + i);
        value_FO(i,j) = anv_FO((j-1)*e + i);
        value_FO2(i,j) = anv_FO2((j-1)*e + i);
        % Density ratio
        value_density_ratio(i,j) = anv_density_ratio((j-1)*e + i);
    end
    
end
%%
% figure
% set(gcf,'color','white');
% geoshow(Y1,X1,value_FO2 ,'DisplayType', 'texturemap','FaceColor','flat');
% box on;
% colorbar;
% % set(gca,'colorscale','log');
% colormap jet;


