function solution = lower_triangular_solver (A, b)
  size_b = length(b);
  solution = zeros(size_b, 1);

  solution(1,1) = b(1,1)/A(1,1);
  for i=2:size_b
    N = b(i,1);
    for j=1:i-1
      N = N - A(i,j)*solution(j,1);
    endfor
    solution(i,1) = N / A(i,i);
  endfor
endfunction
