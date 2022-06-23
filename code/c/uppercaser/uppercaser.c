// ==================================================================================
// UPPERCASER
//
// Uppercases your command line arguments and prints them out!
// Written as a working example of a C program to compare to uppercaser-mac.asm
// ==================================================================================

// gcc -o uppercaser uppercaser.c && ./uppercaser

#include <ctype.h>
#include <string.h>
#include <stdio.h>

/* function declarations */
void print_number_of_args(int num_args);
void print_argument(char *arg);

int main(int argc, char **argv) {
  // Uncomment this to print out number of arguments
  // printNumberOfArgs(argc);

  // Our first argument is the path used to run the program
  // In this case, that's ./uppercaser
  // We only want to print out additional command line arguments, so let's skip
  // our first argument
  if (argc > 1) {
    for (int i = 1; i < argc; i++) {
      print_argument(argv[i]);
    }
  } else {
    printf("No arguments passed!\n");
  }

  return 0;
}

void print_number_of_args(int num_args) {
  printf("%i\n", num_args);
}

void print_argument(char *arg) {
  for (int i = 0; i < strlen(arg); i++) {
    arg[i] = toupper(arg[i]);
  }

  printf("%s\n", arg);
}
