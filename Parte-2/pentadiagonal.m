function A=pentadiagonal(m,a,b,c,d,e)
  if(m<5)
    printf("Error: El vector m debe ser igual o mayor a 5")
  elseif(length(a) != m)
    printf("Error: El vector a debe tener un tamaño m x 1")
  elseif(length(b) != m-1)
    printf("Error: Los vectores b y c deben tener un tamaño (m-1) x 1")
  elseif(length(d) != m-2)
    printf("Error: Los vectores d y e deben tener un tamaño (m-2) x 1")
  else
    %Incializa la matriz
    A=zeros(m);
    %Primera fila
    A(1,1)=a(1); A(1,2)=c(1); A(1,3)=e(1);
    %Segunda fila
    A(2,1)=b(1);A(2,2)=a(2); A(2,3)=c(2); A(2,4)=e(2);
    %Penultima fila
    A(m-1,m)=c(end);A(m-1,m-1)=a(end-1); A(m-1,m-2)=b(end-1); A(m-1,m-3)=d(end-1);
    %Ultima fila
    A(m,m)=a(end); A(m,m-1)=b(end); A(m,m-2)=d(end);
    %Otras filas
    for i=3:m-2
      A(i,i-2)=d(i);A(i,i-1)=b(i-1);A(i,i)=a(i);A(i,i+1)=c(i+1);A(i,i+2)=e(i);
    end
end
