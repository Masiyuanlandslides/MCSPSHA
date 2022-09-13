clc;
clear;
fclose('all');
format short;
% Step 1:  Load study area (Require)
Ar1 = fopen('study.txt','r');
[Ar2,Arcount] = fscanf(Ar1,'%f',[2 inf]);
Arpoint = Arcount/2;
Ar = Ar2';
fclose(Ar1);
tic
timere=[];
 catalog1=[];

%//度文件
 fid=fopen('dizhendai.txt','r');
        % 读文件头     潜源信息
        psf=fscanf(fid,'%f,%f,%f,%f,%f,%f,%f',[7 1]);%nsource为潜源数目
   [DD1,Dcount1]= fscanf(fid,'%f,%f,%f,%f',[4 inf]);%震级上限、b值、年均发生率、深度
   fclose(fid);   
   Dcount=Dcount1/4;%地震带数目
    DD=DD1';
    T=100;
    
    fid1 = fopen('12.txt','r');%潜源区文件
           subM=fscanf(fid1,'%f,%f,%f,%f,%f,%f,%f',[7,1]);%地震档
           QZ3=zeros(422,3);
           dire=zeros(422,4);%方向
           fimkZ=zeros(422,7);%潜源空间分布函数
           loat=zeros(422,20);%顶点坐标
 for j=1:422       
                 QZ31=fscanf(fid1,'%d,%f,%d',[3,1]);%顶点数 最大震级 潜源类型
                 QZ3(j,:)=QZ31';
                 dire1=fscanf(fid1,'%d,%f,%d,%f',[4,1]);%方向1     概率        方向2     概率
                 dire(j,:)=dire1';
                 fimk1=fscanf(fid1,'%f,%f,%f,%f,%f,%f,%f',[7,1]); %某一地震带某一潜源所有震级比例分配参数
                 fimkZ(j,:)=fimk1'; 
                 number=2*QZ3(j,1);%读顶点坐标行的数目变量
                 loat1=fscanf(fid1,'%f,', [number,1]);
                 loat(j,1:number)=loat1';
 end
 fclose(fid1);
% disp(fimkZ);
 %//选择要执行地震带参数
  i=3;%选择地震带
   [M1,N,v0,depth]=ProM(i,DD,T,1);%手动输入次数(小于等于q)！！！！ M为某一地震带产生的震级大小，N1为数目,T为时间长度,psf为潜源分档值,v0为地震年发生率
   Psf1=[1;psf(1)+1;psf(2)+1;psf(3)+1;psf(4)+1;psf(5)+1;psf(6)+1];%地震带潜源起始的潜源分档值;lie
           % disp(Psf1);
            Psf2=[psf(1);psf(2);psf(3);psf(4);psf(5);psf(6);psf(7)];%地震带潜源终止的潜源分档值;lie
            
            Psf11=Psf1(i);%地震带起始潜源编号
            Psf22=Psf2(i);%地震带终止潜源编号
           disp(Psf11);
            disp(Psf22);
   %//并行，大循环      
 for q=1:1 %子目录数目，
           M2=M1(:,q);
           ww=find(M2~=0);%排除对0的统计
           M=M2(ww,:);
         %  disp(M);
           N1=N(q,:);
            stream = RandStream('mt19937ar','seed',0);%随机数流，依据电脑时间产生随机数（没用）
            
            
            [tt1,tt2]= Time1(N1,v0,T);
               
            timere1=[tt1,tt2];
           % timere=[timere;timere1];
             [QYSD,direSD,fimkSD,vertexSDlon,vertexSDlat]= Sourcedata(Psf11,Psf22,QZ3,dire,fimkZ,loat);%每个潜源（顶点数 最大震级 潜源类型）,(方向1 概率 方向2 概率),(潜源所有震级比例分配参数),(源纬度坐标),(源经度坐标)，(地震震级分档)
            %移动出错//
             disp(fimkSD);
             fimk=cumsum(fimkSD);           %一个地震带空间累积概率密度函数,列表示震级档    tabulate
            disp(fimk);
            [qyNcount]= ProQMN(M,subM,fimk);% 产生潜源各震级档发生地震的潜源号，行号代表分档值，列的数字表示潜源号
           % disp(qyNcount);
            [m1,m2]=size(qyNcount); %潜源循环控制
         %disp(qyNcount);
 end
  w=4;
  file2 = strcat('Input/',num2str(w),'.txt');    %创建文本文件
           fid2 = fopen(file2,'wt');
          [nn1,nn2]= size(fimk);
     for s=1:nn1
            
     fprintf(fid2,'%1.4f %1.4f %1.4f %1.4f %1.4f %1.4f %1.4f\r\n',fimkSD(s,1),fimkSD(s,2),fimkSD(s,3),fimkSD(s,4),fimkSD(s,5),fimkSD(s,6),fimkSD(s,7));%i表示地震带号，j表示潜源号，w表示场点号
      
         %  fprintf(fid2,'%d %d %2.2f\r\n',q,i,M(s,1));%i表示地震带号，j表示潜源号，w表示场点号
      end
           