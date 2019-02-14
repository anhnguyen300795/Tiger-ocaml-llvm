	.text
	.file	"Tiger jit"
	.globl	"camlLlvm_byte_code/test/fib__code_begin"
"camlLlvm_byte_code/test/fib__code_begin":
	.data
	.globl	"camlLlvm_byte_code/test/fib__data_begin"
"camlLlvm_byte_code/test/fib__data_begin":
	.text
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	subq	$16, %rsp
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	leaq	8(%rsp), %rbx
	xorl	%esi, %esi
	movq	%rbx, %rdi
	callq	fib
.Ltmp0:
	movl	%eax, %r14d
	movl	$1, %esi
	movq	%rbx, %rdi
	callq	fib
.Ltmp1:
	movl	%eax, %r15d
	movl	$5, %esi
	movq	%rbx, %rdi
	callq	fib
.Ltmp2:
	movl	%eax, %r12d
	movl	$14, %esi
	movq	%rbx, %rdi
	callq	fib
.Ltmp3:
	movl	%eax, %ebp
	movl	$30, %esi
	movq	%rbx, %rdi
	callq	fib
.Ltmp4:
	movl	%eax, %ebx
	xorl	%esi, %esi
	movl	%r14d, %edi
	callq	assert_equal_int
.Ltmp5:
	movl	$1, %esi
	movl	%r15d, %edi
	callq	assert_equal_int
.Ltmp6:
	movl	$5, %esi
	movl	%r12d, %edi
	callq	assert_equal_int
.Ltmp7:
	movl	$377, %esi              # imm = 0x179
	movl	%ebp, %edi
	callq	assert_equal_int
.Ltmp8:
	movl	$832040, %esi           # imm = 0xCB228
	movl	%ebx, %edi
	callq	assert_equal_int
.Ltmp9:
	xorl	%eax, %eax
	addq	$16, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.globl	fib                     # -- Begin function fib
	.p2align	4, 0x90
	.type	fib,@function
fib:                                    # @fib
	.cfi_startproc
# %bb.0:                                # %test
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %rbp, -16
	movl	%esi, %ebx
	movq	%rdi, (%rsp)
	xorl	%eax, %eax
	testl	%ebx, %ebx
	je	.LBB1_3
# %bb.1:                                # %test2
	cmpl	$1, %ebx
	movl	$1, %eax
	je	.LBB1_3
# %bb.2:                                # %else4
	leal	-1(%rbx), %esi
	movq	(%rsp), %rdi
	callq	fib
.Ltmp10:
	movl	%eax, %ebp
	addl	$-2, %ebx
	movq	(%rsp), %rdi
	movl	%ebx, %esi
	callq	fib
.Ltmp11:
	addl	%ebp, %eax
.LBB1_3:                                # %merge
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
.Lfunc_end1:
	.size	fib, .Lfunc_end1-fib
	.cfi_endproc
                                        # -- End function

	.globl	"camlLlvm_byte_code/test/fib__code_end"
"camlLlvm_byte_code/test/fib__code_end":
	.data
	.globl	"camlLlvm_byte_code/test/fib__data_end"
"camlLlvm_byte_code/test/fib__data_end":
	.quad	0
	.globl	"camlLlvm_byte_code/test/fib__frametable"
"camlLlvm_byte_code/test/fib__frametable":
	.short	12
	.p2align	3
                                        # live roots for main
	.quad	.Ltmp0
	.short	56
	.short	0
	.p2align	3
	.quad	.Ltmp1
	.short	56
	.short	0
	.p2align	3
	.quad	.Ltmp2
	.short	56
	.short	0
	.p2align	3
	.quad	.Ltmp3
	.short	56
	.short	0
	.p2align	3
	.quad	.Ltmp4
	.short	56
	.short	0
	.p2align	3
	.quad	.Ltmp5
	.short	56
	.short	0
	.p2align	3
	.quad	.Ltmp6
	.short	56
	.short	0
	.p2align	3
	.quad	.Ltmp7
	.short	56
	.short	0
	.p2align	3
	.quad	.Ltmp8
	.short	56
	.short	0
	.p2align	3
	.quad	.Ltmp9
	.short	56
	.short	0
	.p2align	3
                                        # live roots for fib
	.quad	.Ltmp10
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp11
	.short	24
	.short	0
	.p2align	3
	.section	".note.GNU-stack","",@progbits
