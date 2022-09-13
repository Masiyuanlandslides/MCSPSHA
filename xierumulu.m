clc;
clear;
load('E:\研究生\毕设发表\第三篇\disanbanprepsha\Input\b3.mat')
load('E:\研究生\毕设发表\第三篇\disanbanprepsha\Input\b31.mat')
Cat=catalog1;
time=timere(:,1);

 RandIndex1=randperm(length(time));   % 随即打乱数组索引

  qyM11=time(RandIndex1);            %提取相应的震级
  
  Cat2=[Cat qyM11];
  Cat1=sortrows(Cat2,8);
  w=000;
   file2 = strcat('Input/',num2str(w),'.txt');    %创建文本文件
           fid2 = fopen(file2,'wt');
           
          [m,n]=size(Cat1);
          
          for i=1:m
               fprintf(fid2,'%d %d %2.2f %2.1f %2.2f %2.2f %2.2f %2.2f\r\n',Cat1(i,1),Cat1(i,2),Cat1(i,3),Cat1(i,4),Cat1(i,5),Cat1(i,6),Cat1(i,7),Cat1(i,8));%i表示地震带号，j表示潜源号，w表示场点号
          end;