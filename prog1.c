// 1. Write a C program to implement cat command using general File APIs.

#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[]) {
    if(argc != 2) {
        printf("Sytnax : command(./a.out) filename(sample.txt)\n");
        exit(0);
    }

    char str[100];
    FILE *f = fopen(argv[1], "r");
    if(f == NULL) {
        printf("File does not exists\n");
        exit(0);
    }

    while(fgets(str, 100, f) != NULL)
        printf("%s", str);
    fclose(f);
    return 0;
}