#include <stdio.h>
#include <unistd.h>
#include <signal.h>

//char buf[4096]
//size_t last;
//
//void myprintf(char * str) {
////    .lock()
//    size_t size = strlen(str);
//    auto tmp = last;
//    last += size;
//    strcpy(buf + tmp, str, size);
////    .unlock()
//}

sig_atomic_t x = 0;

void handler(int sig) {
    printf("Caught %d\n", sig);
    ++x;
}

int main(int argc, char *argv[]) {
    signal(SIGINT,  handler);
    signal(SIGSEGV, handler);

    int i;
    for (i = 0;; i++) {
        if (x == 0) {
            ///
        }
        printf("%d %d\n", i, x);
    }
}
