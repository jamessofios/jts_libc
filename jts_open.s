// int jts_open(char *filename, int flags, umode_t mode);

.text
.global jts_open

jts_open:
	mov $2,%rax
	syscall
	ret
