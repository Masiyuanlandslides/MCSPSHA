%概率统计,发生概率
clc;
clear;

%matlabpool local
tic;
load('Input2/bI11.mat');%prepsha2挑选完的目录
load('Input2/bI21.mat');%prepsha2挑选完的目录
load('Input2/bI31.mat');%prepsha2挑选完的目录
load('Input2/bI41.mat');%prepsha2挑选完的目录
load('Input2/bI51.mat');%prepsha2挑选完的目录
load('Input2/bI61.mat');%prepsha2挑选完的目录
load('Input2/bI71.mat');%prepsha2挑选完的目录
Ar11=[cataloge21;cataloge22;cataloge23;cataloge24;cataloge25;cataloge26;cataloge27];

  index=unique(Ar11(:,16));%找出场点号
  num=index;
  disp(num);
  N=10000;%目录数目、、、、、、、、、、、、改
  [m,n]=size(index);%计算场点个数
  subI=[5.8 6.7 7.7 8.7 9.7 10.7];  %烈度值的确定采用“7 下 8 上 ” 的原则 。 即 , 烈度 Ⅵ 为 5 . 8≤ i < 6 . 7 ; 烈度 Ⅶ 为 6 . 8 ≤i < 7 . 7 ; 烈度 Ⅷ为 7 . 8 ≤ i < 8 . 7 
  count7=[];
  for i=1:m%按场点循环
      Ar1=Ar11(ismember(Ar11(:,16),num(i)),:);%按场点选目录
 
  [nI,IMout]=histc(Ar1(:,13),subI);%nI列矩阵,为了将震级分入,边界统计
  
    qyI1=Ar1(IMout==1,1);        %找到所对应的目录序号
  % [tf index]=ismember(qyI1(:,1),69);%
  index1=unique(qyI1);        %求出目录序号的唯一值
   [m1,n1]=size(index1);
   pI6=m1/N;    %6度的发生概率,  100为目录总数
  
  qyI2=Ar1(IMout==2,1);        %潜源区震级大小归类7
  % [tf1 index1]=ismember(qyI2(:,1),num);%
  index2=unique(qyI2);
   [m2,n2]=size(index1);
   pI7=m2/N;    %7度的发生概率
  
  qyI3=Ar1(IMout==3,1);        %潜源区震级大小归类8
  % [tf2 index2]=ismember(qyI3(:,1),num);%
  index3=unique(qyI3);
   [m3,n3]=size(index3);
   pI8=m3/N;    %8度的发生概率
  
  qyI4=Ar1(IMout==4,1);        %潜源区震级大小归类9
   %[tf3 index3]=ismember(qyI4(:,1),num);%
   index4=unique(qyI4);
   [m4,n4]=size(index4);
    pI9=m4/N;    %9度的发生概率
    
    qyI5=Ar1(IMout==5,1);        %潜源区震级大小归类10
  % [tf4 index4]=ismember(qyI5(:,1),num);%
  index5=unique(qyI5);
   [m5,n5]=size(index5);
    pI10=m5/N;   %10度的发生概率
    
  count7(i,:)=[num(i),m1,m2,m3,m4,m5];%衡行加
  
  end
  save('Input/b7count.mat','count7');
toc
%matlabpool close
   
   
   
%  Arr=Ar(I,:);%提取相应行,  烈度值的确定采用“7 下 8 上 ” 的原则 。 即 , 烈度 Ⅵ 为 5 . 8≤ i < 6 . 7 ; 烈度 Ⅶ 为 6 . 8 ≤i < 7 . 7 ; 烈度 Ⅷ为 7 . 8 ≤ i < 8 . 7 
  
        
        
% fid1 = fopen('liedufendang.txt','r');
% [Ar22,Arcount] = fscanf(fid1,'%f',[14 inf]);%烈度分档值 6:12.5
 % Arpoint1 = Arcount/8;
       % Ar3 = Ar2'
%   fclose(fid1);  
   
   
   

   
  %  Imax=zeros(193,1);
  %  Itmax=zeros(193,1);
  % Imax1=zeros(193,1);
%for j=1:193
%    b=j;
%    C=Ar(ismember(Ar(:,1),b),:);%
    
 %   Imax(j,:)=max(C(:,17));%每一个地震目录的最大值
    
    
   % Imeanmax=max(Imax1);%每一个地震目录T的平均值的最大值
    
    %指定返回周期内的最大值序列
 %    T=C(:,6)<150;%找到在150年内的地震
 %    Arr=C(T,:);%提取相应行
 %    Itmax(j,:)=max(Arr(:,17));%指定返回周期内每一个地震目录的最大值
 %    Imax1(j,:)=mean(Arr(:,17));%每一个指定返回周期地震目录的平均值  
%end

%pmax=zeros(14,2);
%pmax1=zeros(13,1);
%for i=1:14
%     C11=Imax>Ar22(i)-0.3&Imax<Ar22(i)+0.3;%找到每个地震目录最大烈度大于6小于6.5的行号
 %    I1=Imax(C11,:);%提取相应行
 %    n11=size(I1);
 %    pmax(i,1)=n11(1,1)/(193*200);
    
    
    
        
 %    C1=Itmax>Ar22(i)-0.3&Itmax<Ar22(i)+0.3;%找到指定周期最大烈度大于6小于6.5的行号
 %    I=Itmax(C1,:);%提取相应行
 %    n1=size(I);
 %    pmax(i,2)=n1(1,1)/(193*150);
%end
%file3 = strcat('Input1/1.txt');    %只存最后一次运行的结果存入文本
 %        fid3 = fopen(file3,'wt');
 % fprintf(fid3,'%9.9f  %9.9f\r\n',pmax'); 
  % fclose(fid2);
 %   fclose(fid3);
 %   plot(Ar22,pmax(:,1));

