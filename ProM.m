%�������Ŀ����С�Ĳ���
function  [MM,count,v0,depth]= ProM(i,DD,T,num)  %FunmΪǱԴ��(���ڸ�Ϊ�������)
%format long g;
 
    v0=DD(i,3);
    b=DD(i,2);
    Mmax=DD(i,1);
   depth=DD(i,4);
  
   
   x1=rand(num,1);
   lamda=v0*T;%lamda=v0*T
   N=poissinv(x1,lamda);     %���ɹ������ɸô�ģ���ܴ���TΪ10�꣬NΪ�������T���ڷ����ĵ�������
 %disp(N);
   c=max(N);
   MM=zeros(c,num);
  % disp(size(MM));
 for i=1:num    
 Mmin=4;
 beta=b*2.3026;%cΪbetaֵ
 x=rand(N(i,:),1);%xΪ���ɵ����������
 %disp(x);
 M=Mmin-(log(1-x*(1-exp((-beta*(Mmax-Mmin))))))/beta;%���ض�ʽ��ϵ���������С
[m,n]=size(M);
 %M=sortrows(M1);%MΪĳһ������������𼶴�С����С��������
 MM(1:m,i)=M;%��������
% disp(MM);
 end
 count=N;