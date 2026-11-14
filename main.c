#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

size_t ft_strlen(const char *str);
char *ft_strcpy(char *dest, const char *src);
int ft_strcmp(const char *s1, const char *s2);
ssize_t ft_write(int fd, const void *buf, size_t nbyte);
ssize_t ft_read(int fd, void *buf, size_t count);
char *ft_strdup(const char *s);

int main(void)
{
	char *cpy = malloc(sizeof(char) * 14);
	char *ft_cpy = malloc(sizeof(char) * 14);
	int len = 0;

	printf("strlen\n");
	printf("--------------------\n");
	printf("ft_strlen(\"test 42\") = %li\n", ft_strlen("test 42"));
	printf("strlen(\"test 42\") = %li\n", strlen("test 42"));
	printf("--------------------\n\n");

	printf("strcpy\n");
	printf("--------------------\n");
	strcpy(cpy, "hello world !");
	printf("strcpy(\"hello world !\", cpy) = %s\n", cpy);
	ft_strcpy(ft_cpy, "hello world !");
	printf("ft_strcpy(\"hello world !\", ft_cpy) = %s\n", ft_cpy);
	printf("--------------------\n\n");

	printf("strcmp\n");
	printf("--------------------\n");
	printf("ft_strcmp(\"test 42\", \"test 42\") = %i\n", ft_strcmp("test 42", "test 42"));
	printf("strcmp(\"test 42\", \"test 42\") = %i\n", strcmp("test 42", "test 42"));
	printf("\n");
	printf("ft_strcmp(ft_cpy, cpy) = %i\n", ft_strcmp(ft_cpy, cpy));
	printf("strcmp(ft_cpy, cpy) = %i\n", strcmp(ft_cpy, cpy));
	printf("\n");
	printf("ft_strcmp(\"test 42\", \"test 43\") = %i\n", ft_strcmp("test 42", "test 43"));
	printf("strcmp(\"test 42\", \"test 43\") = %i\n", strcmp("test 42", "test 43"));
	printf("\n");
	printf("ft_strcmp(\"test 42\", \"tes\") = %i\n", ft_strcmp("test 42", "tes"));
	printf("strcmp(\"test 42\", \"tes\") = %i\n", strcmp("test 42", "tes"));
	printf("\n");
	printf("ft_strcmp(\"test 42\", \"tes\") = %i\n", ft_strcmp("test 42", "tes"));
	printf("strcmp(\"test 42\", \"tes\") = %i\n", strcmp("test 42", "tes"));
	printf("--------------------\n\n");

	printf("write\n");
	printf("--------------------\n\n");
	len = ft_write(1, "hello world\n", ft_strlen("hello world\n"));
	printf("ft_write(1, \"hello world\\n\", ft_strlen(\"hello world\")) = %i\n", len);
	len = write(1, "hello world\n", strlen("hello world\n"));
	printf("write(1, \"hello world\\n\", strlen(\"hello world\")) = %i\n", len);
	printf("--------------------\n\n");


	

}