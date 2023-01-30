/*
%rax (%rdi, %rsi, %rdx)
https://github.com/cirosantilli/linux-kernel-module-cheat/blob/05f9a1f4bed304f89b820ac30a690e669a8a0d35/userland/linux/mmap_anonymous.c
https://www.tutorialspoint.com/assembly_programming/assembly_memory_management.htm
https://stackoverflow.com/questions/22586532/assembly-x86-brk-call-use
https://stackoverflow.com/questions/2535989/what-are-the-calling-conventions-for-unix-linux-system-calls-and-user-space-f
https://stackoverflow.com/questions/4779188/how-to-use-mmap-to-allocate-a-memory-in-heap
https://sites.uclouvain.be/SystInfo/usr/include/bits/mman.h.html
*/


//#define PROT_READ        0x1                /* Page can be read.  */
//#define PROT_WRITE        0x2                /* Page can be written.  */
//#define PROT_EXEC        0x4                /* Page can be executed.  */
//#define PROT_NONE        0x0                /* Page can not be accessed.  */
//#define PROT_GROWSDOWN        0x01000000        /* Extend change to start of
//                                           growsdown vma (mprotect only).  */
//#define PROT_GROWSUP        0x02000000        /* Extend change to start of
//                                           growsup vma (mprotect only).  */
//
///* Sharing types (must choose one and only one of these).  */
//#define MAP_SHARED        0x01                /* Share changes.  */
//#define MAP_PRIVATE        0x02                /* Changes are private.  */
//
//# define MAP_ANONYMOUS        0x20                /* Don't use a file.  */
//# define MAP_ANON        MAP_ANONYMOUS




.global jts_mmap
.global jts_munmap

.text
	// void *mmap(void *addr, size_t length, int prot, int flags, int fd, off_t offset);
	jts_mmap:
//		// make sure size is gt zero
//		cmpq $0, %rdi
//		je set_null
//
//		// set len
//		movq %rdi, %rsi
//
//		// set addr preference. Zero is no preference
//		movq $0, %rdi
//
//		// set prot to read and write
//		movq $3, %rdx
//
//		// set flags to shared and private
//		mov $34, %r10
//
//		// set fd to no file
//		movq $-1, %r8
//
//		// zero offset
//		movq $0, %r9
//		call sys_mmap

			sys_mmap:
				movq %rcx, %r10
				movq $9, %rax
				syscall
				ret
//		ret

	// int munmap(void *addr, size_t length);
	jts_munmap:
		// Make sure the arguents are not zero or null before munmapping
//		cmpq $0, %rdi
//		je set_null
//		cmpq $0, %rsi
//		je set_null
//		call sys_munmap
			sys_munmap:
			movq $11, %rax
			syscall
			ret
//		ret
