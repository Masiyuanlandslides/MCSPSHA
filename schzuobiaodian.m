%function [CT0,CT]=schzuobiaodian(lat,lon,catalog1)
function [CT0,CT]=schzuobiaodian(latlon,catalog1)

% lat，lon 场点经纬度坐标
%catalog1为PREPSHA.M产生的地震目录
%格式为：  子目录数qq 地震档ii 潜源编号vv1 震级MM 地震纬度eqccoor(:,1) 经度 方位角sita

%输出    CT0 为输入第一组参数（lat，lon），即场点坐标的变换值（X，Y）
%        CT  为地震目录的坐标变换,第8列X，第9列Y
% 格式为：子目录数qq 地震档ii 潜源编号vv1 震级MM 地震纬度eqccoor(:,1) 经度 方位角sita X坐标 Y坐标

%disp(lat);
%disp(lon);
%disp(catalog1);

%function [CT,dd]=zuobiaodian(lat1,lon1)
%http://blog.sina.com.cn/s/blog_5f67dccb0102vyp4.html
%clear;
close all;
lat=latlon(:,2);
lon=latlon(:,1);
%    locat=[lat,lon];      % 以场点为中心进行投影转换
    axesm utm             %设置投影方式，这是MATLAT自带的Universal Transverse Mercator （UTM）方式
%    Z=utmzone(locat);     %utmzone根据locat 的数据选择投影区域
    Z=utmzone(lat,lon);     %utmzone根据locat 的数据选择投影区域
    setm(gca,'zone',Z)
    h = getm(gca);
    [xx,yy]= mfwdtran(h,lat,lon); %调用MATLAB自带的函数，根据先前设置的Z，进行转换计算
     CT0 = [xx/1000, yy/1000];
    [x,y] = mfwdtran(h,catalog1(:,6),catalog1(:,5)); %根据先前设置的Z，逐个地震进行转换计算
    CT=[catalog1,x/1000,y/1000];
close all

%   lat1=catalog1(:,6);%震中经度;
%   lon1=catalog1(:,5);%震中纬度;
%   lat2=[lat ;lat1];  
%   lon2=[lon; lon1];
%disp(lon2);

%latlon20=[lat2,lon2];%把经度放在第一列，纬度放在第二列  场点坐标在第一行，震中坐标在第二行
%latlon20=[lat,lon];%把经度放在第一列，纬度放在第二列  场点坐标在第一行，震中坐标在第二行

%[m,n]=size(latlon20);
%disp(latlon20);
%axesm utm   %设置投影方式，这是MATLAT自带的Universal Transverse Mercator （UTM）方式
%Z=utmzone(latlon20);%utmzone根据latlon20里面的数据选择他认为合适的投影区域，可以是一个台站的经纬度，也可以是所有台站的经纬度（此时是平均）
%setm(gca,'zone',Z)
%h = getm(gca);
%R=zeros(m,2);
%for i=1:m
%  [xx,yy]= mfwdtran(h,latlon20(:,1),latlon20(:,2)); %调用MATLAB自带的函数，根据先前设置的Z，逐个台站进行转换计算  [x,y] = mfwdtran(mstruct,lat,lon);
%  R(:,1)=xx;
%  R(:,2)=yy;
%end
%CT=R/1000;