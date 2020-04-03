%%%%%%%%%%%%%%%%
clear all
close all
clc
%%%%%%%%%%%%%%%%%%%
%Cargo entrada
dominio='2z';   
matrizEntrada=cargarEntradas(dominio);
N=size(matrizEntrada,1);                   %Cantidad de posibles M parejas de entradas
M=size(matrizEntrada,2);                   %Dimension de entrada
index=1:N;
%% Condiciones iniciales
k=0;                                        %constante de aprendizaje etha=1/k
intentos=0;
W=rand(1,M);
deltaW=zeros(1,M);

%% Division Inicial Random
h1=plot_lines(W);
title('División inicial')
pause(1)

while(flag~=N)
    %% Salida Deseada
    %%
    title('Salida deseada')
    plotOR(matrizEntrada,dominio)
    pause(1)
    
    %% Intentos
    %%
    intentos=intentos+1;
    title(['Actualización numero ',num2str(intentos),':'])
    index=randperm(N);
    flag=0;
    
    for i=1:N
        
        entrada=matrizEntrada(index(i),:); %entrada aleatoria
        
        yd=funcion_deseada(entrada,dominio); %y deseada
        y=signo2(W*entrada',dominio);
        
        hold on
        if y==1
            plot(entrada(1),entrada(2),'b*')
        else %y==-1 o y==0
            plot(entrada(1),entrada(2),'r*')
        end

        pause(1)
        
        
        if yd~=y
            k=k+1;
            deltaW=(1/k)*entrada*(yd-y);
            W=W+deltaW;
            delete(h1)
            h1=plot_lines(W);
        else
            flag=flag+1;
            
        end
        
    end
    
    pause(1)
    hold off
    h1=plot_lines(W);
end

title('División Final')
plotOR(matrizEntrada,dominio);

display(['El vector final W es ',num2str(W)])
display(['La pendiente es ',num2str(-W(1)/W(2))]);
display(['La ordenada es ',num2str(W(3)/W(2))]);
display(['La cantidad de actualizaciones de W es ',num2str(k)]);
display(['La cantidad de intentos es ',num2str(intentos)]);





