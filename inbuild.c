#include<stdio.h>
#include<malloc.h>
#include<string.h>

long long FUNCTION_size(long long* a) {
    return *(a - 1);
}

void FUNCTION_print(char a[]) {
    printf("%s", a);
}

void FUNCTION_println(char a[]) {
    puts(a);
}

char* FUNCTION_getString() {
    char *str = (char*) malloc(256);
    scanf("%s", str);
    return str;
}

char* FUNCTION_toString(long long num) {
    int neg = 0, len = 0;
    if (num < 0) {
        neg = 1;
        num = -num;
    }
    int digits[20];
    if (num == 0) {
        digits[++len] = 0;
    }
    else {
        while (num != 0) {
            digits[++len] = num % 10;
            num /= 10;
        }
    }
    char *str = (char*) malloc((len + neg) / 8 * 8 + 8);
    if (neg) str[0] = '-';
    for (int i = 0; i < len; ++i)
        str[i + neg] = digits[len - i] + '0';
    str[len + neg] = 0;
    return str;
}

long long CLASS_string_MEMBER_length(char* str) {
    return strlen(str);
}

char* CLASS_string_MEMBER_substring(char *str, int l, int r) {
    int len = r - l + 1;
    char *subStr = (char*) malloc(len / 8 * 8 + 8);
    str += l;
    for (int i = 0; i < len; ++i)
        subStr[i] = str[i];
    subStr[len] = 0;
    return subStr;
}

long long CLASS_string_MEMBER_parseInt(char *str) {
    int neg = 0;
    int i = 0;
    while (str[i] < '0' || str[i] > '9')
    {
        if (str[i++] == '-') neg = 1;
    }
    long long num = str[i++] - '0';
    while (str[i] >= '0' && str[i] <= '9')
    {
        num = num * 10 + str[i++] - '0';
    }
    if (neg) return -num;
    return num;
}

long long FUNCTION_getInt() {
    return CLASS_string_MEMBER_parseInt(FUNCTION_getString());
}

long long CLASS_string_MEMBER_ord(char *str, int idx) {
    return (long long)(*(char *)(str + idx));
}

char* FUNCTION_string_concat(char *str1, char *str2) {
    int len1 = strlen(str1), len2 = strlen(str2);
    char *catStr = (char*) malloc((len1 + len2) / 8 * 8 + 8);
    int now = 0;
    for (int i = 0; i < len1; ++i)
        catStr[now++] = str1[i];
    for (int i = 0; i < len2; ++i)
        catStr[now++] = str2[i];
    catStr[now] = 0;
    return catStr;
}

long long FUNCTION_string_equal(char *str1, char *str2) {
    return strcmp(str1, str2) == 0;
}

long long FUNCTION_string_notequal(char *str1, char *str2) {
    return strcmp(str1, str2) != 0;
}

long long FUNCTION_string_lt(char *str1, char *str2) {
    return strcmp(str1, str2) < 0;
}

long long FUNCTION_string_leq(char *str1, char *str2) {
    return strcmp(str1, str2) <= 0;
}

long long FUNCTION_string_gt(char *str1, char *str2) {
    return strcmp(str1, str2) > 0;
}

long long FUNCTION_string_geq(char *str1, char *str2) {
    return strcmp(str1, str2) >= 0;
}

