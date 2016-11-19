clear all; 

c = 3*10.0^8;
f = 2*c;
k = (2*pi*f)/c;

x = [0 0 0];
y = [1 0.5 0.5];

normXY = sqrt((x-y)*(x-y)');

exp(i*k*normXY)/normXY

ondesPlanes(x,y,x,y,k)