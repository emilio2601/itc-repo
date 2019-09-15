from collections import defaultdict

UNIDADES_MONETARIAS = [500, 200, 100, 50, 20, 10, 5, 2, 1]

cantidad = int(input("Ingresa la cantidad de dinero a repartir: "))

billetes_a_usar = defaultdict(int)

for unidad in UNIDADES_MONETARIAS:
    billetes_a_usar[unidad] += cantidad // unidad
    cantidad -= billetes_a_usar[unidad] * unidad

for billete, cantidad in billetes_a_usar.items():
    if cantidad != 0:
        print(f"Usa {cantidad} de billetes/monedas de ${billete}")