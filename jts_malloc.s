/* void *malloc(size_t size);
%rax (%rdi, %rsi, %rdx)
https://github.com/cirosantilli/linux-kernel-module-cheat/blob/05f9a1f4bed304f89b820ac30a690e669a8a0d35/userland/linux/mmap_anonymous.c
https://www.tutorialspoint.com/assembly_programming/assembly_memory_management.htm
https://stackoverflow.com/questions/22586532/assembly-x86-brk-call-use
https://stackoverflow.com/questions/2535989/what-are-the-calling-conventions-for-unix-linux-system-calls-and-user-space-f
*/

.bss
count: .int 8

.global jts_malloc
.global jts_free
.text

jts_malloc:
	pushq %rdi

	movq $0, %rdi
	call sys_brk

	popq %rdi

	leaq (%rax, %rdi), %rdi
	call sys_brk

	ret

// void free(void *ptr, size_t size);
jts_free:
	pushq %rdi

	movq $0, %rdi
	call sys_brk

	popq %rdi

	subq %rdi, %rax

	movq %rax, %rdi
	call sys_brk

	ret
sys_brk:
	//sys_brk is 12(d)
	movq $12, %rax
	syscall
	ret
