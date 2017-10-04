function data=calc_fun(a,b,l,t,c)
tempa=(sin(a)*sin(b)+cos(a)*cos(b)*cos((abs(c*180/pi-116))*pi/180+15*t*pi/180))^2;
tempb=sqrt(1-tempa);
tempc=sin(a)*sin(b)+cos(a)*cos(b)*cos((abs(c*180/pi-116))*pi/180+15*t*pi/180);
data=l*tempb/tempc;
if data<0
    data=0-data;
end