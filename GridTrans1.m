 function GT = GridTrans1(lon,lat,dnum,NM)%
%format long g;
              
              longmax = max(lon(:,1:dnum));%
              longmin=min(lon(:,1:dnum));%
              latmin = min(lat(:,1:dnum));%
              latmax=max(lat(:,1:dnum));%
              vlong=lon(:,1:dnum);%
              vlat=lat(:,1:dnum);%
              %disp(vlong);
              vlong1 = [vlong' ; vlong(1)];%
              vlat1 = [vlat' ; vlat(1)];%
    
    %  C=rand(100,2);
    %  y=(longmax-longmin)*C(:,2)+longmin;
   %   x=(latmax-latmin)*C(:,1)+latmin;
    %  vlong1 = [vlong ; vlong(1)];%
    %  vlat1 = [vlat ; vlat(1)];%
    % in = inpolygon(x,y,vlat1,vlong1);%
   %     point=[y(in),x(in)];
    %     [m,n]=size(point);
          point1=zeros(NM,2);
    %       point1(1:m,:)=point;
    m=0;
while m<NM
          
             m=m+1;   
             C1=rand(1,2);
            y1=(longmax-longmin)*C1(1,2)+longmin;
             x1=(latmax-latmin)*C1(1,1)+latmin;
             in1 = inpolygon(x1,y1,vlat1,vlong1);%
            % disp(in1);
            if in1==1
            point1(m,:)=[y1(in1),x1(in1)];%Î³¶È£¬¾­¶È
            else
                m=m-1;
            end
end
%point1=point(1:NM,:);
GT=point1;
             
 %m_proj('miller','lat',[34 36],'long',[111.4 113]);
 %    m_line(point1(:,1),point1(:,2),'marker','^','markersize',15,'color','r','MarkerEdgeColor','r',...
 %               'MarkerFaceColor','r');      %
    
 %    m_grid('box','fancy','tickdir','in');
 %    m_line(vlong1,vlat1,'linewi',1,'color',[0 0 0]);     %
            %  in = inpolygon(X,Y,vlat1,vlong1);%
              %point=[Y(in),X(in)];
            %  GT =[point;vertex] ;%