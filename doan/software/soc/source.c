#include <stdio.h>
#include "io.h"
#include "system.h"
void main(){
//printf("test comple");
volatile int * ip =(int *) MULTIPLE_0_BASE;
*ip= 0x3;
*(ip+1)=0x2;
*(ip+2)=0x1;
*(ip+3)=0x2;
*(ip+4)=0xc;
printf("control = %d \n",*(ip+4));//
printf(" phep nhan vo huong vector (%d,%d)x(%d,%d)\n",*(ip),*(ip+1),*(ip+2),*(ip+3));
if(*(ip+6)==0x3)printf("da tinh toan xong\n");
else
	if(*(ip+6)==0x0) printf("he thong khong hoat dong\n");
printf("ket qua = %d \n",*(ip+5));




}

