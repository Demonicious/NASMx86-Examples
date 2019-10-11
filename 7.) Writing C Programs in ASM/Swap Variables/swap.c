#include <stdio.h>

void main() {
    int x, y;
    
    x = 350;
    y = 641;
    
    y = x + y;
    x = y - x;
    y = y - x;
    
    printf("x = %d\ny = %d", x, y);
}
