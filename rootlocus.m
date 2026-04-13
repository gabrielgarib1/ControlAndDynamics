clear 
clc


% B=[1 0]; % for analysing k<0 just switch B signal
B=[1 9.69];
% A= [1 -1.4 0.4];
A=poly([-2 -3 -.5336]);
disp("Roots of A")
roots(A) %roots of A

disp("Roots of B")
roots(B)
sys=tf(B,A);
rlocus(sys);% S domain and B/A,  A + k . B


%{
%help rlocus
rlocus by default calculate for loop:
--->O---[G]--------->
    |           |
    -----[k]-----
that gives the same result as -->O--[k]--[G]---> in closed loop when analysing stability
does it automatically for k<0
%}
title('Customized Root Locus');

%% arrival points calcularion
da=polyder(A); %polinomium differentiation
db=polyder(B);
disp("Arrival points")
roots(conv(B,da)-conv(A,db))%conv() its for convolution or in this case polinomium multiplication



