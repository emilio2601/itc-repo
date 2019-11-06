import random

def crea_matriz1(n):
    return [[-1 for i in range(n)] for j in range(n)]

def crea_matriz2(n):
    return [[i for i in range(n)] for j in range(n)]

def crea_matriz3(n):
    return [[j for i in range(n)] for j in range(n)]

def crea_matriz_aleatoria(n, m):
    return [[random.randint(0, 100) for i in range(m)] for j in range(n)]

def crea_matriz4(n):
    return [[(j*n)+i+1 for i in range(n)] for j in range(n)]

def crea_matriz5(n):
    return [[(i*n)+j+1 for i in range(n)] for j in range(n)]

def cuenta_pares(mat):
    return [j % 2 == 0 for i in mat for j in i].count(True)

def cuenta_positivos(mat):
    return [j >= 0 for i in mat for j in i].count(True)

def cambia_negativos(mat):
    return [[max(0, j) for j in i] for i in mat]

def cuenta_repeticiones(mat, val):
    return [j == val for i in mat for j in i].count(True)

def busca(mat, val):
    return [j == val for i in mat for j in i].count(True) >= 1

def suma_mayores5(mat):
    return sum([j if j > 5 else 0 for i in mat for j in i])

def cambia_ceros(mat):
    return [[idxx + idxy if j == 0 else j for idxx, j in enumerate(i)] for idxy, i in enumerate(mat)]