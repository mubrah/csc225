/* 

Evan Zhang
CSC 225

myGrep.h

*/

typedef struct node{
    int line;
    int wordn;
    char occurance[100];
    struct node *next;
    struct node *previous;
} linkedlist;

void add(linkedlist **thishead, int line, int wordn, char occurance[]);

void removelist(linkedlist *thishead);

