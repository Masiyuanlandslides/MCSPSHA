clc;
clear;
load('E:\�о���\���跢��\����ƪ\disanbanprepsha\Input\b3.mat')
load('E:\�о���\���跢��\����ƪ\disanbanprepsha\Input\b31.mat')
Cat=catalog1;
time=timere(:,1);

 RandIndex1=randperm(length(time));   % �漴������������

  qyM11=time(RandIndex1);            %��ȡ��Ӧ����
  
  Cat2=[Cat qyM11];
  Cat1=sortrows(Cat2,8);
  w=000;
   file2 = strcat('Input/',num2str(w),'.txt');    %�����ı��ļ�
           fid2 = fopen(file2,'wt');
           
          [m,n]=size(Cat1);
          
          for i=1:m
               fprintf(fid2,'%d %d %2.2f %2.1f %2.2f %2.2f %2.2f %2.2f\r\n',Cat1(i,1),Cat1(i,2),Cat1(i,3),Cat1(i,4),Cat1(i,5),Cat1(i,6),Cat1(i,7),Cat1(i,8));%i��ʾ������ţ�j��ʾǱԴ�ţ�w��ʾ�����
          end;