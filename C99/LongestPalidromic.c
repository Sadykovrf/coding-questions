#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char* longest_palindrome(char* s);

int main(void) {
    char s[] = "babad";
    char* longest_palindrome_str = longest_palindrome(s);
    printf("%s\n", longest_palindrome_str); // prints "bab"
    free(longest_palindrome_str);
    return 0;
}

char* longest_palindrome(char* s) {
    int n = strlen(s);
	char* longest_palindrome;
    int max_len = 0, start_idx = 0;
    for (int i = 0; i < n; i++) {
        for (int j = i; j < n; j++) {
            int left = i, right = j;
            while (left < right && s[left] == s[right]) {
                left++;
                right--;
            }
            if (left >= right && j - i + 1 > max_len) {
                max_len = j - i + 1;
                start_idx = i;
            }
        }
    }
    longest_palindrome = (char*)malloc(max_len + 1);
    strncpy(longest_palindrome, s + start_idx, max_len);
    longest_palindrome[max_len] = '\0';
    return longest_palindrome;
}
