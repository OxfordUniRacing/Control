close all

set(groot,'defaultfigureposition',[400 150 1300 750])

alpha = getdatasamples(logsout{16}.Values,[1:length(tscollection(logsout{16}.Values))]);
beta = getdatasamples(logsout{17}.Values,[1:length(tscollection(logsout{17}.Values))]);
gamma = getdatasamples(logsout{18}.Values,[1:length(tscollection(logsout{18}.Values))]);
x0 = getdatasamples(logsout{19}.Values,[1:length(tscollection(logsout{19}.Values))]);
u0 = getdatasamples(logsout{20}.Values,[1:length(tscollection(logsout{20}.Values))]);
Toqrue_data = getdatasamples(logsout{22}.Values,[1:length(tscollection(logsout{22}.Values))]);

x0 = squeeze(x0(1,1,:));
alpha = squeeze(alpha(1,1,:));
beta = squeeze(beta(1,1,:));
gamma = squeeze(gamma(1,1,:));
u0 = squeeze(u0(1,1,:));

x=linspace(0,1,1000);
u = linspace(0,3000,1000);

frame = 1;
figure
for i = 1:10:length(alpha)
    % non linear model
nonlinearfx = -x.*(u0(i)-alpha(i)+beta(i)) + u0(i) - gamma(i);

% linear model
linearfx_x = -x.*(u0(i) - alpha(i) + beta(i)) + u0(i).*(1-x0(i)) - gamma(i);

%current position
currentfx = -x0(i)*(u0(i)-alpha(i)+beta(i)) + u0(i) - gamma(i);

% draw 

plot(x,linearfx_x)
hold on
plot(x,nonlinearfx)
currentfx = -x0(i)*(u0(i)-alpha(i)+beta(i)) + u0(i) - gamma(i);
plot(x0(i),currentfx,'o');
axis([0 1 -100 2000])
drawnow
hold off
pause(0)
disp(i)
end

for i=1:30:length(alpha)
    

[X,U] = meshgrid(x,u);

% non linear model
Fx = -X.*(U-alpha(i)+beta(i)) + U - gamma(i);

% linear model
linearfx = -X.*(u0(i) - alpha(i) + beta(i)) + U.*(1-x0(i));

%current position
currentfx = -x0(i)*(u0(i)-alpha(i)+beta(i)) + u0(i) - gamma(i);

% draw 

surf(X,U,Fx,'FaceColor', [0.5 1.0 0.5], 'EdgeColor', 'none');
hold on
plot3(x0(i),u0(i),currentfx,'ko');
hold on
surf(X,U,linearfx,'FaceColor', [1.0 0.5 0.5], 'EdgeColor', 'none','FaceAlpha',0.5);


fxdiff = Fx - linearfx;
C = contour(X,U,fxdiff,[0 0]);
xL = C(1, 2:end);
uL = C(2, 2:end);

zL = interp2(X,U,Fx,xL,uL);
line(xL, uL, zL, 'Color', 'k', 'LineWidth', 3);

disp(["Slip: ", x0(i), "Timestep: ", i])
%shading interp
xlabel('x');
ylabel('u');
axis([0 1 0 3000 -1000 4000])
M(frame) = getframe;
frame = frame +1;
hold off
drawnow
pause(0)
end