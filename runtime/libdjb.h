#include <stdio.h>

void
error (const char *format, ...);

void 
stdlib_error (const char *complaint);

void *
allot (size_t size);

FILE *
open_file (const char *filename, const char *mode);

int
parse_int (const char *text);

