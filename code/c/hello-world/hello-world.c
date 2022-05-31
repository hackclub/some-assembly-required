// Simple C program to display "Hello World"

// We have 2 steps to run our program.
// 1. generate our executable
// 2. run our executable

// 1. generate our executable
// gcc is our compiler, -o is to specify executable file name
// gcc -o hello-world hello-world.c

// 2. run our executable
// ./hello-world

// gcc -o hello-world hello-world.c && ./hello-world

// Header file for input output functions
#include <stdio.h>

// main function -
// where the execution of program begins
int main() { // main returns an int because it expects a return code. see more below at the return
  // prints hello world to stdout
  // stands for "print formatted", giving you formatting options. we aren't using any here right now
  printf("Hello, world!");

  // the OS expects a return code to know if we were successful or if we had an error
  // returning 0 indicates a success
  // returning 1 indicates an error
  return 0;
}
