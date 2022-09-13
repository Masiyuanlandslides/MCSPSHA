 function GT = schGridTrans1(lon,lat,dnum,NM)%潜源格网化函数，NM为要产生的震中个数
%format long g;
              
    longmax = max(lon(:,1:dnum));%潜源纬度最大值
    longmin=min(lon(:,1:dnum));%潜源纬度最小值
    latmin = min(lat(:,1:dnum));%潜源精度最小值
    latmax=max(lat(:,1:dnum));%潜源精度最大值
    vlong=lon(:,1:dnum);%潜源所有纬度坐标
    vlat=lat(:,1:dnum);%潜源所有经度坐标
    %disp(vlong);
    vlong1 = [vlong' ; vlong(1)];%纬度闭合
    vlat1 = [vlat' ; vlat(1)];%精度闭合
    
      C=rand(2*NM,2);
      y=(longmax-longmin)*C(:,2)+longmin;
      x=(latmax-latmin)*C(:,1)+latmin;

      in = inpolygon(x,y,vlat1,vlong1);%判断含在潜源区内的所有格网
      point=[y(in),x(in)];
      [mh,nl]=size(point);
%     if mk<NM

while mh<NM
      mh=mh+1;
      C1=rand(1,2);
      y1=(longmax-longmin)*C1(1,2)+longmin;
      x1=(latmax-latmin)*C1(1,1)+latmin;
      in1 = inpolygon(x1,y1,vlat1,vlong1);%判断含在潜源区内的所有格网点
      % disp(in1);
      if in1==1
          point(mh,:)=[y1(in1),x1(in1)];%纬度，经度
      else
          mh=mh-1;
      end
end
%point1=point(1:NM,:);
%GT=point1;
  GT = point(1:NM,:);           
 

%m_proj('miller','lat',[34 36],'long',[111.4 113]);
 %    m_line(point1(:,1),point1(:,2),'marker','^','markersize',15,'color','r','MarkerEdgeColor','r',...
 %               'MarkerFaceColor','r');      %画场地
    
 %    m_grid('box','fancy','tickdir','in');
 %    m_line(vlong1,vlat1,'linewi',1,'color',[0 0 0]);     %用随机产生的三个色素颜色画源
     
            %  in = inpolygon(X,Y,vlat1,vlong1);%判断含在潜源区内的所有格网点
              %point=[Y(in),X(in)];
            %  GT =[point;vertex] ;%格网化潜源坐标值