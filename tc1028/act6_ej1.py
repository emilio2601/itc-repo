import math

a = float(input("Ingresa la longitud del lado a: "))
b = float(input("Ingresa la longitud del lado b: "))
c = float(input("Ingresa la longitud del lado c: "))

def heron(a, b, c):
    s    = (a + b + c) / 2
    area = math.sqrt(s * (s - a) * (s - b) * (s - c))
    return area

print(f"El resultado es: {heron(a, b, c)}")