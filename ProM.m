%地震带数目、大小的产生
function  [MM,count,v0,depth]= ProM(i,DD,T,num)  %Funm为潜源号(现在改为地震带号)
%format long g;
 
    v0=DD(i,3);
    b=DD(i,2);
    Mmax=DD(i,1);
   depth=DD(i,4);
  
   
   x1=rand(num,1);
   lamda=v0*T;%lamda=v0*T
   N=poissinv(x1,lamda);     %泊松过程生成该次模拟总次数T为10年，N为地震带在T年内发生的地震总数
 %disp(N);
   c=max(N);
   MM=zeros(c,num);
  % disp(size(MM));
 for i=1:num    
 Mmin=4;
 beta=b*2.3026;%c为beta值
 x=rand(N(i,:),1);%x为生成的随机数，共
 %disp(x);
 M=Mmin-(log(1-x*(1-exp((-beta*(Mmax-Mmin))))))/beta;%按截断式关系产生地震大小
[m,n]=size(M);
 %M=sortrows(M1);%M为某一地震带产生的震级大小，由小到大排列
 MM(1:m,i)=M;%乱序排列
% disp(MM);
 end
 count=N;