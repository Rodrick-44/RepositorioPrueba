#include <iostream>
#include <random> // Se usa la bilbilote random para poder crear numeros aleatorios
#include <ctime> // Se usa la biblioteca ctime para poder usar el tiempo del sistema a la hora de generar numeros aleatorios
using namespace std;

#define n 10

// Precondición: La constante global 'n' debe ser un número positivo.
// Postcondición: Devuelve un puntero a un vector dinámico de 'n' números enteros aleatorios generados entre 1 y 100.
int* generarVectorAleatorio();

// Precondición: -
// Postcondición: Devuelve un puntero a un vector dinámico con numeros enteros pares filtrados de un vector original.
int* obtenerNumerosPares(int* vector, int& sizePar);

// Precondición: -
// Postcondición: Devuelve un numero entero con el tamaño del vector.
int obtenerTamanoVector(int* vector);

// Precondición: -
// Postcondición: Muestra el vector original y el vector filtrado con los numeros pares.
void mostrarVectores(int* vectorOriginal, int* vectorNuevo, int sizeNuevo);

int main(){

    int* vector;
    int* vectorPar;
    int sizePar=0;

    vector=generarVectorAleatorio();
    vectorPar=obtenerNumerosPares(vector, sizePar);
    mostrarVectores(vector, vectorPar, sizePar);

    delete[] vector;
    delete[] vectorPar; 

    return 0;
}

int* generarVectorAleatorio(){

    int* vector = new int[n];

    // Configurar el generador de números aleatorios
    unsigned seed = static_cast<unsigned>(time(0));  // Usar el tiempo del sistema para obtener una semilla
    std::mt19937 gen(seed); // Crear el generador de números aleatorios con la semilla
    std::uniform_int_distribution<int> distrib(1, 100);  // Distribución limitada entre los numeros 1 y 100 para mejor comprension

    for (int i = 0; i < n; i++) {
        vector[i] = distrib(gen);  // Generarion de un número aleatorio
    }

    return vector;
}

int* obtenerNumerosPares(int* vector, int& sizePar){
    
    int indice=0;
    sizePar=obtenerTamanoVector(vector);
    int* vectorPar = new int[sizePar];
    for (int i = 0; i < n; i++) {
        if (vector[i] % 2 == 0) {
            vectorPar[indice++] = vector[i];
        }
    }
    return vectorPar;
}

int obtenerTamanoVector(int* vector){
    
    int contador=0;
    for (int i = 0; i < n; i++) {
        if (vector[i] % 2 == 0) {
            contador++;  
        }
    }
    return contador;
}

void mostrarVectores(int* vectorOriginal, int* vectorNuevo, int sizeNuevo){
    
    cout<<"Vector original: ";
    for (int x = 0; x < n; x++) {
        cout << vectorOriginal[x] << " ";
    }
    cout << endl;

    cout<<"Vector filtrado par: ";
    for (int i = 0; i < sizeNuevo; i++) {
        cout << vectorNuevo[i] << " ";
    }
    cout << endl;
}
