function [newA, newb, perm] = gauss_maximal(A, b)
  n = length(A);

  solution = zeros(n, 0);
  indexes = 1:n;

  for row = 1:n#For throw row
    #Look for max
      max = {row, row};
      for maxRow = row:n
        for maxCol = row:n
          if abs(A(maxRow, maxCol)) > abs(A(max{1}, max{2}))
            max{1} = maxRow;
            max{2} = maxCol;
          endif
        endfor
      endfor

      #Check if max = 0 them continue to next due to no necessary to make 0's
      if A(max{1}, max{2} == 0)
        continue;
      endif

      #Permute row
      if max{1} ~= row
        tmp = A(row, :);
        A(row, :) = A(max{1}, :);
        A(max{1}, :) = tmp;

        tmp = b(row);
        b(row) = b(max{1});
        b(max{1}) = tmp;
      endif

      #Permute column
      if max{2} != row

        tmp = A(:, row);
        A(:, row) = A(:, max{2});
        A(:, max{2}) = tmp;

        %Refelct column change
        tmp = row;
        indexes(row) = max{2};
        indexes(max{2}) = tmp;
      endif

    for i = row + 1:n #For throw cols to divide throw 'lmb'
      lmd = A(i, row) / A(row, row);
      A(i, row) = 0;

      #Loop to make zero's
      for j = row + 1:n
        A(i, j) = A(i, j) - (lmd * A(row, j));
      endfor

      b(i) = b(i) - (lmd * b(row));
    endfor#Row + 1 use to make 0's
  endfor#Row
  newA = A;
  newb = b;
  perm = indexes;

endfunction
