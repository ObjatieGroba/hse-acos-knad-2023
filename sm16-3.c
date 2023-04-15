#include <stdio.h>
#include <stdlib.h>

struct Node {
    struct Node * next;
    int value;
};

// void push(struct Node **head);
struct Node * push_front(struct Node *head, int val) {
    struct Node * newHead = malloc(sizeof(*newHead));
    newHead -> next = head;
    newHead -> value = val;
    return newHead;
}

void clear(struct Node *head) {
    if (head == NULL) {
        return;
    }
    clear(head->next);
    free(head);
}

void clear2(struct Node *head) {
    while (head != NULL) {
        struct Node * next = head -> next;
//        free(head);
        head = head->next;
    }
}

int main() {
    struct Node * head = NULL;
    head = push_front(head, 1);
    head = push_front(head, 2);
    head = push_front(head, 3);

    clear2(head);
}
