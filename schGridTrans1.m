 function GT = schGridTrans1(lon,lat,dnum,NM)%ǱԴ������������NMΪҪ���������и���
%format long g;
              
    longmax = max(lon(:,1:dnum));%ǱԴγ�����ֵ
    longmin=min(lon(:,1:dnum));%ǱԴγ����Сֵ
    latmin = min(lat(:,1:dnum));%ǱԴ������Сֵ
    latmax=max(lat(:,1:dnum));%ǱԴ�������ֵ
    vlong=lon(:,1:dnum);%ǱԴ����γ������
    vlat=lat(:,1:dnum);%ǱԴ���о�������
    %disp(vlong);
    vlong1 = [vlong' ; vlong(1)];%γ�ȱպ�
    vlat1 = [vlat' ; vlat(1)];%���ȱպ�
    
      C=rand(2*NM,2);
      y=(longmax-longmin)*C(:,2)+longmin;
      x=(latmax-latmin)*C(:,1)+latmin;

      in = inpolygon(x,y,vlat1,vlong1);%�жϺ���ǱԴ���ڵ����и���
      point=[y(in),x(in)];
      [mh,nl]=size(point);
%     if mk<NM

while mh<NM
      mh=mh+1;
      C1=rand(1,2);
      y1=(longmax-longmin)*C1(1,2)+longmin;
      x1=(latmax-latmin)*C1(1,1)+latmin;
      in1 = inpolygon(x1,y1,vlat1,vlong1);%�жϺ���ǱԴ���ڵ����и�����
      % disp(in1);
      if in1==1
          point(mh,:)=[y1(in1),x1(in1)];%γ�ȣ�����
      else
          mh=mh-1;
      end
end
%point1=point(1:NM,:);
%GT=point1;
  GT = point(1:NM,:);           
 

%m_proj('miller','lat',[34 36],'long',[111.4 113]);
 %    m_line(point1(:,1),point1(:,2),'marker','^','markersize',15,'color','r','MarkerEdgeColor','r',...
 %               'MarkerFaceColor','r');      %������
    
 %    m_grid('box','fancy','tickdir','in');
 %    m_line(vlong1,vlat1,'linewi',1,'color',[0 0 0]);     %���������������ɫ����ɫ��Դ
     
            %  in = inpolygon(X,Y,vlat1,vlong1);%�жϺ���ǱԴ���ڵ����и�����
              %point=[Y(in),X(in)];
            %  GT =[point;vertex] ;%������ǱԴ����ֵ