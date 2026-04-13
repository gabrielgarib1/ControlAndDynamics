function dxdt = funDin (l,m,b,g,x,Q)
  theta = x(1);
  theta_d = x(2);
  
  dx1dt = theta_d;
  dx2dt = (Q - b*theta_d - m*g*l*sin(theta))/(m*(l^2));
  
  dxdt = [dx1dt; dx2dt];
end
