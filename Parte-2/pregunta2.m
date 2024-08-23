clc;
#Tamaño de la matriz
m = 500
#Se definen los vectores que componene la matriz
a = 1:m
b =[];
for i=1:m-1
  b=[b (i+1)/3];
end
c =[];
for i=1:m-1
  c=[c -i/3];
end
d =[];
for i=1:m-2
  d=[d (i+2)/2];
end
e =[];
for i=1:m-2
  e=[e -i/2];
end
h = zeros(m, 1);
for i = 1:m
    h(i) = 1;
end
#Se crea la matriz pentadiagonal
A=pentadiagonal(m,a,b,c,d,e)

h

#Se resuelve la matriz
resultado = inv(A)*h


