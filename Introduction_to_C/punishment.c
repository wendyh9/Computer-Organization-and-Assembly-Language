// author: Wendy Haw

#include <stdio.h>

int main(){
    int repetitions;
    int typo_line;

    printf("Enter the number of repetitions for the punishment phrase: ");
    scanf("%d", &repetitions);
    while (repetitions <= 0){
        printf("You entered an invalid value for the number of repetitions!\n");
        printf("Enter the number of repetitions for the punishment phrase again: ");
        scanf("%d", &repetitions);
    }

    printf("\nEnter the line where you wish to introduce the typo: ");
    scanf("%d", &typo_line);
    while (typo_line <= 0 || typo_line > repetitions){
        printf("You entered an invalid value for the typo placement!\n");
        printf("Enter the line where you wish to introduce the typo again: ");
        scanf("%d", &typo_line);
    } 

    printf("\n");
    int i;
    for (i = 1; i < repetitions + 1; i++){

        if (i == typo_line){
            printf("Cading in C is fun end intreseting!\n");
        }
        else{
            printf("Coding in C is fun and interesting!\n");
        }
        
    }   

    return 0;
}