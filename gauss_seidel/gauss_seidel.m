B = input("Enter the matrix (The matrix should be augmented matrix): ");
fprintf("Your matrix is :\n");
disp(B);
n = size(B,1);
if n==1
    fprintf("This is row vector \n");
    return;
end;
col=size(B,2);
if col<=2
    fprintf("This matrix does not fit any equation. Maybe you forgot to write the arguments. \n");
    return;
end;
if n~=col-1
    fprintf("This matrix is not square. \n");
    return;
end;
A = zeros(n,col);
for t=1:col-1
check = 0;
   for z=1:n   
   sum1=0;
            for w=1:col-1
                if w==t
                    continue;
                end;
                sum1=sum1 + abs(B(z,w));
            end;     
                  
            if abs(B(z,t)) >= sum1
                A(t,:) = B(z,:);
                check = check +1;
            end;
            if check > 1
                fprintf("This matrix doesnt't have diagonally dominant form.\n");
                return;
            end;
   end; 
    if check == 0
        fprintf("This matrix doesnt't have diagonally dominant form.\n");
        return;
    end;
end;
fprintf("Diagonally dominant form :\n");
disp(A);

x=zeros(1,col-1);
  
fprintf("iter  ");
for s=1:col-1
    fprintf("        x%d          ",s);
end;
fprintf("\n");
i=1; check2=1;
while check2~=x
     check2=x;
       fprintf(" %d  |",i);
       fprintf(" %.15f  |",x);
       fprintf("\n");
    for j=1:col-1
        sum=0;
        for k=1:col-1
            if k==j
                continue;
            end;
            sum=sum + A(j,k)*x(k);
         end;
        
            x(j)=(A(j,col)-sum)/A(j,j);
     
    end;    
i=i+1;
end;   
