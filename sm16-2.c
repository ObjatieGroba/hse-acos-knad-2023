#include <stdio.h>
#include <stdlib.h>

typedef struct Point {
    double x;
    double y;
} Point;

int main() {
    int n = 0;
    if (scanf("%d", &n) != 1) {
        return 1;
    }
    Point * storage = malloc(sizeof(*storage) * n);
    for (int i = 0; i < n; ++i) {
        scanf("%lf%lf", &storage[i].x, &storage[i].y);
    }
    printf("%lf %lf\n", storage[0].x, storage[0].y);
    free(storage);
}
