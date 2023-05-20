#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>


void* threads_print(void*) {
    int number;
    scanf("%d", &number);
  	if (number == 0) {
        return NULL;
    }
    pthread_t t;
  	pthread_create(&t, NULL, threads_print, NULL);
  	pthread_join(t, NULL);
    printf("%d\n", number);
    return NULL;
}

int main() {
    threads_print(NULL);

    /// printf(...) == fprintf(stdin, ...)
}

