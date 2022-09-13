function GT = GridTrans(vertex,gri)


format long g;
   longmax = max(vertex(:,1));%
    longmin=min(vertex(:,1));%
    latmin = min(vertex(:,2));%
    latmax=max(vertex(:,2));%
    vlong=vertex(:,1);%
    vlat=vertex(:,2);%
    [X,Y]=meshgrid(latmin:gri:latmax,longmin:gri:longmax);%
    %vlong1 = [vlong ; vlong(1)];%
   % vlat1 = [vlat ; vlat(1)];%
    in = inpolygon(X,Y,vlat,vlong);%
    point=[Y(in),X(in)];
   % GT =[point;vertex] ;%
   GT =point ;%














