%本程序利用实验目录测试ＰＲＥＰＳＨＡ２程序计算烈度
close all;
clc;
%http://m.blog.csdn.net/article/details?id=51283758
clear;
% Step 1:  Load study area (Require)

%profile on
%matlabpool local
tic;
%衰减关系
C1=5.253;
C2=1.398;
C3=0;
C4=-4.164;
C5=26;
C6=0;
C7=0;
D1=2.019;
D2=1.398;
D3=0;
D4=-2.943;
D5=8;
D6=0;
D7=0;
gri=0.05;%格网化精度
% % C1=1.0476;
% % C2=1.4472;
% % C3=0;
% % C4=-0.8609;
% % C5=7;
% % C6=0;
% % C7=-0.0039;
% % D1=0.8831;
% % D2=1.4472;
% % D3=0;
% % D4=-0.9381;
% % D5=5;
% % D6=0;
% % D7=-0.0027;
%gri=0.2;%格网化精度

Ar1 = fopen('tianshuishi.txt','r');             %宝鸡市（边界点）
[Ar,Arcount] = fscanf(Ar1,'%f',[2 inf]);
%Arpoint = Arcount/2;
Ar = Ar';
fclose(Ar1);
GT = GridTrans(Ar,gri);         %省边界格网化
[ppoint1,ppoint2]=size(GT);     %需要计算的场点大小
GT2=GT(:,2);                    %场点经度
GT1=GT(:,1);                    %场点纬度


%load('inputyong/b6(50年10万).mat');        %程序1产生的目录
load('inputyong/b6(50年100000个).mat');        %程序1产生的目录
count = length(catalog1);
%catalog1格式：  子目录数qq 地震档ii 潜源编号vv1 震级MM 地震纬度eqccoor(:,1) 经度 方位角sita
disp(count);

%//计算震级档上限距离
lsub=[4.9;5.4;5.9;6.4;6.9;7.4;7.9;8.5;9.5];%分档地震震级
    II=5.0;                                   %需要的最低烈度
    A=disRMax(II,lsub,C1,C2,C3,C4,C5,C6,C7);   %按震级分档计算出最大长轴距离
    A1=10*ceil(A/10);                         %最大长轴距离取整
cataloge611=[];          %程序2的输出矩阵预设////////////////////////////////////////注意该矩阵名称，21中1代表第一个地震带

%parfor i=1:ppoint1%按格网点计算1992
parfor i=1:100%按格网点计算6租
 
%parfor i=1;%按格网点计算
%for i=23:43;
    disp(i);
    [CT0,CT] = schzuobiaodian(GT(i,:),catalog1);    %以场点为中心CTO转直角坐标 CT所有目录进行坐标转换
    %[CT0,CT] = schzuobiaodian(GT(i,2),GT(i,1),catalog1);    %以场点为中心CTO转直角坐标 CT所有目录进行坐标转换
     % 格式为：子目录数qq 地震档ii 潜源编号vv1 震级MM 地震纬度eqccoor(:,1) 经度 方位角sita X坐标 Y坐标

    newC=schnewCat(CT0,CT,A1,lsub);     %按距离挑选出新的目录，最后一列增加了距场点的距离
    % newC格式为：子目录数qq 地震档ii 潜源编号vv1 震级MM 地震纬度eqccoor(:,1) 经度 方位角sita X坐标 Y坐标 距离    
    
    %//坐标平移旋转
    CT2=schcoortrans2(CT0,newC);  %对新产生的目录按每个地震的破裂方向进行坐标的平移和旋转。在原目录最后增加11、12列
    %CT2格式为：子目录数qq 地震档ii 潜源编号vv1 震级MM 地震纬度eqccoor(:,1) 经度 方位角sita X坐标 Y坐标 距离 X1 Y1   
    [count1,lie1]=size(CT2);%计算大小
    %dd1=sqrt((0-CT2(:,1)).^2+(0-CT2(:,2)).^2);%计算场点与震中距离公式
    disp(count1);
    %//计算烈度
     %CT2格式为：子目录数qq 地震档ii 潜源编号vv1 震级MM 地震纬度eqccoor(:,1) 经度 方位角sita X坐标 Y坐标 距离 X1 Y1   
     ellipse= gschelli(CT2,C1,C2,C3,C4,C5,C6,C7,D1,D2,D3,D4,D5,D6,D7);  %场点衰减椭圆，求得长短轴的长度，单位为km
    %计算长短轴用到并行
    Inten=Intensity(CT2(:,4),ellipse(:,1),C1,C2,C3,C4,C5,C6,C7) ;                        %计算烈度值 震级  长轴
    iii=repmat(i,count1,1);%场点号
    cataloge=[CT2 Inten ellipse(:,1) ellipse(:,2) iii];%衡行加
%CT2格式为：子目录数qq 地震档ii 潜源编号vv1 震级MM 地震纬度eqccoor(:,1) 经度 方位角sita X坐标 Y坐标 距离 X1 Y1 烈度 长轴 短轴 场点号
    cataloge611=[cataloge611;cataloge];                     %、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、注意替换矩阵名称
end
%目录号 带号 潜源号 震级 纬度 经度 角度 x坐标 y坐标 震中距 转x 转y 烈度 长轴 短轴 场点号
%31  3 44  5.43039533392234  107.719827522045   34.1997999178864   170
%197.722440773789          3788.89583614646          40.4953956805562          5.60380045091084          40.5685225606436          27.8325367354434                         2
%storageName = strcat('bI33',num2str(i),'.mat');
%storageName = strcat('bI33',num2str(i),'.mat');
%save(storageName,'cataloge2');

 save('Input2/bI611(50).mat','cataloge611');  
% cataloge313=cataloge311(10000001:20000000,:);
% save('Input2/bI313(50).mat','cataloge313');  
% cataloge314=cataloge311(20000001:30000000,:);
%  save('Input2/bI314(50).mat','cataloge314');  %、、、、、、、、、、、、、、、、、、、、、、、、、、注意命名
% cataloge315=cataloge311(30000001:44806025,:);
%  save('Input2/bI315(50).mat','cataloge315');  
 toc
%matlabpool close

%fp1 = fopen('catalog2new.txt','w');
%fprintf(fp1,'    M      lat         lon        sita        x           y        delta       I        Ia          Ib\r\n');
%for i=1:length(cataloge2(:,1))
%    fprintf(fp1,'%7.4f  %7.4f   %8.4f   %8.4f   %8.4f   %8.4f   %8.4f   %5.3f   %8.4f   %8.4f\r\n',...
%      cataloge2(i,4),cataloge2(i,5),cataloge2(i,6),cataloge2(i,7),cataloge2(i,8),cataloge2(i,9),cataloge2(i,10),...
%      cataloge2(i,13),cataloge2(i,14),cataloge2(i,15));
%end;
%fclose(fp1);

%figure(1)
%    latb = floor(min(min(catalog1(:,6)),GT(1,2))-1);  %确定图框大小
%    late = ceil(max(max(catalog1(:,6)),GT(1,2))+1);
%    lonb = floor(min(min(catalog1(:,5)),GT(1,1))-1);
%    lone = ceil(max(max(catalog1(:,5)),GT(1,1))+1);
%    m_proj('miller','lat',[latb late],'long',[lonb lone]);
%    axesm('MapProjection','miller','FLonLimit',[lonb lone],'FLatLimit',[latb late]);
%    axesm('MapProjection','miller');
%    m_grid('box','fancy','tickdir','in');
%    for r =1:length(catalog1(:,1))
%       m_line(catalog1(r,5),catalog1(r,6),'marker','o','markersize',1*catalog1(r,4),'MarkerEdgeColor','g','MarkerFaceColor','g'); 
%    end
%   for r=1:length(cataloge(:,1))    %画地震分布图
%        
%         m_line(cataloge(r,5),cataloge(r,6),'marker','o','markersize',1*cataloge(r,4),'MarkerEdgeColor','b','MarkerFaceColor','b'); 
%    end
%    title('震中分布图');
%    m_line(GT(1,1),GT(1,2),'marker','^','markersize',5,'color','r','MarkerEdgeColor','r',...
%        'MarkerFaceColor','r');      %画场地
%    legend('红色为场点','蓝色挑选地震','绿色其余地震');


%figure(2)
%    hold on
%    for r=1:length(cataloge(:,1))
      
%       plot(cataloge(r,8),cataloge(r,9),'o','markersize',cataloge(r,4));
%    end

%     plot(CT0(1),CT0(2),'-ro'); 
%     grid;
%     axis equal;
%     title('转直角坐标震中分布图');
%     xlabel('UTM Easting (km)')
%     ylabel('UTM Northing (km)')

%figure(3)
%    drawcircle=@(x,y,r,c)(plot(x+r*cos(linspace(0,2*pi)),y+r*sin(linspace(0,2*pi)),c));
%    hold on; 
%    grid;
%    for r=1:length(cataloge(:,1))
                                      %drawcircle(cataloge(r,11),cataloge(r,12),2*cataloge(r,4),'b');
%        drawcircle(cataloge(r,11),cataloge(r,12),2,'b');
                                      %h = hellipse(0,0,cataloge(r,14),cataloge(r,15),cataloge(r,7));
%        h = hellipse(cataloge(r,15),cataloge(r,14),0,0,0);
%    end
%       drawcircle(0,0,2,'r');
%    axis equal;
%    legend('红色为场点','蓝色为地震','线条为等震线');
   



