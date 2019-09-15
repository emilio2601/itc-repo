calificaciones = []

for i in range(10):
    c = input(f"Ingresa la calificación {i+1}: ")
    calificaciones.append(float(c))

print(f"El promedio es: {sum(calificaciones) / len(calificaciones)}")
print(f"La calificación máxima es: {max(calificaciones)}")
print(f"La calificación mínima es: {min(calificaciones)}")