function plotAND(matrizEntrada,dominio)
N=size(matrizEntrada,1); 
for i=1:N
    entrada=matrizEntrada(i,:); %entrada aleatoria
    yd=funcion_deseada(entrada,dominio);
    hold on
    
    if yd==1
        plot(entrada(1),entrada(2),'bo')
    else %y==-1 or y==0
        plot(entrada(1),entrada(2),'ro')
    end
end