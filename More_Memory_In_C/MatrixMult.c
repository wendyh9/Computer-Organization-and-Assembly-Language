#include <stdio.h>
#include <malloc.h>

// notes from lab
// for i in rows
	// for j in col
		// for k in 
			// c[i,j] += a[i,k] * b[k,j]

int** matMult(int **a, int **b, int size) {
	// (4) Implement your matrix multiplication here. You will need to create a new matrix to store the product.
	int i = 0, j = 0, k = 0;
	// create int double pointer matC
	int** c = (int**)malloc(size * sizeof(int*));
	// create n int pointers for each row of matC
	for (i = 0; i < size; i++){
		*(c + i) = (int*)malloc(size * sizeof(int));
	}

	for (i = 0; i < size; i++){
		for (j = 0; j < size; j++){
			*(*(c + i) + j) = 0;
		}
	}

	for (i = 0; i < size; i++){
		for (j = 0; j < size; j++){
			for (k = 0; k < size; k++){
				*(*(c + i) + j) += *(*(a + i) + k) * (*(*(b + k) + j));
			}
		}
		
	}
	return c;
}

void printArray(int **arr, int n) {
	// (2) Implement your printArray function here
	for (int i = 0; i < n; i++){
		for (int j = 0; j < n; j++){
			printf("%d ", *(*(arr + i) + j));
		}
		printf("\n");
	}
	printf("\n");
}

void deallocateMemory(int **arr, int n){
	for (int i = 0; i < n; i++){
		free(*(arr + i));
	}
	free(arr);
}

int main() {
	int n = 0;
	int **matA, **matB, **matC;	
	int i = 0, j = 0;
	
	// n x n array
	n = 4;	
	
	// (1) Define 2 (n x n) arrays (matrices). 

	// create int double pointer matA
	matA = (int**)malloc(n * sizeof(int*));
	// create n int pointers for each row of matA
	for (i = 0; i < n; i++){
		*(matA + i) = (int*)malloc(n * sizeof(int));
	}

	// create int double pointer matB
	matB = (int**)malloc(n * sizeof(int*));
	// create n int pointers for each row of matB
	for (i = 0; i < n; i++){
		*(matB + i) = (int*)malloc(n * sizeof(int));
	}



	// initializing values for matA
	int temp = 1;
	for (i = 0; i < n; i++){
		for (j = 0; j < n; j++){
			*(*(matA + i) + j) = temp;
			temp++;
		}
	}

	// intializing values for matB
	for (i = 0; i < n; i++){
		for (j = 0; j < n; j++){
			*(*(matB + i) + j) = i * 3;
		}
	}

	// (3) Call printArray to print out the 2 arrays here.
	printArray(matA, n);
	printArray(matB, n);
	
	// (5) Call matMult to multiply the 2 arrays here.
	matC = matMult(matA, matB, n);
	
	// (6) Call printArray to print out resulting array here.
	printArray(matC, n);

	// // deallocate memory used by each int pointer in arr
	deallocateMemory(matA, n);
	deallocateMemory(matB, n);
	deallocateMemory(matC, n);

	return 0;
}