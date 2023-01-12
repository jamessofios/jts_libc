// void jts_exit(int error_code);
.text
.global jts_exit

jts_exit:
	//set syacall to 60: exit
	movq $60,  %rax
	syscall
