clc;
clear;
fclose('all');
load('iimax.mat');%prepsha2��ѡ���Ŀ¼
 index=unique(liedushuzhi(:,16));%������
  num=index;
 % disp(num);
  [m,n]=size(index);%�����С
 % subI=[5.8 6.7 7.7 8.7 9.7 10.7];  %�Ҷ�ֵ��ȷ�����á�7 �� 8 �� �� ��ԭ�� �� �� , �Ҷ� �� Ϊ 5 . 8�� i < 6 . 7 ; �Ҷ� �� Ϊ 6 . 8 ��i < 7 . 7 ; �Ҷ� ��Ϊ 7 . 8 �� i < 8 . 7 
  % count7c=[];%������洢
   chaoyue=[];
  for i=1:m%������ѭ��
      Ar22=liedushuzhi(ismember(liedushuzhi(:,16),num(i)),:);%Ar1Ϊ������ѡĿ¼
      Ar23=sort(Ar22(:,13),'descend');
      c2=(2/100)*10000;  %T�꣬��Խ����10%���к�
      c10=(10/100)*10000;  %T�꣬��Խ����10%���к�
      c40=(40/100)*10000;  %T�꣬��Խ����10%���к�
      c63=(63/100)*10000;  %T�꣬��Խ����10%���к�
      chaoyue(i,1)=Ar23(c2,:);
      chaoyue(i,2)=Ar23(c10,:);
      chaoyue(i,3)=Ar23(c40,:);
      chaoyue(i,4)=Ar23(c63,:);
  end
  save chaoyuegailvzhi chaoyue
  