function  [sita]=DirectionAngel(dire,NN)    %dire行向量 45     1     0     0,qyNcount潜源每个震级档的数目
%sita1为方向一的角度，sita2为方向2的角度
x=rand(NN,1);%x为生成的随机数，共N个
C=ones(NN,1);
if dire(2)==0
    sita2=C*dire(3);
    sita=sita2; 
elseif dire(4)==0;
    sita1=C*dire(1);
    sita=sita1;
elseif dire(2)~=0 && dire(4)~=0 
    subDA=[0 dire(2) 1];
    [nDA,xDAout]=histc(x,subDA);%nM为行矩阵
    qyA1=x(xDAout==1);
   % qyA2=x(xDAout==2);
   % qyA3=x(xDAout==3);
   % qyA33=[qyA2;qyA3];
    m=size(qyA1);
   % disp(m);
    C1=ones(m(1),1);
   sita1=C1*dire(1);
   C2=ones(NN-m(1),1);
   sita2=C2*dire(3);
   sita=[sita1;sita2];
   sita= sita(randperm(length(sita)));
  
end
 



 
