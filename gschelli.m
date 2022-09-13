function ellipse = gschelli(catml,C1,C2,C3,C4,C5,C6,C7,D1,D2,D3,D4,D5,D6,D7)
  %http://www.ilovematlab.cn/forum.php?mod=viewthread&tid=286761
  %ccatml格式为：子目录数qq 地震档ii 潜源编号vv1 震级MM 地震纬度eqccoor(:,1) 经度 方位角sita X坐标 Y坐标 距离 X1 Y1   
  %C、D为衰减关系的系数


  %la = catml(:,11); %
  %lb = catml(:,12);
  lb = catml(:,11); %
  la = catml(:,12);
  mc = catml(:,4);
  jj=catml(:,10);
    
%    f= @(a,b,c,d)@(x)[a^2/x(1)^2+b^2/x(2)^2 - 1;...
%       c(1)+c(2)*mc+c(4)*log10(x(1)+c(5))+c(7)*x(1)-d(1)-d(2)*mc-d(4)*log10(x(2)+d(5))-d(7)*x(2)];
    f= @(a,b,mc,C1,C2,C4,C5,C7,D1,D2,D4,D5,D7)@(x)[a^2/x(1)^2+b^2/x(2)^2 - 1;...
       C1+C2*mc+C4*log(x(1)+C5)+C7*x(1)-D1-D2*mc-D4*log(x(2)+D5)-D7*x(2)];
   
    n = numel(la);
    op = optimset('display','off');
    x = rand(2,n);
    parfor i = 1:n
     %   w=zeros(1,2);
     %  syms A B
     % [E,F]=solve(la(i)^2/A^2+lb(i)^2/B^2-1,D1+D2*mc(i)+D4*log10(B+D5)-C1-C2*mc(i)-C4*log10(A+C5));%
     %   E1=double(E);
     %   F1=double(F);

       x(:,i) = fsolve(f(la(i),lb(i),mc(i),C1,C2,C4,C5,C7,D1,D2,D4,D5,D7),[jj(i),jj(i)],op);
      % x(:,i) = fsolve(f(la(i),lb(i),mc(i),C1,C2,C4,C5,C7,D1,D2,D4,D5,D7),[E1,F1],op);
    end
    ellipse = x'; 
end    
