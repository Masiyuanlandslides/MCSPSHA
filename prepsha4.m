%��Խ���������¼���ķ�������

%matlabpool local

clc;
clear;

     
tic;
load('Input2/bI11(50).mat');%prepsha2��ѡ���Ŀ¼
load('Input2/bI21(50).mat');%prepsha2��ѡ���Ŀ¼
load('Input2/bI31(50).mat');%prepsha2��ѡ���Ŀ¼
load('Input2/bI41(50).mat');%prepsha2��ѡ���Ŀ¼
load('Input2/bI51(50).mat');%prepsha2��ѡ���Ŀ¼
load('Input2/bI61(50).mat');%prepsha2��ѡ���Ŀ¼
load('Input2/bI71(50).mat');%prepsha2��ѡ���Ŀ¼
Ar11=[cataloge11;cataloge21;cataloge31;cataloge41;cataloge51;cataloge61;cataloge71];

N=10000;%Ŀ¼��Ŀ
  index=unique(Ar11(:,16));%������
  num=index;
  disp(num);
  [m,n]=size(index);%�����С
  subI=[5.8 6.7 7.7 8.7 9.7 10.7];  %�Ҷ�ֵ��ȷ�����á�7 �� 8 �� �� ��ԭ�� �� �� , �Ҷ� �� Ϊ 5 . 8�� i < 6 . 7 ; �Ҷ� �� Ϊ 6 . 8 ��i < 7 . 7 ; �Ҷ� ��Ϊ 7 . 8 �� i < 8 . 7 
   count7c=[];%������洢
   liedushuzhi=[];
  for i=1:m%������ѭ��
      disp(i);
      Ar22=Ar11(ismember(Ar11(:,16),num(i)),:);%Ar1Ϊ������ѡĿ¼
     
        iindex=unique(Ar22(:,1));%ѡ��Ŀ¼��
       [mm1,nn1]=size(iindex);
       Ar1=[];%ÿ��Ŀ¼�����ֵ��Ҳ�Ǽ��㳬Խ��������Ҫ��Ŀ¼
       for j=1:mm1%�ҳ�ÿ��Ŀ¼�����ֵ
     % for j=6707;
            d=ismember(Ar22(:,1),iindex(j));
            Cat1=Ar22(d,:);%��һ��
           % disp(Cat1);
          %  Cat2=find(max(Cat1(:,13)));
          [Catt2,Cat2]=max(Cat1(:,13));
           % disp(Cat2);
            
            Cat3=Cat1(Cat2,:);
           % disp(Cat3);
          Ar1(j,:)=Cat3;
       end
    [nI,IMout]=histc(Ar1(:,13),subI);%nI�о���,Ϊ�˽��𼶷���,�߽�ͳ��
  
    qyI1=Ar1(IMout==1,1);        %ǱԴ���𼶴�С����6
   [m1,n1]=size(qyI1);
   pI6=m1/N;    %6�ȵķ�������,  100ΪĿ¼����
  
  qyI2=Ar1(IMout==2,1);        %ǱԴ���𼶴�С����7
   [m2,n2]=size(qyI2);
   pI7=m2/N;    %7�ȵķ�������
  
  qyI3=Ar1(IMout==3,1);        %ǱԴ���𼶴�С����8
   [m3,n3]=size(qyI3);
   pI8=m3/N;    %8�ȵķ�������
  
  qyI4=Ar1(IMout==4,1);        %ǱԴ���𼶴�С����9
   [m4,n4]=size(qyI4);
    pI9=m4/N;    %9�ȵķ�������
    
    qyI5=Ar1(IMout==5,1);        %ǱԴ���𼶴�С����10
   [m5,n5]=size(qyI5);
    pI10=m5/N;   %10�ȵķ�������
    
  count7c(i,:)=[num(i),m1,m2,m3,m4,m5];%���м�   
  liedushuzhi=[liedushuzhi;Ar1];
  end  
  save iimax liedushuzhi
  save iimaxnum count7c
  
 