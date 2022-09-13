function CT=coortrans(lat,lon,lat1,lon1,Dirangle1,Dirangle2)
%http://blog.sina.com.cn/s/blog_5f67dccb0102vyp4.html
%clear;
close all;
%disp(lon1);
lat2=[lat ;lat1];
lon2=[lon; lon1];
%disp(lon2);
latlon20=[lat2,lon2];%把经度放在第一列，纬度放在第二列  场点坐标在第一行，震中坐标在第二行

%disp(latlon20);
axesm utm   %设置投影方式，这是MATLAT自带的Universal Transverse Mercator （UTM）方式
Z=utmzone(latlon20);%utmzone根据latlon20里面的数据选择他认为合适的投影区域，可以是一个台站的经纬度，也可以是所有台站的经纬度（此时是平均）
setm(gca,'zone',Z)
h = getm(gca);
R=zeros(2,2);
 %file1 = strcat('coordinate.txt');
  %  fid1 = fopen(file1,'wt');
for i=1:2
  [xx,yy]= mfwdtran(h,latlon20(i,1),latlon20(i,2)); %调用MATLAB自带的函数，根据先前设置的Z，逐个台站进行转换计算  [x,y] = mfwdtran(mstruct,lat,lon);
  R(i,1)=xx;
  R(i,2)=yy;
  %disp(R);
end

x=R(1,1);%场点坐标
y=R(1,2);
 a=R(2,1); %震中坐标
b=R(2,2);
w=zeros(1,4);
syms x1 y1 t z
a1=Dirangle1;%角度
[A,B,C,D]= solve(x1*cos(a1)+y1*sin(a1)-t,y1*cos(a1)-x1*sin(a1)-z,t+a-x,z+b-y);
%disp(x1);
w(1,1)=B;
w(1,2)=C;
%disp(w);
 syms x11 y11 t1 z1
a2=Dirangle2;
[E,F,G,H]=solve(x11*cos(a2)+y11*sin(a2)-t1,y11*cos(a2)-x11*sin(a2)-z1,t1+a-x,z1+b-y);
w(1,3)=F;
w(1,4)=G;
%disp(w);
CT=w;


 

   

