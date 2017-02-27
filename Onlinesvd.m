clc;
clear all;
X = 100.*rand(15,10);
a = 100.*rand(15,2);     %Adding two columns%
b = 100.*rand(10,2);     %Adding 2 rows%
b1 = X'*X;    
[v1 sigTemp] = eig(b1);
sig = zeros(size(sigTemp));
for i=1:length(sig)
    sig(i,i) = sqrt(sigTemp(i,i));
end
I = eye(15); 
U = X*v1*sig'*(sig*sig')^-1;
OrthComp = (I - U*U')*a;
P = GramSchmidt(OrthComp);
Ra = P' * OrthComp;
QRb = (eye(10) - v1*v1')*b;
Q = GramSchmidt(QRb);
Rb = Q' * QRb;

r1 = [sig zeros(10,2)];
r2 = [r1 ;zeros(2,12)];

r3 = U'*a ;
r4 = [r3 ;zeros(2,2)];

r5 = v1'*b;
r6 = [r5;zeros(2,2)]';

K = r2 + r4*r6;
[Ut sigma Vt] = svd(K);

St = Ut'*K*Vt;

answer = ([U P]*Ut)*St*([v1 QRb]*Vt)';

final = X + a*b';








