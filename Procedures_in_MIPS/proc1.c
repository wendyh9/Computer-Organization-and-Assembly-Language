#include <stdio.h>

int sumOfTwoNum(int m, int n){
    return (m + n);
}
int main(){
    int m = 5;
    int n = 7;

    int sum = sumOfTwoNum(m,n);

    printf("%d\n", sum);

    return 0;
}