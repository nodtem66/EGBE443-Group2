function mask = createDonut(radius1,radius2)
if radius1>radius2
    r1 = radius1;
    r2 = radius2;
else
    r1 = radius2;
<<<<<<< HEAD
    r2 = radius1;
=======
    r2 = raduis1;
>>>>>>> 7d39bbeda2ac56d4221ac9f9e38a5baf59761e6e
end
m1 = createCircle(r1);
m2 = createCircle(r2);
p1 = size(m1);
p2 = size(m2);
pad = (p1(1)-p2(1))/2;
m2 = padarray(m2,[pad pad]);
mask = m1-m2;



