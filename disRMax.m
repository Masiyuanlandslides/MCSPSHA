function AA=disRMax(I,M,C1,C2,C3,C4,C5,C6,C7)

[n1,n2]=size(M);
AA=zeros(n1,1);
for i=1:n1
syms Ra
%[A]=solve(C1+C2*M(i)+C4*log(Ra+C5)+C7*Ra-I);
[A]=solve(C1+C2*M(i)+C4*log10(Ra+C5)+C7*Ra-I);
w=double(A);
disp(M(i));
disp(w);
%disp(w);
AA(i,:)=w;
end
%C1+C2*4.9+C4*log(-20.4938824813262+C5)+C7*(-20.4938824813262)-5