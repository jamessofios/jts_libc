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

// open() flag macros. defines are taken from: /usr/include/asm-generic/fcntl.h
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

// mmap flag macros
#define PROT_READ        0x1                /* Page can be read.  */
#define PROT_WRITE        0x2                /* Page can be written.  */
#define PROT_EXEC        0x4                /* Page can be executed.  */
#define PROT_NONE        0x0                /* Page can not be accessed.  */
#define PROT_GROWSDOWN        0x01000000        /* Extend change to start of
                                           growsdown vma (mprotect only).  */
#define PROT_GROWSUP        0x02000000        /* Extend change to start of
                                           growsup vma (mprotect only).  */

/* Sharing types (must choose one and only one of these).  */
#define MAP_SHARED 0x01                /* Share changes.  */
#define MAP_PRIVATE 0x02                /* Changes are private.  */

#define MAP_ANONYMOUS 0x20                /* Don't use a file.  */
#define MAP_ANON MAP_ANONYMOUS
// end mmap macros

// fd const macros
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
int jts_strcmp(char*,char*);
void *jts_memset(void *str, int c, size_t n);

// typedef for mmap
typedef long int off_t;
void *jts_mmap(void *addr, size_t length, int prot, int flags, int fd, off_t offset);
int jts_munmap(void *addr, size_t length);
