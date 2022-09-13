clc;
clear;
fclose('all');
format short;
% Step 1:  Load study area (Require)
parpool local;
%profile on;%分析程序
tic
timere=[];
catalog1=[];
%//读文件
fid=fopen('dizhendaibuchong.txt','r');
% 
psf=fscanf(fid,'%f,%f',[2 1]);%
%Psf1=[1;psf(1)+1;psf(2)+1;psf(3)+1;psf(4)+1;psf(5)+1;psf(6)+1];%
%Psf2=[psf(1);psf(2);psf(3);psf(4);psf(5);psf(6);psf(7)];%
Psf1=[1;psf(1)+1;psf(2)+1];%
Psf2=[psf(1);psf(2)];%

[DD1,Dcount1]= fscanf(fid,'%f,%f,%f,%f',[4 inf]);%震级上限、b值、年均发生率、深度
Dcount=Dcount1/4;%地震带数目
DD=DD1';
fclose(fid);


fid1 = fopen('qybuchong.txt','r');%潜源区文件
subM=fscanf(fid1,'%f,%f,%f,%f,%f,%f,%f',[7,1]);%地震档
%422
QZ3=zeros(113,3);
dire=zeros(113,4);%方向
fimkZ=zeros(113,7);%潜源空间分布函数
loat=zeros(113,20);%顶点坐标
for j=1:113
    QZ31=fscanf(fid1,'%d,%f,%d',[3,1]);%
    QZ3(j,:)=QZ31';
    dire1=fscanf(fid1,'%d,%f,%d,%f',[4,1]);%
    dire(j,:)=dire1';
    fimk1=fscanf(fid1,'%f,%f,%f,%f,%f,%f,%f',[7,1]); %
    fimkZ(j,:)=fimk1';
    number=2*QZ3(j,1);%读顶点坐标行的数目变量
    loat1=fscanf(fid1,'%f,', [number,1]);
    loat(j,1:number)=loat1';
end
fclose(fid1);


%//选择要执行地震带参数
i=2;%选择地震带
Psf11=Psf1(i);%
Psf22=Psf2(i);%
disp(Psf11);
disp(Psf22);
T=50;%time
NNum=100000;%
[M1,N,v0,depth]=ProM(i,DD,T,NNum);%
stream = RandStream('mt19937ar','seed',0);%
%//并行，大循环
parfor q=1:NNum %
    
    M2=M1(:,q);
    ww=find(M2~=0);%
    M=M2(ww,:);
    %disp(max(M));
    N1=N(q,:);%
    
   % [tt1,tt2]= Time1(N1,v0,T);
    
   % timere1=[tt1,tt2];
   % timere=[timere;timere1];
    [QYSD,direSD,fimkSD,vertexSDlon,vertexSDlat]= Sourcedata(Psf11,Psf22,QZ3,dire,fimkZ,loat);%
    %移动出错//
   
    fimk=cumsum(fimkSD);           %
 %   disp(fimkSD(:,1));
    [qyNcount]= ProQMN(M,subM,fimk);% 
    
    [m1,m2]=size(qyNcount); %
    
    for j=1:7    %
        
        A=qyNcount(j,:);
        count=tabulate(A);%
        [nn1,nn2]=size(count);
        if nn1==1
            continue
        else
            a1=find(count(:,1)~=0);%
            count1=count(a1,:);
            
            a2=find(count1(:,2)~=0);%
            count2=count1(a2,:);
            
            qydata1=count2;     %
           
            [nn3,nn4]=size(qydata1);
            catalog=[];
            for s=1:nn3
                v1=qydata1(s,1);%
                v2=qydata1(s,2);%
                
                
                MM= ProQM(M,subM,v2,j);%
                eqccoor = schGridTrans1(vertexSDlon(v1,:),vertexSDlat(v1,:),QYSD(v1,1),v2);            %    
                
                sita=DirectionAngel(direSD(v1,:),v2);                       %    
                
                
                [n4,n5]=size(MM);
                vv1=repmat(v1,n4,1);
                qq=repmat(q,n4,1);
                
                ii=repmat(i,n4,1);
                
                catalog=[qq ii vv1 MM  eqccoor(:,1) eqccoor(:,2) sita];
                
                catalog1=[catalog1;catalog];
                
            end
            
        end
    end
    
end

save('inputyong/b9(50年100000个).mat','catalog1');
% catalog11=catalog1(1:3000000,:);
% catalog12=catalog1(3000001:6000350,:);
% save('inputyong/b81(50年100000个).mat','catalog11');
% save('inputyong/b82(50年100000个).mat','catalog12');
%save('Input/b3time.mat','timere');
toc
%profile viewer
%matlabpool close;
 delete(gcp('nocreate'))             
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
%for j=1:m1    %潜源循环 
%    if  any(qyNcount(j,:))==1 %潜源分到地震不全为0
 %               vertexlon=vertexSDlon(j,1:QYSD(j,1));
%                vertexlat=vertexSDlat(j,1:QYSD(j,1));
 %                vertex=[vertexlon;vertexlat]';         %潜源区纬经度坐标
                 
                 
 %             [qyM11,qyM22,qyM33,qyM44,qyM55,qyM66,qyM77]= ProQM(M,subM,qyNcount(j,:),QYSD(j,2));%产生潜源各震级档所分配的地震大小,http://blog.csdn.net/colddie/article/details/6442740
 %             MM=[qyM11;qyM22;qyM33;qyM44;qyM55;qyM66;qyM77];                                      
               
 %             sita=DirectionAngel(direSD(j,:),qyNcount(j,:));          %方向角的产生,sita1为方向一的角度，sita2为方向2的角度
             %   disp(sita);
                
  %             eqccoor = GridTrans1(vertex,qyNcount(j,:));                      %震中坐标的产生
                
 %              tt=Time(qyNcount(j,:),T);                                       %时间的产生
               
  %             cataloge=[MM tt eqccoor(:,1) eqccoor(:,2) sita ];
            
               
  %             [m,n]=size(cataloge);
               
 %             for k=1:m;
%              fprintf(fid2,'%d  %d  %d  %2.2f  %4.3f  %4.4f  %4.4f  %d  %d\r\n',q,i,j+Psf11-1,cataloge(k,1),cataloge(k,2),cataloge(k,3),cataloge(k,4),cataloge(k,5),depth);%i表示地震带号，j表示潜源号，w表示场点号
 %             end
 %   else
 %      continue;
 %   end
%end
%end
%end
 %      fclose(fid2);%关闭潜源地震目录生成      
           
%end
   






   
    
 %    figure(1)
  %   bar(xout,n);%10档间隔统计
 %    figure(2)
%    bar(xMout,nM);%6档间隔统计
    
%    figure(3)
%    p=(1-exp(-beta*(M-Mmin)))/(1-exp(-beta*(Mmax-Mmin)));
%    stem(M,p);
  %  figure(4)
    %  线性回归
%    data = [n1' xout1'];
 %   alpha = 0.05;
%    [b,bint,r,rint,stats] = regress(data(:,1),[data(:,2) ones(size(data,1),1)],alpha);
    %   bint是回归系数的区间估计，r是残差，rint是置信区间，stats是用于检验回归模型的统计量，
    %有三个数值：相关系数r^2，F值，与F对应的概率P，alpha是显著性水平(缺省的时候为0.05)。
    %相关系数r^2越大，说明回归方程越显著；与F对应的概率P<alpha时候拒绝H0，回归模型成立。
 %   xt1 = linspace(min(xout), max(xout));
 %   yt1 = b(1)*xt1 + b(2);
 %   plot(xt1, yt1, 'b-');
 %   hold on;
 %   funstr = sprintf('R^2 = %.3f', stats(1));
 %   text(4,0.18,funstr);     % 改位置
 %   funstr = sprintf('y = %.3f*x + %.3f', b(1), b(2));
 %   title(['曲线回归分析',funstr], 'FontWeight', 'Bold', 'Color', 'r');
 %   plot(xout1,n1,'.-');grid;
 %figure (4)
 
% file1=strcat( 'Input/',num2str(w),'.txt');  %地震带潜源文件
% fid1 = fopen(file1,'r');
%[SR1,SRMcount1]=fscanf(fid1,'%f',[16 inf]);
%SRMcount=SRMcount1/16;
%SR=SR1';
 
%latlon = jwdtuoyuanzuobiaodian(SR(SRMcount,8),SR(SRMcount,7),dire(1)); 

%lon=SR(SRMcount,7);%震中
%lat=SR(SRMcount,8);
%llon= 112.46;  %场点112.46   34.54  
%llat= 34.54 ;       
 
 
% Gridcoor=GridTrans(vertex,QZ3(2));
 %   longmax = max(vertex(:,1));%潜源纬度最大值
 %   longmin=min(vertex(:,1));%潜源纬度最小值
 %   latmin = min(vertex(:,2));%潜源精度最小值
 %   latmax=max(vertex(:,2));%潜源精度最大值
 %   vlong=vertex(:,1);%潜源所有纬度坐标
 %   vlat=vertex(:,2);%潜源所有经度坐标
   % disp(vertex);
 %   [X,Y]=meshgrid(latmin:0.1:latmax,longmin:0.1:longmax);%划分格网
 %   vlong1 = [vlong ; vlong(1)];%纬度闭合
  %  vlat1 = [vlat ; vlat(1)];%精度闭合  
  %  in = inpolygon(X,Y,vlat1,vlong1);%判断含在潜源区内的所有格网点
 %   point=[Y(in),X(in)];
 %   m_proj('miller','lat',[32 36],'long',[110 113]);
%m_proj('miller','lat',[latmin latmax],'long',[longmin longmax]);
%axesm('MapProjection','miller','FLonLimit',[latb late],'FLatLimit',[lonb lone]);
%axesm('MapProjection','miller');
%m_grid('box','fancy','tickdir','in');
%m_grid('box','on','xtick',[0:2:360],'xticklabels',[0:2:360],'Fontsize',9.5,'ytick',[-50:2:50],'yticklabels',[-50:2:50],'Fontsize',9.5,'tickdir','out','XaxisLocation','bottom','YaxisLocation','left','linestyle','none'); 

%m_line(Gridcoor(:,1),Gridcoor(:,2),'marker','^','markersize',15,'color','r','MarkerEdgeColor','r',...
%                'MarkerFaceColor','r');      %画场地
%m_line(SR(:,7),SR(:,8),'marker','^','markersize',15,'color','r','MarkerEdgeColor','r',...
 %              'MarkerFaceColor','r');      %画场地
%m_line(vlong1,vlat1,'linewi',1,'color',[0 0 0]);     %用随机产生的三个色素颜色画源

%m_line(lon,lat,'marker','^','markersize',15,'color','r','MarkerEdgeColor','r',...
%                'MarkerFaceColor','b');      %画场地
%m_line(llon,llat,'marker','^','markersize',15,'color','r','MarkerEdgeColor','b',...
%                'MarkerFaceColor','r');      %画场地            
%m_line(latlon(:,2),latlon(:,1),'linewi',1,'color',[0 0 0]);     %用随机产生的三个色素颜色画源


 
    
    













