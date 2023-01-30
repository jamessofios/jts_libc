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

	if (jts_strcmp("Hi", "Hi") == 0) {
		c = 'Z';
		jts_write(STDOUT, &c, 1);
	}

	if (jts_strcmp("Him", "Hi") == 1) {
		c = 'O';
		jts_write(STDOUT, &c, 1);
	}

	if (jts_strcmp("Hi", "Him") == -1) {
		c = 'N';
		jts_write(STDOUT, &c, 1);
	}

	c = '\n';
	jts_write(STDOUT, &c, 1);

	jts_memset(&c, 'M', 1);
	jts_write(STDOUT, &c, 1);

	c = '\n';
	jts_write(STDOUT, &c, 1);


	char *vptr = jts_mmap(0, 1, PROT_READ | PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);

	*vptr = 'V';

	jts_write(STDOUT, vptr, 1);

	jts_munmap(vptr, 1);


	jts_exit(jts_strlen("Hi"));

	return 0;
}
