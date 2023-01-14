#include "jts_libc.h"

int main(int argc, char **argv)
{
//	int jts_close(int fd);
//	int jts_open(char *filename, int flags, umode_t mode);
//	intmax_t jts_read(int fd, void *buf, uintmax_t count);
//	intmax_t jts_write(int fd, const void *buf, uintmax_t count);

	int fd = 2;
	int status = 0;
	char c = '\0';

	fd = jts_open("main.c", O_RDONLY, 0644);
	if (fd == -1) {
		jts_exit(1);
	}

	status = jts_read(fd, &c, 1);
	if (status == -1) {
		jts_exit(1);
	}

	status = jts_write(STDOUT, &c, 1);
	if (status == -1) {
		jts_exit(1);
	}

	char *s = "True\n";

	if ( !(jts_false()) && jts_true()) {
		jts_write(STDOUT, s, jts_strlen(s));
	}

	jts_nop();

	jts_close(fd);
	jts_exit(jts_strlen("Hi"));

	return 0;
}
