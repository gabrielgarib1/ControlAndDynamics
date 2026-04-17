clear 
clc


% Define the system of equations
function Fun = myEquations(x)
    ca = x(1);
    T = x(2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
F = 1;
V = 1;
R = 1.985875;
DH = -5960;
E = 11843;
k0 = 34903800;
roCp = 500;
UA = 150;
caf0=10;
tf0=300;
tc0=292;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    a=F/V;
    b=DH/roCp;
    c=UA/roCp/V;
    r=k0*exp(-E/R/T);
    Fun(1) = a*(caf0-ca)-r;
    Fun(2)=a*(tf0-T)-b*r-c*(T-tc0);
end

% Initial guess
x0 = [5; 200];

% Solve the system of equations
solution = fsolve(@myEquations, x0);
disp(solution);