%����������ʵ��Ŀ¼���ԣУңţУӣȣ�����������Ҷ�
close all;
clc;
%http://m.blog.csdn.net/article/details?id=51283758
clear;
% Step 1:  Load study area (Require)

%profile on
%matlabpool local
tic;
%˥����ϵ
C1=5.253;
C2=1.398;
C3=0;
C4=-4.164;
C5=26;
C6=0;
C7=0;
D1=2.019;
D2=1.398;
D3=0;
D4=-2.943;
D5=8;
D6=0;
D7=0;
gri=0.05;%����������
% % C1=1.0476;
% % C2=1.4472;
% % C3=0;
% % C4=-0.8609;
% % C5=7;
% % C6=0;
% % C7=-0.0039;
% % D1=0.8831;
% % D2=1.4472;
% % D3=0;
% % D4=-0.9381;
% % D5=5;
% % D6=0;
% % D7=-0.0027;
%gri=0.2;%����������

Ar1 = fopen('tianshuishi.txt','r');             %�����У��߽�㣩
[Ar,Arcount] = fscanf(Ar1,'%f',[2 inf]);
%Arpoint = Arcount/2;
Ar = Ar';
fclose(Ar1);
GT = GridTrans(Ar,gri);         %ʡ�߽������
[ppoint1,ppoint2]=size(GT);     %��Ҫ����ĳ����С
GT2=GT(:,2);                    %���㾭��
GT1=GT(:,1);                    %����γ��


%load('inputyong/b6(50��10��).mat');        %����1������Ŀ¼
load('inputyong/b6(50��100000��).mat');        %����1������Ŀ¼
count = length(catalog1);
%catalog1��ʽ��  ��Ŀ¼��qq ����ii ǱԴ���vv1 ��MM ����γ��eqccoor(:,1) ���� ��λ��sita
disp(count);

%//�����𼶵����޾���
lsub=[4.9;5.4;5.9;6.4;6.9;7.4;7.9;8.5;9.5];%�ֵ�������
    II=5.0;                                   %��Ҫ������Ҷ�
    A=disRMax(II,lsub,C1,C2,C3,C4,C5,C6,C7);   %���𼶷ֵ��������������
    A1=10*ceil(A/10);                         %��������ȡ��
cataloge611=[];          %����2���������Ԥ��////////////////////////////////////////ע��þ������ƣ�21��1�����һ�������

%parfor i=1:ppoint1%�����������1992
parfor i=1:100%�����������6��
 
%parfor i=1;%�����������
%for i=23:43;
    disp(i);
    [CT0,CT] = schzuobiaodian(GT(i,:),catalog1);    %�Գ���Ϊ����CTOתֱ������ CT����Ŀ¼��������ת��
    %[CT0,CT] = schzuobiaodian(GT(i,2),GT(i,1),catalog1);    %�Գ���Ϊ����CTOתֱ������ CT����Ŀ¼��������ת��
     % ��ʽΪ����Ŀ¼��qq ����ii ǱԴ���vv1 ��MM ����γ��eqccoor(:,1) ���� ��λ��sita X���� Y����

    newC=schnewCat(CT0,CT,A1,lsub);     %��������ѡ���µ�Ŀ¼�����һ�������˾ೡ��ľ���
    % newC��ʽΪ����Ŀ¼��qq ����ii ǱԴ���vv1 ��MM ����γ��eqccoor(:,1) ���� ��λ��sita X���� Y���� ����    
    
    %//����ƽ����ת
    CT2=schcoortrans2(CT0,newC);  %���²�����Ŀ¼��ÿ����������ѷ�����������ƽ�ƺ���ת����ԭĿ¼�������11��12��
    %CT2��ʽΪ����Ŀ¼��qq ����ii ǱԴ���vv1 ��MM ����γ��eqccoor(:,1) ���� ��λ��sita X���� Y���� ���� X1 Y1   
    [count1,lie1]=size(CT2);%�����С
    %dd1=sqrt((0-CT2(:,1)).^2+(0-CT2(:,2)).^2);%���㳡�������о��빫ʽ
    disp(count1);
    %//�����Ҷ�
     %CT2��ʽΪ����Ŀ¼��qq ����ii ǱԴ���vv1 ��MM ����γ��eqccoor(:,1) ���� ��λ��sita X���� Y���� ���� X1 Y1   
     ellipse= gschelli(CT2,C1,C2,C3,C4,C5,C6,C7,D1,D2,D3,D4,D5,D6,D7);  %����˥����Բ����ó�����ĳ��ȣ���λΪkm
    %���㳤�����õ�����
    Inten=Intensity(CT2(:,4),ellipse(:,1),C1,C2,C3,C4,C5,C6,C7) ;                        %�����Ҷ�ֵ ��  ����
    iii=repmat(i,count1,1);%�����
    cataloge=[CT2 Inten ellipse(:,1) ellipse(:,2) iii];%���м�
%CT2��ʽΪ����Ŀ¼��qq ����ii ǱԴ���vv1 ��MM ����γ��eqccoor(:,1) ���� ��λ��sita X���� Y���� ���� X1 Y1 �Ҷ� ���� ���� �����
    cataloge611=[cataloge611;cataloge];                     %��������������������������������������������������������������������������������ע���滻��������
end
%Ŀ¼�� ���� ǱԴ�� �� γ�� ���� �Ƕ� x���� y���� ���о� תx תy �Ҷ� ���� ���� �����
%31  3 44  5.43039533392234  107.719827522045   34.1997999178864   170
%197.722440773789          3788.89583614646          40.4953956805562          5.60380045091084          40.5685225606436          27.8325367354434                         2
%storageName = strcat('bI33',num2str(i),'.mat');
%storageName = strcat('bI33',num2str(i),'.mat');
%save(storageName,'cataloge2');

 save('Input2/bI611(50).mat','cataloge611');  
% cataloge313=cataloge311(10000001:20000000,:);
% save('Input2/bI313(50).mat','cataloge313');  
% cataloge314=cataloge311(20000001:30000000,:);
%  save('Input2/bI314(50).mat','cataloge314');  %����������������������������������������������������ע������
% cataloge315=cataloge311(30000001:44806025,:);
%  save('Input2/bI315(50).mat','cataloge315');  
 toc
%matlabpool close

%fp1 = fopen('catalog2new.txt','w');
%fprintf(fp1,'    M      lat         lon        sita        x           y        delta       I        Ia          Ib\r\n');
%for i=1:length(cataloge2(:,1))
%    fprintf(fp1,'%7.4f  %7.4f   %8.4f   %8.4f   %8.4f   %8.4f   %8.4f   %5.3f   %8.4f   %8.4f\r\n',...
%      cataloge2(i,4),cataloge2(i,5),cataloge2(i,6),cataloge2(i,7),cataloge2(i,8),cataloge2(i,9),cataloge2(i,10),...
%      cataloge2(i,13),cataloge2(i,14),cataloge2(i,15));
%end;
%fclose(fp1);

%figure(1)
%    latb = floor(min(min(catalog1(:,6)),GT(1,2))-1);  %ȷ��ͼ���С
%    late = ceil(max(max(catalog1(:,6)),GT(1,2))+1);
%    lonb = floor(min(min(catalog1(:,5)),GT(1,1))-1);
%    lone = ceil(max(max(catalog1(:,5)),GT(1,1))+1);
%    m_proj('miller','lat',[latb late],'long',[lonb lone]);
%    axesm('MapProjection','miller','FLonLimit',[lonb lone],'FLatLimit',[latb late]);
%    axesm('MapProjection','miller');
%    m_grid('box','fancy','tickdir','in');
%    for r =1:length(catalog1(:,1))
%       m_line(catalog1(r,5),catalog1(r,6),'marker','o','markersize',1*catalog1(r,4),'MarkerEdgeColor','g','MarkerFaceColor','g'); 
%    end
%   for r=1:length(cataloge(:,1))    %������ֲ�ͼ
%        
%         m_line(cataloge(r,5),cataloge(r,6),'marker','o','markersize',1*cataloge(r,4),'MarkerEdgeColor','b','MarkerFaceColor','b'); 
%    end
%    title('���зֲ�ͼ');
%    m_line(GT(1,1),GT(1,2),'marker','^','markersize',5,'color','r','MarkerEdgeColor','r',...
%        'MarkerFaceColor','r');      %������
%    legend('��ɫΪ����','��ɫ��ѡ����','��ɫ�������');


%figure(2)
%    hold on
%    for r=1:length(cataloge(:,1))
      
%       plot(cataloge(r,8),cataloge(r,9),'o','markersize',cataloge(r,4));
%    end

%     plot(CT0(1),CT0(2),'-ro'); 
%     grid;
%     axis equal;
%     title('תֱ���������зֲ�ͼ');
%     xlabel('UTM Easting (km)')
%     ylabel('UTM Northing (km)')

%figure(3)
%    drawcircle=@(x,y,r,c)(plot(x+r*cos(linspace(0,2*pi)),y+r*sin(linspace(0,2*pi)),c));
%    hold on; 
%    grid;
%    for r=1:length(cataloge(:,1))
                                      %drawcircle(cataloge(r,11),cataloge(r,12),2*cataloge(r,4),'b');
%        drawcircle(cataloge(r,11),cataloge(r,12),2,'b');
                                      %h = hellipse(0,0,cataloge(r,14),cataloge(r,15),cataloge(r,7));
%        h = hellipse(cataloge(r,15),cataloge(r,14),0,0,0);
%    end
%       drawcircle(0,0,2,'r');
%    axis equal;
%    legend('��ɫΪ����','��ɫΪ����','����Ϊ������');
   



