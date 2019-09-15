lado1 = float(input("Ingresa el primer lado: "))
lado2 = float(input("Ingresa el segundo lado: "))
lado3 = float(input("Ingresa el tercer lado: "))

if lado1 > 0 and lado2 > 0 and lado3 > 0:
    if lado1 + lado2 > lado3 and lado1 + lado3 > lado2 and lado2 + lado3 > lado1:
        if lado1 == lado2 and lado2 == lado3:
            print("Es un triángulo equilátero")
        elif lado1 != lado2 and lado2 != lado3 and lado1 != lado3:
            print("Es un triángulo escaleno")
        else:
            print("Es un triángulo isósceles")
    else:
        print("Triángulo no válido")
else:
    print("No se permiten valores negativos")