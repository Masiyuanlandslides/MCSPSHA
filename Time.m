%����ʱ��
function  [tt]= Time(qyNcount,tt2) %FunmΪǱԴ��(���ڸ�Ϊ�������)

  RandIndex1=randperm(length(tt2));   % �漴������������
               n1=qyNcount;           %ÿ��ѡ����
               qyM11=qyM1(RandIndex1(1:n1));            %��ȡ��Ӧ����

%N=sum(qyNcount~=0,2);   %ÿ�в�Ϊ0�ĸ���
%N=sum(N);
%x=rand(qyNcount,1);
%tt=x*T;