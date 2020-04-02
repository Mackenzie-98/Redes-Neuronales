%%%%%%%%%%%%%%%%
clear all
close all
clc
%%%%%%%%%%%%%%%%%%%
%Cargo entrada '2m' para dominio {-1,1} o '2z' para dominio {0,1}
dominio='2z';
matrizEntrada=cargarEntradas(dominio);

%% Condiciones iniciales
N=size(matrizEntrada,1);                   %Cantidad de posibles M parejas de entradas
M=size(matrizEntrada,2);                   %Dimension de entrada
index=1:N;
k=0;                                        %constante de aprendizaje
intentos=0;
W=rand(1,M);
deltaW=zeros(1,M);


h1=plot_lines(W);
title('División inicial')
pause(1.5)

while(flag~=N)
   
    plotAND(matrizEntrada,dominio)
    title('Salida deseada')
    pause(1)
    
    intentos=intentos+1;
    title(['Actualización numero ',num2str(intentos),':'])
    index=randperm(N);
    flag=0;
    
    for i=1:N
        
        entrada=matrizEntrada(index(i),:); %entrada aleatoria
        
        yd=funcion_deseada(entrada,dominio);
        y=signo2(W*entrada',dominio);
        
        hold on
        
        if y==1
            plot(entrada(1),entrada(2),'b*')
        else %y==-1 or y==0
            plot(entrada(1),entrada(2),'r*')
        end
        %             str1 = ['La salida de la AND es yd= ',num2str(yd)];
        %             text(-2,-0.5,str1,'HorizontalAlignment','left');
        %             ste2 = ['La salida del Perceptron y= ',num2str(y)];
        %             text(-2,-1.5,ste2,'HorizontalAlignment','left');
        
        pause(1)
        
        
        if yd~=y
            k=k+1;
            deltaW=(1/k)*entrada*(yd-y);
            W=W+deltaW;
            delete(h1)
            h1=plot_lines(W);
            %str1 = {['La constante de'],['aprendizaje es = ',num2str(1/k)]};
            %t=text(0.1,2,str1,'HorizontalAlignment','left');
            pause(1)
        else
            flag=flag+1;
            
        end
            %delete(t)
        
    end
    hold off
    h1=plot_lines(W);
end
title('División Final')
plotAND(matrizEntrada,dominio);

display(['El vector final W es ',num2str(W)])
display(['La pendiente es ',num2str(-W(1)/W(2))]);
display(['La ordenada es ',num2str(W(3)/W(2))]);
display(['La cantidad de actualizaciones de W es ',num2str(k)]);
display(['La cantidad de intentos es ',num2str(intentos)]);


