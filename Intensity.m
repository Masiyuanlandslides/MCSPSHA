function Inten=Intensity(M,Ra,C1,C2,C3,C4,C5,C6,C7)
%clc;

k=size(M);
%SIGMA=0.573;
SIGMA=0.632;
R = normrnd(0,SIGMA,k(1),k(2));  %
%disp(R);
%ii=C1+C2*M+C4*log(Ra+C5)+C7*Ra;%
ii=C1+C2*M+C4*log10(Ra+C5)+C7*Ra;%
Inten=ii+R;
  
%setdiff(A,B)   %
%numel(setdiff(A,B))
   % MaxI(j,1)=max(C(:,17)); 
   % meanI(j,1)=mean(C(:,17)); 
%end

        