function CT1=schcoortrans2(locat,catml)%�������꣬�������꣬�Ƕ�   �����ƽ�ƺ���ת
% locatΪ�����X��Y����
% newC��ʽΪ����Ŀ¼��qq ����ii ǱԴ���vv1 ��MM ����γ��eqccoor(:,1) ���� ��λ��sita X���� Y���� ����    
% ��ת�ĽǶ�Ϊ��һ����������ѷ���
% Ϊ���飬ֱ�Ӽ�11��12���У����滻ԭ����8��9�У�


%function CT1=coortrans2(a,b,x,y,Dirangle)
%x=xy(:,1); %��������
%y=xy(:,2);

x2=catml(:,8)-locat(1);
y2=catml(:,9)-locat(2);
a1=catml(:,7)*0.0174532922222222;      %�Ȼ����� pi/180 = 0.017453 ���Ա�Ϊ���
%a1=90*0.0174532922222222;      %�Ȼ����� pi/180 = 0.017453 ���Ա�Ϊ���

%y1=cos(a1).*y+sin(a1).*x-a.*sin(a1)-b.*cos(a1);
%x1=cos(a1).*x-(1/sin(a1))'.*y-a.*cos(a1)+b.*sin(a1);

catml(:,11) = x2.*cosd(a1) + y2.*sind(a1);%˳ʱ����ת
catml(:,12) = y2.*cosd(a1) - x2.*sind(a1);
CT1=catml;
%��ʱ����ת�Ƕ�t
%ת������Ϊ   cos(t)  sin(t)
%            -sin(t)  cos(t)