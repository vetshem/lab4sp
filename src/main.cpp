#include <iostream>
#include "calculator.h"

int main() {
    Calculator calculator;

    double a = 4.0;
    double b = 2.0;

    int add = calculator.Add(a, b);
    int sub = calculator.Sub(a, b);
		int mul = calculator.Mul(a, b);
		int div = calculator.Div(a, b);
		int pow = calculator.Pow(a, b);

    std::cout << a << " + "<< b <<" = " << add << std::endl;
    std::cout << a << " - "<< b <<" = " << sub << std::endl;
		std::cout << a << " * "<< b <<" = " << mul << std::endl;
    std::cout << a << " / "<< b <<" = " << div << std::endl;
		std::cout << a << "^"<< b <<" = " << pow << std::endl;

    return 0;
}
