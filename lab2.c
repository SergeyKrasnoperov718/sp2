#include <stdio.h>

int main (){
  int arr[10] = {138, 42, 13, 16, 4, 85, 21, 17, 18, 15};
  int sum = 0;
  
  for (int i=0; i<10; i++){
    if (arr[i] < 128){
      sum += arr[i];
    }else{
       arr[i] = (arr[i] * (-1)) + 255;
       sum += arr[i];
    }
  }
  printf ("%d \n", sum);
  return 0;
}
