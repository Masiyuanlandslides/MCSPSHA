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

%//���ļ�
 fid=fopen('dizhendai.txt','r');
        % ���ļ�ͷ     ǱԴ��Ϣ
        psf=fscanf(fid,'%f,%f,%f,%f,%f,%f,%f',[7 1]);%nsourceΪǱԴ��Ŀ
   [DD1,Dcount1]= fscanf(fid,'%f,%f,%f,%f',[4 inf]);%�����ޡ�bֵ����������ʡ����
   fclose(fid);   
   Dcount=Dcount1/4;%�������Ŀ
    DD=DD1';
    T=100;
    
    fid1 = fopen('12.txt','r');%ǱԴ���ļ�
           subM=fscanf(fid1,'%f,%f,%f,%f,%f,%f,%f',[7,1]);%����
           QZ3=zeros(422,3);
           dire=zeros(422,4);%����
           fimkZ=zeros(422,7);%ǱԴ�ռ�ֲ�����
           loat=zeros(422,20);%��������
 for j=1:422       
                 QZ31=fscanf(fid1,'%d,%f,%d',[3,1]);%������ ����� ǱԴ����
                 QZ3(j,:)=QZ31';
                 dire1=fscanf(fid1,'%d,%f,%d,%f',[4,1]);%����1     ����        ����2     ����
                 dire(j,:)=dire1';
                 fimk1=fscanf(fid1,'%f,%f,%f,%f,%f,%f,%f',[7,1]); %ĳһ�����ĳһǱԴ�����𼶱����������
                 fimkZ(j,:)=fimk1'; 
                 number=2*QZ3(j,1);%�����������е���Ŀ����
                 loat1=fscanf(fid1,'%f,', [number,1]);
                 loat(j,1:number)=loat1';
 end
 fclose(fid1);
% disp(fimkZ);
 %//ѡ��Ҫִ�е��������
  i=3;%ѡ������
   [M1,N,v0,depth]=ProM(i,DD,T,1);%�ֶ��������(С�ڵ���q)�������� MΪĳһ������������𼶴�С��N1Ϊ��Ŀ,TΪʱ�䳤��,psfΪǱԴ�ֵ�ֵ,v0Ϊ�����귢����
   Psf1=[1;psf(1)+1;psf(2)+1;psf(3)+1;psf(4)+1;psf(5)+1;psf(6)+1];%�����ǱԴ��ʼ��ǱԴ�ֵ�ֵ;lie
           % disp(Psf1);
            Psf2=[psf(1);psf(2);psf(3);psf(4);psf(5);psf(6);psf(7)];%�����ǱԴ��ֹ��ǱԴ�ֵ�ֵ;lie
            
            Psf11=Psf1(i);%�������ʼǱԴ���
            Psf22=Psf2(i);%�������ֹǱԴ���
           disp(Psf11);
            disp(Psf22);
   %//���У���ѭ��      
 for q=1:1 %��Ŀ¼��Ŀ��
           M2=M1(:,q);
           ww=find(M2~=0);%�ų���0��ͳ��
           M=M2(ww,:);
         %  disp(M);
           N1=N(q,:);
            stream = RandStream('mt19937ar','seed',0);%������������ݵ���ʱ������������û�ã�
            
            
            [tt1,tt2]= Time1(N1,v0,T);
               
            timere1=[tt1,tt2];
           % timere=[timere;timere1];
             [QYSD,direSD,fimkSD,vertexSDlon,vertexSDlat]= Sourcedata(Psf11,Psf22,QZ3,dire,fimkZ,loat);%ÿ��ǱԴ�������� ����� ǱԴ���ͣ�,(����1 ���� ����2 ����),(ǱԴ�����𼶱����������),(Դγ������),(Դ��������)��(�����𼶷ֵ�)
            %�ƶ�����//
             disp(fimkSD);
             fimk=cumsum(fimkSD);           %һ��������ռ��ۻ������ܶȺ���,�б�ʾ�𼶵�    tabulate
            disp(fimk);
            [qyNcount]= ProQMN(M,subM,fimk);% ����ǱԴ���𼶵����������ǱԴ�ţ��кŴ���ֵ�ֵ���е����ֱ�ʾǱԴ��
           % disp(qyNcount);
            [m1,m2]=size(qyNcount); %ǱԴѭ������
         %disp(qyNcount);
 end
  w=4;
  file2 = strcat('Input/',num2str(w),'.txt');    %�����ı��ļ�
           fid2 = fopen(file2,'wt');
          [nn1,nn2]= size(fimk);
     for s=1:nn1
            
     fprintf(fid2,'%1.4f %1.4f %1.4f %1.4f %1.4f %1.4f %1.4f\r\n',fimkSD(s,1),fimkSD(s,2),fimkSD(s,3),fimkSD(s,4),fimkSD(s,5),fimkSD(s,6),fimkSD(s,7));%i��ʾ������ţ�j��ʾǱԴ�ţ�w��ʾ�����
      
         %  fprintf(fid2,'%d %d %2.2f\r\n',q,i,M(s,1));%i��ʾ������ţ�j��ʾǱԴ�ţ�w��ʾ�����
      end
           