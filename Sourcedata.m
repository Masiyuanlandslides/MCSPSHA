function  [QYSD,direSD,fimkSD,vertexSDlon,vertexSDlat]= Sourcedata(Psf1,Psf2,QZ3,dire,fimkz,loat)  %Psf1地震带潜源起始，Psf2地震带潜源终止  
format long;
            
 QYSD=QZ3(Psf1:Psf2,:);     %顶点数 最大震级 潜源类型
 direSD=dire(Psf1:Psf2,:);  %方向1     概率        方向2     概率
 fimkSD=fimkz(Psf1:Psf2,:);  %某一地震带所有潜源所有震级比例分配参数
 vertexSD=loat(Psf1:Psf2,:);%某一地震带所有潜源所有纬度精度坐标
 [m,n]=size(vertexSD);
 vertexSDlon=zeros(m,10);
 vertexSDlat=zeros(m,10);
 for i=1:10
vertexSDlon(:,i)=vertexSD(:,i*2-1);
vertexSDlat(:,i)=vertexSD(:,i*2);
 end
 