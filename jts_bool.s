// size_t jts_true(void);
// size_t jts_false(void);

.text
.global jts_true
.global jts_false

jts_true:
	movq $1,%rax
	ret
jts_false:
	xor %rax,%rax
	ret
