#include <stdio.h>

int main() {
	int i;
	int four_ints[4];
	char* four_c;

	for(i = 0; i < 4; i++)
        four_ints[i] = 2;

	// printf("four_ints[0]: %x\n", four_ints[0]);
	
    four_c = (char*)four_ints;
	// printf("four_ints: %p \n", four_ints);
	// printf("four_c: %p\n", four_c);

	for(i = 0; i < 4; i++)
        four_c[i] = 'A' + i; // ASCII value of 'A' is 65 or 0x41 in Hex.
    
    // Add your code for the exercises here:
	printf("four_ints[0]: %x \n", four_ints[0]);
	printf("four_ints[1]: %x \n", four_ints[1]);
	printf("four_ints: %p \n", four_ints);
	printf("four_c: %p\n", four_c);

	for (int i = 0; i < 4; i++){
		printf("value of four_ints[%d]: %x \n", i, four_ints[i]);
		printf("address of four_ints[%d]: %p \n", i, &(four_ints[i]));
	}

	for (int i = 0; i < 4; i++){
		printf("value of four_c[%d]: %x \n", i, four_c[i]);
		printf("address of four_c[%d]: %p \n", i, &(four_c[i]));
	}
	return 0;
}