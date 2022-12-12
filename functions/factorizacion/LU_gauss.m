function [L, U] = LU_gauss(A)
  n = length(A(1, :));
  m = length(A(:, 1));

  if n != m
    print("La matriz debe de ser cuadrada");
    return;
  endif

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
