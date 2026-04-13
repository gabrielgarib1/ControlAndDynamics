function dxdt = funDinCar (l,m,b,g,x,Q)
  xc = x(1);
  xc_d = x(2);
  zc = x(3);
  zc_d = x(4);
  
  lambda = -(m/(2*(l^2)))*(g*zc + (xc_d^2) + zc_d^2);
  
  dx1dt = xc_d;
  dx2dt = (Q*zc/(l^2) - b*xc_d/(l^2) + 2*xc*lambda)/m;
  dx3dt = zc_d;
  dx4dt = (m*g - Q*xc/(l^2) - b*zc_d/(l^2) + 2*zc*lambda)/m;
  
  dxdt = [dx1dt;dx2dt;dx3dt;dx4dt];
end