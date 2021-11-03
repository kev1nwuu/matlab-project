#Solar system
clc
clear
# Earth = 1
M1 = 5.972e24; # kg
X1 = 1e11;
Y1 = 2e11;
a1x = 0;
a1y = 0;

# Mars = 2
M2 = 6.39e23; #kg
X2 = 1e10;
Y2 = -8e11;
a2x = 0;
a2y = 0;

# uranus = 3
M3 = 8.681e25; #kg
X3 = -1e12;
Y3 = 9e11;
a3x = 0;
a3y = 0;

# sun = 4
M4 = 1.989e30; # kg
X4 = 0;
Y4 = 0;
a4x = 0;
a4y = 0;
V4ix = 0;
V4iy = 0;

X14 = -1/(X1-X4);  # The speed at which the earth revolves around the sun (m/s)
Y14 = -1/(Y1 - Y4);
theta14i = atan(X14/Y14);
V1ix = 30000*cos(theta14i);  
V1iy = 30000*sin(theta14i);

X24 = X2 - X4; # The speed at which the mars revolves around the sun (m/s)
Y24 = Y2 - Y4;
theta24i = atan(X24/Y24);
V2ix = 24000 *cos(theta24i);
V2iy = 24000 *sin(theta24i);

X34 = X3 - X4; # The speed at which the uruns revolves around the sun (m/s)!!!!!!
Y34 = Y3 - Y4;
theta34i = atan(X34/Y34);
V3ix = 24607 * cos(theta34i);
V3iy = 24607 * sin(theta34i);





G = 6.67408e-11; #gravitational constant
t = 0;

figure
grid on
plot(X1*1e-10,Y1*1e-10,'b','markersize',15)
hold on
plot(X2*1e-10,Y3*1e-10,'y','markersize',15)
plot(X3*1e-10,Y3*1e-10,'k','markersize',15)
plot(X4*1e-10,Y4*1e-10,'r','markersize',30)
hold off

xlim([-200 200])
ylim([-200 200])

tresult = [];
Ft1 = [];
Ft2 = [];
Ft3 = [];




while true 
  # Earth
  X12 = X2 - X1; # with mars 
  Y12 = Y2 - Y1; 
  R12 = sqrt((X12^2) + (Y12^2));
  theta12 = atan(X12/Y12);
  F12 = (G*M1*M2)/(R12^2);
  F12x = (X12/abs(X12))*F12 * cos(theta12); 
  F12y = (Y12/abs(Y12))*F12 * sin(theta12);

  X13 = X3 - X1; # with uranus 
  Y13 = Y3 - Y1; 
  R13 = sqrt((X13^2) + (Y13^2));
  theta13 = atan(Y13/X13);
  F13 = (G*M1*M3)/(R13^2);
  F13x = (X13/abs(X13))*F13 * cos(theta13); 
  F13y = (Y13/abs(Y13))*F13 * sin(theta13);
  
  X14 = X4 - X1; # with sun 
  Y14 = Y4 - Y1; 
  R14 = sqrt((X14^2) + (Y14^2));
  theta14 = atan(X14/Y14);
  F14 = (G*M1*M4)/(R14^2);
  F14x = (X14/abs(X14))*F14 * cos(theta14);
  F14y = (Y14/abs(Y14))*F14 * sin(theta14);
  
  Fsumx_earth = F13x + F12x + F14x;
  Fsumy_earth = F13y + F12y + F14y;

  V1ix = V1ix + t*(Fsumx_earth) / M1;
  V1iy = V1iy + t*(Fsumy_earth) / M1;
  
  X1 = X1 + t*V1ix;
  Y1 = Y1 + t*V1iy;

  # Mars
  X21 = X1 - X2; # with Earth
  Y21 = Y1 - Y2; 
  R21 = sqrt((X21^2) + (Y21^2));
  theta21 = atan(Y21/X21);
  F21 = (G*M1*M2)/(R21^2);
  F21x = (X21/abs(X21))*F21 * cos(theta21); 
  F21y = (Y21/abs(Y21))*F21 * sin(theta21);
  
  X23 = X3 - X2; # with uranus 
  Y23 = Y3 - Y2; 
  R23 = sqrt((X23^2) + (Y23^2));
  theta23 = atan(Y23/X23);
  F23 = (G*M2*M3)/(R23^2);
  F23x = (X23/abs(X23))*F23 * cos(theta23); 
  F23y = (Y23/abs(Y23))*F23 * sin(theta23);
  
  
  X24 = X4 - X2; # with sun 
  Y24 = Y4 - Y2; 
  R24 = sqrt((X24^2) + (Y24^2));
  theta24 = atan(Y24/X24);
  F24 = (G*M2*M4)/(R24^2);
  F24x = (X24/abs(X24))*F24 * cos(theta24); 
  F24y = (Y24/abs(Y24))*F24 * sin(theta24);
  
  
  Fsumx_mars = F21x + F23x + F24x;
  Fsumy_mars = F21y + F23y + F24y;

  V2ix = V2ix + t*(Fsumx_mars) / M2;
  V2iy = V2iy + t*(Fsumy_mars) / M2;
  
  X2 = X2 + t*V2ix;
  Y2 = Y2 + t*V2iy;
  
  
  
  # uranus
  X31 = X1 - X3; # with Earth
  Y31 = Y1 - Y3; 
  R31 = sqrt((X31^2) + (Y31^2));
  theta = atan(Y31/X31);
  F31 = (G*M1*M3)/(R31^2);
  F31x = (X31/abs(X31))*F31 * cos(theta); 
  F31y = (Y31/abs(Y31))*F31 * sin(theta);
  
  X32 = X2 - X3; # with mars
  Y32 = Y2 - Y3; 
  R32 = sqrt((X32^2) + (Y32^2));
  theta32 = atan(X32/Y32);
  F32 = (G*M2*M3)/(R32^2);
  F32x = (X32/abs(X32))*F32 * cos(theta32); 
  F32y = (Y32/abs(Y32))*F32 * sin(theta32);
  
  X34 = X4 - X3; # with sun 
  Y34 = Y4 - Y3; 
  R34 = sqrt((X34^2) + (Y34^2));
  theta34 = atan(X34/Y34);
  F34 = (G*M3*M4)/(R34^2);
  F34x = (X34/abs(X34))*F34 * cos(theta34); 
  F34y = (Y34/abs(Y34))*F34 * sin(theta34);
  
  Fsumx_uruns = F31x + F32x + F34x;
  Fsumy_uruns = F31y + F32y + F34y;

  V3ix = V3ix + t*(Fsumx_uruns) / M3;
  V3iy = V3iy + t*(Fsumy_uruns) / M3;
  
  X3 = X3 + t*V3ix;
  Y3 = Y3 + t*V3iy;
  
tresult(end + 1) = t;
Ft1(end + 1) = sqrt((Fsumx_earth)^2 +(Fsumy_earth)^2);
Ft2(end + 1) = sqrt((Fsumx_mars)^2  +(Fsumy_mars)^2);
Ft3(end + 1) = sqrt((Fsumx_uruns)^2  +(Fsumy_uruns)^2);  
  
  if mod(t,30) == 0
    
    plot(X1*1e-10,Y1*1e-10,'b','markersize',15)

    hold on

    plot(X2*1e-10,Y2*1e-10,'y','markersize',15)
    plot(X3*1e-10,Y3*1e-10,'k','markersize',15)
    plot(X4*1e-10,Y4*1e-10,'r','markersize',20)
    hold off
  
    grid on
    xlim([-100 100])
    ylim([-100 100])
    pause(1/150)
 endif



if t == 5000
  figure
  subplot(2,2,1)
  plot(tresult,Ft1)
  title('t vs Fearth')
  
  subplot(2,2,2)
  plot(tresult,Ft2)
  title('t vs Fmars')
  
  subplot(2,2,3)
  plot(tresult,Ft3)
  title('t vs Furuns')
  
  break
endif
  
  

  
  t += 1;
  
endwhile