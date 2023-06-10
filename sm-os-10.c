#include <sys/socket.h>
#include <sys/types.h>
#include <netdb.h>
#include <unistd.h>
#include <stdio.h>

int main() {
    int sock = socket(AF_INET, SOCK_STREAM, 0);

//    struct sockaddr_in addr;
//    addr.sin_family = AF_INET;
//    addr.sin_port = htons(8080);
//    addr.sin_addr.s_addr = htonl(1 + 256 * 0 + 256 * 256 * 0 + 256 * 256 * 256 * 127);  /// 127.0.0.1
//
//    printf("%d\n", connect(sock, (const struct sockaddr *)&addr, sizeof(addr)));
//
//    write(sock, "abacaba\n", 8);
//
//    char buf[1024];
//    read(sock, buf, sizeof(buf));
//    printf("%s", buf);


    struct sockaddr_in addr;
    addr.sin_family = AF_INET;
    addr.sin_port = htons(8080);
    addr.sin_addr.s_addr = INADDR_ANY;

    bind(sock, (void*)&addr, sizeof(addr));

    listen(sock, 16);

    int clint_fd = accept(sock, NULL, NULL);

    write(clint_fd, "abacaba\n", 8);

    char buf[1024];
    read(clint_fd, buf, sizeof(buf));
    printf("%s", buf);
}
