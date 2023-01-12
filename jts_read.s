// ssize_t jts_read(int fd, void *buf, size_t count);
.text
.global jts_read

jts_read:
	movq $0,%rax
	syscall
	ret
