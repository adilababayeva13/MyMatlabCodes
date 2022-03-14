A = input("Enter the matrix : ");
fprintf("Your matrix is :\n");
disp(A);
n = size(A,1);
if n==1
    fprintf("This is row vector, there is no row echelon form :( \n");
    return;
end;
col=size(A,2);
if col<=2
    fprintf("This matrix does not fit any equation. Maybe you forgot to write the arguments. \n");
    return;
end;
B=A(:,1:col-1);
[maxValue, linearIndexesOfMaxes] = max(B(:));
[rowsOfMaxes colsOfMaxes] = find(B == maxValue);
colOfMax=colsOfMaxes(1);
if colOfMax~=1
    v = A(:, 1);
    A(:, 1) = A(:,colOfMax );
    A(:, colOfMax) = v;
    fprintf("1.column and %d. column swaped. \n",colOfMax);
    disp(A);
end;
A = sortrows(A,'descend');
fprintf("Rows of the matrix are sorted by descending order\n");
disp(A);
i=1;k=1;
while A(i,1)==0
  row=A(i+1,:);
  i=i+1;
end;
while A(k,1)==0
    A(k,:)=A(k,:)+row;
    k=k+1;
end; 
A = sortrows(A);
if col>n
    for l=1:n
        s=l;
        y=A(l,l);
        while A(l,s)==0
            y=A(l,s+1);
            s=s+1;
        end;
        A(l,:)=A(l,:)./y;
        for j=l+1:n
            x=A(j,l);
            A(j,:)=A(j,:)-A(l,:)*x;
        end;
    end;
else
    for l=1:col
        s=l;
        y=A(l,l);
        while A(l,s)==0
            y=A(l,s+1);
            s=s+1;
        end;
        A(l,:)=A(l,:)./y;
        for j=l+1:n
            x=A(j,l);
            A(j,:)=A(j,:)-A(l,:)*x;
        end;
    end;
end;
if col==1
    fprintf("Answer :\n ");
    disp(A);
    return;
end;
fprintf("Row Echelon Form : \n");
 disp(A);
for l=2:n
        s=l;
        y=A(l,l);
        while A(l,s)==0
            y=A(l,s+1);
            s=s+1;
        end;
        for j=1:l-1
          A(j,:)=A(j,:)-A(j,s)*A(l,:);
        end;
 end;
 fprintf("Reduced Row Echelon Form : \n");
 disp(A);
 
 % Check the solution of the system
 check_sol = true;
 for q=1:n
     t=1;
     if A(q,col)~=0
         while (A(q,t)==0)&&(t<col)
             if t==col-1
                 disp("System has no solution.");
                 ckeck_sol=false;
                 break;
             end;
             
             
             t=t+1;
         end;
     end;
 end;
if check_sol 
  if col-n>1
      disp("The system has entire solution.");
  else
    disp("The system has unique solution.");
  end;
end;
