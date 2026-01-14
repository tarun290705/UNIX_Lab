// 2. Write C program to implement copy command using general File APIs.

#include <stdio.h>
#include <stdlib.h>
#define BUFFER_SIZE 4096

int main(int argc, char* argv[]) {
    if(argc != 3) {
        printf("Syntax : ./a.out <source-file> <destination-file>\n");
        exit(0);
    }

    FILE *src, *dest;
    char buf[BUFFER_SIZE];
    size_t bytes;

    src = fopen(argv[1], "rb");
    if(src == NULL) {
        printf("Error in opening source file\n");
        exit(0);
    }

    dest = fopen(argv[2], "rb");
    if(dest == NULL) {
        printf("Error in opening destination file\n");
        fclose(src);
        exit(0);
    }

    dest = fopen(argv[2], "wb");
    while((bytes=fread(buf, 1, BUFFER_SIZE, src)) > 0)
        fwrite(buf, 1, bytes, dest);

    if(ferror(src))
        printf("Error in reading from source file\n");

    if(ferror(dest))
        printf("Error in writing to destination file\n");

    printf("Copy successfull!\n");
    fclose(src);
    fclose(dest);
    return 0;
}