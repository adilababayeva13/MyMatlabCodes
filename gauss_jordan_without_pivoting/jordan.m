A = input("Enter the matrix (The matrix should be augmented matrix): ");
fprintf("Your matrix is :\n");
disp(A);
n = size(A,1);
if n == 1
    fprintf("This is row vector \n");
    return;
end;
col=size(A,2);
if col<=2
    fprintf("This matrix does not fit any equation. Maybe you forgot to write the arguments. \n");
    return;
end;

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
 


