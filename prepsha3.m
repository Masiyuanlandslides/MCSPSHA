%����ͳ��,��������
clc;
clear;

%matlabpool local
tic;
load('Input2/bI11.mat');%prepsha2��ѡ���Ŀ¼
load('Input2/bI21.mat');%prepsha2��ѡ���Ŀ¼
load('Input2/bI31.mat');%prepsha2��ѡ���Ŀ¼
load('Input2/bI41.mat');%prepsha2��ѡ���Ŀ¼
load('Input2/bI51.mat');%prepsha2��ѡ���Ŀ¼
load('Input2/bI61.mat');%prepsha2��ѡ���Ŀ¼
load('Input2/bI71.mat');%prepsha2��ѡ���Ŀ¼
Ar11=[cataloge21;cataloge22;cataloge23;cataloge24;cataloge25;cataloge26;cataloge27];

  index=unique(Ar11(:,16));%�ҳ������
  num=index;
  disp(num);
  N=10000;%Ŀ¼��Ŀ��������������������������
  [m,n]=size(index);%���㳡�����
  subI=[5.8 6.7 7.7 8.7 9.7 10.7];  %�Ҷ�ֵ��ȷ�����á�7 �� 8 �� �� ��ԭ�� �� �� , �Ҷ� �� Ϊ 5 . 8�� i < 6 . 7 ; �Ҷ� �� Ϊ 6 . 8 ��i < 7 . 7 ; �Ҷ� ��Ϊ 7 . 8 �� i < 8 . 7 
  count7=[];
  for i=1:m%������ѭ��
      Ar1=Ar11(ismember(Ar11(:,16),num(i)),:);%������ѡĿ¼
 
  [nI,IMout]=histc(Ar1(:,13),subI);%nI�о���,Ϊ�˽��𼶷���,�߽�ͳ��
  
    qyI1=Ar1(IMout==1,1);        %�ҵ�����Ӧ��Ŀ¼���
  % [tf index]=ismember(qyI1(:,1),69);%
  index1=unique(qyI1);        %���Ŀ¼��ŵ�Ψһֵ
   [m1,n1]=size(index1);
   pI6=m1/N;    %6�ȵķ�������,  100ΪĿ¼����
  
  qyI2=Ar1(IMout==2,1);        %ǱԴ���𼶴�С����7
  % [tf1 index1]=ismember(qyI2(:,1),num);%
  index2=unique(qyI2);
   [m2,n2]=size(index1);
   pI7=m2/N;    %7�ȵķ�������
  
  qyI3=Ar1(IMout==3,1);        %ǱԴ���𼶴�С����8
  % [tf2 index2]=ismember(qyI3(:,1),num);%
  index3=unique(qyI3);
   [m3,n3]=size(index3);
   pI8=m3/N;    %8�ȵķ�������
  
  qyI4=Ar1(IMout==4,1);        %ǱԴ���𼶴�С����9
   %[tf3 index3]=ismember(qyI4(:,1),num);%
   index4=unique(qyI4);
   [m4,n4]=size(index4);
    pI9=m4/N;    %9�ȵķ�������
    
    qyI5=Ar1(IMout==5,1);        %ǱԴ���𼶴�С����10
  % [tf4 index4]=ismember(qyI5(:,1),num);%
  index5=unique(qyI5);
   [m5,n5]=size(index5);
    pI10=m5/N;   %10�ȵķ�������
    
  count7(i,:)=[num(i),m1,m2,m3,m4,m5];%���м�
  
  end
  save('Input/b7count.mat','count7');
toc
%matlabpool close
   
   
   
%  Arr=Ar(I,:);%��ȡ��Ӧ��,  �Ҷ�ֵ��ȷ�����á�7 �� 8 �� �� ��ԭ�� �� �� , �Ҷ� �� Ϊ 5 . 8�� i < 6 . 7 ; �Ҷ� �� Ϊ 6 . 8 ��i < 7 . 7 ; �Ҷ� ��Ϊ 7 . 8 �� i < 8 . 7 
  
        
        
% fid1 = fopen('liedufendang.txt','r');
% [Ar22,Arcount] = fscanf(fid1,'%f',[14 inf]);%�Ҷȷֵ�ֵ 6:12.5
 % Arpoint1 = Arcount/8;
       % Ar3 = Ar2'
%   fclose(fid1);  
   
   
   

   
  %  Imax=zeros(193,1);
  %  Itmax=zeros(193,1);
  % Imax1=zeros(193,1);
%for j=1:193
%    b=j;
%    C=Ar(ismember(Ar(:,1),b),:);%
    
 %   Imax(j,:)=max(C(:,17));%ÿһ������Ŀ¼�����ֵ
    
    
   % Imeanmax=max(Imax1);%ÿһ������Ŀ¼T��ƽ��ֵ�����ֵ
    
    %ָ�����������ڵ����ֵ����
 %    T=C(:,6)<150;%�ҵ���150���ڵĵ���
 %    Arr=C(T,:);%��ȡ��Ӧ��
 %    Itmax(j,:)=max(Arr(:,17));%ָ������������ÿһ������Ŀ¼�����ֵ
 %    Imax1(j,:)=mean(Arr(:,17));%ÿһ��ָ���������ڵ���Ŀ¼��ƽ��ֵ  
%end

%pmax=zeros(14,2);
%pmax1=zeros(13,1);
%for i=1:14
%     C11=Imax>Ar22(i)-0.3&Imax<Ar22(i)+0.3;%�ҵ�ÿ������Ŀ¼����Ҷȴ���6С��6.5���к�
 %    I1=Imax(C11,:);%��ȡ��Ӧ��
 %    n11=size(I1);
 %    pmax(i,1)=n11(1,1)/(193*200);
    
    
    
        
 %    C1=Itmax>Ar22(i)-0.3&Itmax<Ar22(i)+0.3;%�ҵ�ָ����������Ҷȴ���6С��6.5���к�
 %    I=Itmax(C1,:);%��ȡ��Ӧ��
 %    n1=size(I);
 %    pmax(i,2)=n1(1,1)/(193*150);
%end
%file3 = strcat('Input1/1.txt');    %ֻ�����һ�����еĽ�������ı�
 %        fid3 = fopen(file3,'wt');
 % fprintf(fid3,'%9.9f  %9.9f\r\n',pmax'); 
  % fclose(fid2);
 %   fclose(fid3);
 %   plot(Ar22,pmax(:,1));

