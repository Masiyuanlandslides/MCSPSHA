function tyzbd = tuoyuanzuobiaodian(x,y)
sita=0:pi/20:2*pi; 
%1  1  1  4.00  112.3700  34.8900  15   39.69299  -39432.18827  -4462.64596   40.26451   22.06218    3.23857
x0=0;
y0=0;
w=1;
file1=strcat( 'Input/',num2str(w),'.txt');  %地震带潜源文件
 fid1 = fopen(file1,'r');
[SR1,SRMcount1]=fscanf(fid1,'%f',[16 inf]);
SRMcount=SRMcount1/16;
SR=SR1';
a=SR(SRMcount,11);
b=SR(SRMcount,12);
disp(a);
disp(b);
%a= 44.074380588799088971442905916953;%44.074380588799088971442905916953
%b= 24.536536337971847661273607532332;%24.536536337971847661273607532332
%x1= 37545.38883/1000;  
%y1=-12851.32127/1000; 
x1=x/1000;  
y1=y/1000; 
angle =45;       % 单位为度
fi=angle/180*pi;    %  转弧度
%figure(1)
 %椭圆，中心点在（x0,y0），长轴为a，短轴为b，方向角为fi。
 %p = calculateEllipse(x0,y0,a,b,angle,50);        %  调用子程序，返回椭圆曲线点的坐标
% X=a*cos(sita+fi);
 %Y=b*sin(sita+fi);
% [lat,lon]=projinv(utm,34,114);
 %plot(a*cos(sita),b*sin(sita));
 XY=zeros(41,2);
 XY(:,1)=a*cos(sita);
 XY(:,2)=b*sin(sita);
 %disp(XY);
 %disp(lat5);
 %http://www.cnblogs.com/mengxin/archive/2011/10/15/2213479.html
%hold on;   
%plot(x0,y0,'marker','^','markersize',10,'color','r','MarkerEdgeColor','r','MarkerFaceColor','r');     %  画圆心
%plot(x1,y1,'marker','^','markersize',10,'color','r','MarkerEdgeColor','r','MarkerFaceColor','r');     %  画圆心
%axis equal
tyzbd=XY;
