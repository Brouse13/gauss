function solution = gauss_column(A, b)
  n = length(A);

  solution = zeros(n, 0);

  for k = 1:n - 1#For thk k
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

      #Permute k
      tmp = A(k, :);
      A(k, :) = A(max, :);
      A(max, :) = tmp;

      tmp = b(k);
      b(k) = b(max);
      b(max) = tmp;

    for i = k + 1:n
      m = A(i, k) / A(k, k);

      #Loop to make zero's
      for j = k:n
        A(i, j) = A(i, j) - (m * A(k, j));
      endfor

      b(i) = b(i) - (m * b(k));
    endfor#k + 1 use to make 0's
  endfor#k

  solution = upper_triangular_solver(A, b);

endfunction
