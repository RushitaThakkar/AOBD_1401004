function[B] = GramSchmidt(A)
[m,n] = size(A);
[U, jb] = rref(A);
x = length(jb); 
B = zeros(m,x);
for i = 1:x
   C(:,i)= A(:,(jb(i))); 
end
B=C;
for i = 2:x
    for j = 1:i-1
    B(:,i) = B(:,i)- dot(C(:,i),B(:,j))/dot(B(:,j),B(:,j))* B(:,j) ;
    end
end
end