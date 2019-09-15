def a_segundos(horas, minutos, segundos):
    return (3600 * horas) + (60 * minutos) + segundos

horas    = float(input("Ingresa las horas: "))
minutos  = float(input("Ingresa los minutos: "))
segundos = float(input("Ingresa los segundos: "))

print(f"Esto equivale a {a_segundos(horas, minutos, segundos)}")