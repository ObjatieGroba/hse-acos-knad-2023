#include <unistd.h>
#include <stdio.h>
#include <fcntl.h>

int main(int argc, char **argv) {
    int fdin = open(argv[1], O_RDONLY);
    dup2(fdin, STDIN_FILENO);
    close(fdin);
    int fdout = open(argv[2], O_WRONLY | O_CREAT | O_TRUNC, 0600);
    dup2(fdout, STDOUT_FILENO);
    close(fdout);
//     printf("abacaba\n");
    execvp(argv[3], argv + 3);
}
