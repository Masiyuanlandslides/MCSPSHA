function  [tt1,tt2]= Time1(N,v,T)
%T=10;
x=rand(N-1,1);
%v1=1/v;
% tt=-(log(1-x*(1-exp(-v1*Tmax))))/v1;%按截断式关系产生地震大小
tt=(-log(1-x))/v;%产生地震时间
 tt1=cumsum(tt); 
 while tt1(N-1)>T
     x=rand(N-1,1);
     tt=(-log(1-x))/v;%产生地震时间
      tt1=cumsum(tt); 
  if tt1(N-1)<T
      break;
  end
 end
 tt1=[0;tt1];
 tt2=[0;tt];