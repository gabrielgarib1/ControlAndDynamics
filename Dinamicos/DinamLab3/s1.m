
t=out.y2(:,1);
x1=out.y2(:,2);
x2=out.y2(:,3);

x3=out.y4(:,2);
x4=out.y4(:,3);

x5=out.y6(:,2);
x6=out.y6(:,3);

x7=out.y8(:,2);
x8=out.y8(:,3);

x9=out.y10(:,2);
x10=out.y10(:,3);

x11=out.y12(:,2);
x12=out.y12(:,3);

figure;

plot(x1,x2)

hold;
plot(x3,x4)
plot(x5,x6)
plot(x7,x8)
plot(x9,x10)
plot(x11,x12)
legend('yr=2', 'yr=4', 'yr=6', 'yr=8', 'yr=10', 'yr=12');
xlabel('x1')
ylabel('x2')
grid
% figure;
% plot(t,x1,t,x2)
% legend('x1','x2')