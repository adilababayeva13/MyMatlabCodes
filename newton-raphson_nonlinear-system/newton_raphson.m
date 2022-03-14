function y = newton_raphson(funcs,initial,J,iter)
    funcs = input("Enter functions as column vector (parameters: x1,x2,x3,x4,x5...) : ");
    J = input("Enter differentials of the functions as matrix (Jacobian): ");
    initial=input("Enter initial values as column vector: ");
    iter=input("The number of iteration :");
    col=size(initial,2);
    for i=1:col
      eval(sprintf('x%d = initial(i)', i));
    end;
end;

