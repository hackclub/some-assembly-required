// ==================================================================================
// UPPERCASER
//
// Uppercases your command line arguments and prints them out!
// Written as a working example of a C program to compare to assembly programs
// ==================================================================================

// gcc -o uppercaser uppercaser.c && ./uppercaser

#include <ctype.h>
#include <string.h>
#include <stdio.h>

/* function declarations */
void printNumberOfArgs(int numberOfArgs);
void printArgument(char *arg);

int main(int argc, char **argv) {
  // Uncomment this to print out number of arguments
  // printNumberOfArgs(argc);

  // Our first argument is the program we're running
  // In this case, that's ./uppercaser.c
  // We only want to print out additional command line arguments, so let's skip
  // our first argument
  if (argc > 1) {
    for (int i = 1; i < argc; i++) {
      printArgument(argv[i]);
    }
  } else {
    printf("No arguments passed!\n");
  }

  return 0;
}

void printNumberOfArgs(int numberOfArgs) {
  printf("%i\n", numberOfArgs);
}

void printArgument(char *arg) {
  for (int i = 0; i < strlen(arg); i++) {
    arg[i] = toupper(arg[i]);
  }

  printf("%s\n", arg);
}
