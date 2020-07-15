#include <stdio.h>
#include <stdlib.h>
#include <string.h>

uint8_t* flipString(uint8_t* str, int strlen);
struct FlipedStringStructure* flipStringToStruct(uint8_t* str, int strlen);



void freeSMemmory(struct FlipedStringStructure* s);
void freeMemmory(void* s);


struct FlipedStringStructure {
    void *result;
    int resultSize;
};
