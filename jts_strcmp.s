/*
https://stackoverflow.com/questions/12136329/how-does-strcmp-work
*/


// intmax_t jts_strcmp(const char *str, const char *str);
.global jts_strcmp
.text

/*
%rdi = str1
%rsi = str2
%rax is:
return 0 if strings are equal
return >0 if str2 is less than str1
return <0 if str1 is less than str2
*/

exit_1:
	movq $-1, %rax
	ret
exit_2:
	movq $1, %rax
	ret
exit_0:
	xor %rax, %rax
	ret

jts_strcmp:
	xor %rax, %rax
	loop:
		movq (%rdi), %r8
		movq (%rsi), %r9

		// str1 != NULL
		cmpb $0, (%rdi)
		je exit_1

		// str2 != NULL
		cmpb $0, (%rsi)
		je exit_2

		// str2 > str1 ?
		cmp %r8, %r9
		jg exit_2

		// str1 > str2 ?
		jl exit_1

		// str1 == str2
		je exit_0

		inc %rdi
		inc %rsi

		jmp loop
