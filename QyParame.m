%ǱԴ����Ԥ���ṩ
function  [A]= QyParame(qysdata)  %�����ǱԴ�ţ����ֵ�����Ŀ���ٷֱ�
       b=unique(qysdata(:,1));
       [m1,m2]=size(b);
        A=zeros(m1,2);

    for i=1:m1
     c=find(qysdata(:,1)==b(i));
     d=qysdata(c,:);
    [n1,n2]=size(d);
    if n1==1
        A(i,1:2)=[b(i) d(:,2)];
   else
   d1=sum(d);
  
   A(i,1:2)=[b(i) d1(:,2)];
    end
    end
