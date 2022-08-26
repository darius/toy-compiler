#include <assert.h>
#include <ctype.h>
#include <errno.h>
#include <limits.h>
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void
error (const char *format, ...)
{
  va_list args;
  va_start (args, format);
  vfprintf (stderr, format, args);
  va_end (args);
  fprintf (stderr, "\n");
  exit (1);
}

void 
stdlib_error (const char *complaint)
{
  error ("%s: %s", complaint, strerror (errno));
}

void *
allot (size_t size)
{
  void *result = malloc (size);
  if (!result && size != 0)
    stdlib_error("Out of memory");
  return result;
}

FILE *
open_file (const char *filename, const char *mode)
{
  if (strcmp (filename, "-") == 0)
    {
      assert (mode [0] == 'r' || mode [0] == 'w' || mode [0] == 'a');
      return mode [0] == 'r' ? stdin : stdout;
    }
  else
    {
      FILE *result = fopen (filename, mode);
      if (!result)
	stdlib_error (filename);
      return result;
    }
}

/*
int
parse_int (const char *text)
{
  return (int) strtol (text, NULL, 10);
}
*/

/* Since the interface to strtol can't reliably report errors,
   we have this little replacement: */

int
parse_int (const char *text)
{
  int max_significant_digits = 10; /* 32 bits, base 10 */
  int negative = 0;
  unsigned prev = 0, magnitude = 0;

  /* Skip leading blanks, sign, and insignificant 0's. */
  const char *start = text;
  while (isspace (*start))
    ++start;
  if (*start == '-')
    {
      negative = 1;
      ++start;
    }
  while (*start == '0')
    ++start;

  if (!isdigit (*start) && (start == text || start [-1] != '0'))
    error ("Not an int -- parse_int '%s'", text);

  {
    /* Convert the digits. */
    const char *scan = start;
    for (; isdigit (*scan); ++scan)
      prev = magnitude, magnitude = 10 * magnitude + *scan - '0';

    /* Check for trailing garbage. */
    {
      const char *trailing = scan;
      while (isspace (*trailing))
	++trailing;
      if (*trailing)
	error ("Trailing garbage -- parse_int '%s'", text);
    }

    /* Check for overflow. */
    if (max_significant_digits < scan - start
	|| (max_significant_digits == scan - start
	    && (magnitude < magnitude - (scan [-1] - '0')
		|| prev != magnitude / 10
		|| (!negative && INT_MAX < magnitude)
		|| ( negative && (unsigned)INT_MAX + 1 < magnitude))))
      error ("Overflow -- parse_int '%s'", text);

    return negative ? - (int) magnitude : (int) magnitude;       /* right? */
  }
}
