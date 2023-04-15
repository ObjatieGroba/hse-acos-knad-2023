#include <stdio.h>
#include <stdlib.h>

int main() {
    int n = 0;
    if (scanf("%d", &n) != 1) {
        return 1;
    }
    int * storage = malloc(sizeof(*storage) * n);
    for (int i = 0; i < n; ++i) {
        scanf("%d", &storage[i]);
        // scanf("%d", storage + i);
    }
    for (int i = 0; i < n; i += 2) {
        storage[i] *= 2;
        printf("%d\n", storage[i]);
    }
}
