#include <stdio.h>
#include <malloc.h>

void printArray(int**, int);

int main() {
	int i = 0, j = 0, n = 5;
	int **arr = (int**)malloc(n * sizeof(int*));

	// (3) Add your code to complete allocating and initializing the 2-D array here. The content should be all 0.
	
	// create n pointers for each array
	for (i = 0; i < n; i++){
		*(arr + i) = (int*)malloc(n * sizeof(int));
	}
	
	// assign each element to be 0
	for (i = 0; i < n; i++){
		for (j = 0; j < n; j++){
			*(*(arr + i) + j) = 0;
		}
	}


    // This will print out your array
	printArray(arr, n);
	printf("\n");

    // (6) Add your code to make arr a diagonal matrix
    for (i = 0; i < n; i++){
		for (j = 0; j < n; j++){
			if (i == j){
				*(*(arr + i) + j) = i + 1;
			}
		}
	}
	
	
	// (7) Call printArray to print array
    printArray(arr, n);

	// deallocate memory used by each int pointer in arr
	for (i = 0; i < n; i++){
		free(*(arr + i));
	}

	// deallocate memory used by arr itself
	free(arr);

	return 0;
}

void printArray(int ** array, int size) {
    // (5) Implement your printArr here:
	for (int i = 0; i < size; i++){
		for (int j = 0; j < size; j++){
			// printf("*(*(arr + %d) + %d): %d \n", i , j, *(*(array + i) + j));
			printf("%d ", *(*(array + i) + j));
		}
		printf("\n");
	}
}
