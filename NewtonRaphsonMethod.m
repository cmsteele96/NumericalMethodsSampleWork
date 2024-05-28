%% This script solves the Newton Raphson method
format long

%% Input Parameters
fun= @(x) sin(7*x) + cos(4*x) + x;
fprime= @(x)  7*cos(7*x) - 4*sin(4*x) + 1;
x0=0.28; %initial guess
counter=0;
xerror=1;
xvalue = [];
%% Newton Raphson Method
while xerror > 10^-6 && counter <99
    x = x0 - fun(x0)/fprime(x0);
    xerror = (x-x0)/x;
    counter = counter+1;
    x0 = x;
    xn(counter,1)= x; 
    xvalue = [x, xvalue];
    
end
xvalues = unique(xvalue); %xvalue at each iteration
xvalues = flip(xvalues); %puts xvalues in order of iteration
xvalues = round(xvalues, 6) %rounds to 6 decimals
iterations = sum(counter) %number of iterations required to converge
root = xn(end, 1); 
root = round(root,6) %rounds to 6 decimals

%% Error Plot
y=abs(root-xn); %iteration error
plot(y)
set(gca,'Yscale', 'log')
xlabel('Iteration Count')
ylabel('Iteration Error')

