/* 

Evan Zhang
CSC 225

myGrep.c 

*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "myGrep.h"


int main(int argc, char *argv[]) {
   
    FILE *fp;             /* This is the file to be read.    */
    char sentence[100];   /* to check for longest sentence   */
    char tpsent[100];     /* checker for sentence            */
    char hold[100];       /* checker for sentence            */
    int numlines = 0;     /* number of lines in file         */
    int numchar = 0;      /* number of char in max sentence  */
    int tempchar = 0;     /* number of characters in current */
    int thiswordnum = 0;
    int numofoccurs = 0;
    int i = 0;
    int same = 0;
    char *token;
    char *word;
    
    linkedlist *head = NULL;
    head = malloc(sizeof(linkedlist));
    head->line = -1;
    head->next = NULL;
    head->previous = NULL;

    
    /* Check input */
    if(argc != 3){
        argv[1] = "<filename>";
        argv[2] = "<word>";
        printf("myGrep: improper number of arguments\nUsage: ");
        printf("%s %s %s\n", argv[0], argv[1], argv[2]);
    } else{
        /* Check File */
        if((fp = fopen(argv[1],"r"))==NULL){
            /* File not found */
            printf("Unable to open file: %s\n", argv[1]);
            return -1;
        }
        printf("%s %s %s\n", argv[0], argv[1], argv[2]);
    
        /* Processing File*/
        fp = fopen(argv[1],"r");
        
        while (fgets(tpsent, 100, fp) != NULL){
            for(i = 0; i < 100; i++){
                hold[i] = tpsent[i];
            }

            token = strtok(tpsent, " ");
            /* Process each word */
            while(token){

                word = argv[2];
                if(*token != *word){
                    same = 1;
                }
                
                while(*token != '\0'){
                    if(*token != *word && *token != 10){
                        same = 1;
                    }
                    if(*word != '\0' && *token == 10){
                        same = 1;
                    }
                    tempchar++;
                    token++;
                    word++;
                }
                
                
                
                if(same == 0){
                    numofoccurs++;
                    add(&head, numlines, thiswordnum, hold);
                }
                
                same = 0;
                token = strtok(NULL, " ");

                if(token){
                    tempchar++;
                    /*printf(" ");*/
                }

                thiswordnum++;
            }
            thiswordnum = 0;
            if(tempchar > numchar){
                numchar = tempchar; 
                for(i = 0; i < numchar; i++){
                    sentence[i] = hold[i];
                }
            }
            tempchar = 0;
            numlines++;
        }

        printf("longest line: ");
        for(i = 0; i < numchar;i++){
            if(sentence[i] != 10)
                printf("%c", sentence[i]);
        }
        printf("\nnum chars: %d\n", numchar);
        printf("num lines: %d\n", numlines);
        printf("total occurrences of word: %d\n", numofoccurs); 
        if(numofoccurs != 0){
            removelist(head);
        }


        fclose(fp);
    }
    return 0;
}

/* Adds a instance of the word to the data structure*/
void add(linkedlist **thishead, int line, int wordn, char occurance[]){
    int i = 0;
    linkedlist *newnode = malloc(sizeof(linkedlist));
    newnode->line = line;
    newnode->wordn = wordn;
    for(i = 0; i < 100; i++){
        if(occurance[i] != 10){
            newnode->occurance[i] = occurance[i];
        }else{
            newnode->occurance[i] = occurance[i];
            i = 100;
        }
    }
    newnode->next = *thishead;
    (*thishead)->previous = newnode;
    newnode->previous = NULL;
    *thishead = newnode;
    
}


/* Prints the instances and frees up memory */
void removelist(linkedlist *thishead) {
    int i = 0;
    linkedlist *temp = NULL;
    
    while(thishead->line != -1){
        thishead = thishead->next;
    }
    
    thishead = thishead->previous;
    
    while(thishead != NULL){
        printf("line %d; word %d; ", thishead->line, thishead->wordn);
        for(i = 0; i < 100; i++){
            if(thishead->occurance[i] != 10){
                printf("%c", thishead->occurance[i]);
            }else{
                i = 100;
            }
        }
        printf("\n");
        temp = thishead;
        thishead = thishead->previous;
        free(temp);
    }
        
    

}


