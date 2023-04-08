#include <unistd.h>
#include <fcntl.h>
#include <stdlib.h>
#include <stdio.h>

ssize_t write_all(int fd, const char * buf, ssize_t nbytes) {
    ssize_t wrote_bytes = 0;
    while (nbytes > 0) {
        ssize_t one_write = write(fd, buf, nbytes);
        if (one_write <= 0) {
            return one_write;
        }
        wrote_bytes += one_write;
        nbytes -= one_write;
        buf += one_write;
    }
    return wrote_bytes;
}

int main() {
    int fd = open("output.txt", O_RDWR | O_CREAT | O_TRUNC, 0600);
    if (fd < 0) {
        exit(1);
    }

    // write(fd, "hello world", 11);
    char s[] = "hello world\n";
    ssize_t w = write_all(fd, s, sizeof(s) - 1);
    if (w < 0) {
        exit(1);
    }

//    dup2(fd, 1);

//    close(0);
//    open(...);

    close(1);
    fd = open("output.txt", O_RDWR, 0600);
    fprintf(stderr, "%d\n", fd);

    write_all(1, s, sizeof(s) - 1);

    close(fd);
}
