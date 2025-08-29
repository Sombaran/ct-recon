// run main from test

#include "testInc.h"
#include <iostream>

int someNumber  {123};
int someNumber1 {-123};

int main()
{
    std::shared_ptr<test> lObj;
    lObj->foo();
    lObj->reverseNumber(someNumber);    // positive number
    lObj->reverseNumber(someNumber1);   // negative number
    return (0);
}
