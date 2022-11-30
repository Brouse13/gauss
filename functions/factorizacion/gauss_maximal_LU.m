function [L, U, P, Q] = gauss_maximal_LU(A)
  n = length(A(1, :));
  m = length(A(:, 1));

  if n != m
    print("La matriz debe de ser cuadrada");
    return;
  endif

  L = zeros(n);
  U = A;
  P = eye(n);
  Q = eye(n);

  for k = 1:n#For throw k
    #Look for max
      max = {k, k};
      for maxRow = k:n
        for maxCol = k:n
          if abs(U(maxRow, maxCol)) > abs(U(max{1}, max{2}))
            max{1} = maxRow;
            max{2} = maxCol;
          endif
        endfor
      endfor

      #Check if max = 0 them continue to next due to no necessary to make 0's
      if U(max{1}, max{2} == 0)
        continue;
      endif

      #Permute k
      if max{1} ~= k
        tmp = U(k, :);
        U(k, :) = U(max{1}, :);
        U(max{1}, :) = tmp;

        tmp = L(k, :);
        L(k, :) = L(max{1}, :);
        L(max{1}, :) = tmp;

        tmp = P(k, :);
        P(k, :) = P(max{1}, :);
        P(max{1}, :) = tmp;
      endif

      #Permute column
      if max{2} != k
        tmp = U(:, k);
        U(:, k) = U(:, max{2});
        U(:, max{2}) = tmp;

        tmp = L(:, k);
        L(:, k) = L(:, max{2});
        L(:, max{2}) = tmp;

        %Refelct column change
        tmp = Q(:, k);
        Q(:, k) = Q(:, max{2});
        Q(:, max{2}) = tmp;
      endif

    for i = k + 1:n #For throw cols to divide throw 'lmb'
      L(i, k) = U(i, k) / U(k, k);
      U(i, k) = 0;

      #Loop to make zero's
      for j = k + 1:n
        U(i, j) = U(i, j) - (L(i, k) * U(k, j));
      endfor
    endfor#Row + 1 use to make 0's
  endfor#Row

  %Make identity on L
  L += eye(n);
endfunction
