function newC=schnewCat(locat,catml,A1,sub)

% locat Ϊ����ת�����X��Y���ꣻ
% catml��ʽΪ����Ŀ¼��qq ����ii ǱԴ���vv1 ��MM ����γ��eqccoor(:,1) ���� ��λ��sita X���� Y����
%  A1 Ϊ��Ӧ�Ҷ��𼶵�sub��Ӧ���޾���
%  ���Ŀ¼�����һ�������˾ೡ��ľ���
% newC��ʽΪ����Ŀ¼��qq ����ii ǱԴ���vv1 ��MM ����γ��eqccoor(:,1) ���� ��λ��sita X���� Y���� ����

sub=[3;sub];    %Ϊѭ�����俪ʼ�ͽ�β����
mn=length(sub);
newCat=[];

  dd = sqrt((locat(1)-catml(:,8)).^2+(locat(2)-catml(:,9)).^2);   %���㳡�������о��빫ʽ
  catml = [catml,dd];   %Ŀ¼�����һ�����Ӿ�����
%Cat1=[Cat CT11 dd];   %Ŀ¼�м��������Ŀ���ľ���//0.0010    0.0030    0.0280    0.0053    0.1110    0.0357         0    0.4982    3.9513    0.3753

for i=2:mn
%    FI = find(sub(i)<=catml(:,4)&catml(:,4)<sub(i+1)&dd<A1(i));
%    I49= sub(i)<=catalog1(:,4)&catalog1(:,4)<sub(i+1)&dd<A1(i);
     I49= sub(i-1)<=catml(:,4)&catml(:,4)<sub(i)&catml(:,10)<A1(i-1);
     A49=catml(I49,:);
     
%    CT12=catml(I49,:);
%    A491=[A49, ];
     newCat=[newCat;A49];
end
newC= newCat;


%I49= 4<=Cat1(:,4)&Cat1(:,4)<sub(1)&Cat1(:,8)<A1(1);
%A49=Cat1(I49,:);


%I54= sub(1)<=Cat1(:,4)&Cat1(:,4)<sub(2)&Cat1(:,8)<A1(2);
%disp(I54);
%A54=Cat1(I54,:);

%I59= sub(2)<=Cat1(:,4)&Cat1(:,4)<sub(3)&Cat1(:,8)<A1(3);
%A59=Cat1(I59,:);

%I64= sub(3)<=Cat1(:,4)&Cat1(:,4)<sub(4)&Cat1(:,8)<A1(4);
%A64=Cat1(I64,:);

%I69= sub(4)<=Cat1(:,4)&Cat1(:,4)<6.9&Cat1(:,8)<A1(5);
%A69=Cat1(I69,:);

%I74= 6.9<=Cat1(:,4)&Cat1(:,4)<7.4&Cat1(:,8)<A1(6);
%A74=Cat1(I74,:);

%I79= 7.4<=Cat1(:,4)&Cat1(:,4)<7.9&Cat1(:,8)<A1(7);
%A79=Cat1(I79,:);

%I85= 7.9<=Cat1(:,4)&Cat1(:,4)<8.5&Cat1(:,8)<A1(8);
%A85=Cat1(I85,:);
%newC=[A49;A54;A59;A64;A69;A74;A79;A85];
