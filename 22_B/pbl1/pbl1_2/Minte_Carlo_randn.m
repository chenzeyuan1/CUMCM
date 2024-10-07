function [p,a1,a2,a3,xm,ym] =  Minte_Carlo_randn(m,n)
min_r = 10.741884202179357;
% min_r = 7;
R = 100;
x0 = R*cos(2*pi/9 *(m-1));
y0 = R*sin(2*pi/9 *(m-1));
dr = randn;
while dr<0||dr>1
    dr = randn;
end
xm = min_r * dr + x0;
ym = min_r * dr + y0;
pointM = [xm,ym];
point0 = [0,0];
pointA = [100,0];
xN = R*cos(2*pi/9 *(n-1));
yN = R*sin(2*pi/9 *(n-1));
pointN = [xN,yN];
a1 = abs2angle(point0,pointM,pointA);
a2 = abs2angle(point0,pointM,pointN);
a3 = abs2angle(pointA,pointM,pointN);
if a2 < 4*pi/9
    p = 0;
    if a2 < 3*pi/9
        p = 1;
        if a2 < 2*pi/9
            p = 2;
            if a2 < 1*pi/9
                p = 3;
                if a2<0
                    disp("错错错")
                end
            end
        end
    end
else
    p = 0;
end

end
