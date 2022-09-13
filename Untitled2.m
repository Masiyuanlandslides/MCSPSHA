clc;
clear;
Ar1 = fopen('Input/1.txt','r');
 [Ar2,Arcount] = fscanf(Ar1,'%f',[10 inf]);
  Arpoint = Arcount/10;
        Ar = Ar2';
        
       % 如矩阵为x（m,n)分两个矩阵
%  M=5.07;     
%C1=5.253;
%C2=1.398;
%C3=0;
%C4=-4.164;
%C5=26;
%C6=0;
%D1=2.019;
%D2=1.398;
%D3=0;
%D4=-2.943;
%D5=8;
%D6=0;
%f=@(C)C1+C2*M+C4*log10(C+26);%计算烈度公式
%I1=f(Ar(2,11));
%I1=C1+C2*Ar(:,5)+C4*log10(Ar(:,11)+26);%计算方向1烈度
%I2=C1+C2*Ar(:,5)+C4*log10(Ar(:,14)+26);%计算方向1烈度
%I=I1.*Ar(:,13)+I2.*Ar(:,16);
%Arr=[Ar I];

%  meanI=zeros(2,1);
%  MaxI=zeros(2,1);   
%  subcat=1:1:2;
%  [nsubcat,subout]=hist(Arr(:,1),subcat);
%for j=1:2
 %   b=j;
  %  C=Arr(ismember(Arr(:,1),b),:);
   % MM=M(M<subM(k+1));
   %                 MM1=MM(MM>subM(k));    %地震带上每一档地震的大小
    %                [m1,n1]=size(MM1);
    %I6=M(M<6);
  %  I6=A(Arr(:,17)>5.5&Arr(:,17)<6);
  %  [m,n]=size(I6);
  %  I65=A(Arr(:,17)>6&Arr(:,17)<6.5);
  %  [m1,n1]=size(I65);
  %  I7=A(Arr(:,17)>6.5&Arr(:,17)<7);
  %  [m2,n2]=size(I7);
    
  %  [mm,mmout]=hist(I6(:,1),subcat);
  %    ncatnum=nnz(mm);%不为0的个数
  %    RT=m/(ncatnum*200);
  %    [a,b] = find(mm~=0);
    %  aa=size(a);
      
%      C=nsubcat(aa);
  %    PRT=RT/subcat(1);
    
    
    %setdiff(A,B)   %找AB中不同的数
%numel(setdiff(A,B))
    
    
    
  
   % MaxI(j,1)=max(C(:,17)); 
   % meanI(j,1)=mean(C(:,17)); 
%end

        