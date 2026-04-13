function[ua]=sat(u)
umax=0.4;
umin=-0.4;
if u>umax
    ua=umax;
elseif u<umin
    ua=umin;
else
    ua=u;
end
end