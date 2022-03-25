A = input("Enter the matrix (The matrix should be augmented matrix): ");
fprintf("Your matrix is :\n");
disp(A);
n = size(A,1);
if n==1
    fprintf("This is row vector \n");
    return;
end;
col=size(A,2);
if col<=2
    fprintf("This matrix does not fit any equation. Maybe you forgot to write the arguments. \n");
    return;
end;
if col-1>n
    fprintf("This system has infinite solutions");
    return;
end;
iteration = input("Enter the number of iteration : ");
x=zeros(1,col-1);
  
fprintf("iter  ");
for s=1:col-1
    fprintf("    x%d    ",s);
end;
fprintf("\n");
for i=1:iteration
       fprintf(" %d  |",i);
       fprintf(" %f  |",x);
       fprintf("\n");
    for j=1:col-1
        sum=0;
        for k=1:col-1
            if k==j
                continue;
            end;
            sum=sum + A(j,k)*x(k);
         end;
        
        if A(j,j) ~= 0
            
            x(j)=(A(j,col)-sum)/A(j,j);
         
        end;  
    end;    

end;   
