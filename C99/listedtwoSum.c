#include <stdio.h>
#include <stdlib.h>

struct node {
    int val;
    struct node *next;
};

struct node *create_node(int val);
void add_node(struct node **head, int val);
void delete_list(struct node **head);
struct node *find(struct node *head, int val);
int* two_sum(struct node *head, int target);

int main(void) {
    struct node *head = NULL;
    int sum = 9;
    int* result = NULL;
    add_node(&head, 11);
    add_node(&head, 2);
    add_node(&head, 7);
    add_node(&head, 15);

    result = two_sum(head, sum);
    if (result != NULL) {
        printf("[%d, %d]\n", result[0], result[1]);
        free(result);
    } else {
        printf("No two sum solution.\n");
    }

    delete_list(&head);

    return 0;
}


struct node *create_node(int val) {
    struct node *new_node = (struct node *)malloc(sizeof(struct node));
    new_node->val = val;
    new_node->next = NULL;
    return new_node;
}

void add_node(struct node **head, int val) {
    struct node *new_node = create_node(val);
    new_node->next = *head;
    *head = new_node;
}

void delete_list(struct node **head) {
    while (*head != NULL) {
        struct node *temp = *head;
        *head = (*head)->next;
        free(temp);
    }
}

struct node *find(struct node *head, int val) {
    while (head != NULL) {
        if (head->val == val) {
            return head;
        }
        head = head->next;
    }
    return NULL;
}

int* two_sum(struct node *head, int target) {
    struct node *p1 = head;
    int index1 = 0;
    while (p1 != NULL) {
        struct node *p2 = p1->next;
        int index2 = index1 + 1;
        while (p2 != NULL) {
            if (p1->val + p2->val == target) {
                int* result = (int*)malloc(2 * sizeof(int));
                result[0] = index1;
                result[1] = index2;
                return result;
            }
            p2 = p2->next;
            index2++;
        }
        p1 = p1->next;
        index1++;
    }
    return NULL;
}

