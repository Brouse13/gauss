function [L, U, P] = gauss_column_LU(A)
  n = length(A);

  solution = zeros(n, 0);
  L = zeros(n, 0);
  P = eye(n);

  for k = 1:n#For the row
    #Look for max
      max = k;
      for i = k + 1:n
        if abs(A(i, k)) > abs(A(max, k))
          max = i;
        endif
      endfor

      #Check if max = 0 them continue to next due to no necessary to make 0's
      if A(max, k == 0)
        continue;
      endif

      #Permute rows
      if max ~= k
        tmp = A(k, :);
        A(k, :) = A(max, :);
        A(max, :) = tmp;

        tmp = L(k, :);
        L(k, :) = L(max, :);
        L(max, :) = tmp

        tmp = P(k, :);
        P(k, :) = P(max, :);
        P(max, :) = tmp
      endif

    for i = k + 1:n #For thk cols to divide thk 'lmb'
      m = A(i, k) / A(k, k);
      A(i, k) = 0;
      L(i, k) = m;

      #Loop to make zero's
      for j = k + 1:n
        A(i, j) = A(i, j) - (m * A(k, j));
      endfor

    endfor#k + 1 use to make 0's
  endfor#k

  %Make identity on L
  for i = 1 : n
    L(i, i) = 1;
  endfor

  U = A;

endfunction
