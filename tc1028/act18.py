a = int(input("Valor 1: "))
b = int(input("Valor 2: "))

while a <= b:
    if a % 2 == 0:
        print(a)
    a += 1

suma = 0
its  = 0

while suma < 1000:
    suma += float(input("Ingresa un número: "))
    its  += 1

print(f"{suma}, {its}")

num = int(input("Ingresa un número: "))
suma_divisores = 0

for i in range(1, num):
    if num % i == 0:
        suma_divisores += i

if num == suma_divisores:
    print("El número es perfecto")
else:
    print("El número no es perfecto")