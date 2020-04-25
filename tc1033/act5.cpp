#include <iostream>

using namespace std;

class Automovil {
    private:
    string marca, modelo, color;
    int anio, numPuertas, numPasajeros;
    double kilometraje, rendimiento, capacidadTanque, gasolinaEnTanque;

    public:

    Automovil() {
        marca = "Kia";
        modelo = "Rio";
        color = "rojo";
        anio = 2018;
        numPuertas = 4;
        numPasajeros = 5;
        capacidadTanque = 50;
        gasolinaEnTanque = capacidadTanque;
        rendimiento = 12;
        kilometraje  = 0;
    }

    Automovil(string marca, string modelo, string color, int anio, int numPuertas, int numPasajeros, double capacidadTanque, double gasolinaEnTanque, double rendimiento, double kilometraje) {
        this->marca = marca;
        this->modelo = modelo;
        this->color = color;
        this->anio = anio;
        this->numPuertas = numPuertas;
        this->numPasajeros = numPasajeros;
        this->capacidadTanque = capacidadTanque;
        this->gasolinaEnTanque = gasolinaEnTanque;
        this->rendimiento = rendimiento;
        this->kilometraje = kilometraje;
    }

    double validaGasolinaEnTanque() {
        double gasolinaInput;
        do {
            cout << "Ingresa cantidad de gasolina en tanque: ";
            cin >> gasolinaInput;
        } while(gasolinaInput > capacidadTanque || gasolinaInput < 0);
        gasolinaEnTanque = gasolinaInput;
    }

    void imprimeAutomovil() {
        cout << "Resumen: " << marca << " " << modelo << " " << color << " año " << anio << endl;
        cout << "Kilometraje: " << kilometraje << " km, gasolina en tanque: " << gasolinaEnTanque << " lts" << endl;
    }

    void avanzaAutomovil(double distancia, int pasajeros) {
        double consumo = calculaConsumo(distancia, pasajeros);

        if (consumo == -1) {
            cout << "No hay suficiente gasolina" << endl;
        } else if(requiereMantenimiento()) {
            cout << "Mantenimiento requerido" << endl;
        } else {
            kilometraje += distancia;
            gasolinaEnTanque -= consumo;
            cout << "Avance confirmado" << endl;
        }

    }

    double calculaConsumo(double distancia, int pasajeros) {
        double gasolinaRequerida = 0;
        double multiplier = 1;

        if(pasajeros == numPasajeros) {
            multiplier = 1.05;
        } else if(pasajeros < (numPasajeros / 2) ) {
            multiplier = 0.96;
        }

        gasolinaRequerida = (distancia / rendimiento) * multiplier;

        if (gasolinaRequerida > gasolinaEnTanque) {
            return -1;
        } else {
            return gasolinaRequerida;
        }
    }

    void llenaTanque() {
        gasolinaEnTanque = capacidadTanque;
    }

    bool requiereMantenimiento() {
        return kilometraje > 10000;
    }

};

int main() {
    cout<<"\nSistema de control de uso de autos\n";
    Automovil miCoche;
    miCoche.imprimeAutomovil();
    miCoche.validaGasolinaEnTanque();
    cout<<"\nQue distancia quieres recorrer?: ";
    float distancia;
    cin>>distancia;
    cout<<"Cuantos pasajeros viajaran?: ";
    float pasajeros;
    cin>>pasajeros;
    miCoche.avanzaAutomovil(distancia,pasajeros);
    miCoche.imprimeAutomovil();
    miCoche.llenaTanque();
    miCoche.imprimeAutomovil();
    return 0;
}