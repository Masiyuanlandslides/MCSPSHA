function  [QYSD,direSD,fimkSD,vertexSDlon,vertexSDlat,subM]= Sourcedatalao(Psf1,Psf2)  %Psf1地震带潜源起始，Psf2地震带潜源终止  
format long;
            fid1 = fopen('lao12.txt','r');%潜源区文件
           subM=fscanf(fid1,'%f %f %f %f %f %f %f',[7,1]);%地震档
           QZ3=zeros(422,3);
           dire=zeros(422,4);%方向
           fimk=zeros(422,7);%潜源空间分布函数
           loat=zeros(422,20);%顶点坐标
 for j=1:422       
                 QZ31=fscanf(fid1,' %d    %f    %d',[3,1]);%顶点数 最大震级 潜源类型
                 QZ3(j,:)=QZ31';
                 dire1=fscanf(fid1,'   %d  %f   %d  %f',[4,1]);%方向1     概率        方向2     概率
                 dire(j,:)=dire1';
                 fimk1=fscanf(fid1,'%f  %f  %f  %f  %f  %f  %f',[7,1]); %某一地震带某一潜源所有震级比例分配参数
              %   disp(fimk1);
                 fimk(j,:)=fimk1'; 
                 number=2*QZ3(j,1);%读顶点坐标行的数目变量
                 loat1=fscanf(fid1,'%f ', [number,1]);
                 loat(j,1:number)=loat1';
 end
 fclose(fid1);
 QYSD=QZ3(Psf1:Psf2,:);     %顶点数 最大震级 潜源类型
 direSD=dire(Psf1:Psf2,:);  %方向1     概率        方向2     概率
 fimkSD=fimk(Psf1:Psf2,:);  %某一地震带所有潜源所有震级比例分配参数
 vertexSD=loat(Psf1:Psf2,:);%某一地震带所有潜源所有纬度精度坐标
 [m,n]=size(vertexSD);
 vertexSDlon=zeros(m,10);
 vertexSDlat=zeros(m,10);
 for i=1:10
vertexSDlon(:,i)=vertexSD(:,i*2-1);
vertexSDlat(:,i)=vertexSD(:,i*2);
 end