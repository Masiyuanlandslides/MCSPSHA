function  [QYSD,direSD,fimkSD,vertexSDlon,vertexSDlat,subM]= Sourcedatalao(Psf1,Psf2)  %Psf1�����ǱԴ��ʼ��Psf2�����ǱԴ��ֹ  
format long;
            fid1 = fopen('lao12.txt','r');%ǱԴ���ļ�
           subM=fscanf(fid1,'%f %f %f %f %f %f %f',[7,1]);%����
           QZ3=zeros(422,3);
           dire=zeros(422,4);%����
           fimk=zeros(422,7);%ǱԴ�ռ�ֲ�����
           loat=zeros(422,20);%��������
 for j=1:422       
                 QZ31=fscanf(fid1,' %d    %f    %d',[3,1]);%������ ����� ǱԴ����
                 QZ3(j,:)=QZ31';
                 dire1=fscanf(fid1,'   %d  %f   %d  %f',[4,1]);%����1     ����        ����2     ����
                 dire(j,:)=dire1';
                 fimk1=fscanf(fid1,'%f  %f  %f  %f  %f  %f  %f',[7,1]); %ĳһ�����ĳһǱԴ�����𼶱����������
              %   disp(fimk1);
                 fimk(j,:)=fimk1'; 
                 number=2*QZ3(j,1);%�����������е���Ŀ����
                 loat1=fscanf(fid1,'%f ', [number,1]);
                 loat(j,1:number)=loat1';
 end
 fclose(fid1);
 QYSD=QZ3(Psf1:Psf2,:);     %������ ����� ǱԴ����
 direSD=dire(Psf1:Psf2,:);  %����1     ����        ����2     ����
 fimkSD=fimk(Psf1:Psf2,:);  %ĳһ���������ǱԴ�����𼶱����������
 vertexSD=loat(Psf1:Psf2,:);%ĳһ���������ǱԴ����γ�Ⱦ�������
 [m,n]=size(vertexSD);
 vertexSDlon=zeros(m,10);
 vertexSDlat=zeros(m,10);
 for i=1:10
vertexSDlon(:,i)=vertexSD(:,i*2-1);
vertexSDlat(:,i)=vertexSD(:,i*2);
 end