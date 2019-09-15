# Emilio Mendoza Palafox A00344575

def calcular_precio_final(precio_original, tipo_etiqueta, tarjeta):
    """
    Se calcula el precio final del producto tomando en cuenta el tipo de etiqueta
    Parámetros:
     - precio_original (float)
     - tipo_etiqueta (str)
     - tarjeta (str)

     Regresa:
     - plazo (int)
     - pago_por_plazo (int)
    """
    if tipo_etiqueta == "roja":
        precio_final = precio_original * 0.6
        if precio_original > 550 and precio_original < 1000:
            precio_final -= 80
        elif precio_original > 1000:
            precio_final *= 0.85
        return (1, precio_final)
    elif tipo_etiqueta == "verde":
        precio_final = precio_original * 0.75
        if tarjeta == "s":
            return (6, precio_final/6)
        else:
            return (1, precio_final)
    else:
        return (1, precio_original)

# Obtener datos del usuario
precio   = float(input("Ingrese el precio del producto: "))
etiqueta = input("Ingrese tipo de etiqueta (roja/verde/blanca): ")
tarjeta  = input("Tiene tarjeta de la tienda? (s/n): ")

meses, precio = calcular_precio_final(precio, etiqueta, tarjeta)

if meses != 1:
    print(f"El pago será diferido a {meses} meses sin intereses")
    print(f"El pago mensual será de ${precio}")
else:
    print(f"El pago será de ${precio}")