A = input("Enter the matrix : ");
fprintf("Your matrix is :\n");
disp(A);
n = size(A,1);
if n==1
    fprintf("This is row vector, there is no row echelon form :( \n");
    return;
end;
col=size(A,2);
A = sortrows(A,'descend');
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
fprintf("Answer :\n");
disp(A);

