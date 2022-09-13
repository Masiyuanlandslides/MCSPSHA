%function [CT0,CT]=schzuobiaodian(lat,lon,catalog1)
function [CT0,CT]=schzuobiaodian(latlon,catalog1)

% lat��lon ���㾭γ������
%catalog1ΪPREPSHA.M�����ĵ���Ŀ¼
%��ʽΪ��  ��Ŀ¼��qq ����ii ǱԴ���vv1 ��MM ����γ��eqccoor(:,1) ���� ��λ��sita

%���    CT0 Ϊ�����һ�������lat��lon��������������ı任ֵ��X��Y��
%        CT  Ϊ����Ŀ¼������任,��8��X����9��Y
% ��ʽΪ����Ŀ¼��qq ����ii ǱԴ���vv1 ��MM ����γ��eqccoor(:,1) ���� ��λ��sita X���� Y����

%disp(lat);
%disp(lon);
%disp(catalog1);

%function [CT,dd]=zuobiaodian(lat1,lon1)
%http://blog.sina.com.cn/s/blog_5f67dccb0102vyp4.html
%clear;
close all;
lat=latlon(:,2);
lon=latlon(:,1);
%    locat=[lat,lon];      % �Գ���Ϊ���Ľ���ͶӰת��
    axesm utm             %����ͶӰ��ʽ������MATLAT�Դ���Universal Transverse Mercator ��UTM����ʽ
%    Z=utmzone(locat);     %utmzone����locat ������ѡ��ͶӰ����
    Z=utmzone(lat,lon);     %utmzone����locat ������ѡ��ͶӰ����
    setm(gca,'zone',Z)
    h = getm(gca);
    [xx,yy]= mfwdtran(h,lat,lon); %����MATLAB�Դ��ĺ�����������ǰ���õ�Z������ת������
     CT0 = [xx/1000, yy/1000];
    [x,y] = mfwdtran(h,catalog1(:,6),catalog1(:,5)); %������ǰ���õ�Z������������ת������
    CT=[catalog1,x/1000,y/1000];
close all

%   lat1=catalog1(:,6);%���о���;
%   lon1=catalog1(:,5);%����γ��;
%   lat2=[lat ;lat1];  
%   lon2=[lon; lon1];
%disp(lon2);

%latlon20=[lat2,lon2];%�Ѿ��ȷ��ڵ�һ�У�γ�ȷ��ڵڶ���  ���������ڵ�һ�У����������ڵڶ���
%latlon20=[lat,lon];%�Ѿ��ȷ��ڵ�һ�У�γ�ȷ��ڵڶ���  ���������ڵ�һ�У����������ڵڶ���

%[m,n]=size(latlon20);
%disp(latlon20);
%axesm utm   %����ͶӰ��ʽ������MATLAT�Դ���Universal Transverse Mercator ��UTM����ʽ
%Z=utmzone(latlon20);%utmzone����latlon20���������ѡ������Ϊ���ʵ�ͶӰ���򣬿�����һ��̨վ�ľ�γ�ȣ�Ҳ����������̨վ�ľ�γ�ȣ���ʱ��ƽ����
%setm(gca,'zone',Z)
%h = getm(gca);
%R=zeros(m,2);
%for i=1:m
%  [xx,yy]= mfwdtran(h,latlon20(:,1),latlon20(:,2)); %����MATLAB�Դ��ĺ�����������ǰ���õ�Z�����̨վ����ת������  [x,y] = mfwdtran(mstruct,lat,lon);
%  R(:,1)=xx;
%  R(:,2)=yy;
%end
%CT=R/1000;