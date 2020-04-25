#include <iostream>
#include <iomanip>
#include <fstream>
#include <random>
#include <vector>
#include <cmath>
#include <map>

using namespace std;

const int X = 10;
const int Y = 8;

int matrizA[X][Y];
int matrizB[X][Y]; 
int matrizC[X][Y]; 

void llenaConAleatorios(int matriz[][Y]) {
    random_device rd;  //Will be used to obtain a seed for the random number engine
    mt19937 gen(rd()); //Standard mersenne_twister_engine seeded with rd()
    uniform_int_distribution<> dis(0, 1500);
    for (size_t x = 0; x < X; x++) {
        for (size_t y = 0; y < Y; y++) {
            matriz[x][y] = dis(gen);
        }
    }
}

void despliegaMatriz(int matriz[][Y]) {
    for (size_t x = 0; x < X; x++) {
        for (size_t y = 0; y < Y; y++) {
           cout << matriz[x][y] << endl;
        }
    }
}

void sumaMatrices(int matrizA[][Y], int matrizB[][Y], int matrizC[][Y]) {
    std::ofstream outfile("salida.txt", ios::app);
    for (size_t x = 0; x < X; x++) {
        for (size_t y = 0; y < Y; y++) {
            matrizC[x][y] = matrizA[x][y] + matrizB[x][y];
            outfile << to_string(matrizC[x][y]) << ' ';
        }
        outfile << '\n';
    }
}

void despliegaDiagonal(int matriz[][Y]) {
    for (size_t y = 0; y < Y; y++) {
        cout << string(4 * y, ' ');
        cout << matriz[y][y] << endl;
    }
}

void llenaConArchivo(int matriz[][Y]) {
    std::ifstream infile("matrix.txt");
    string value;
    for (size_t x = 0; x < X; x++) {
        for (size_t y = 0; y < Y; y++) {
           if(infile >> value) {
               matriz[x][y] = stoi(value);
           } else {
               matriz[x][y] = 0;
           }
        }
    }
}

void intercambiaRenglonColumna(int matriz[][Y]) {
    int i, j;
    cout << "Ingresa el renglón de origen: ";
    cin >> i;
    cout << "Ingresa la columna destino: ";
    cin >> j;

    if(i >= X || j >= Y ) {
        cout << "Renglón o columna fuera de rango" << endl;
        return;
    }

    for (size_t y = 0; y < Y; y++) {
           int temp = matriz[i][y];
           matriz[i][y] = matriz[y][j];
           matriz[y][j] = temp;
    }
}


int main(void) {
    llenaConArchivo(matrizA);
    llenaConAleatorios(matrizB);
    sumaMatrices(matrizA, matrizB, matrizC);
    despliegaMatriz(matrizC);
    intercambiaRenglonColumna(matrizC);
    despliegaDiagonal(matrizC);
}