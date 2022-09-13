function PR = ProbR(long,lat,earthcatlong,earthcatlat,depth)  %
format long g;
% CU-PSHA Software
% Calculate probability of distance from earthquake source to site
% Step 1: Call EQ source

%file = strcat('Input\',num2str(i),'.txt');
%fid = fopen(file,'r');
%[earthcat1,Qncount] = fscanf(fid,'%f',[6 inf]);
%earthcat=earthcat1';
%Qnpoint = Qncount/6;
%disp(Qnpoint);
%fclose(fid);
%Rdist = zeros(1,Qnpoint);
%for k = 1:Qnpoint
    ci=[earthcatlong earthcatlat];
    cf=[long lat];
    C=geodistance(ci,cf,6)/1000;
    Rdist = sqrt((C^2)+depth^2);
%end
  % PR=Rdist;
  PR=C;

   
   