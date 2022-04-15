% initial functions
f1 = @(u,v,a) (u^2 - 2*v^2 - a^2);
f2 = @(u,v,a) (u+v-2);
f3 = @(u,v,a) (a^2 - 2*a - u);
% derivatives of function f1
fdu1=@(u,v,a) (2*u);
fdv1=@(u,v,a) (-4*v);
fda1=@(u,v,a) (-2*a);
% derivatives of function f2
fdu2=@(u,v,a) (1);
fdv2=@(u,v,a) (1);
fda2=@(u,v,a) (0);
% derivatives of function f3
fdu3=@(u,v,a) (-1);
fdv3=@(u,v,a) (0);
fda3=@(u,v,a) (2*a -2);
x=[3;4;1];
f=[f1(x(1),x(2),x(3));f2(x(1),x(2),x(3));f3(x(1),x(2),x(3))];
inc = input("Enter the required iteration step to update Jacobian matrix : ");
J=[fdu1(x(1),x(2),x(3)) fdv1(x(1),x(2),x(3)) fda1(x(1),x(2),x(3));fdu2(x(1),x(2),x(3)) fdv2(x(1),x(2),x(3)) fda2(x(1),x(2),x(3));fdu3(x(1),x(2),x(3)) fdv3(x(1),x(2),x(3)) fda3(x(1),x(2),x(3))];
k=0;
i=0;
temp = -1;
while temp~=f(1)
    if i==k
        J=[fdu1(x(1),x(2),x(3)) fdv1(x(1),x(2),x(3)) fda1(x(1),x(2),x(3));fdu2(x(1),x(2),x(3)) fdv2(x(1),x(2),x(3)) fda2(x(1),x(2),x(3));fdu3(x(1),x(2),x(3)) fdv3(x(1),x(2),x(3)) fda3(x(1),x(2),x(3))];
        J = inv(J);
        k=k+inc; 
    end;
    x = x - J*f;
    temp=f(1);
    f=[f1(x(1),x(2),x(3));f2(x(1),x(2),x(3));f3(x(1),x(2),x(3))];
    i=i+1;
end;
fprintf("Total iteration :");
disp(i);
fprintf("u :");
disp(x(1));
fprintf("v :");
disp(x(2));
fprintf("a :");
disp(x(3));

