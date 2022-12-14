function h=hellipse(ra,rb,ang,x0,y0,C,Nb)
%说明：MATLAB中画椭圆的自定义函数：ellipse，用后才会发现这个函数的强大功能！
%在ellipse之函数当中，其输入之变数分别如下： -ra 椭圆之长轴半径，可为列矩阵，
%若为列矩阵时，代表可同时绘制许多椭圆。 -rb 椭圆之矩轴半径，可为列矩阵，
%如ra。 -ang 水平轴之倾斜角，以弧度表示。可为列矩阵，但ra、rb、ang三者之矩阵数应相同。
%-x0,y0 圆心之座标，可为矩阵，若为矩阵时，代表可同时绘制许多不同圆心位置之椭圆。
% -C 椭圆线之颜色 -Nb 绘椭圆时所用之点数。
%ang 以x轴为起点，顺时针为正
ang = ang*pi/180;    %角度转换，以北为起点，顺时针为正。
%ra =4
%rb = 2
%ang = pi/6;
%x0 =1;
%y0 = 1;
%C = 'r';
%Nb = 100;
  
% Ellipse adds ellipses to the current plot  
%  
% ELLIPSE(ra,rb,ang,x0,y0) adds an ellipse with semimajor axis of ra,  
% a semimajor axis of radius rb, a semimajor axis of ang, centered at  
% the point x0,y0.  
%  
% The length of ra, rb, and ang should be the same.  
% If ra is a vector of length L and x0,y0 scalars, L ellipses  
% are added at point x0,y0.  
% If ra is a scalar and x0,y0 vectors of length M, M ellipse are with the same  
% radii are added at the points x0,y0.  
% If ra, x0, y0 are vectors of the same length L=M, M ellipses are added.  
% If ra is a vector of length L and x0, y0 are  vectors of length  
% M~=L, L*M ellipses are added, at each point x0,y0, L ellipses of radius ra.  
%  
% ELLIPSE(ra,rb,ang,x0,y0,C)  
% adds ellipses of color C. C may be a string ('r','b',...) or the RGB value.  
% If no color is specified, it makes automatic use of the colors specified by  
% the axes ColorOrder property. For several circles C may be a vector.  
%  
% ELLIPSE(ra,rb,ang,x0,y0,C,Nb), Nb specifies the number of points  
% used to draw the ellipse. The default value is 300. Nb may be used  
% for each ellipse individually.  
%  
% h=ELLIPSE(...) returns the handles to the ellipses.  
%  
% as a sample of how ellipse works, the following produces a red ellipse  
% tipped up at a 45 deg axis from the x axis  
% ellipse(1,2,pi/8,1,1,'r')  
%  
% note that if ra=rb, ELLIPSE plots a circle  
%  
% rewritten by Din-sue Fon. Dept. of Bio-Industrial Mechatronics Engineering,  
% National Taiwan University March 10,2001  
% dsfong@ccms.ntu.edu.tw  
% % rewritten by Din-sue Fon. Dept. of Bio-Industrial Mechatronics Engineering,  
% National Taiwan University March 10,2001  
% dsfong@ccms.ntu.edu.tw  
% written by D.G. Long, Brigham Young University, based on the  
% CIRCLES.m original  
% written by Peter Blattner, Institute of Microtechnology, University of  
% Neuchatel, Switzerland, blattner@imt.unine.ch  
% Check the number of input arguments

switch nargin
    case 0
        ra=1;rb=1;ang=0;x0=0;y0=0;C=[];Nb=300;
    case 1
        rb=ra;ang=0;x0=0;y0=0;C=[];Nb=300;
    case 2
        ang=0;x0=0;y0=0;C=[];Nb=300;
    case 3
        x0=0;y0=0;C=[];Nb=300;
    case 4
        y0=zeros(1,length(x0));C=[];Nb=300;
    case 5
        C=[];Nb=300;
    case 6
        Nb=300;
end

% set up the default values
if isempty(ra),ra=1;end;
if isempty(rb),rb=1;end;
if isempty(ang),ang=0;end;
if isempty(x0),x0=0;end;
if isempty(y0),y0=0;end;
if isempty(Nb),Nb=300;end;
if isempty(C),C=get(gca,'colororder');end;
% work on the variable sizes
x0=x0(:);
y0=y0(:);
ra=ra(:);
rb=rb(:);
ang=ang(:);
Nb=Nb(:);
if isstr(C),C=C(:);end;
if length(x0)~=length(y0),
    if length(y0)==1,
        y0=ones(1,length(x0))*y0;
    elseif length(x0)==1,
        x0=ones(1,length(y0))*x0;
    else
        error('The lengths of x0 and y0 must be identical');
    end;
end; if length(ra)~=length(rb),
    if length(ra)==1,
        ra=ones(1,length(rb))*ra;
    elseif length(x0)==1,
        rb=ones(1,length(ra))*rb;
    else
        error('The lengths of ra and rb must be identical');
    end;
end;   % how many inscribed elllipses are plotted
if length(ra)~=length(x0)
    maxk=length(ra)*length(x0);
else
    maxk=length(ra);
end;
% drawing loop
route=0;
if length(x0)==1, route=1; end
if length(ra)==1, route=2; end
if length(x0)==length(ra), route=3; end
if length(ang)>1 & length(ra)==1,
    route=4;maxk=length(ang);
end
for k=1:maxk
    switch route
        case 1
            xpos=x0;
            ypos=y0;
            radm=ra(k);
            radn=rb(k);
            if length(ang)==1, an=ang; else an=ang(k); end;
        case 2
            xpos=x0(k);
            ypos=y0(k);
            radm=ra;
            radn=rb;
            if length(ang)==1, an=ang; else an=ang(k); end;
        case 3
            xpos=x0(k);
            ypos=y0(k);
            radm=ra(k);
            radn=rb(k);
            if length(ang)==1, an=ang; else an=ang(k); end;
        case 4
            xpos=x0;
            ypos=y0;
            radm=ra;
            radn=rb;
            an=ang(k);
        otherwise
            rada=ra(fix((k-1)/size(x0,1))+1);
            radb=rb(fix((k-1)/size(x0,1))+1);
            an=ang(fix((k-1)/size(x0,1))+1);
            xpos=x0(rem(k-1,size(x0,1))+1);
            ypos=y0(rem(k-1,size(y0,1))+1);
    end;
    co=cos(an);
    si=sin(an);
    the=linspace(0,2*pi,Nb(rem(k-1,size(Nb,1))+1,:)+1);
    %  x=radm*cos(the)*co-si*radn*sin(the)+xpos;
    %  y=radm*cos(the)*si+co*radn*sin(the)+ypos;
    h(k)=line(radm*cos(the)*co-si*radn*sin(the)+xpos,radm*cos(the)*si+co*radn*sin(the)+ypos);
    set(h(k),'color',C(rem(k-1,size(C,1))+1,:));
end;

%axis equal;grid on;
