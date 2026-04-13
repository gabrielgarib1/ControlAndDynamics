
close
t=out.tout(:);
x1=out.spacestate(:,1);
x2=out.spacestate(:,2);
x3=out.spacestate(:,3);

x11=out.spacestate1(:,1);
x21=out.spacestate1(:,2);
x31=out.spacestate1(:,3);

x12=out.spacestate2(:,1);
x22=out.spacestate2(:,2);
x32=out.spacestate2(:,3);

% x13=out.spacestate3(:,1);
% x23=out.spacestate3(:,2);
% x33=out.spacestate3(:,3);


figure;

plot3(x1,x2,x3)
hold;
plot3(x11,x21,x31)

plot3(x12,x22,x32)

% plot3(x13,x23,x33)



legend('yr=1', 'yr=4', 'yr=8', 'yr=3.5');
xlabel('x1')
ylabel('x2')
zlabel('x3')


% xlim([-4 8])
% ylim([-5 4])
% zlim([-2.5 2.5])

grid
% axis([0 4 -1 2 -1.5 1.5])
% figure;
% plot(t,x1,t,x2)
% legend('x1','x2')