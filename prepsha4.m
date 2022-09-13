%超越概率意义下计算的发生概率

%matlabpool local

clc;
clear;

     
tic;
load('Input2/bI11(50).mat');%prepsha2挑选完的目录
load('Input2/bI21(50).mat');%prepsha2挑选完的目录
load('Input2/bI31(50).mat');%prepsha2挑选完的目录
load('Input2/bI41(50).mat');%prepsha2挑选完的目录
load('Input2/bI51(50).mat');%prepsha2挑选完的目录
load('Input2/bI61(50).mat');%prepsha2挑选完的目录
load('Input2/bI71(50).mat');%prepsha2挑选完的目录
Ar11=[cataloge11;cataloge21;cataloge31;cataloge41;cataloge51;cataloge61;cataloge71];

N=10000;%目录数目
  index=unique(Ar11(:,16));%场点编号
  num=index;
  disp(num);
  [m,n]=size(index);%场点大小
  subI=[5.8 6.7 7.7 8.7 9.7 10.7];  %烈度值的确定采用“7 下 8 上 ” 的原则 。 即 , 烈度 Ⅵ 为 5 . 8≤ i < 6 . 7 ; 烈度 Ⅶ 为 6 . 8 ≤i < 7 . 7 ; 烈度 Ⅷ为 7 . 8 ≤ i < 8 . 7 
   count7c=[];%最后结果存储
   liedushuzhi=[];
  for i=1:m%按场点循环
      disp(i);
      Ar22=Ar11(ismember(Ar11(:,16),num(i)),:);%Ar1为按场点选目录
     
        iindex=unique(Ar22(:,1));%选出目录号
       [mm1,nn1]=size(iindex);
       Ar1=[];%每个目录的最大值，也是计算超越概率所需要的目录
       for j=1:mm1%找出每个目录的最大值
     % for j=6707;
            d=ismember(Ar22(:,1),iindex(j));
            Cat1=Ar22(d,:);%第一组
           % disp(Cat1);
          %  Cat2=find(max(Cat1(:,13)));
          [Catt2,Cat2]=max(Cat1(:,13));
           % disp(Cat2);
            
            Cat3=Cat1(Cat2,:);
           % disp(Cat3);
          Ar1(j,:)=Cat3;
       end
    [nI,IMout]=histc(Ar1(:,13),subI);%nI列矩阵,为了将震级分入,边界统计
  
    qyI1=Ar1(IMout==1,1);        %潜源区震级大小归类6
   [m1,n1]=size(qyI1);
   pI6=m1/N;    %6度的发生概率,  100为目录总数
  
  qyI2=Ar1(IMout==2,1);        %潜源区震级大小归类7
   [m2,n2]=size(qyI2);
   pI7=m2/N;    %7度的发生概率
  
  qyI3=Ar1(IMout==3,1);        %潜源区震级大小归类8
   [m3,n3]=size(qyI3);
   pI8=m3/N;    %8度的发生概率
  
  qyI4=Ar1(IMout==4,1);        %潜源区震级大小归类9
   [m4,n4]=size(qyI4);
    pI9=m4/N;    %9度的发生概率
    
    qyI5=Ar1(IMout==5,1);        %潜源区震级大小归类10
   [m5,n5]=size(qyI5);
    pI10=m5/N;   %10度的发生概率
    
  count7c(i,:)=[num(i),m1,m2,m3,m4,m5];%衡行加   
  liedushuzhi=[liedushuzhi;Ar1];
  end  
  save iimax liedushuzhi
  save iimaxnum count7c
  
 