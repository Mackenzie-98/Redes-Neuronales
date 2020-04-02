function Yd=funcion_deseada(U,dominio)
 
u1=U(1);
u2=U(2);  

%OR de 2 entradas {0,1}
if dominio=='2z'
    Yd=u1|u2;
end
%OR de 2 entradas {-1,1}
if dominio=='2m'
    
    if u1==-1 && u2==-1
        Yd=-1;
    else
        Yd=1;
    end
end
%OR de 4 entradas 0,1}
if dominio=='4z'
    u3=U(3);
    u4=U(4);  
    
    Yd=u1|u2|u3|u4;
end
%OR de 4 entradas {-1,1}
if dominio=='4m'   
    u3=U(3);
    u4=U(4);  

    if u1==-1 && u2==-1 && u3==-1 && u4==-1
        Yd=-1;
    else
        Yd=1;
    end
end
