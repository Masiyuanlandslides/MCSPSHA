%���������ǱԴ������Ŀ
function  [qynunmber]= ProQMN(M,subM,fimk)  %ĳ���������ǱԴ�ֵ��ĵ�����Ŀ,subMͳ�Ƽ��������fimkΪ�ռ��ۻ������ܶȺ���
         [m,n]=size(fimk);
        % disp(fimk);
        
        mmax=max(M);
        if 7.5<mmax
            subM=[subM;mmax];
           
            [nM,xMout1]=histc(M,subM);%nMΪÿ���������Ŀֵ
            nM=[nM(1:6);nM(7)+nM(8)];
        else
            [nM,xMout1]=histc(M,subM);%nMΪÿ���������Ŀֵ          nMΪ������
        end
     
        
        
        nqy=zeros(7,max(nM));
       % disp(nM);
         for i=1:7%����ѭ��
             b=fimk(m,i)*rand(1,nM(i)); %ĳһ�����������
            % disp(fimk(m,i));
           
              a=repmat(fimk(:,i)',nM(i),1);%�����ظ�������
            %  disp(a);
              c=bsxfun(@minus, a, b.');%ÿ�м�ȥ��Ӧ��  bΪ�о����е���a����,����һ����aһ����С�ľ���
              d=c';
             % disp(d);
              d(d<0)=inf;
             [minvalue,nqy1]=min(d);%minvalueΪÿ�е���Сֵ��nΪλ�á���Ϊ������%minvalueΪÿ�е���Сֵ��nΪλ�á���Ϊ������ 
              %disp(nqy1);
         %    disp(size(nqy1));
              nqy(i,1:nM(i))=nqy1;%�洢�ռ�ǱԴ�ż�û��ǱԴ�ĸ���
             % disp(nqy);
         end  
       qynunmber=nqy;%�ĸ�ǱԴ�е�����Ŀ�޷�ͳ�Ƴ�
     %   subM1=zeros(1,6);
     %       for k=1:6
     %             subM1(k)=(subM(k)+subM(k+1))/2;%������м�ֵ
     %       end
     %       subM72=[subM(1) subM1 subM(7)];  %�·ֵ�
            
     %       subM22=repmat(subM72,m,1);%�����ظ�������
           
            
     %       subM23= bsxfun(@max,Mmax,subM72(:,8));%�����𼶵�����
          %  disp(subM23);
      %       subM2=[subM22(1,1:7) subM23];        %����ͳ�����䣨���հ棩
            
           %  nM=zeros(m,7);
       %   for i=1:m
      %       [nM1,xMout1]=histc(M,subM2);%nM1�о���,Ϊ�˽��𼶷���,�߽�ͳ��
      %       nM7=nM1(7)+nM1(8);
       %      nM=[nM1(1:6)' nM7];%���������������Ŀ��ȷ��
             
     %        nqy=zeros(7,max(nM));
     %    for i=1:7
     %        b=fimk(m,1)*rand(1,nM(1,i)); %ĳһ�����������
     %        a=repmat(fimk(:,1)',m,1);%�����ظ�������
           
     %        c=bsxfun(@minus, a, b.');%ÿ�м�ȥ��Ӧ��  bΪ�о����е���a����,����һ����aһ����С�ľ���
   %          d=c';
    %          d(d<0)=inf;
   %        [minvalue,nqy1]=min(d);%minvalueΪÿ�е���Сֵ��nΪλ�á���Ϊ������%minvalueΪÿ�е���Сֵ��nΪλ�á���Ϊ������  
   %        nqy(i,:)=nqy1;%�洢�ռ�ǱԴ�ż�û��ǱԴ�ĸ���
   %       end 
 %nfimk= bsxfun(@times,fimk,nM);%������Ŀ������Ӧ�Ŀռ�ֲ�����
%qynunmber=round(nfimk);%ǱԴ����Ŀȡ������������

%qynunmber=nqy;%�ĸ�ǱԴ�е�����Ŀ�޷�ͳ�Ƴ�


 
              
      