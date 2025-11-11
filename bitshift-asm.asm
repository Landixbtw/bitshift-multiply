	.file	"bitshift.c"
	.text
	.section	.rodata
	.align 8
.LC0:
	.string	"[first binary number] [second binary number]"
.LC1:
	.string	"%s %s"
.LC2:
	.string	"Error while reading stdin"
.LC3:
	.string	"Ergebnis: "
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$192, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	-80(%rbp), %rdx
	leaq	-160(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	cmpl	$2, %eax
	je	.L2
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$1, %edi
	call	exit@PLT
.L2:
	leaq	-160(%rbp), %rax
	movq	%rax, %rdi
	call	btol
	movq	%rax, -184(%rbp)
	leaq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	btol
	movq	%rax, -176(%rbp)
	movq	$0, -168(%rbp)
	jmp	.L3
.L5:
	movq	-176(%rbp), %rax
	andl	$1, %eax
	testq	%rax, %rax
	je	.L4
	movq	-184(%rbp), %rax
	addq	%rax, -168(%rbp)
.L4:
	salq	-184(%rbp)
	sarq	-176(%rbp)
	movq	-184(%rbp), %rax
	movq	%rax, %rdi
	call	printb
	movl	$10, %edi
	call	putchar@PLT
	movq	-176(%rbp), %rax
	movq	%rax, %rdi
	call	printb
	movl	$10, %edi
	call	putchar@PLT
.L3:
	cmpq	$0, -176(%rbp)
	jne	.L5
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-168(%rbp), %rax
	movq	%rax, %rdi
	call	printb
	movl	$10, %edi
	call	putchar@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L7
	call	__stack_chk_fail@PLT
.L7:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.globl	btol
	.type	btol, @function
btol:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	$0, -8(%rbp)
	jmp	.L9
.L12:
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$49, %al
	je	.L10
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$48, %al
	jne	.L11
.L10:
	movq	-8(%rbp), %rax
	leaq	(%rax,%rax), %rdx
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	subl	$48, %eax
	cltq
	addq	%rdx, %rax
	movq	%rax, -8(%rbp)
.L11:
	addq	$1, -24(%rbp)
.L9:
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L12
	movq	-8(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	btol, .-btol
	.section	.rodata
.LC4:
	.string	"%d"
	.text
	.globl	printb
	.type	printb, @function
printb:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L15
	movl	$48, %edi
	call	putchar@PLT
	jmp	.L14
.L15:
	movq	$1, -16(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
	jmp	.L17
.L18:
	salq	-16(%rbp)
.L17:
	sarq	-8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L18
	jmp	.L19
.L20:
	movq	-24(%rbp), %rax
	andq	-16(%rbp), %rax
	testq	%rax, %rax
	setne	%al
	movzbl	%al, %eax
	movl	%eax, %esi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	sarq	-16(%rbp)
.L19:
	cmpq	$0, -16(%rbp)
	jne	.L20
.L14:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	printb, .-printb
	.ident	"GCC: (GNU) 14.2.1 20240910"
	.section	.note.GNU-stack,"",@progbits
