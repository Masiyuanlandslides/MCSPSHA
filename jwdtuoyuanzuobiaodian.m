function zhtyjwd = jwdtuoyuanzuobiaodian(ax,ay,direction)
%1  1  1  4.00  112.3700  34.8900  15   39.69299  -39432.18827  -4462.64596   40.26451   22.06218    3.23857
lat=34.54;%场点112.46   34.54 
lon=112.46;      
%lat1= 34.8900;     %震中 112.3700  34.8900
%lon1=112.3700;
lat1=ax;     %震中
lon1=ay;
lat2=[lat ;lat1];
lon2=[lon; lon1];
latlon20=[lat2,lon2];%把经度放在第一列，纬度放在第二列
axesm utm   %设置投影方式，这是MATLAT自带的Universal Transverse Mercator （UTM）方式
Z=utmzone(latlon20);%utmzone根据latlon20里面的数据选择他认为合适的投影区域，可以是一个台站的经纬度，也可以是所有台站的经纬度（此时是平均）
setm(gca,'zone',Z)
h = getm(gca);
R=zeros(size(latlon20));
for i=1:length(latlon20)
  [x,y]= mfwdtran(h,latlon20(i,1),latlon20(i,2)); %调用MATLAB自带的函数，根据先前设置的Z，逐个台站进行转换计算  [x,y] = mfwdtran(mstruct,lat,lon);
  R(i,:)=[x;y];
  % disp(lat3);
end
%画图
x=R(1,1);%场点坐标
y=R(1,2);
%[lat3,lon3] = minvtran(x,y);
a=R(2,1); %震中坐标
b=R(2,2);
%w=zeros(1,4);
%a1=45;%角度
syms x1 y1 t z %场点经平移旋转后坐标值
a1=direction;
%a1=45;%角度
XY=zeros(1,4);
[A B C D]= solve(x1*cos(a1)+y1*sin(a1)-t,y1*cos(a1)-x1*sin(a1)-z,t+a-x,z+b-y);
XY(1,1)=B;
XY(1,2)=C;
%[lat4,lon4] = minvtran(XY(1,1),XY(1,2));
tyzbd = tuoyuanzuobiaodian(XY(1,1),XY(1,2));%41行2列
latlon=zeros(41,2);
%w=zeros(1,2);
for i=1:41
syms x111 y111 t111 z111   %转回
x11=tyzbd(i,1)*1000;%最终坐标场点坐标
y11=tyzbd(i,2)*1000;
[E,F,G,H]=solve(x11*cos(a1)+y11*sin(a1)-t111,y11*cos(a1)-x11*sin(a1)-z111,t111+a-x111,z111+b-y111);
XY(1,3)=F;
XY(1,4)=G;
[lat3,lon3] = minvtran(XY(1,3),XY(1,4));
latlon(i,1)=lat3;
latlon(i,2)=lon3;
end
zhtyjwd=latlon;
%x11=XY(1,1);%最终坐标场点坐标
%y11=XY(1,2);
%[E,F,G,H]=solve(x11*cos(a1)+y11*sin(a1)-t111,y11*cos(a1)-x11*sin(a1)-z111,t111+a-x111,z111+b-y111);
%XY(1,3)=F;
%XY(1,4)=G;

%syms x1 y1 t z
%[t,x1,y1,z]= solve(x1*cos(a1)+y1*sin(a1)-t,y1*cos(a1)-x1*sin(a1)-z,t+a-x,z+b-y);
%w(1,1)=x1;
%w(1,2)=y1;
%tyzbd = tuoyuanzuobiaodian(w(1,1),w(1,2));%41行2列
%latlon=zeros(41,2);
%for i=1:41
%syms x111 y111 t111 z111
%x11=tyzbd(i,1)*1000;%最终坐标场点坐标
%y11=tyzbd(i,2)*1000;
%[t111,x111,y111,z111]=solve(x11*cos(a1)+y11*sin(a1)-t111,y11*cos(a1)-x11*sin(a1)-z111,t111+a-x111,z111+b-y111);
%w(1,3)=x111;
%w(1,4)=y111;
%[lat3,lon3] = minvtran(w(1,3),w(1,4));
%latlon(i,1)=lat3;
%latlon(i,2)=lon3;
%disp(latlon)
%end
%zhtyjwd=latlon;











