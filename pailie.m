clc;
clear;
load('inputyong/b3(50��2��(3)).mat');
 % Cat=catalog1; % 1.0000    3.0000   95.0000    5.9275  110.5894   31.3053   50.0000   15.0000
  count14=zeros(57,1);%ǧԪ����
  count2=zeros(57,3);
  num=0;
  for j=0:399
   for k=1+j*50:(j+1)*50%Ŀ¼����
       count2=zeros(57,3);
           % d=ismember(Cat(:,1),k);
            d=ismember(catalog1(:,1),k);
           % Cat1=Cat(d,:);%��һ��
           Cat1=catalog1(d,:);%��һ��
           % disp(Cat1);
            Cat2=find(7<=Cat1(:,4)&Cat1(:,4)<7.5);
          % Cat2=find(7.5<=Cat1(:,4));
            Cat3=Cat1(Cat2,:);
            count=tabulate(Cat3(:,3));
           % disp(count);
            [m,n]=size(count);
           % disp(size(count));
             if n==1
                    continue
                else
           % disp(n);
            count2(1:m,:)=count;
            % disp(count2(:,3));
            num=num+1;
           % disp(k);
            count14=count14+count2(:,2);%4������
             end
   end
   
   %count15=count14/(100*num);%4�����𵵣���ƽ����
  count15=count14/sum(count14);%4�����𵵣���ƽ����
   w=700400+j+1;
    file2 = strcat('Input/5ʮ/',num2str(w),'.txt');    %�����ı��ļ�
           fid2 = fopen(file2,'wt');
           
          [m,n]=size(count15);
          
          for i=1:m
               fprintf(fid2,'%d %2.4f\r\n', count14(i),count15(i,1));%i��ʾ������ţ�j��ʾǱԴ�ţ�w��ʾ�����
          end;
          fclose(fid2);

  end