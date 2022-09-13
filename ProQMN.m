%地震带所有潜源地震数目
function  [qynunmber]= ProQMN(M,subM,fimk)  %某地震带所有潜源分到的地震数目,subM统计间隔档数，fimk为空间累积概率密度函数
         [m,n]=size(fimk);
        % disp(fimk);
        
        mmax=max(M);
        if 7.5<mmax
            subM=[subM;mmax];
           
            [nM,xMout1]=histc(M,subM);%nM为每档地震的数目值
            nM=[nM(1:6);nM(7)+nM(8)];
        else
            [nM,xMout1]=histc(M,subM);%nM为每档地震的数目值          nM为列向量
        end
     
        
        
        nqy=zeros(7,max(nM));
       % disp(nM);
         for i=1:7%地震档循环
             b=fimk(m,i)*rand(1,nM(i)); %某一档随机数产生
            % disp(fimk(m,i));
           
              a=repmat(fimk(:,i)',nM(i),1);%构建重复矩阵用
            %  disp(a);
              c=bsxfun(@minus, a, b.');%每行减去对应行  b为行矩阵，列等于a行数,产生一个和a一样大小的矩阵
              d=c';
             % disp(d);
              d(d<0)=inf;
             [minvalue,nqy1]=min(d);%minvalue为每行的最小值，n为位置。都为行向量%minvalue为每行的最小值，n为位置。都为行向量 
              %disp(nqy1);
         %    disp(size(nqy1));
              nqy(i,1:nM(i))=nqy1;%存储空间潜源号级没个潜源的个数
             % disp(nqy);
         end  
       qynunmber=nqy;%哪个潜源有地震，数目无法统计出
     %   subM1=zeros(1,6);
     %       for k=1:6
     %             subM1(k)=(subM(k)+subM(k+1))/2;%求归类中间值
     %       end
     %       subM72=[subM(1) subM1 subM(7)];  %新分档
            
     %       subM22=repmat(subM72,m,1);%构建重复矩阵用
           
            
     %       subM23= bsxfun(@max,Mmax,subM72(:,8));%构建震级档矩阵
          %  disp(subM23);
      %       subM2=[subM22(1,1:7) subM23];        %构建统计区间（最终版）
            
           %  nM=zeros(m,7);
       %   for i=1:m
      %       [nM1,xMout1]=histc(M,subM2);%nM1列矩阵,为了将震级分入,边界统计
      %       nM7=nM1(7)+nM1(8);
       %      nM=[nM1(1:6)' nM7];%地震带各级地震数目的确定
             
     %        nqy=zeros(7,max(nM));
     %    for i=1:7
     %        b=fimk(m,1)*rand(1,nM(1,i)); %某一档随机数产生
     %        a=repmat(fimk(:,1)',m,1);%构建重复矩阵用
           
     %        c=bsxfun(@minus, a, b.');%每行减去对应行  b为行矩阵，列等于a行数,产生一个和a一样大小的矩阵
   %          d=c';
    %          d(d<0)=inf;
   %        [minvalue,nqy1]=min(d);%minvalue为每行的最小值，n为位置。都为行向量%minvalue为每行的最小值，n为位置。都为行向量  
   %        nqy(i,:)=nqy1;%存储空间潜源号级没个潜源的个数
   %       end 
 %nfimk= bsxfun(@times,fimk,nM);%各级数目乘以相应的空间分布函数
%qynunmber=round(nfimk);%潜源震级数目取整，四舍五入

%qynunmber=nqy;%哪个潜源有地震，数目无法统计出


 
              
      