#include <stdio.h>
#include <unistd.h>
#include <signal.h>
#include <stdlib.h>

sig_atomic_t flag = 0;

void handler(int sig) {
    flag = sig;
    signal(sig,  handler);
    exit(1);
}

int main(int argc, char *argv[]) {
    signal(SIGINT,  handler);
    signal(SIGSEGV, handler);

    for (;;) {
        if (flag != 0) {
            printf("Caught %d\n", flag);
            fflush(stdout);
            flag = 0;
        }
    }
    kill()
    return 0;
}
