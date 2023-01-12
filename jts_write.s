// ssize_t jts_write(int fd, const void *buf, size_t count);
// void jts_putc(char *c);
// void jts_fputc(int fd, char c);

/*
rdi = format string
rsi = 1
rdx = 2
rcx = 3
r8 = 4
r9 = 5
*/

.text
.global jts_write
.global jts_putc
.global jts_fputc

jts_write:
	//sys_write
	movq $1,%rax
	syscall
	ret
jts_fputc:
	//count
//	movq $1, %rdx
//	call jts_write
	ret
jts_putc:
//	movq %rdi, %rsi
	//count
	movq $1, %rdx
	//fd
	movq $1, %rdi
	call jts_write
	ret
