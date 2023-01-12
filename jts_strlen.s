// unsigned long jts_strlen(char *s);
.text
.global jts_strlen

jts_strlen:
	xor %rax,%rax
	cmpb $0,(%rdi)
	je end
	loop:
		inc %rdi
		inc %rax
		cmpb $0,(%rdi)
		jne loop
	end:
		ret
