#include "libasm.h"

#include <assert.h>
#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>


int main(void)
{
    printf("atoibase %d\n",ft_atoi_base("0A", "0123456789ABCDEF"));
    printf("atoibase %d\n",ft_atoi_base("1010", "01"));
    printf("atoibase %d\n",ft_atoi_base("10", "0123456789"));

    // printf("checkchar %d\n", _check_char('\t'));
    printf("atoibase %d\n",ft_atoi_base("0A", "0123456+789ABCDEF"));
    printf("atoibase %d\n",ft_atoi_base("1010", "011"));
    printf("atoibase %d\n",ft_atoi_base("1", "\t1"));
    printf("atoibase %d\n",ft_atoi_base("10", "1"));





}

// static int sign(int x)
// {
//     return (x > 0) - (x < 0);
// }

// static void test_strings(void)
// {
//     char dest[128];
//     char large[8193];
//     char *copy;
//     unsigned char high1[] = {0x80, 0};
//     unsigned char high2[] = {0x7f, 0};

//     assert(ft_strlen("") == strlen(""));
//     printf("|\n");
//     printf("| ft_strlen(\"\") = %ld && strlen(\"\") = %ld\n", ft_strlen(""), strlen(""));
//     assert(ft_strlen("42 libasm") == strlen("42 libasm"));
//     printf("| ft_strlen(\"42 libasm\") = %ld && strlen(\"42 libasm\") = %ld\n", ft_strlen("42 libasm"), strlen("42 libasm"));
//     memset(large, 'X', sizeof(large) - 1);
//     large[sizeof(large) - 1] = '\0';
//     assert(ft_strlen(large) == strlen(large));
//     printf("| ft_strlen(large) = %ld && strlen(large) = %ld\n", ft_strlen(large), strlen(large));

//     assert(ft_strcpy(dest, "") == dest);
//     assert(strcmp(dest, "") == 0);
//     printf("|\n");
//     printf("| ft_strcpy(dest, \"\") = \"%s\" && strcmp(dest, \"\") = %d\n", ft_strcpy(dest, ""), strcmp(dest, ""));
//     assert(ft_strcpy(dest, "Hello, 42!") == dest);
//     assert(strcmp(dest, "Hello, 42!") == 0);
//     printf("| ft_strcpy(dest, \"Hello, 42!\") = \"%s\" && strcmp(dest, \"Hello, 42!\") = %d\n", ft_strcpy(dest, "Hello, 42!"), strcmp(dest, "Hello, 42!"));

//     assert(sign(ft_strcmp("", "")) == sign(strcmp("", "")));
//     assert(sign(ft_strcmp("abc", "abc")) == sign(strcmp("abc", "abc")));
//     assert(sign(ft_strcmp("abc", "abd")) == sign(strcmp("abc", "abd")));
//     assert(sign(ft_strcmp("abd", "abc")) == sign(strcmp("abd", "abc")));
//     assert(sign(ft_strcmp("ab", "abc")) == sign(strcmp("ab", "abc")));
//     assert(sign(ft_strcmp("abc", "ab")) == sign(strcmp("abc", "ab")));
//     assert(sign(ft_strcmp((char *)high1, (char *)high2)) ==
//            sign(strcmp((char *)high1, (char *)high2)));

//     copy = ft_strdup("");
//     printf("|\n");
//     printf("| ft_strdup(\"\") = \"%s\"\n", copy);
//     assert(copy != NULL && strcmp(copy, "") == 0);
//     free(copy);
//     copy = ft_strdup("duplicate me");
//     printf("| ft_strdup(\"duplicate me\") = \"%s\"\n", copy);
//     assert(copy != NULL && strcmp(copy, "duplicate me") == 0);
//     assert(copy != (char *)"duplicate me");
//     copy[0] = 'D';
//     assert(strcmp(copy, "Duplicate me") == 0);
//     free(copy);
// }

// static void test_io(void)
// {
//     int pipefd[2];
//     char buffer[64] = {0};
//     const char *message = "libasm pipe test";
//     ssize_t n;

//     assert(pipe(pipefd) == 0);
//     n = ft_write(pipefd[1], message, strlen(message));
//     assert(n == (ssize_t)strlen(message));
//     assert(ft_write(pipefd[1], "", 0) == 0);
//     n = ft_read(pipefd[0], buffer, sizeof(buffer));
//     assert(n == (ssize_t)strlen(message));
//     assert(memcmp(buffer, message, strlen(message)) == 0);
//     close(pipefd[1]);
//     assert(ft_read(pipefd[0], buffer, sizeof(buffer)) == 0);
//     close(pipefd[0]);

//     errno = 0;
//     assert(ft_write(-1, message, strlen(message)) == -1);
//     assert(errno == EBADF);
//     errno = 0;
//     assert(ft_read(-1, buffer, sizeof(buffer)) == -1);
//     assert(errno == EBADF);
// }

// static void test_args(char *str)
// {
//     char dest[128];
//     ssize_t n;

//     printf("=====================================\n");
//     printf("|   ------\033[33mTests personalisÃ©s\033[0m------\n");
//     printf("|\n");
//     printf("| arguments : \033[32m%s\033[0m\n", str);
//     printf("|\n");
//     printf("| Test :\n|\n");
//     printf("| ft_read ->\033[32m ");
//     fflush(stdout);
//     n = ft_read(0, dest, ft_strlen(str));
//     printf("\033[0m| \033[34m%zd\033[0m\n", n);
//     printf("| read    ->\033[32m ");
//     fflush(stdout);
//     n = read(0, dest, ft_strlen(str));
//     printf("\033[0m| \033[34m%zd\033[0m\n|\n", n);
//     printf("| ft_strcmp -> \033[32m%d\033[0m\n", ft_strcmp(str, "Hello, 42!"));
//     printf("| strcmp -> \033[32m%d\033[0m\n|\n", strcmp(str, "Hello, 42!"));
//     printf("| ft_strcpy -> \033[32m%s\033[0m\n", ft_strcpy(dest, str));
//     printf("| strcpy -> \033[32m%s\033[0m\n|\n", strcpy(dest, str));
//     printf("| ft_strdup -> \033[32m%s\033[0m\n", ft_strdup(str));
//     printf("| strdup -> \033[32m%s\033[0m\n|\n", strdup(str));
//     printf("| ft_strlen -> \033[32m%ld\033[0m\n", ft_strlen(str));
//     printf("| strlen -> \033[32m%ld\033[0m\n|\n", strlen(str));
//     printf("| ft_write  ->\033[32m ");
//     fflush(stdout);
//     n = ft_write(0, dest, ft_strlen(str));
//     printf("\n\033[0m| \033[34m%ld\033[0m\n", n);
//     printf("| write  ->\033[32m ");
//     fflush(stdout);
//     n = write(0, dest, ft_strlen(str));
//     printf("\n\033[0m| \033[34m%ld\033[0m\n", n);

// }

// int main(int ac, char **av)
// {
//     if (ac == 2)
//         test_args(av[1]);
//     else if (ac > 1)
//         printf("[\033[31mKO\033[0m] Il y a trop d'arguments !\nusage: ./<executable de test> <arguments>\n");
//     printf("=====================================\n");
//     printf("|   ------\033[33mTests automatiques\033[0m------\n");
//     test_strings();
//     test_io();
//     printf("|\n");
//     printf("| [\033[32mOK\033[0m] Les six fonctions obligatoires de libasm passent les tests.\n");
//     printf("=====================================\n");
//     return 0;
// }


// int main(void)
// {
// 	char *cpy = malloc(sizeof(char) * 14);
// 	char *ft_cpy = malloc(sizeof(char) * 14);
// 	int len = 0;

// 	printf("strlen\n");
// 	printf("--------------------\n");
// 	printf("ft_strlen(\"test 42\") = %li\n", ft_strlen("test 42"));
// 	printf("strlen(\"test 42\") = %li\n", strlen("test 42"));
// 	printf("--------------------\n\n");

// 	printf("strcpy\n");
// 	printf("--------------------\n");
// 	strcpy(cpy, "hello world !");
// 	printf("strcpy(\"hello world !\", cpy) = %s\n", cpy);
// 	ft_strcpy(ft_cpy, "hello world !");
// 	printf("ft_strcpy(\"hello world !\", ft_cpy) = %s\n", ft_cpy);
// 	printf("--------------------\n\n");

// 	printf("strcmp\n");
// 	printf("--------------------\n");
// 	printf("ft_strcmp(\"test 42\", \"test 42\") = %i\n", ft_strcmp("test 42", "test 42"));
// 	printf("strcmp(\"test 42\", \"test 42\") = %i\n", strcmp("test 42", "test 42"));
// 	printf("\n");
// 	printf("ft_strcmp(ft_cpy, cpy) = %i\n", ft_strcmp(ft_cpy, cpy));
// 	printf("strcmp(ft_cpy, cpy) = %i\n", strcmp(ft_cpy, cpy));
// 	printf("\n");
// 	printf("ft_strcmp(\"test 42\", \"test 43\") = %i\n", ft_strcmp("test 42", "test 43"));
// 	printf("strcmp(\"test 42\", \"test 43\") = %i\n", strcmp("test 42", "test 43"));
// 	printf("\n");
// 	printf("ft_strcmp(\"test 42\", \"tes\") = %i\n", ft_strcmp("test 42", "tes"));
// 	printf("strcmp(\"test 42\", \"tes\") = %i\n", strcmp("test 42", "tes"));
// 	printf("\n");
// 	printf("ft_strcmp(\"test 42\", \"tes\") = %i\n", ft_strcmp("test 42", "tes"));
// 	printf("strcmp(\"test 42\", \"tes\") = %i\n", strcmp("test 42", "tes"));
// 	printf("--------------------\n\n");

// 	printf("write\n");
// 	printf("--------------------\n\n");
// 	len = ft_write(1, "hello world\n", ft_strlen("hello world\n"));
// 	printf("ft_write(1, \"hello world\\n\", ft_strlen(\"hello world\")) = %i\n", len);
// 	len = write(1, "hello world\n", strlen("hello world\n"));
// 	printf("write(1, \"hello world\\n\", strlen(\"hello world\")) = %i\n", len);
// 	printf("\n");
// 	len = ft_write(6, "hello world\n", ft_strlen("hello world\n"));
// 	printf("ft_write(6, \"hello world\\n\", ft_strlen(\"hello world\")) = %i\n", len);
// 	len = write(6, "hello world\n", strlen("hello world\n"));
// 	printf("write(6, \"hello world\\n\", strlen(\"hello world\")) = %i\n", len);
	
// 	printf("--------------------\n\n");


	

// }