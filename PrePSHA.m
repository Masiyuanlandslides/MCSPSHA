clc;
clear;
fclose('all');
format short;
% Step 1:  Load study area (Require)
parpool local;
%profile on;%��������
tic
timere=[];
catalog1=[];
%//���ļ�
fid=fopen('dizhendaibuchong.txt','r');
% 
psf=fscanf(fid,'%f,%f',[2 1]);%
%Psf1=[1;psf(1)+1;psf(2)+1;psf(3)+1;psf(4)+1;psf(5)+1;psf(6)+1];%
%Psf2=[psf(1);psf(2);psf(3);psf(4);psf(5);psf(6);psf(7)];%
Psf1=[1;psf(1)+1;psf(2)+1];%
Psf2=[psf(1);psf(2)];%

[DD1,Dcount1]= fscanf(fid,'%f,%f,%f,%f',[4 inf]);%�����ޡ�bֵ����������ʡ����
Dcount=Dcount1/4;%�������Ŀ
DD=DD1';
fclose(fid);


fid1 = fopen('qybuchong.txt','r');%ǱԴ���ļ�
subM=fscanf(fid1,'%f,%f,%f,%f,%f,%f,%f',[7,1]);%����
%422
QZ3=zeros(113,3);
dire=zeros(113,4);%����
fimkZ=zeros(113,7);%ǱԴ�ռ�ֲ�����
loat=zeros(113,20);%��������
for j=1:113
    QZ31=fscanf(fid1,'%d,%f,%d',[3,1]);%
    QZ3(j,:)=QZ31';
    dire1=fscanf(fid1,'%d,%f,%d,%f',[4,1]);%
    dire(j,:)=dire1';
    fimk1=fscanf(fid1,'%f,%f,%f,%f,%f,%f,%f',[7,1]); %
    fimkZ(j,:)=fimk1';
    number=2*QZ3(j,1);%�����������е���Ŀ����
    loat1=fscanf(fid1,'%f,', [number,1]);
    loat(j,1:number)=loat1';
end
fclose(fid1);


%//ѡ��Ҫִ�е��������
i=2;%ѡ������
Psf11=Psf1(i);%
Psf22=Psf2(i);%
disp(Psf11);
disp(Psf22);
T=50;%time
NNum=100000;%
[M1,N,v0,depth]=ProM(i,DD,T,NNum);%
stream = RandStream('mt19937ar','seed',0);%
%//���У���ѭ��
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
    %�ƶ�����//
   
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

save('inputyong/b9(50��100000��).mat','catalog1');
% catalog11=catalog1(1:3000000,:);
% catalog12=catalog1(3000001:6000350,:);
% save('inputyong/b81(50��100000��).mat','catalog11');
% save('inputyong/b82(50��100000��).mat','catalog12');
%save('Input/b3time.mat','timere');
toc
%profile viewer
%matlabpool close;
 delete(gcp('nocreate'))             
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
%for j=1:m1    %ǱԴѭ�� 
%    if  any(qyNcount(j,:))==1 %ǱԴ�ֵ�����ȫΪ0
 %               vertexlon=vertexSDlon(j,1:QYSD(j,1));
%                vertexlat=vertexSDlat(j,1:QYSD(j,1));
 %                vertex=[vertexlon;vertexlat]';         %ǱԴ��γ��������
                 
                 
 %             [qyM11,qyM22,qyM33,qyM44,qyM55,qyM66,qyM77]= ProQM(M,subM,qyNcount(j,:),QYSD(j,2));%����ǱԴ���𼶵�������ĵ����С,http://blog.csdn.net/colddie/article/details/6442740
 %             MM=[qyM11;qyM22;qyM33;qyM44;qyM55;qyM66;qyM77];                                      
               
 %             sita=DirectionAngel(direSD(j,:),qyNcount(j,:));          %����ǵĲ���,sita1Ϊ����һ�ĽǶȣ�sita2Ϊ����2�ĽǶ�
             %   disp(sita);
                
  %             eqccoor = GridTrans1(vertex,qyNcount(j,:));                      %��������Ĳ���
                
 %              tt=Time(qyNcount(j,:),T);                                       %ʱ��Ĳ���
               
  %             cataloge=[MM tt eqccoor(:,1) eqccoor(:,2) sita ];
            
               
  %             [m,n]=size(cataloge);
               
 %             for k=1:m;
%              fprintf(fid2,'%d  %d  %d  %2.2f  %4.3f  %4.4f  %4.4f  %d  %d\r\n',q,i,j+Psf11-1,cataloge(k,1),cataloge(k,2),cataloge(k,3),cataloge(k,4),cataloge(k,5),depth);%i��ʾ������ţ�j��ʾǱԴ�ţ�w��ʾ�����
 %             end
 %   else
 %      continue;
 %   end
%end
%end
%end
 %      fclose(fid2);%�ر�ǱԴ����Ŀ¼����      
           
%end
   






   
    
 %    figure(1)
  %   bar(xout,n);%10�����ͳ��
 %    figure(2)
%    bar(xMout,nM);%6�����ͳ��
    
%    figure(3)
%    p=(1-exp(-beta*(M-Mmin)))/(1-exp(-beta*(Mmax-Mmin)));
%    stem(M,p);
  %  figure(4)
    %  ���Իع�
%    data = [n1' xout1'];
 %   alpha = 0.05;
%    [b,bint,r,rint,stats] = regress(data(:,1),[data(:,2) ones(size(data,1),1)],alpha);
    %   bint�ǻع�ϵ����������ƣ�r�ǲвrint���������䣬stats�����ڼ���ع�ģ�͵�ͳ������
    %��������ֵ�����ϵ��r^2��Fֵ����F��Ӧ�ĸ���P��alpha��������ˮƽ(ȱʡ��ʱ��Ϊ0.05)��
    %���ϵ��r^2Խ��˵���ع鷽��Խ��������F��Ӧ�ĸ���P<alphaʱ��ܾ�H0���ع�ģ�ͳ�����
 %   xt1 = linspace(min(xout), max(xout));
 %   yt1 = b(1)*xt1 + b(2);
 %   plot(xt1, yt1, 'b-');
 %   hold on;
 %   funstr = sprintf('R^2 = %.3f', stats(1));
 %   text(4,0.18,funstr);     % ��λ��
 %   funstr = sprintf('y = %.3f*x + %.3f', b(1), b(2));
 %   title(['���߻ع����',funstr], 'FontWeight', 'Bold', 'Color', 'r');
 %   plot(xout1,n1,'.-');grid;
 %figure (4)
 
% file1=strcat( 'Input/',num2str(w),'.txt');  %�����ǱԴ�ļ�
% fid1 = fopen(file1,'r');
%[SR1,SRMcount1]=fscanf(fid1,'%f',[16 inf]);
%SRMcount=SRMcount1/16;
%SR=SR1';
 
%latlon = jwdtuoyuanzuobiaodian(SR(SRMcount,8),SR(SRMcount,7),dire(1)); 

%lon=SR(SRMcount,7);%����
%lat=SR(SRMcount,8);
%llon= 112.46;  %����112.46   34.54  
%llat= 34.54 ;       
 
 
% Gridcoor=GridTrans(vertex,QZ3(2));
 %   longmax = max(vertex(:,1));%ǱԴγ�����ֵ
 %   longmin=min(vertex(:,1));%ǱԴγ����Сֵ
 %   latmin = min(vertex(:,2));%ǱԴ������Сֵ
 %   latmax=max(vertex(:,2));%ǱԴ�������ֵ
 %   vlong=vertex(:,1);%ǱԴ����γ������
 %   vlat=vertex(:,2);%ǱԴ���о�������
   % disp(vertex);
 %   [X,Y]=meshgrid(latmin:0.1:latmax,longmin:0.1:longmax);%���ָ���
 %   vlong1 = [vlong ; vlong(1)];%γ�ȱպ�
  %  vlat1 = [vlat ; vlat(1)];%���ȱպ�  
  %  in = inpolygon(X,Y,vlat1,vlong1);%�жϺ���ǱԴ���ڵ����и�����
 %   point=[Y(in),X(in)];
 %   m_proj('miller','lat',[32 36],'long',[110 113]);
%m_proj('miller','lat',[latmin latmax],'long',[longmin longmax]);
%axesm('MapProjection','miller','FLonLimit',[latb late],'FLatLimit',[lonb lone]);
%axesm('MapProjection','miller');
%m_grid('box','fancy','tickdir','in');
%m_grid('box','on','xtick',[0:2:360],'xticklabels',[0:2:360],'Fontsize',9.5,'ytick',[-50:2:50],'yticklabels',[-50:2:50],'Fontsize',9.5,'tickdir','out','XaxisLocation','bottom','YaxisLocation','left','linestyle','none'); 

%m_line(Gridcoor(:,1),Gridcoor(:,2),'marker','^','markersize',15,'color','r','MarkerEdgeColor','r',...
%                'MarkerFaceColor','r');      %������
%m_line(SR(:,7),SR(:,8),'marker','^','markersize',15,'color','r','MarkerEdgeColor','r',...
 %              'MarkerFaceColor','r');      %������
%m_line(vlong1,vlat1,'linewi',1,'color',[0 0 0]);     %���������������ɫ����ɫ��Դ

%m_line(lon,lat,'marker','^','markersize',15,'color','r','MarkerEdgeColor','r',...
%                'MarkerFaceColor','b');      %������
%m_line(llon,llat,'marker','^','markersize',15,'color','r','MarkerEdgeColor','b',...
%                'MarkerFaceColor','r');      %������            
%m_line(latlon(:,2),latlon(:,1),'linewi',1,'color',[0 0 0]);     %���������������ɫ����ɫ��Դ


 
    
    













