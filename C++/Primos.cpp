#include <iostream>
using namespace std;

bool esPrimo(int numero);

int main(){
    int vector[]={1,2,3,4,5,6,7,8,9,10};
    int longitud=sizeof(vector) / sizeof(vector[0]);

    cout<<"Los numeros primos del vector son: ";
    for(int x=0;x<longitud;x++){
        if(esPrimo(vector[x])){
            cout<<vector[x]<<", ";
        }
    }

    return 0;
}

bool esPrimo(int numero){
    bool esNumeroPrimo=true;
    if(numero>1){
        for(int i=2;i<numero;i++){
            if(numero%i==0){
                esNumeroPrimo=false;
            }
        }
    }
    else{
        esNumeroPrimo=false;
    }
    return esNumeroPrimo;
}
