#include <stdio.h>
void foo()
{
    static int x = 5;
    x++;
    printf("%d", x);
}

int main()
{
    int i = 0x1;
    i = i << 9;

    printf("%d\n", i);
    return 0;
}