function CT=coortrans(lat,lon,lat1,lon1,Dirangle1,Dirangle2)
%http://blog.sina.com.cn/s/blog_5f67dccb0102vyp4.html
%clear;
close all;
%disp(lon1);
lat2=[lat ;lat1];
lon2=[lon; lon1];
%disp(lon2);
latlon20=[lat2,lon2];%�Ѿ��ȷ��ڵ�һ�У�γ�ȷ��ڵڶ���  ���������ڵ�һ�У����������ڵڶ���

%disp(latlon20);
axesm utm   %����ͶӰ��ʽ������MATLAT�Դ���Universal Transverse Mercator ��UTM����ʽ
Z=utmzone(latlon20);%utmzone����latlon20���������ѡ������Ϊ���ʵ�ͶӰ���򣬿�����һ��̨վ�ľ�γ�ȣ�Ҳ����������̨վ�ľ�γ�ȣ���ʱ��ƽ����
setm(gca,'zone',Z)
h = getm(gca);
R=zeros(2,2);
 %file1 = strcat('coordinate.txt');
  %  fid1 = fopen(file1,'wt');
for i=1:2
  [xx,yy]= mfwdtran(h,latlon20(i,1),latlon20(i,2)); %����MATLAB�Դ��ĺ�����������ǰ���õ�Z�����̨վ����ת������  [x,y] = mfwdtran(mstruct,lat,lon);
  R(i,1)=xx;
  R(i,2)=yy;
  %disp(R);
end

x=R(1,1);%��������
y=R(1,2);
 a=R(2,1); %��������
b=R(2,2);
w=zeros(1,4);
syms x1 y1 t z
a1=Dirangle1;%�Ƕ�
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


 

   

