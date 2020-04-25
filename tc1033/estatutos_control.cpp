#include <iostream>
#include <iomanip>
#include <fstream>
#include <vector>
#include <cmath>
#include <map>

using namespace std;

void conversionCelsiusFahrenheit() { 
    double inicial, delta;
    int iters;
    cout << "Valor inicial en Celsius: ";
    cin >> inicial;
    cout << "Número de iteraciones: ";
    cin >> iters;
    cout << "Incremento entre valores: ";
    cin >> delta;

    if (inicial < 0 || iters > 10'000 || delta < 2 || delta > 10){
        cout << endl << "Error: revisa tus parámetros" << endl;
    } else {
        cout << endl << "Conversión de grados Celsius a Fahrenheit" << endl;
        cout << "Fahrenheit  Celsius" << endl;

        for (size_t i = 0; i < iters; i++) {
            double tempFahrenheit = (9.0/5.0 * inicial) + 32;
            cout << setw(10) << tempFahrenheit << "  " << inicial << endl;
            inicial += delta;
        }
    }

    cout << endl;
}

void serieAritmetica() {
    uint64_t sum = 0;

    for (size_t i = 0; i < 25; i++) {
        uint64_t term = 1 + (i * 3);
        cout << "Término " << i << ": " << term << endl;
        sum += term;
    }
    cout << "Valor total de la serie: " << sum << endl << endl;
}

void mediaGeometricaArmonica() { 
    vector<double> values;
    double in = 0;
    while (true) {
        cout << "Ingresa valor: ";
        cin >> in;
        if (in == 0) {
            break;
        } else {
            values.push_back(in);
        }
    }
    double product = 1;
    double recip_sum = 0;
    for (auto val: values) {
        product *= val;
        recip_sum += 1.0 / val;
    }
    cout << "La media geométrica es: " << pow(product, 1.0 / values.size()) << endl;
    cout << "La media armónica es: " << values.size() / recip_sum << endl;
}

int main() {
    int status = -1;

    while (status != 0) {
        cout << "1) Conversión de Celsius a Fahrenheit" << endl;
        cout << "2) Calcular serie aritmética" << endl;
        cout << "3) Calcular media geométrica y armónica" << endl;
        cout << "0) Exit" << endl;
        cout << "Elige una opción: ";
        cin >> status;
        
        switch(status) {
            case 1: conversionCelsiusFahrenheit();
                    break;
            case 2: serieAritmetica();
                    break;
            case 3: mediaGeometricaArmonica();
                    break;
        }
    }
}