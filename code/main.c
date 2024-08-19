#include <stdio.h>
#include <stdint.h>

typedef   uint8_t u8;
typedef    int8_t s8;
typedef uint16_t u16;
typedef  int16_t s16;
typedef uint32_t u32;
typedef  int32_t s32;
typedef uint64_t u64;
typedef  int64_t s64;

#define array_count(a) (sizeof((a))/sizeof((a)[0]))

#define WIN32_LEAN_AND_MEAN
#include <windows.h>

void str8_to_upper_case_n(char *str, u64 count);

int
main(void) {
  char str[] = "helloworld";
  u64 count = sizeof(str) - 1;
  str8_to_upper_case_n(str, count);
  
  printf("%s", str);
  ExitProcess(0);
}