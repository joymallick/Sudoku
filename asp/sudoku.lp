% Please insert the names and email addresses of the group members:
% Joy Mallick Md Nazmul     joy.md@uni-potsdam.de   
%

subgrid_size(3).



num(1..9).

% numbers in the question need to be present
:- initial(X,Y,N), not sudoku(X,Y,N).

%one integer allowed in a row
{ sudoku(X,Y,N) : num(X) } = 1 :- num(N), num(Y).

%one integer allowed in a column
{ sudoku(X,Y,N) : num(Y) } = 1 :- num(X), num(N).

% only one integer allowed per cell, 
{ sudoku(X,Y,N) : num(N) } = 1 :- num(X), num(Y).

% assign the cells to subgrids
subgrid((((X-1)/S)*S + (Y-1)/S),X,Y) :- subgrid_size(S), num(X), num(Y).

% one integer allowed in subgrid
:- sudoku(X,Y,N), sudoku(X',Y',N), subgrid(S,X,Y), subgrid(S,X',Y'), X != X', Y != Y'.

#show sudoku/3.
