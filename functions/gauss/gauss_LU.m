function [L, U] = gauss_LU(A)
 n = length(A);
 L = zeros(n, 0);

 for k = 1 : n - 1
  for i = k + 1 : n
    m = A(i,k) / A(k,k)
    A(i,k) = 0;
    L(i, k) = m;

    for j = k + 1:n
      A(i,j) = A(i,j) - m * A(k,j);
    endfor
  endfor
 endfor

 %Make identity on L
 for i = 1 : n
   L(i, i) = 1;
 endfor

 U = A;
endfunction
