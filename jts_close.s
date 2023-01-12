// int jts_close(int fd);
.text
.global jts_close

jts_close:
	mov $3,%rax
	syscall
	ret
