#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int lengthOfLongestSubstring(char *s);

int lengthOfLongestSubstring(char *s) {
    int n = strlen(s);
    int charIndex[128] = {0};
    int maxLength = 0, currentLength = 0, currentCharIndex = 0;
	char currentChar;
    
    for (int i = 0; i < n; i++) {
        currentChar = s[i];
        currentCharIndex = charIndex[(int)currentChar];
        if (currentCharIndex > 0 && i - currentCharIndex <= currentLength) {
            if (currentLength > maxLength) {
                maxLength = currentLength;
            }
            currentLength = i - currentCharIndex;
        }
        currentLength++;
        charIndex[(int)currentChar] = i + 1;
    }
    if (currentLength > maxLength) {
        maxLength = currentLength;
    }
    return maxLength;
}

int main(void) {
    int length;
	char s[50000];
    char *pos;
	int n = 0;
	
    printf("Enter a string: ");
    if (fgets(s, sizeof(s), stdin) != NULL) {
		n = strlen(s);
        if (n > 50000) {
            printf("Error: input string length is too long\n");
			return -1;
        }
		if ((pos=strchr(s, '\n')) != NULL) {
            *pos = '\0';
        }
        printf("The entered string is: %s", s);
    }
    else {
        printf("Error reading the string\n");
		return -2;
    }
    length = lengthOfLongestSubstring(s);
    printf("\n%d\n", length);
    return 0;
}
