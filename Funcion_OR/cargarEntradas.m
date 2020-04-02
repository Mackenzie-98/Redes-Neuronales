function matrizEntrada=cargarEntradas(dominio)

if dominio=='s'
    
    maxDivisiones=100;
    muestras=20;
    matrizEntrada=zeros(maxDivisiones*muestras,3);
    matrizEntrada(:,1)=definirIntervalos(0,2*pi,muestras,maxDivisiones);
    matrizEntrada(:,2)=definirIntervalos(0,2*pi,muestras,maxDivisiones);
    matrizEntrada(:,3)=definirIntervalos(-1,1,muestras,maxDivisiones);
    
end

if dominio=='2z'
    matrizEntrada=[ 0,0;
                    0,1;
                    1,0;
                    1,1]; 
end
if dominio=='2m'
    matrizEntrada=[-1,-1;
                    -1,1;
                    1,-1;
                    1,1];
end

if dominio=='4z'
    matrizEntrada=[0 0 0 0;
                   0 0 0 1;
                   0 0 1 0;
                   0 0 1 1;
                   0 1 0 0;
                   0 1 0 1;
                   0 1 1 0;
                   0 1 1 1;
                   1 0 0 0;
                   1 0 0 1;
                   1 0 1 0;
                   1 0 1 1;
                   1 1 0 0;
                   1 1 0 1;
                   1 1 1 0;
                   1 1 1 1];
end

if dominio=='4m'
    matrizEntrada=[-1 -1 -1 -1;
                   -1 -1 -1 1;
                   -1 -1 1 -1;
                   -1 -1 1 1;
                   -1 1 -1 -1;
                   -1 1 -1 1;
                   -1 1 1 -1;
                   -1 1 1 1;
                   1 -1 -1 -1;
                   1 -1 -1 1;
                   1 -1 1 -1;
                   1 -1 1 1;
                   1 1 -1 -1;
                   1 1 -1 1;
                   1 1 1 -1;
                   1 1 1 1];
end

I=ones(length(matrizEntrada),1);           %Agregado de entrada fija en 1
matrizEntrada=horzcat(matrizEntrada,I);   
