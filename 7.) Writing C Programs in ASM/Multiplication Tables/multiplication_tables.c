#include <stdio.h>

void main() {
  int number;
  
  printf("Please Enter a Number to Print the Table of: ");
  scanf("%d", &number);
  
  for(int i = 1; i < 11; i++) {
    printf("%d x %d = %d", number, i, (number * i));
  }
  
  printf("Finished Execution");
  
  getch();
}
