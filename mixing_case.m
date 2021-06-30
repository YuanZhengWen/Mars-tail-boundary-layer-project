% Investigations of solar wind and planetary ions mixing
% Mixing cases (20%-80%£© identification with ASPERA-3 IMA 
% Author: Yuanzheng Wen & Hans Nilsson
% Email: wenyuanzheng@stu.cdut.edu.cn
% 2021-06-01 Happy Children's Day!
% =======================================================================
% First pick out valid data, with mixing ratio of 20%-80%
%%
i=length(data);
data0101=[data,lower_density(1:i,:)];
nH=data0101(:,16)+data0101(:,60);
nO=data0101(:,38)+data0101(:,62);
nO2=data0101(:,49)+data0101(:,63);
nHe=data0101(:,27)+data0101(:,61);
ratio=(nH./(nO+nH+nO2));

aa=find(ratio>=0.2 & ratio<=0.8);

% Look at the difference in the index variable
tst=diff(aa);

% Find when the difference is more than 1, (or one can allow it to be 2), it indicates a gap between continuous data that fulfil our criteria
bb=find(tst>1);

% The difference between the ¡°break points¡± determined above shows how long the continuous sequence fulfilling the criteria is, i..e the numbest rof samples in each continuous event:
samples_in_event=diff(bb);

% We can define that the longest event is the best:
[best_sample si]=max(samples_in_event);

% And we can sort them after length:
[sorted_sample isample]=sort(samples_in_event);

% To plot the data we need to get back the actual indices in the variable of our ¡°events"
sample_event=[(aa(bb(si)+1)):(aa(bb(si+1)))];
