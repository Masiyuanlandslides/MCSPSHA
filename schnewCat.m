function newC=schnewCat(locat,catml,A1,sub)

% locat 为场点转换后的X、Y坐标；
% catml格式为：子目录数qq 地震档ii 潜源编号vv1 震级MM 地震纬度eqccoor(:,1) 经度 方位角sita X坐标 Y坐标
%  A1 为相应烈度震级挡sub对应上限距离
%  输出目录中最后一列增加了距场点的距离
% newC格式为：子目录数qq 地震档ii 潜源编号vv1 震级MM 地震纬度eqccoor(:,1) 经度 方位角sita X坐标 Y坐标 距离

sub=[3;sub];    %为循环补充开始和结尾两数
mn=length(sub);
newCat=[];

  dd = sqrt((locat(1)-catml(:,8)).^2+(locat(2)-catml(:,9)).^2);   %计算场点与震中距离公式
  catml = [catml,dd];   %目录中最后一列增加距离项
%Cat1=[Cat CT11 dd];   %目录中加入与计算目标点的距离//0.0010    0.0030    0.0280    0.0053    0.1110    0.0357         0    0.4982    3.9513    0.3753

for i=2:mn
%    FI = find(sub(i)<=catml(:,4)&catml(:,4)<sub(i+1)&dd<A1(i));
%    I49= sub(i)<=catalog1(:,4)&catalog1(:,4)<sub(i+1)&dd<A1(i);
     I49= sub(i-1)<=catml(:,4)&catml(:,4)<sub(i)&catml(:,10)<A1(i-1);
     A49=catml(I49,:);
     
%    CT12=catml(I49,:);
%    A491=[A49, ];
     newCat=[newCat;A49];
end
newC= newCat;


%I49= 4<=Cat1(:,4)&Cat1(:,4)<sub(1)&Cat1(:,8)<A1(1);
%A49=Cat1(I49,:);


%I54= sub(1)<=Cat1(:,4)&Cat1(:,4)<sub(2)&Cat1(:,8)<A1(2);
%disp(I54);
%A54=Cat1(I54,:);

%I59= sub(2)<=Cat1(:,4)&Cat1(:,4)<sub(3)&Cat1(:,8)<A1(3);
%A59=Cat1(I59,:);

%I64= sub(3)<=Cat1(:,4)&Cat1(:,4)<sub(4)&Cat1(:,8)<A1(4);
%A64=Cat1(I64,:);

%I69= sub(4)<=Cat1(:,4)&Cat1(:,4)<6.9&Cat1(:,8)<A1(5);
%A69=Cat1(I69,:);

%I74= 6.9<=Cat1(:,4)&Cat1(:,4)<7.4&Cat1(:,8)<A1(6);
%A74=Cat1(I74,:);

%I79= 7.4<=Cat1(:,4)&Cat1(:,4)<7.9&Cat1(:,8)<A1(7);
%A79=Cat1(I79,:);

%I85= 7.9<=Cat1(:,4)&Cat1(:,4)<8.5&Cat1(:,8)<A1(8);
%A85=Cat1(I85,:);
%newC=[A49;A54;A59;A64;A69;A74;A79;A85];
