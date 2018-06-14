#include <stdio.h>

unsigned long long rdtscl() {
  unsigned int lo, hi;
  __asm__ __volatile__ ("rdtsc" : "=a"(lo), "=d"(hi));
  return (unsigned long long)lo | ((unsigned long long)hi << 32);
}

int main(int argc, char* argv[]) {
  unsigned long long t = rdtscl();
  printf("%lld\n", t);

  if (argc == 2) {
    FILE* log = fopen("/var/startup-log", "a");
    if (log) {
      fprintf(log, "%s, %lld\n", argv[1], t);
      fclose(log);
    }
    return log ? 0 : 1;
  }
  return 0;
}
