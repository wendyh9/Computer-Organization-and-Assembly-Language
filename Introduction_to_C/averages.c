// author: Wendy Haw

#include <stdio.h>
#include <math.h>

int main(){
    int counter = 1;
    int num = 0, num_total = 0, num_calc = 0;
    int even_counter = 0, odd_counter = 0;
    float avg_even = 0, avg_odd = 0;

    printf("Enter the 1st number: ");
    scanf("%d", &num);
    
    if (num == 0){
        printf("\nThere is no average to compute.\n");
        return 0;
    }

    do {
        num_calc = num;
        num_total = num_calc % 10;
        while(num_calc != 0){
            num_calc = floor(num_calc / 10);
            num_total += num_calc % 10;
        }
        if (num_total % 2 == 0){
            avg_even += num;
            // printf("avg_even: %f\n", avg_even);
            even_counter += 1;
            // printf("even_counter: %d\n", even_counter);
        }
        else{
            avg_odd += num;
            // printf("avg_odd: %f\n", avg_odd);
            odd_counter += 1;
            // printf("odd_counter: %d\n", odd_counter);
        }
        
        counter += 1;
        if (counter >= 4){
            if ((counter > 11 && counter % 10 == 1)){
                printf("Enter the %dst number: ", counter);
            }
            else if ((counter > 12 && (counter % 10 == 2))){
                printf("Enter the %dnd number: ", counter);
            }
            else if ((counter > 13 && (counter % 10 == 3))){
                printf("Enter the %drd number: ", counter);
            }              
            else{
                printf("Enter the %dth number: ", counter);
            }
        }
        else if (counter == 2){
            printf("Enter the %dnd number: ", counter);
        }
        else if (counter == 3){
            printf("Enter the %drd number: ", counter);
        }       
        scanf("%d", &num);
        

    } while(num != 0);

    printf("\n");
    if (even_counter > 0){
        avg_even = avg_even / even_counter;
        printf("Average of inputs whose digits sum up to an even number: %0.2f\n", avg_even);
        // printf("Counter of even numbers: %d\n", even_counter);
    }
    if (odd_counter > 0){
        avg_odd = avg_odd / odd_counter; 
        printf("Average of inputs whose digits sum up to an odd number: %0.2f\n", avg_odd);
        // printf("Counter of odd numbers: %d\n", odd_counter);
    }

    return 0;
}