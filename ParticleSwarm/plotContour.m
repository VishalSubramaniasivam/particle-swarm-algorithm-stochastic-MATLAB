function plotContour()

a=0.01;

x1 = linspace(-5,5,1000);
x2 = x1';
x3 = log(a+ (((x1.^2)+x2-11).^2 + (x1+(x2.^2)-7).^2));

x_point = [3 3.584428340330492 -2.805118086952745 -3.77931025337775];
y_point = [2 -1.848126526964404 3.131312518250573 -3.28318599128617];

figure()
contour(x1,x2,x3,40)
hold on
plot(x_point,y_point,'kh','MarkerSize', 20)
hold on
plot(x_point,y_point,'k*','MarkerSize', 20)
colormap('jet')
hold off
title('Contour plot of function with minima','FontSize', 18)

end