/*
https://stackoverflow.com/questions/29694564/what-is-the-use-of-start-in-c
https://x64.syscall.sh/
*/
.text
.global _start

_start:

	// setup argc and argv for C main()
	xor %rbp, %rbp
	xor %rax, %rax
	movq (%rsp), %rdi
	leaq 8(%rsp), %rsi
	leaq 16(%rsp, %rdi, 8), %rdx
	call main
	// the return value from main gets put into %rax
	mov %rax, %rdi
	mov $60,  %rax
	syscall
