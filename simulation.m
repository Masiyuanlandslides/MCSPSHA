%ģ�������ȷ������
clc;
clear;
fclose('all');
format long;
aa=zeros(800,1);
cc=zeros(800,1);%�ܸ���
for j=0:799
kk=700001+j;
file= strcat('Input/7����/5ʮ/', num2str(kk),'.txt');%ģ�����
   fp = fopen(file, 'r');  
 [Ar,Arcount] = fscanf(fp,'%d %f',[2 inf]);
 Ar=Ar';
 
 A=sum(Ar(:,1));  %�ܲ���������
 
 
 fp1= fopen('Input1/ǱԴ3.txt','r');%��ʵ����
 [Ar1,Arcount1] = fscanf(fp1,'%f %f %f %f %f %f %f',[7 inf]);
 Ar1=Ar1';  
 
 A1=A*Ar1(:,6);  %��ʵ�ļ�����ÿ��ǱԴ�ֵ��ĸ���
 

CC=zeros(57,1);
AA=zeros(57,1);
 for i=1:57
 CC(i,1)=abs(Ar(i,2)-Ar1(i,6));%ƫ�����[ģ��ֵ-��ʵֵ]
 AA(i,1)=abs(Ar(i,1)-A1(i));%����ƫ��
 
 end
 
 
 aa(j+1,1)=mean(AA);
%aa1=std(AA);%��׼��
 
cc(j+1,1)=mean(CC);
%cc1=std(CC);%��׼��
fclose(fp);
fclose(fp1);
end



w=1;
 file2 = strcat('Input/',num2str(w),'.txt');    %�����ı��ļ�
           fid2 = fopen(file2,'wt');
          
          for s=1:j+1
               fprintf(fid2,'%f %f\r\n', aa(s),cc(s));%i��ʾ������ţ�j��ʾǱԴ�ţ�w��ʾ�����
          end;



