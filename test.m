clear all

A = [1, 2, 3, 5;
     4, 5, 6, 5;
     7, 8, -4, 5;
     0, 1, -1, 9];
b = [0; 1; 2; 3];

[newA, newB] = gauss_solver(A,b);
newA
sol1 = upper_triangular_solver(newA, newB);

sol2 = gauss_column(A, b)

%sol3 = gauss_maximal(A, b)
