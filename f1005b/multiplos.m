x = [-6,-2,34,4,7,8,-10,-23,22,112];
eleccion = 1;

while eleccion == 1 || eleccion == 2
    fprintf('1) Múltiplos \n2) Positivos o negativos\n');
    eleccion = input("Elige una opción: ");
    if eleccion == 1
        num = input('Ingresa el múltiplo: ');
        mul = multiplo(x, num);
        fprintf('\nCantidad de múltiplos: %d \n\n', mul);
    elseif eleccion == 2
        [neg, pos] = posneg(x);
        fprintf('\nCantidad de negativos: %d \n Cantidad de positivos: %d\n',neg, pos);
    end
end

function [cantidad] = multiplo(x, num)
    cantidad = 0;
    for i = 1:length(x)
        if mod(x(i), num) == 0 % si es múltiplo
            cantidad = cantidad + 1;
        end
    end
end

function [neg, pos] = posneg(x)
    pos = 0;
    neg = 0;
    for i=1:length(x)
        if x(i) < 0
            neg = neg + 1;
        elseif x(i) > 0
            pos = pos + 1;
        end
    end
end
