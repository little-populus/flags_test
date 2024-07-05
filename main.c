#include <stdio.h>
void test(char v);
int main()
{
    int value;
    while (1)
    {
        scanf("%d", &value);
        test(value);
    }
    return 0;
}
