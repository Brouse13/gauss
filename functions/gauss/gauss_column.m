function [newA, newB] = gauss_column(A, b)
  n = length(A);

  solution = zeros(n, 0);

  for row = 1:n#For throw row
    #Look for max
      max = row;
      for maxRow = row + 1:n
        if abs(A(maxRow, row)) > abs(A(max, row))
          max = maxRow;
        endif
      endfor

      #Check if max = 0 them continue to next due to no necessary to make 0's
      if A(max, row == 0)
        continue;
      endif

      #Permute row
      if max ~= row
        tmp = A(row, :);
        A(row, :) = A(max, :);
        A(max, :) = tmp;

        tmp = b(row);
        b(row) = b(max);
        b(max) = tmp;
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
  newB = b;

endfunction
