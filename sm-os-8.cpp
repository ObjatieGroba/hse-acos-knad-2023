#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <pthread.h>
#include <atomic>
#include <iostream>


int* data;
std::atomic<long long> sum[8 * 5]{};

void* part_sum(void *arg) {
    size_t current = *(size_t*)arg;
    size_t end = *(((size_t*)arg) + 1);
    size_t i = *(((size_t*)arg) + 2);
    // printf("current: %zu, end: %zu\n", current, end);
    while (current < end) {
        sum[i] += data[current];
        ++current;
    }

    return NULL;
}


int main() {
    size_t data_size;
    srand(time(NULL));
    scanf("%zd", &data_size);
    // data_size = 500000000;

    data = (int*) malloc(data_size * sizeof(int));
    if (!data) {
        perror("can't allocate memory");
        exit(-1);
    }
    for (int i = 0; i < data_size; ++i) {
        data[i] = rand() % 1000;
        // data[i] = i + 1;
    }
//    for (int i = 0; i < data_size; ++i) {
//        printf("%d ", data[i]);
//    }
//    printf("\n");

    int thread_count = 4;
    pthread_t t[thread_count];
    size_t args[thread_count * 3];
    size_t thread_work_size = data_size / thread_count;

    for (int i = 0; i < thread_count; ++i) {
        args[i * 3] = thread_work_size * i;
        args[i * 3 + 1] = thread_work_size * (i + 1);
        args[i * 3 + 2] = i * 8;
        if (i == thread_count - 1) {
            args[i * 3 + 1] = data_size;
        }
        int s = pthread_create(&t[i], NULL, part_sum, args + i * 3);
        if (s != 0) {
            perror("pthread_create");
            return -1;
        }
    }
    long long ssum = 0;
    for (int i = 0; i < thread_count; ++i) {
        int s = pthread_join(t[i], NULL);
        ssum += sum[i * 8];
        if (s != 0) {
            perror("pthread_join");
            return -1;
        }
    }

    std::cout << "Resulting sum: " <<  ssum << std::endl;

    free(data);
}