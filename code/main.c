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

#define stringify_(s) #s
#define stringify(s) stringify_(s)
#define print_test_u64(fn_call) printf(stringify(fn_call)": %llu",fn_call)

void str8_to_upper_case_n(char *str, u64 count);
b32 is_even(s32 v);
void find_non_zero(s16 *array, u64 count);
s32 maximum_s32(s32 a, s32 b);

s32 maximum_s32_in_C(s32 a, s32 b) {
  s32 result = a;
  if (b > a) {
    result = b;
  }
  return(result);
}

b32 is_multiple_of_3_or_5_u64(u64 value);

u64 sum_of_multiples(u64 upto);
u64 sum_of_multiples_better(u64 upto);

u64 sum_of_multiples_in_C(u64 upto) {
  u64 result = 0;
  for (u64 index = 0; index < upto; ++index) {
    if (((index % 3) == 0) || ((index % 5) == 0)) {
      result += index;
    }
  }
  return(result);
}

void print_even_fib_numbers_in_C(u64 end) {
  u64 a = 1;
  u64 b = 2;
  
  while (end--) {
    printf("%llu\t", a);
    u64 temp = a;
    a = b;
    b = temp + b;
  }
}

void print_even_fib_numbers_4m_C(void) {
  u64 a = 1;
  u64 b = 2;
  u64 sum_of_even = 0;
  while (a < 4000000) {
    if ((a % 2) == 0) {
      sum_of_even += a;
    }
    
    u64 temp = a;
    a = b;
    b = temp + b;
  }
  
  printf("%llu\n", sum_of_even);
}

u64 add_even_fib_numbers_4m(void);

void print_to_screen(char *c, u64 char_count);

int
main(void) {
  //char str[] = "helloworld";
  //u64 count = sizeof(str) - 1;
  //str8_to_upper_case_n(str, count);
  
  //maximum_s32_in_C(100, 1000);
  //s16 test_array[] = { 0, 0, 0, 0 };
  //s16 test_array[] = { 0, 0, 0, 1 };
  //s16 test_array[] = { 0, 0, 1, 0 };
  //s16 test_array[] = { 0, 1, 0, 0 };
  //s16 test_array[] = { 1, 0, 0, 0 };
  //s16 test_array[] = { 0, 6, 0, 0 };
  //s16 test_array[] = { 0, 6, 0, 1 };
  //find_non_zero(test_array, array_count(test_array));
  //printf("%s, is_even: %d", str, is_even(2));
  
  //s32 a = maximum_s32_in_C(100, 0);
  //s32 a = maximum_s32(1000, 100);
  
  //print_test_u64(sum_of_multiples_better(1000));
  //print_even_fib_numbers_in_C(4000000);
  //print_even_fib_numbers_4m_C();
  //sum_of_multiples_in_C(100);
  //print_test_u64(add_even_fib_numbers_4m());
  
  char test[] = "HI WORLD";
  print_to_screen(test, sizeof(test) - 1);
  ExitProcess(0);
}