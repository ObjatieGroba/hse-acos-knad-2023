#include <stdio.h>

// int main(int argc, char **argv, char**env) {
//     while (*env) {
//         printf("%s\n", *env);
//         ++env;
//     }
// }

#include <sys/types.h>
#include <sys/wait.h>
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>

void process_print() {
	pid_t pid;
  	pid = fork();
    if (pid == 0) {
    	  /// Child
        int number;
        scanf("%d", &number);
        if (number == 0) {
          	printf("%d %d\n", number, getpid());
          	exit(0);
        	return;
        } else {
          	process_print();
          	wait(NULL);
          	printf("%d %d\n", number, getpid());
          	exit(0);
        }
    }
}

int main() {
    process_print();
    wait(NULL);
}

