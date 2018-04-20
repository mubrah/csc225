/* 

Evan Zhang
CSC 225
driver.c
Description: Runs stack.c and stack.h for a demonstration of stack in C

*/

#include <stdio.h>
#include "stack.h"

int main(int argc, char *argv[])
{
    
    char choice = 'a';
    int form = 0;
    int *popped = NULL;
    int entered = 0;
    char String[3];
    printf("Welcome to the stack program.");
    do {
        char choice = 'a';
        
        printf("\n\nEnter option: ");
        scanf("%s", String);
        choice = String[0];
        
        if (choice == 'u'){
            printf("What number? ");
            scanf("%d", &entered);
            if(push(entered) == 1)
                printf("Overflow!!!\n");
                printStack(form);
            }
        if (choice == 'o'){
            if (pop(popped) == 1)
                printf("Underflow!!!");
            else {
                printf("Popped ");
                printf("%d \n", *popped);
                printStack(form);
            }
        }
        if (choice ==  'h'){
            form = 1;
            printStack(form);
        }
        if (choice == 'c'){
            form = 2;
            printStack(form);
        }
        if (choice ==  'd'){
            form = 0;
            printStack(form);
        }
    
    } while (choice != 'x');
    printf("Goodbye!\n");
    return 0;
}
