function [L, U, P] = LU_column(A)
  n = length(A(1, :));
  m = length(A(:, 1));

  if n != m
    print("La matriz debe de ser cuadrada");
    return;
  endif

  U = A;
  L = zeros(n);
  P = eye(n);

  for k = 1:n-1#For the row
    #Look for max
      max = k;
      for i = k + 1:n
        if abs(U(i, k)) > abs(U(max, k))
          max = i;
        endif
      endfor

      #Check if max = 0 them continue to next due to no necessary to make 0's
      if U(max, k == 0)
        continue;
      endif

      #Permute rows
      if max ~= k
        tmp = U(k, :);
        U(k, :) = U(max, :);
        U(max, :) = tmp;

        tmp = L(k, :);
        L(k, :) = L(max, :);
        L(max, :) = tmp;

        tmp = P(k, :);
        P(k, :) = P(max, :);
        P(max, :) = tmp;
      endif

    for i = k + 1:n #For thk cols to divide thk 'lmb'
      L(i, k) = U(i, k) / U(k, k);
      U(i, k) = 0;

      #Loop to make zero's
      for j = k + 1:n
        U(i, j) = U(i, j) - L(i, k) * U(k, j);
      endfor

    endfor#k + 1 use to make 0's
  endfor#k

  #Make identity on L
  L += eye(n);
endfunction
