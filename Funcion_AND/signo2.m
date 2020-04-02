function bool=signo2(x,dominio)
%2m o 4m significa dominio {-1,1}
%2z o 4z significa dominio {0,1}

%Esto es por que la funcion signo si recibe un 0 da un 0 y eso no es
%conceptualmente correcto
if  x==0
    x=1;
end

if strcmp(dominio,'2m') || strcmp(dominio,'4m') 
    bool=sign(x);
elseif strcmp(dominio,'2z') || strcmp(dominio,'4z')
    bool=1/2+sign(x)/2;
end

