function Yd=funcion_deseada(U,dominio)
 
u1=U(1);
u2=U(2);  

%AND de 2 entrada {0,1}
if dominio=='2z'
    Yd=u1 && u2;
end
%AND de 2 entrada {-1,1}
if dominio=='2m'
    if u1==1 && u2==1
        Yd=1;
    else
        Yd=-1;
    end
end

%AND de 4 entrada {0,1}
if dominio=='4z'
    u3=U(3);
    u4=U(4);  
    
    Yd=u1 && u2 && u3 && u4;
end
%AND de 4 entrada {-1,1}
if dominio=='4m'   
    u3=U(3);
    u4=U(4);  
    
    if u1==1 && u2==1 && u3==1 && u4==1
        Yd=1;
    else
        Yd=-1;
    end
end
