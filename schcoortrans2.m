function CT1=schcoortrans2(locat,catml)%场点坐标，震中坐标，角度   坐标的平移和旋转
% locat为场点的X，Y坐标
% newC格式为：子目录数qq 地震档ii 潜源编号vv1 震级MM 地震纬度eqccoor(:,1) 经度 方位角sita X坐标 Y坐标 距离    
% 旋转的角度为第一个地震的破裂方向。
% 为检验，直接加11、12两列（不替换原来的8、9列）


%function CT1=coortrans2(a,b,x,y,Dirangle)
%x=xy(:,1); %震中坐标
%y=xy(:,2);

x2=catml(:,8)-locat(1);
y2=catml(:,9)-locat(2);
a1=catml(:,7)*0.0174532922222222;      %度化弧度 pi/180 = 0.017453 并以北为起点
%a1=90*0.0174532922222222;      %度化弧度 pi/180 = 0.017453 并以北为起点

%y1=cos(a1).*y+sin(a1).*x-a.*sin(a1)-b.*cos(a1);
%x1=cos(a1).*x-(1/sin(a1))'.*y-a.*cos(a1)+b.*sin(a1);

catml(:,11) = x2.*cosd(a1) + y2.*sind(a1);%顺时针旋转
catml(:,12) = y2.*cosd(a1) - x2.*sind(a1);
CT1=catml;
%逆时针旋转角度t
%转换矩阵为   cos(t)  sin(t)
%            -sin(t)  cos(t)