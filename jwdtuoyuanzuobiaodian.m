function zhtyjwd = jwdtuoyuanzuobiaodian(ax,ay,direction)
%1  1  1  4.00  112.3700  34.8900  15   39.69299  -39432.18827  -4462.64596   40.26451   22.06218    3.23857
lat=34.54;%����112.46   34.54 
lon=112.46;      
%lat1= 34.8900;     %���� 112.3700  34.8900
%lon1=112.3700;
lat1=ax;     %����
lon1=ay;
lat2=[lat ;lat1];
lon2=[lon; lon1];
latlon20=[lat2,lon2];%�Ѿ��ȷ��ڵ�һ�У�γ�ȷ��ڵڶ���
axesm utm   %����ͶӰ��ʽ������MATLAT�Դ���Universal Transverse Mercator ��UTM����ʽ
Z=utmzone(latlon20);%utmzone����latlon20���������ѡ������Ϊ���ʵ�ͶӰ���򣬿�����һ��̨վ�ľ�γ�ȣ�Ҳ����������̨վ�ľ�γ�ȣ���ʱ��ƽ����
setm(gca,'zone',Z)
h = getm(gca);
R=zeros(size(latlon20));
for i=1:length(latlon20)
  [x,y]= mfwdtran(h,latlon20(i,1),latlon20(i,2)); %����MATLAB�Դ��ĺ�����������ǰ���õ�Z�����̨վ����ת������  [x,y] = mfwdtran(mstruct,lat,lon);
  R(i,:)=[x;y];
  % disp(lat3);
end
%��ͼ
x=R(1,1);%��������
y=R(1,2);
%[lat3,lon3] = minvtran(x,y);
a=R(2,1); %��������
b=R(2,2);
%w=zeros(1,4);
%a1=45;%�Ƕ�
syms x1 y1 t z %���㾭ƽ����ת������ֵ
a1=direction;
%a1=45;%�Ƕ�
XY=zeros(1,4);
[A B C D]= solve(x1*cos(a1)+y1*sin(a1)-t,y1*cos(a1)-x1*sin(a1)-z,t+a-x,z+b-y);
XY(1,1)=B;
XY(1,2)=C;
%[lat4,lon4] = minvtran(XY(1,1),XY(1,2));
tyzbd = tuoyuanzuobiaodian(XY(1,1),XY(1,2));%41��2��
latlon=zeros(41,2);
%w=zeros(1,2);
for i=1:41
syms x111 y111 t111 z111   %ת��
x11=tyzbd(i,1)*1000;%�������곡������
y11=tyzbd(i,2)*1000;
[E,F,G,H]=solve(x11*cos(a1)+y11*sin(a1)-t111,y11*cos(a1)-x11*sin(a1)-z111,t111+a-x111,z111+b-y111);
XY(1,3)=F;
XY(1,4)=G;
[lat3,lon3] = minvtran(XY(1,3),XY(1,4));
latlon(i,1)=lat3;
latlon(i,2)=lon3;
end
zhtyjwd=latlon;
%x11=XY(1,1);%�������곡������
%y11=XY(1,2);
%[E,F,G,H]=solve(x11*cos(a1)+y11*sin(a1)-t111,y11*cos(a1)-x11*sin(a1)-z111,t111+a-x111,z111+b-y111);
%XY(1,3)=F;
%XY(1,4)=G;

%syms x1 y1 t z
%[t,x1,y1,z]= solve(x1*cos(a1)+y1*sin(a1)-t,y1*cos(a1)-x1*sin(a1)-z,t+a-x,z+b-y);
%w(1,1)=x1;
%w(1,2)=y1;
%tyzbd = tuoyuanzuobiaodian(w(1,1),w(1,2));%41��2��
%latlon=zeros(41,2);
%for i=1:41
%syms x111 y111 t111 z111
%x11=tyzbd(i,1)*1000;%�������곡������
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











