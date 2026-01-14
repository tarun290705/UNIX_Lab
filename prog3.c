// 3. Write a C program to Demonstrate link(), unlink(), setjmp() and longjmp() APIs

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <setjmp.h>

jmp_buf buf;

void fun() {
    printf("Error occured, jumping back to set point\n");
    longjmp(buf, 1);
}

int main() {
    const char* filename = "example.txt";
    const char* linkname = "Example_link.txt";
    FILE *f = fopen(filename, "w");

    if(f == NULL) {
        printf("Error in creating file\n");
        exit(0);
    }

    if(link(filename, linkname) == -1) {
        printf("Error in creating link\n");
        exit(0);
    } else {
        printf("Link Created : %s -> %s\n", linkname, filename);
    }

    if(unlink(linkname) == -1) {
        printf("Error in removing the link\n");
        exit(0);
    } else {
        printf("Link removed : %s\n", linkname);
    }

    if(setjmp(buf) == 0) {
        printf("Setting jump point\n");
        fun();
    }

    unlink(filename);
    return 0;
}