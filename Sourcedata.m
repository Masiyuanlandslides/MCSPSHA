function  [QYSD,direSD,fimkSD,vertexSDlon,vertexSDlat]= Sourcedata(Psf1,Psf2,QZ3,dire,fimkz,loat)  %Psf1�����ǱԴ��ʼ��Psf2�����ǱԴ��ֹ  
format long;
            
 QYSD=QZ3(Psf1:Psf2,:);     %������ ����� ǱԴ����
 direSD=dire(Psf1:Psf2,:);  %����1     ����        ����2     ����
 fimkSD=fimkz(Psf1:Psf2,:);  %ĳһ���������ǱԴ�����𼶱����������
 vertexSD=loat(Psf1:Psf2,:);%ĳһ���������ǱԴ����γ�Ⱦ�������
 [m,n]=size(vertexSD);
 vertexSDlon=zeros(m,10);
 vertexSDlat=zeros(m,10);
 for i=1:10
vertexSDlon(:,i)=vertexSD(:,i*2-1);
vertexSDlat(:,i)=vertexSD(:,i*2);
 end
 