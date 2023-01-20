// char *itoa(int value, char *str, int base);
// %rax %rdi, %rsi, %rdx
// 48(d) -> 57(d) == 0 -> 9

.global jts_itoa
.text

jts_itoa:
	
