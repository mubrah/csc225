/*practice.c*/

#include <stdio.h>
#include "practice.h"

int main(int argc, char *argv[]) {
    int a = 10;
    while (a != 0){
        printf("\n\nEnter number (0 to quit): ");
        scanf("%d", &a);
        if (a != 0){
            printf("\nCount forward to: ");
            countForwardTo(a);
            printf("\nCount backward: ");
            countBackwardFrom(a);
            printf("\n");
        }
    }
}

/**
 * This function counts backward from x to 1 by one.
 * For example, calling this function with a value of 5 should
 * result in the following output:
 * 5, 4, 3, 2, 1
 */
 void countBackwardFrom(int x){
     if(x == 1){
        printf("%d", x);
     }else
        printf("%d, ", x);
     if(x > 1) {
        countBackwardFrom(x - 1);
     }
    
    
 }


void countForwardTo(int x){
if(x > 1) {
        countForwardTo(x - 1);
    }
    printf("%d ", x);
}
