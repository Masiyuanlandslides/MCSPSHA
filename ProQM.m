%ǱԴ�����𼶵������С
function  [qyM11]= ProQM(M,subM,qyNcount,j)  %M���� subMΪ����ֵ� qyNcountΪ�������������ǱԴ
        
  
           %����ֵ�
               mmax=max(M);
        if 7.5<mmax
            subM=[subM;mmax];
            [nM,xMout1]=histc(M,subM);%nMΪÿ���������Ŀֵ
            if  j<7
                qyM1=M(xMout1==j);        %ǱԴ���𼶴�С����
              % RandIndex1=randperm(length(qyM1));   % �漴������������
               qyM1=sort(qyM1,'descend');
               n1=qyNcount;           %ÿ��ѡ����
              % qyM11=qyM1(RandIndex1(1:n1));            %��ȡ��Ӧ����
              qyM11=qyM1(1:n1); 
            elseif j==7
                     qyM71=M(xMout1==7);
                   qyM72=M(xMout1==8);
                   qyM7=[qyM71;qyM72];
                %  RandIndex7=randperm(length(qyM7));   % �漴������������
                 qyM7=sort(qyM7,'descend');
                      n7=qyNcount;           %ÿ��ѡ����
                 %  qyM11=qyM7(RandIndex7(1:n7));
                  qyM11=qyM7(1:n7);
             end
      
        else
            [nM,xMout1]=histc(M,subM);%nMΪÿ���������Ŀֵ          nMΪ������
            qyM1=M(xMout1==j);        %ǱԴ���𼶴�С����
               qyM1=sort(qyM1,'descend');
          % RandIndex1=randperm(length(qyM1));   % �漴������������
           n1=qyNcount;           %ÿ��ѡ����
           % qyM11=qyM1(RandIndex1(1:n1));            %��ȡ��Ӧ����
            qyM11=qyM1(1:n1); 
        end

          
           
           
  
  
 


%RandIndex = randperm( length( a ) );   % �漴������������
%a = a( RandIndex );   % ���µ�����������Һ������
%              subM1=zeros(1,6);
 %           for k=1:6
 %                 subM1(k)=(subM(k)+subM(k+1))/2;%������м�ֵ
  %          end
  %          if subM(7)>Mmax
  %            subM2=[subM(1) subM1 subM(7)];
  %          else
 %               subM2=[subM(1) subM1 Mmax];
    %        end
  %         %   disp(subM2);
             % [nM,xMout]=hist(M,subM);%nMΪ�о���ͳ�Ʒ�ʽȡ������ֵ
  %            [nM1,xMout1]=histc(M,subM2);%nM1�о���,Ϊ�˽��𼶷���,�߽�ͳ��
            
 %             disp(nM1);
              
              
%  qyM1=M(xMout1==1);        %ǱԴ���𼶴�С����
%  RandIndex1=randperm(length(qyM1));   % �漴������������
%   n1=fimkSD(1);           %ÿ��ѡ����
%  qyM11=qyM1(RandIndex1(1:n1));            %��ȡ��Ӧ����
 
%  qyM2=M(xMout1==2);
%  RandIndex2=randperm(length(qyM2));   % �漴������������
%   n2=fimkSD(2);                       %ÿ��ѡ����
%  qyM22=qyM2(RandIndex2(1:n2));     
   
%   qyM3=M(xMout1==3);
%  RandIndex3=randperm(length(qyM3));   % �漴������������
%   n3=fimkSD(3);           %ÿ��ѡ����
% qyM33=qyM3(RandIndex3(1:n3));   
  
%  qyM4=M(xMout1==4);
%   RandIndex4=randperm(length(qyM4));   % �漴������������
%   n4=fimkSD(4);           %ÿ��ѡ����
%  qyM44=qyM4(RandIndex4(1:n4));  
  
%   qyM5=M(xMout1==5);
 %   RandIndex5=randperm(length(qyM5));   % �漴������������
 %  n5=fimkSD(5);           %ÿ��ѡ����
 % qyM55=qyM5(RandIndex5(1:n5));   
  
%  qyM6=M(xMout1==6);
%    RandIndex6=randperm(length(qyM6));   % �漴������������
 %  n6=fimkSD(6);           %ÿ��ѡ����
%  qyM66=qyM6(RandIndex6(1:n6));  
  
%  qyM71=M(xMout1==7);
%  qyM72=M(xMout1==8);
%  qyM7=[qyM71;qyM72];
%  disp(qyM7);
%  RandIndex7=randperm(length(qyM7));   % �漴������������
%  n7=fimkSD(7);           %ÿ��ѡ����
% disp(n7);
%  qyM77=qyM7(RandIndex7(1:n7));   
  
  