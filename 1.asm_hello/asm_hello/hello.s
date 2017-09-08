    .section	__TEXT,__text,regular,pure_instructions # 指示下面代码所位于的段和节区
# _TEXT - 表示位于程序的代码段，_text 位于主程序的代码节区
    .macosx_version_min 10, 12 # 标识 macOS 最低版本
    .intel_syntax noprefix # Intel 语法显示标注
    .globl	_main # 希望 main 符号可被连接器 ld 使用
    .p2align	4, 0x90 # 代码对齐方式
_main:                                  ## @main

## x86 汇编（真汇编指令），调用了 C 中的 puts() 函数。返回 0 结束 main() 方法。
## BB#0:
	push	rbp
	mov	rbp, rsp
	lea	rdi, [rip + L_.str]
	call	_puts
	xor	eax, eax
	pop	rbp
	ret

	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"Hello World"

# 这个伪指令表示当前的节区可以被内敛到其他代码中
# 并且如果没有被其他代码使用就可以被剔除掉
.subsections_via_symbols
