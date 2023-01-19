/*
void *memset(void *str, int c, size_t n)
%rax %rdi, %rsi, %rdx
*/

.global jts_memset
.text

jts_memset:
	//set return to void *str
	movq %rdi, %rax

	// if number of bytes to fill is zero, then exit
	cmp $0, %rdx
	je exit

	//use %rcx as loop counter
	movq $0, %rcx

	loop:
		//if loop counter is equal to the number of bytes to fill, then exit
		cmp %rcx, %rdx
		je exit

		// *(char*)str = c;
		movq %rsi, (%rdi)

		inc %rdi
		inc %rcx

		jmp loop
	exit:
		ret
