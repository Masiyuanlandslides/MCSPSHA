%模拟次数的确定方法
clc;
clear;
fclose('all');
format long;
aa=zeros(800,1);
cc=zeros(800,1);%总个数
for j=0:799
kk=700001+j;
file= strcat('Input/7级档/5十/', num2str(kk),'.txt');%模拟比率
   fp = fopen(file, 'r');  
 [Ar,Arcount] = fscanf(fp,'%d %f',[2 inf]);
 Ar=Ar';
 
 A=sum(Ar(:,1));  %总参与计算个数
 
 
 fp1= fopen('Input1/潜源3.txt','r');%真实比率
 [Ar1,Arcount1] = fscanf(fp1,'%f %f %f %f %f %f %f',[7 inf]);
 Ar1=Ar1';  
 
 A1=A*Ar1(:,6);  %真实四级地震档每个潜源分到的个数
 

CC=zeros(57,1);
AA=zeros(57,1);
 for i=1:57
 CC(i,1)=abs(Ar(i,2)-Ar1(i,6));%偏差矩阵[模拟值-真实值]
 AA(i,1)=abs(Ar(i,1)-A1(i));%个数偏差
 
 end
 
 
 aa(j+1,1)=mean(AA);
%aa1=std(AA);%标准差
 
cc(j+1,1)=mean(CC);
%cc1=std(CC);%标准差
fclose(fp);
fclose(fp1);
end



w=1;
 file2 = strcat('Input/',num2str(w),'.txt');    %创建文本文件
           fid2 = fopen(file2,'wt');
          
          for s=1:j+1
               fprintf(fid2,'%f %f\r\n', aa(s),cc(s));%i表示地震带号，j表示潜源号，w表示场点号
          end;



