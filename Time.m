%产生时间
function  [tt]= Time(qyNcount,tt2) %Funm为潜源号(现在改为地震带号)

  RandIndex1=randperm(length(tt2));   % 随即打乱数组索引
               n1=qyNcount;           %每次选几行
               qyM11=qyM1(RandIndex1(1:n1));            %提取相应的震级

%N=sum(qyNcount~=0,2);   %每行不为0的个数
%N=sum(N);
%x=rand(qyNcount,1);
%tt=x*T;