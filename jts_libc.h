// include headers provided by compiler
#include <stddef.h>
#include <stdint.h>
#include <float.h>
//#include <iso646.h>
#include <limits.h>
#include <stdarg.h>
#include <stdalign.h>
#include <stdnoreturn.h>
#include <stdbool.h>

// defines are taken from: /usr/include/asm-generic/fcntl.h
#define O_ACCMODE	00000003
#define O_RDONLY	00000000
#define O_WRONLY	00000001
#define O_RDWR		00000002
#define O_CREAT		00000100	/* not fcntl */
#define O_EXCL		00000200	/* not fcntl */
#define O_NOCTTY	00000400	/* not fcntl */
#define O_TRUNC		00001000	/* not fcntl */
#define O_APPEND	00002000
#define O_NONBLOCK	00004000

#define STDIN 0
#define STDOUT 1
#define STDERR 2

// typedefs for glibc compat
typedef unsigned short umode_t;

/*
Here is the x64 syscall chart I used:
https://chromium.googlesource.com/chromiumos/docs/+/master/constants/syscalls.md#x86_64-64_bit
*/
void jts_exit(int code);
int jts_close(int fd);
int jts_open(char *filename, int flags, umode_t mode);
intmax_t jts_read(int fd, void *buf, uintmax_t count);
intmax_t jts_write(int fd, const void *buf, uintmax_t count);
uintmax_t jts_strlen(char *s);
uintmax_t jts_true(void);
uintmax_t jts_false(void);
void jts_nop(void);
