#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int lengthOfLongestSubstring(char *s);

int lengthOfLongestSubstring(char *s) {
    int n = strlen(s);
    int maxLength = 0;
    int start = 0;
    int end = 0;
    int charIndex[128] = {0};
    int currentCharIndex;
	char currentChar;
	int length;
	
    while (end < n) {
        currentChar = s[end];
        currentCharIndex = charIndex[currentChar];
        if (currentCharIndex > 0 && currentCharIndex >= start) {
            start = currentCharIndex;
        }
        length = end - start + 1;
        if (length > maxLength) {
            maxLength = length;
        }
        charIndex[currentChar] = end + 1;
        end++;
    }

    return maxLength;
}

int main(void) {
    const char *s = "abcabcbb";
    int length;
    length = lengthOfLongestSubstring(s);
    printf("%d\n", length);
    return 0;
}
