function [X0]=upper_triangular_solver(A,b)
 n=length(b);
 X0 = zeros(n, 1);

 X0(n, 1)=b(n)/A(n,n);
 for i=n-1:-1:1
    S=b(i);
    for j=i+1:n
       S=S-A(i,j)*X0(j);
    endfor
    X0(i, 1)=S/A(i,i);
 endfor
endfunction
