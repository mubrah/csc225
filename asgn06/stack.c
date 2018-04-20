/* 

Evan Zhang
CSC 225
stack.c
Description: Defines a stack

*/


#include <stdio.h>
#include "stack.h"

int stack[10];
int size = 0;
int *pointer = &stack[0];


int push(int value) {
    if (&stack[0] + 9 < pointer){
        return 1;
    } else {
        size = size + 1;
        *pointer = value;
        pointer = pointer + 1;
        return 0;
    }
}

int pop(int *value) {
    if (size < 1){
        return 1;
    } else {
        size = size - 1;
        *value = *pointer;
        pointer = pointer - 1;
        return 0;
    }
    
}

void printStack(int format) {
    int loop;
    printf("Stack: ");
    switch (format) {
        case 0:
            for(loop = 0; loop < size; loop++)
                printf("%d ", stack[loop]);
            break;
        case 1: 
            for(loop = 0; loop < size; loop++)
                printf("%x ", stack[loop]);
            break;
        case 2:
            for(loop = 0; loop < size; loop++)
                printf("%c ", stack[loop]);
            break;
        default: 
            for(loop = 0; loop < size; loop++)
                printf("%d ", stack[loop]);
    }
    return;
    
}
