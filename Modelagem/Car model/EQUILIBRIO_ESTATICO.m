function ret = EQUILIBRIO_ESTATICO(F,b,v,m,g,alpha,c)


ret = F - b*v -m*g*sin(alpha) - c*v^2;
end