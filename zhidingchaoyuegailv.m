clc;
clear;
fclose('all');
load('iimax.mat');%prepsha2挑选完的目录
 index=unique(liedushuzhi(:,16));%场点编号
  num=index;
 % disp(num);
  [m,n]=size(index);%场点大小
 % subI=[5.8 6.7 7.7 8.7 9.7 10.7];  %烈度值的确定采用“7 下 8 上 ” 的原则 。 即 , 烈度 Ⅵ 为 5 . 8≤ i < 6 . 7 ; 烈度 Ⅶ 为 6 . 8 ≤i < 7 . 7 ; 烈度 Ⅷ为 7 . 8 ≤ i < 8 . 7 
  % count7c=[];%最后结果存储
   chaoyue=[];
  for i=1:m%按场点循环
      Ar22=liedushuzhi(ismember(liedushuzhi(:,16),num(i)),:);%Ar1为按场点选目录
      Ar23=sort(Ar22(:,13),'descend');
      c2=(2/100)*10000;  %T年，超越概率10%的行号
      c10=(10/100)*10000;  %T年，超越概率10%的行号
      c40=(40/100)*10000;  %T年，超越概率10%的行号
      c63=(63/100)*10000;  %T年，超越概率10%的行号
      chaoyue(i,1)=Ar23(c2,:);
      chaoyue(i,2)=Ar23(c10,:);
      chaoyue(i,3)=Ar23(c40,:);
      chaoyue(i,4)=Ar23(c63,:);
  end
  save chaoyuegailvzhi chaoyue
  