%潜源各个震级档地震大小
function  [qyM11]= ProQM(M,subM,qyNcount,j)  %M地震 subM为地震分档 qyNcount为所分配地震所在潜源
        
  
           %地震分档
               mmax=max(M);
        if 7.5<mmax
            subM=[subM;mmax];
            [nM,xMout1]=histc(M,subM);%nM为每档地震的数目值
            if  j<7
                qyM1=M(xMout1==j);        %潜源区震级大小归类
              % RandIndex1=randperm(length(qyM1));   % 随即打乱数组索引
               qyM1=sort(qyM1,'descend');
               n1=qyNcount;           %每次选几行
              % qyM11=qyM1(RandIndex1(1:n1));            %提取相应的震级
              qyM11=qyM1(1:n1); 
            elseif j==7
                     qyM71=M(xMout1==7);
                   qyM72=M(xMout1==8);
                   qyM7=[qyM71;qyM72];
                %  RandIndex7=randperm(length(qyM7));   % 随即打乱数组索引
                 qyM7=sort(qyM7,'descend');
                      n7=qyNcount;           %每次选几行
                 %  qyM11=qyM7(RandIndex7(1:n7));
                  qyM11=qyM7(1:n7);
             end
      
        else
            [nM,xMout1]=histc(M,subM);%nM为每档地震的数目值          nM为列向量
            qyM1=M(xMout1==j);        %潜源区震级大小归类
               qyM1=sort(qyM1,'descend');
          % RandIndex1=randperm(length(qyM1));   % 随即打乱数组索引
           n1=qyNcount;           %每次选几行
           % qyM11=qyM1(RandIndex1(1:n1));            %提取相应的震级
            qyM11=qyM1(1:n1); 
        end

          
           
           
  
  
 


%RandIndex = randperm( length( a ) );   % 随即打乱数组索引
%a = a( RandIndex );   % 用新的索引构造打乱后的数组
%              subM1=zeros(1,6);
 %           for k=1:6
 %                 subM1(k)=(subM(k)+subM(k+1))/2;%求归类中间值
  %          end
  %          if subM(7)>Mmax
  %            subM2=[subM(1) subM1 subM(7)];
  %          else
 %               subM2=[subM(1) subM1 Mmax];
    %        end
  %         %   disp(subM2);
             % [nM,xMout]=hist(M,subM);%nM为行矩阵，统计方式取两端中值
  %            [nM1,xMout1]=histc(M,subM2);%nM1列矩阵,为了将震级分入,边界统计
            
 %             disp(nM1);
              
              
%  qyM1=M(xMout1==1);        %潜源区震级大小归类
%  RandIndex1=randperm(length(qyM1));   % 随即打乱数组索引
%   n1=fimkSD(1);           %每次选几行
%  qyM11=qyM1(RandIndex1(1:n1));            %提取相应的震级
 
%  qyM2=M(xMout1==2);
%  RandIndex2=randperm(length(qyM2));   % 随即打乱数组索引
%   n2=fimkSD(2);                       %每次选几行
%  qyM22=qyM2(RandIndex2(1:n2));     
   
%   qyM3=M(xMout1==3);
%  RandIndex3=randperm(length(qyM3));   % 随即打乱数组索引
%   n3=fimkSD(3);           %每次选几行
% qyM33=qyM3(RandIndex3(1:n3));   
  
%  qyM4=M(xMout1==4);
%   RandIndex4=randperm(length(qyM4));   % 随即打乱数组索引
%   n4=fimkSD(4);           %每次选几行
%  qyM44=qyM4(RandIndex4(1:n4));  
  
%   qyM5=M(xMout1==5);
 %   RandIndex5=randperm(length(qyM5));   % 随即打乱数组索引
 %  n5=fimkSD(5);           %每次选几行
 % qyM55=qyM5(RandIndex5(1:n5));   
  
%  qyM6=M(xMout1==6);
%    RandIndex6=randperm(length(qyM6));   % 随即打乱数组索引
 %  n6=fimkSD(6);           %每次选几行
%  qyM66=qyM6(RandIndex6(1:n6));  
  
%  qyM71=M(xMout1==7);
%  qyM72=M(xMout1==8);
%  qyM7=[qyM71;qyM72];
%  disp(qyM7);
%  RandIndex7=randperm(length(qyM7));   % 随即打乱数组索引
%  n7=fimkSD(7);           %每次选几行
% disp(n7);
%  qyM77=qyM7(RandIndex7(1:n7));   
  
  