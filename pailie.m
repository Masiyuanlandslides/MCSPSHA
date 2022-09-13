clc;
clear;
load('inputyong/b3(50年2万(3)).mat');
 % Cat=catalog1; % 1.0000    3.0000   95.0000    5.9275  110.5894   31.3053   50.0000   15.0000
  count14=zeros(57,1);%千元个数
  count2=zeros(57,3);
  num=0;
  for j=0:399
   for k=1+j*50:(j+1)*50%目录总数
       count2=zeros(57,3);
           % d=ismember(Cat(:,1),k);
            d=ismember(catalog1(:,1),k);
           % Cat1=Cat(d,:);%第一组
           Cat1=catalog1(d,:);%第一组
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
            count14=count14+count2(:,2);%4级地震档
             end
   end
   
   %count15=count14/(100*num);%4级地震档（求平均）
  count15=count14/sum(count14);%4级地震档（求平均）
   w=700400+j+1;
    file2 = strcat('Input/5十/',num2str(w),'.txt');    %创建文本文件
           fid2 = fopen(file2,'wt');
           
          [m,n]=size(count15);
          
          for i=1:m
               fprintf(fid2,'%d %2.4f\r\n', count14(i),count15(i,1));%i表示地震带号，j表示潜源号，w表示场点号
          end;
          fclose(fid2);

  end