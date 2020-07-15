#include "MyCFile.h"

uint8_t* flipString(uint8_t* str, int strlen){
  uint8_t* result = malloc(strlen);
  int i;
  int j=0;
  for(i = strlen-1; i>=0; --i){
      result[j] = str[i];
      j++;
  }
  return result;
}


struct FlipedStringStructure* flipStringToStruct(uint8_t* str, int strlen){
    uint8_t* result = malloc(strlen);
    int i;
    int j=0;
    for(i = strlen-1; i>=0; --i){
        result[j] = str[i];
        j++;
    }

    struct FlipedStringStructure* structure;
    structure = malloc(sizeof(struct FlipedStringStructure));
    structure->resultSize=j;
    structure->result = malloc(j);
    memcpy(structure->result,result,j);
    free(result);
    return structure;

}

void freeMemmory(void* s){
    free(s);
}
void freeSMemmory(struct FlipedStringStructure* s){
    free(s);
}
