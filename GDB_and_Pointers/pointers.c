#include <stdio.h> 
 
int main() { 
    int x = 5, y = 7, *px, *py; 
    int arr[10];
    arr[0] = 100;
    px = &x;
    py = &y;
    
    // print values of x, y, and arr[0] 
    // printf("int x: %d \n", x);
    // printf("int y: %d \n", y);
    // printf("arr[0]: %d \n", arr[0]);

    // print address of x and y
    // printf("address of x: %p \n", &x);
    // printf("address of y: %p \n", &y);

    // print values and addresses of x and y using pointer variables
    // printf("x: %d \n", *(px));
    // printf("address of x: %p \n \n", px);
    // printf("y: %d \n", *(py));
    // printf("address of y: %p \n", py);

    // printing out values of arr without using []
    // int i;
    // for (i = 0; i < 10; i++){
    //     // recall arr is a pointer to the first element
    //     // use i to point to the next element
    //     printf("%d \n", *(arr + i));
    // }

    // verify that array names are pointers to the first element of the array
    printf("address of arr: %p \n", arr);
    printf("address of arr[0]: %p \n", &(arr[0]));
    
    return 0; 
} 
 