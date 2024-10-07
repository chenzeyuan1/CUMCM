function [theta,co] = abs2angle(pointA,pointO,pointB)
%%%A在左侧,O在中间,B在右侧,二维行向量

a = pointA - pointO;
b = pointB - pointO;
co = a*b'/(norm(a)*norm(b));
co = abs(co);
theta = acos(co);
% theta = abs(theta);