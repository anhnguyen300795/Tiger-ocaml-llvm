#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

int yield_seed = 0;
#define Color_Red "\x1b[31m"
#define Color_end "\x1b[0m"

/*
  IMPORTANT NOTE: CLOSURE CALLING CONVENTION OF TIGER ALWAYS PASS CONTEXT OF TYPE char*
  AS FIRST ARGUMENT TO ANY FUNCTION CALL 
  => ALL FUNCTIONS CALLED BY TIGER PROGRAM MUST HAVE FIRST DUMMY (NEVER USED) ARGUMENT OF TYPE char*
 */
extern void tig_print(const char *ctx, const char *s)
{
   puts(s);
}

extern int tig_random(const char *ctx, const int upper)
{
  /* Intializes random number generator */
  if(yield_seed == 0) {
    srand(time(NULL));
    yield_seed = 1;
  }

  return rand() % upper;
}


extern void tig_print_int(const char *ctx, const int i)
{
   printf("%d\n", i);
}

extern void tig_flush(const char *ctx)
{
   fflush(stdout);
}

extern char *tig_getchar(const char *ctx)
{
   char *s = malloc(sizeof(char) * 2);
   s[0] = getchar();
   s[1] = '\0';
   return s;
}

extern int tig_ord(const char *ctx, const char *s)
{
   return *s;
}

extern char *tig_chr(const char *ctx, const int i)
{
   char* s = malloc(sizeof(char) * 2);
   s[0] = i;
   s[1] = '\0';
   return s;
}

extern int tig_nillable(const char *ctx, const char *s)
{
  return s == NULL;
}

extern void tig_check_null_pointer(const char *ctx, const char *s, const char *msg)
{
  if (tig_nillable(NULL, s) == 1) {
    tig_print(NULL, msg);
    exit(1);
  }
}

extern int tig_array_length(const char *ctx, const char *s)
{
  return s[0];
}

extern void tig_check_array_bound(const char *ctx, const char *s, const int index, const char *msg)
{
  int size = s[0];
  if (index >= size) {
    tig_print(NULL, msg);
    exit(1);
  }
}

extern void print_arr_int_ele(const char *ctx, const int s)
{
  printf("%d, ", s);
}

extern int tig_size(const char *ctx, const char *s)
{
   return strlen(s);
}

extern int tig_string_cmp(const char *ctx, const char *a, const char *b)
{
  return strcmp (a, b) == 0;
}

extern char *tig_substring(const char *ctx, const char *s, const int start, const int len)
{
   char *sub = malloc(sizeof(char) * (len + 1));
   strncpy(sub, s + start, len);
   sub[len] = '\0';
   return sub;
}

extern char *tig_concat(const char *ctx, const char *s1, const char *s2)
{
   const int len1 = strlen(s1);
   const int len2 = strlen(s2);
   char *s = malloc(sizeof(char) * (len1 + len2 + 1));
   strcpy(s, s1);
   strcpy(s + len1, s2);
   s[len1 + len2] = '\0';
   return s;
}

extern int tig_not(const char *ctx, const int i)
{
   return !i;
}

extern void tig_exit(const char *ctx, const int i)
{
   exit(i);
}

extern int *tig_init_array(const char *ctx, int size, int init)
{
  int i;
  int *a = (int *)malloc(size*sizeof(int));
  
  int n = a[0];
  for(i=0;i<size;i++) a[i]=init;
  return a;
}

extern int *tig_init_record (const char *ctx, int size)
{
  int i;
  int *a = (int *)malloc(size*sizeof(int));
  return a;
}

extern void assert_equal_int(const char *ctx, const int actual, const int expected)
{
  if (actual != expected) {
    printf("%sExpect %d to be %d %s\n", Color_Red, actual, expected, Color_end);
    exit(1);
  }
}

extern void assert_equal_string(const char *ctx, const char *actual, const char *expected)
{
  if (tig_string_cmp(NULL, actual, expected) == 0) {
    printf("%sExpect \"%s\" to be \"%s\" %s\n", Color_Red, actual, expected, Color_end);
    exit(1);
  }
}
