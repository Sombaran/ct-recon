#include "testInc.h"

void test::foo()
{
    std::cout<< "foo is called from main " << std::endl;
}

void test::reverseNumber(int& number) {
    std::cout << "Execution begin for function" << __func__ << std::endl;

    int reverseNumber {0};
    bool numberIsNegative = false;

    if (number != 0) {
        numberIsNegative = true;
        number = ((-1)* number);
    }

    auto isNumberNegavtive = [&] (int number, bool flag) {
        if (flag) {
            reverseNumber = ((-1)* reverseNumber);
            std::cout << "The reversed negative number " << reverseNumber << std::endl;
        }else {
            std::cout << "The reversed positive number " << reverseNumber << std::endl;
        }
    };

	while(number != 0){
		int lastDigit = number % 10;
		reverseNumber = ((reverseNumber * 10) + lastDigit);
		number /=  10;
	}

    isNumberNegavtive(reverseNumber, numberIsNegative);
}
