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

typedef s32 b32;
typedef float f32;
typedef double f64;

#define array_count(a) (sizeof((a))/sizeof((a)[0]))

#define WIN32_LEAN_AND_MEAN
#include <windows.h>

void str8_to_upper_case_n(char *str, u64 count);
b32 is_even(s32 v);
void find_non_zero(s16 *array, u64 count);
int
main(void) {
  char str[] = "helloworld";
  u64 count = sizeof(str) - 1;
  str8_to_upper_case_n(str, count);
  
  s16 test_array[] = { 0, 0, 0, 0 };
  //s16 test_array[] = { 0, 0, 0, 1 };
  //s16 test_array[] = { 0, 0, 1, 0 };
  //s16 test_array[] = { 0, 1, 0, 0 };
  //s16 test_array[] = { 1, 0, 0, 0 };
  //s16 test_array[] = { 0, 6, 0, 0 };
  //s16 test_array[] = { 0, 6, 0, 1 };
  find_non_zero(test_array, array_count(test_array));
  //printf("%s, is_even: %d", str, is_even(2));
  ExitProcess(0);
}