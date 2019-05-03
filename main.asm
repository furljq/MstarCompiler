	default rel
	global main
	global FUNCTION_main
	global LABEL0
	global FUNCTION_size
	global FUNCTION_print
	global FUNCTION_println
	global FUNCTION_getString
	global FUNCTION_toString
	global CLASS_string_MEMBER_length
	global CLASS_string_MEMBER_substring
	global CLASS_string_MEMBER_parseInt
	global FUNCTION_getInt
	global CLASS_string_MEMBER_ord
	global FUNCTION_string_concat
	global FUNCTION_string_equal
	global FUNCTION_string_notequal
	global FUNCTION_string_lt
	global FUNCTION_string_leq
	global FUNCTION_string_gt
	global FUNCTION_string_geq
	extern strcmp
	extern __stack_chk_fail
	extern strlen
	extern __isoc99_scanf
	extern malloc
	extern puts
	extern printf
	extern _GLOBAL_OFFSET_TABLE_
	SECTION .text
FUNCTION_size:
	        push    rbp
	        mov     rbp, rsp
	        mov     qword [rbp-8H], rdi
	        mov     rax, qword [rbp-8H]
	        mov     rax, qword [rax-8H]
	        pop     rbp
	        ret
FUNCTION_print:
	        push    rbp
	        mov     rbp, rsp
	        sub     rsp, 16
	        mov     qword [rbp-8H], rdi
	        mov     rax, qword [rbp-8H]
	        mov     rsi, rax
	        lea     rdi, [rel L_022]
	        mov     eax, 0
	        call    printf
	        nop
	        leave
	        ret
FUNCTION_println:
	        push    rbp
	        mov     rbp, rsp
	        sub     rsp, 16
	        mov     qword [rbp-8H], rdi
	        mov     rax, qword [rbp-8H]
	        mov     rdi, rax
	        call    puts
	        nop
	        leave
	        ret
FUNCTION_getString:
	        push    rbp
	        mov     rbp, rsp
	        sub     rsp, 16
	        mov     edi, 266
	        call    malloc
	        mov     qword [rbp-8H], rax
	        mov     rax, qword [rbp-8H]
	        add     rax, 8
	        mov     rsi, rax
	        lea     rdi, [rel L_022]
	        mov     eax, 0
	        call    __isoc99_scanf
	        mov     rax, qword [rbp-8H]
	        add     rax, 8
	        mov     rdi, rax
	        call    strlen
	        mov     rdx, rax
	        mov     rax, qword [rbp-8H]
	        mov     qword [rax], rdx
	        mov     rax, qword [rbp-8H]
	        add     rax, 8
	        leave
	        ret
FUNCTION_toString:
	        push    rbp
	        mov     rbp, rsp
	        sub     rsp, 96
	        mov     qword [rbp-58H], rdi
	        mov     rax, qword [fs:abs 28H]
	        mov     qword [rbp-8H], rax
	        xor     eax, eax
	        mov     dword [rbp-44H], 0
	        mov     dword [rbp-40H], 0
	        cmp     qword [rbp-58H], 0
	        jns     L_001
	        mov     dword [rbp-44H], 1
	        neg     qword [rbp-58H]
	L_001:  cmp     qword [rbp-58H], 0
	        jnz     L_003
	        add     dword [rbp-40H], 1
	        mov     eax, dword [rbp-40H]
	        cdqe
	        mov     dword [rbp+rax*4-30H], 0
	        jmp     L_004
	L_002:  mov     rcx, qword [rbp-58H]
	        mov     rdx, qword 6666666666666667H
	        mov     rax, rcx
	        imul    rdx
	        sar     rdx, 2
	        mov     rax, rcx
	        sar     rax, 63
	        sub     rdx, rax
	        mov     rax, rdx
	        shl     rax, 2
	        add     rax, rdx
	        add     rax, rax
	        sub     rcx, rax
	        mov     rdx, rcx
	        add     dword [rbp-40H], 1
	        mov     eax, dword [rbp-40H]
	        cdqe
	        mov     dword [rbp+rax*4-30H], edx
	        mov     rcx, qword [rbp-58H]
	        mov     rdx, qword 6666666666666667H
	        mov     rax, rcx
	        imul    rdx
	        sar     rdx, 2
	        mov     rax, rcx
	        sar     rax, 63
	        sub     rdx, rax
	        mov     rax, rdx
	        mov     qword [rbp-58H], rax
	L_003:  cmp     qword [rbp-58H], 0
	        jnz     L_002
	L_004:  mov     edx, dword [rbp-40H]
	        mov     eax, dword [rbp-44H]
	        add     eax, edx
	        add     eax, 9
	        cdqe
	        mov     rdi, rax
	        call    malloc
	        mov     qword [rbp-38H], rax
	        mov     edx, dword [rbp-40H]
	        mov     eax, dword [rbp-44H]
	        add     eax, edx
	        movsxd  rdx, eax
	        mov     rax, qword [rbp-38H]
	        mov     qword [rax], rdx
	        add     qword [rbp-38H], 8
	        mov     edx, dword [rbp-40H]
	        mov     eax, dword [rbp-44H]
	        add     eax, edx
	        movsxd  rdx, eax
	        mov     rax, qword [rbp-38H]
	        add     rax, rdx
	        mov     byte [rax], 0
	        cmp     dword [rbp-44H], 0
	        jz      L_005
	        mov     rax, qword [rbp-38H]
	        mov     byte [rax], 45
	L_005:  mov     dword [rbp-3CH], 0
	        jmp     L_007
	L_006:  mov     eax, dword [rbp-40H]
	        sub     eax, dword [rbp-3CH]
	        cdqe
	        mov     eax, dword [rbp+rax*4-30H]
	        lea     ecx, [rax+30H]
	        mov     edx, dword [rbp-3CH]
	        mov     eax, dword [rbp-44H]
	        add     eax, edx
	        movsxd  rdx, eax
	        mov     rax, qword [rbp-38H]
	        add     rax, rdx
	        mov     edx, ecx
	        mov     byte [rax], dl
	        add     dword [rbp-3CH], 1
	L_007:  mov     eax, dword [rbp-3CH]
	        cmp     eax, dword [rbp-40H]
	        jl      L_006
	        mov     rax, qword [rbp-38H]
	        mov     rsi, qword [rbp-8H]
	        xor     rsi, qword [fs:abs 28H]
	        jz      L_008
	        call    __stack_chk_fail
	L_008:  leave
	        ret
CLASS_string_MEMBER_length:
	        push    rbp
	        mov     rbp, rsp
	        mov     qword [rbp-8H], rdi
	        mov     rax, qword [rbp-8H]
	        mov     rax, qword [rax-8H]
	        pop     rbp
	        ret
CLASS_string_MEMBER_substring:
	        push    rbp
	        mov     rbp, rsp
	        sub     rsp, 32
	        mov     qword [rbp-18H], rdi
	        mov     dword [rbp-1CH], esi
	        mov     dword [rbp-20H], edx
	        mov     eax, dword [rbp-20H]
	        sub     eax, dword [rbp-1CH]
	        add     eax, 1
	        mov     dword [rbp-0CH], eax
	        mov     eax, dword [rbp-0CH]
	        add     eax, 9
	        cdqe
	        mov     rdi, rax
	        call    malloc
	        mov     qword [rbp-8H], rax
	        mov     eax, dword [rbp-0CH]
	        movsxd  rdx, eax
	        mov     rax, qword [rbp-8H]
	        mov     qword [rax], rdx
	        mov     eax, dword [rbp-1CH]
	        add     eax, 8
	        cdqe
	        add     qword [rbp-18H], rax
	        add     qword [rbp-8H], 8
	        mov     dword [rbp-10H], 0
	        jmp     L_010
	L_009:  mov     eax, dword [rbp-10H]
	        movsxd  rdx, eax
	        mov     rax, qword [rbp-18H]
	        add     rax, rdx
	        mov     edx, dword [rbp-10H]
	        movsxd  rcx, edx
	        mov     rdx, qword [rbp-8H]
	        add     rdx, rcx
	        movzx   eax, byte [rax]
	        mov     byte [rdx], al
	        add     dword [rbp-10H], 1
	L_010:  mov     eax, dword [rbp-10H]
	        cmp     eax, dword [rbp-0CH]
	        jl      L_009
	        mov     eax, dword [rbp-0CH]
	        movsxd  rdx, eax
	        mov     rax, qword [rbp-8H]
	        add     rax, rdx
	        mov     byte [rax], 0
	        mov     rax, qword [rbp-8H]
	        leave
	        ret
CLASS_string_MEMBER_parseInt:
	        push    rbp
	        mov     rbp, rsp
	        mov     qword [rbp-18H], rdi
	        mov     dword [rbp-10H], 0
	        mov     dword [rbp-0CH], 0
	        jmp     L_012
	L_011:  mov     eax, dword [rbp-0CH]
	        lea     edx, [rax+1H]
	        mov     dword [rbp-0CH], edx
	        movsxd  rdx, eax
	        mov     rax, qword [rbp-18H]
	        add     rax, rdx
	        movzx   eax, byte [rax]
	        cmp     al, 45
	        jnz     L_012
	        mov     dword [rbp-10H], 1
	L_012:  mov     eax, dword [rbp-0CH]
	        movsxd  rdx, eax
	        mov     rax, qword [rbp-18H]
	        add     rax, rdx
	        movzx   eax, byte [rax]
	        cmp     al, 47
	        jle     L_011
	        mov     eax, dword [rbp-0CH]
	        movsxd  rdx, eax
	        mov     rax, qword [rbp-18H]
	        add     rax, rdx
	        movzx   eax, byte [rax]
	        cmp     al, 57
	        jg      L_011
	        mov     eax, dword [rbp-0CH]
	        lea     edx, [rax+1H]
	        mov     dword [rbp-0CH], edx
	        movsxd  rdx, eax
	        mov     rax, qword [rbp-18H]
	        add     rax, rdx
	        movzx   eax, byte [rax]
	        movsx   eax, al
	        sub     eax, 48
	        cdqe
	        mov     qword [rbp-8H], rax
	        jmp     L_014
	L_013:  mov     rdx, qword [rbp-8H]
	        mov     rax, rdx
	        shl     rax, 2
	        add     rax, rdx
	        add     rax, rax
	        mov     rcx, rax
	        mov     eax, dword [rbp-0CH]
	        lea     edx, [rax+1H]
	        mov     dword [rbp-0CH], edx
	        movsxd  rdx, eax
	        mov     rax, qword [rbp-18H]
	        add     rax, rdx
	        movzx   eax, byte [rax]
	        movsx   rax, al
	        add     rax, rcx
	        sub     rax, 48
	        mov     qword [rbp-8H], rax
	L_014:  mov     eax, dword [rbp-0CH]
	        movsxd  rdx, eax
	        mov     rax, qword [rbp-18H]
	        add     rax, rdx
	        movzx   eax, byte [rax]
	        cmp     al, 47
	        jle     L_015
	        mov     eax, dword [rbp-0CH]
	        movsxd  rdx, eax
	        mov     rax, qword [rbp-18H]
	        add     rax, rdx
	        movzx   eax, byte [rax]
	        cmp     al, 57
	        jle     L_013
	L_015:  cmp     dword [rbp-10H], 0
	        jz      L_016
	        mov     rax, qword [rbp-8H]
	        neg     rax
	        jmp     L_017
	L_016:  mov     rax, qword [rbp-8H]
	L_017:  pop     rbp
	        ret
FUNCTION_getInt:
	        push    rbp
	        mov     rbp, rsp
	        mov     eax, 0
	        call    FUNCTION_getString
	        mov     rdi, rax
	        call    CLASS_string_MEMBER_parseInt
	        pop     rbp
	        ret
CLASS_string_MEMBER_ord:
	        push    rbp
	        mov     rbp, rsp
	        mov     qword [rbp-8H], rdi
	        mov     dword [rbp-0CH], esi
	        mov     eax, dword [rbp-0CH]
	        movsxd  rdx, eax
	        mov     rax, qword [rbp-8H]
	        add     rax, rdx
	        movzx   eax, byte [rax]
	        movsx   rax, al
	        pop     rbp
	        ret
FUNCTION_string_concat:
	        push    rbp
	        mov     rbp, rsp
	        sub     rsp, 48
	        mov     qword [rbp-28H], rdi
	        mov     qword [rbp-30H], rsi
	        mov     rax, qword [rbp-28H]
	        sub     rax, 8
	        mov     rax, qword [rax]
	        mov     dword [rbp-10H], eax
	        mov     rax, qword [rbp-30H]
	        sub     rax, 8
	        mov     rax, qword [rax]
	        mov     dword [rbp-0CH], eax
	        mov     eax, dword [rbp-10H]
	        lea     edx, [rax+9H]
	        mov     eax, dword [rbp-0CH]
	        add     eax, edx
	        cdqe
	        mov     rdi, rax
	        call    malloc
	        mov     qword [rbp-8H], rax
	        mov     edx, dword [rbp-10H]
	        mov     eax, dword [rbp-0CH]
	        add     eax, edx
	        movsxd  rdx, eax
	        mov     rax, qword [rbp-8H]
	        mov     qword [rax], rdx
	        add     qword [rbp-8H], 8
	        mov     dword [rbp-1CH], 0
	        mov     dword [rbp-18H], 0
	        jmp     L_019
	L_018:  mov     eax, dword [rbp-18H]
	        movsxd  rdx, eax
	        mov     rax, qword [rbp-28H]
	        lea     rcx, [rdx+rax]
	        mov     eax, dword [rbp-1CH]
	        lea     edx, [rax+1H]
	        mov     dword [rbp-1CH], edx
	        movsxd  rdx, eax
	        mov     rax, qword [rbp-8H]
	        add     rdx, rax
	        movzx   eax, byte [rcx]
	        mov     byte [rdx], al
	        add     dword [rbp-18H], 1
	L_019:  mov     eax, dword [rbp-18H]
	        cmp     eax, dword [rbp-10H]
	        jl      L_018
	        mov     dword [rbp-14H], 0
	        jmp     L_021
	L_020:  mov     eax, dword [rbp-14H]
	        movsxd  rdx, eax
	        mov     rax, qword [rbp-30H]
	        lea     rcx, [rdx+rax]
	        mov     eax, dword [rbp-1CH]
	        lea     edx, [rax+1H]
	        mov     dword [rbp-1CH], edx
	        movsxd  rdx, eax
	        mov     rax, qword [rbp-8H]
	        add     rdx, rax
	        movzx   eax, byte [rcx]
	        mov     byte [rdx], al
	        add     dword [rbp-14H], 1
	L_021:  mov     eax, dword [rbp-14H]
	        cmp     eax, dword [rbp-0CH]
	        jl      L_020
	        mov     eax, dword [rbp-1CH]
	        movsxd  rdx, eax
	        mov     rax, qword [rbp-8H]
	        add     rax, rdx
	        mov     byte [rax], 0
	        mov     rax, qword [rbp-8H]
	        leave
	        ret
FUNCTION_string_equal:
	        push    rbp
	        mov     rbp, rsp
	        sub     rsp, 16
	        mov     qword [rbp-8H], rdi
	        mov     qword [rbp-10H], rsi
	        mov     rdx, qword [rbp-10H]
	        mov     rax, qword [rbp-8H]
	        mov     rsi, rdx
	        mov     rdi, rax
	        call    strcmp
	        test    eax, eax
	        sete    al
	        movzx   eax, al
	        leave
	        ret
FUNCTION_string_notequal:
	        push    rbp
	        mov     rbp, rsp
	        sub     rsp, 16
	        mov     qword [rbp-8H], rdi
	        mov     qword [rbp-10H], rsi
	        mov     rdx, qword [rbp-10H]
	        mov     rax, qword [rbp-8H]
	        mov     rsi, rdx
	        mov     rdi, rax
	        call    strcmp
	        test    eax, eax
	        setne   al
	        movzx   eax, al
	        leave
	        ret
FUNCTION_string_lt:
	        push    rbp
	        mov     rbp, rsp
	        sub     rsp, 16
	        mov     qword [rbp-8H], rdi
	        mov     qword [rbp-10H], rsi
	        mov     rdx, qword [rbp-10H]
	        mov     rax, qword [rbp-8H]
	        mov     rsi, rdx
	        mov     rdi, rax
	        call    strcmp
	        shr     eax, 31
	        movzx   eax, al
	        leave
	        ret
FUNCTION_string_leq:
	        push    rbp
	        mov     rbp, rsp
	        sub     rsp, 16
	        mov     qword [rbp-8H], rdi
	        mov     qword [rbp-10H], rsi
	        mov     rdx, qword [rbp-10H]
	        mov     rax, qword [rbp-8H]
	        mov     rsi, rdx
	        mov     rdi, rax
	        call    strcmp
	        test    eax, eax
	        setle   al
	        movzx   eax, al
	        leave
	        ret
FUNCTION_string_gt:
	        push    rbp
	        mov     rbp, rsp
	        sub     rsp, 16
	        mov     qword [rbp-8H], rdi
	        mov     qword [rbp-10H], rsi
	        mov     rdx, qword [rbp-10H]
	        mov     rax, qword [rbp-8H]
	        mov     rsi, rdx
	        mov     rdi, rax
	        call    strcmp
	        test    eax, eax
	        setg    al
	        movzx   eax, al
	        leave
	        ret
FUNCTION_string_geq:
	        push    rbp
	        mov     rbp, rsp
	        sub     rsp, 16
	        mov     qword [rbp-8H], rdi
	        mov     qword [rbp-10H], rsi
	        mov     rdx, qword [rbp-10H]
	        mov     rax, qword [rbp-8H]
	        mov     rsi, rdx
	        mov     rdi, rax
	        call    strcmp
	        not     eax
	        shr     eax, 31
	        movzx   eax, al
	        leave
	        ret
main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 40
	mov	qword [rbp-1*8], 4
	mov	r8, qword [rbp-1*8]
	mov	qword [rbp-2*8], r8
	add	qword [rbp-2*8], 1
	mov	r8, qword [rbp-2*8]
	imul	r8, 8
	mov	qword [rbp-2*8], r8
	mov	rdi, qword [rbp-2*8]
	call	malloc
	mov	qword [rbp-3*8], rax
	mov	r8, qword [rbp-3*8]
	mov	r9, qword [rbp-1*8]
	mov	qword [r8], r9
	add	r8, 8
	mov	qword [rbp-3*8], r8
	mov	r8, qword [rbp-3*8]
	mov	qword [rel LABEL0], r8
	call	FUNCTION_main
	mov	qword [rbp-4*8], rax
	mov	rax, qword [rbp-4*8]
	leave
	ret
FUNCTION_main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 560
	mov	qword [rbp-1*8], 0
	mov	qword [rbp-2*8], 0
	mov	qword [rbp-3*8], 4
	mov	r8, qword [rbp-3*8]
	mov	qword [rbp-4*8], r8
	add	qword [rbp-4*8], 1
	mov	r8, qword [rbp-4*8]
	imul	r8, 8
	mov	qword [rbp-4*8], r8
	mov	rdi, qword [rbp-4*8]
	call	malloc
	mov	qword [rbp-5*8], rax
	mov	r8, qword [rbp-5*8]
	mov	r9, qword [rbp-3*8]
	mov	qword [r8], r9
	add	r8, 8
	mov	qword [rbp-5*8], r8
	mov	r8, qword [rbp-5*8]
	mov	qword [rbp-1*8], r8
	mov	qword [rbp-6*8], 0
	mov	r8, qword [rbp-6*8]
	mov	qword [rbp-7*8], r8
	mov	r8, qword [rbp-7*8]
	imul	r8, 8
	mov	qword [rbp-7*8], r8
	mov	r8, qword [rbp-1*8]
	add	qword [rbp-7*8], r8
	mov	r8, qword [rbp-7*8]
	mov	r9, qword [rel LABEL0]
	mov	qword [r8], r9
	mov	qword [rbp-8*8], 1
	mov	qword [rbp-7*8], r8
	mov	r8, qword [rbp-8*8]
	mov	qword [rbp-9*8], r8
	mov	r8, qword [rbp-9*8]
	imul	r8, 8
	mov	qword [rbp-9*8], r8
	mov	r8, qword [rbp-1*8]
	add	qword [rbp-9*8], r8
	mov	r8, qword [rbp-9*8]
	mov	r9, qword [rel LABEL0]
	mov	qword [r8], r9
	mov	qword [rbp-10*8], 2
	mov	qword [rbp-9*8], r8
	mov	r8, qword [rbp-10*8]
	mov	qword [rbp-11*8], r8
	mov	r8, qword [rbp-11*8]
	imul	r8, 8
	mov	qword [rbp-11*8], r8
	mov	r8, qword [rbp-1*8]
	add	qword [rbp-11*8], r8
	mov	r8, qword [rbp-11*8]
	mov	r9, qword [rel LABEL0]
	mov	qword [r8], r9
	mov	qword [rbp-12*8], 3
	mov	qword [rbp-11*8], r8
	mov	r8, qword [rbp-12*8]
	mov	qword [rbp-13*8], r8
	mov	r8, qword [rbp-13*8]
	imul	r8, 8
	mov	qword [rbp-13*8], r8
	mov	r8, qword [rbp-1*8]
	add	qword [rbp-13*8], r8
	mov	r8, qword [rbp-13*8]
	mov	r9, qword [rel LABEL0]
	mov	qword [r8], r9
	mov	qword [rbp-13*8], r8
	mov	rdi, qword [rbp-1*8]
	call	FUNCTION_size
	mov	qword [rbp-14*8], rax
	mov	rdi, qword [rbp-14*8]
	call	FUNCTION_toString
	mov	qword [rbp-15*8], rax
	mov	rdi, qword [rbp-15*8]
	call	FUNCTION_println
	mov	qword [rbp-16*8], rax
	mov	qword [rbp-17*8], 0
	mov	r8, qword [rbp-17*8]
	mov	qword [rbp-2*8], r8
LABEL1:
	mov	qword [rbp-18*8], 0
	mov	r8, qword [rbp-18*8]
	mov	qword [rbp-19*8], r8
	mov	r8, qword [rbp-19*8]
	imul	r8, 8
	mov	qword [rbp-19*8], r8
	mov	r8, qword [rbp-1*8]
	add	qword [rbp-19*8], r8
	mov	r8, qword [rbp-19*8]
	mov	r9, [r8]
	mov	qword [rbp-20*8], r9
	mov	rdi, qword [rbp-20*8]
	call	FUNCTION_size
	mov	qword [rbp-21*8], rax
	mov	r8, qword [rbp-21*8]
	cmp	qword [rbp-2*8], r8
	setl	[rbp-22*8]
	cmp	qword [rbp-22*8], 0
	jz	LABEL3
	jmp	LABEL1
LABEL2:
	mov	qword [rbp-23*8], 0
	mov	r8, qword [rbp-23*8]
	mov	qword [rbp-24*8], r8
	mov	r8, qword [rbp-24*8]
	imul	r8, 8
	mov	qword [rbp-24*8], r8
	mov	r8, qword [rbp-1*8]
	add	qword [rbp-24*8], r8
	mov	r8, qword [rbp-24*8]
	mov	r9, [r8]
	mov	qword [rbp-25*8], r9
	mov	r8, qword [rbp-2*8]
	mov	qword [rbp-26*8], r8
	mov	r8, qword [rbp-26*8]
	imul	r8, 8
	mov	qword [rbp-26*8], r8
	mov	r8, qword [rbp-25*8]
	add	qword [rbp-26*8], r8
	call	FUNCTION_getInt
	mov	qword [rbp-27*8], rax
	mov	r8, qword [rbp-26*8]
	mov	r9, qword [rbp-27*8]
	mov	qword [r8], r9
	inc	qword [rbp-2*8]
	jmp	LABEL1
LABEL3:
	mov	qword [rbp-28*8], 0
	mov	qword [rbp-26*8], r8
	mov	r8, qword [rbp-28*8]
	mov	qword [rbp-2*8], r8
LABEL4:
	mov	qword [rbp-29*8], 1
	mov	r8, qword [rbp-29*8]
	mov	qword [rbp-30*8], r8
	mov	r8, qword [rbp-30*8]
	imul	r8, 8
	mov	qword [rbp-30*8], r8
	mov	r8, qword [rbp-1*8]
	add	qword [rbp-30*8], r8
	mov	r8, qword [rbp-30*8]
	mov	r9, [r8]
	mov	qword [rbp-31*8], r9
	mov	rdi, qword [rbp-31*8]
	call	FUNCTION_size
	mov	qword [rbp-32*8], rax
	mov	r8, qword [rbp-32*8]
	cmp	qword [rbp-2*8], r8
	setl	[rbp-33*8]
	cmp	qword [rbp-33*8], 0
	jz	LABEL6
	jmp	LABEL4
LABEL5:
	mov	qword [rbp-34*8], 1
	mov	r8, qword [rbp-34*8]
	mov	qword [rbp-35*8], r8
	mov	r8, qword [rbp-35*8]
	imul	r8, 8
	mov	qword [rbp-35*8], r8
	mov	r8, qword [rbp-1*8]
	add	qword [rbp-35*8], r8
	mov	r8, qword [rbp-35*8]
	mov	r9, [r8]
	mov	qword [rbp-36*8], r9
	mov	r8, qword [rbp-2*8]
	mov	qword [rbp-37*8], r8
	mov	r8, qword [rbp-37*8]
	imul	r8, 8
	mov	qword [rbp-37*8], r8
	mov	r8, qword [rbp-36*8]
	add	qword [rbp-37*8], r8
	mov	r8, qword [rbp-37*8]
	mov	r9, [r8]
	mov	qword [rbp-38*8], r9
	mov	rdi, qword [rbp-38*8]
	call	FUNCTION_toString
	mov	qword [rbp-39*8], rax
	mov	rdi, qword [rbp-39*8]
	call	FUNCTION_print
	mov	qword [rbp-40*8], rax
	inc	qword [rbp-2*8]
	jmp	LABEL4
LABEL6:
	mov	rdi, 9
	call	malloc
	mov	qword [rbp-41*8], rax
	mov	r8, qword [rbp-41*8]
	mov	r9, 0
	mov	qword [r8], r9
	add	r8, 8
	mov	qword [rbp-41*8], r8
	mov	r8, qword [rbp-41*8]
	mov	qword [rbp-42*8], r8
	add	qword [rbp-42*8], 0
	mov	r8, qword [rbp-42*8]
	mov	r9, 0
	mov	[r8], r9
	mov	qword [rbp-42*8], r8
	mov	rdi, qword [rbp-41*8]
	call	FUNCTION_println
	mov	qword [rbp-43*8], rax
	mov	qword [rbp-44*8], 0
	mov	r8, qword [rbp-44*8]
	mov	qword [rbp-2*8], r8
LABEL7:
	mov	qword [rbp-45*8], 2
	mov	r8, qword [rbp-45*8]
	mov	qword [rbp-46*8], r8
	mov	r8, qword [rbp-46*8]
	imul	r8, 8
	mov	qword [rbp-46*8], r8
	mov	r8, qword [rbp-1*8]
	add	qword [rbp-46*8], r8
	mov	r8, qword [rbp-46*8]
	mov	r9, [r8]
	mov	qword [rbp-47*8], r9
	mov	rdi, qword [rbp-47*8]
	call	FUNCTION_size
	mov	qword [rbp-48*8], rax
	mov	r8, qword [rbp-48*8]
	cmp	qword [rbp-2*8], r8
	setl	[rbp-49*8]
	cmp	qword [rbp-49*8], 0
	jz	LABEL9
	jmp	LABEL7
LABEL8:
	mov	qword [rbp-50*8], 2
	mov	r8, qword [rbp-50*8]
	mov	qword [rbp-51*8], r8
	mov	r8, qword [rbp-51*8]
	imul	r8, 8
	mov	qword [rbp-51*8], r8
	mov	r8, qword [rbp-1*8]
	add	qword [rbp-51*8], r8
	mov	r8, qword [rbp-51*8]
	mov	r9, [r8]
	mov	qword [rbp-52*8], r9
	mov	r8, qword [rbp-2*8]
	mov	qword [rbp-53*8], r8
	mov	r8, qword [rbp-53*8]
	imul	r8, 8
	mov	qword [rbp-53*8], r8
	mov	r8, qword [rbp-52*8]
	add	qword [rbp-53*8], r8
	mov	qword [rbp-54*8], 0
	mov	r8, qword [rbp-53*8]
	mov	r9, qword [rbp-54*8]
	mov	qword [r8], r9
	inc	qword [rbp-2*8]
	jmp	LABEL7
LABEL9:
	mov	qword [rbp-55*8], 0
	mov	qword [rbp-53*8], r8
	mov	r8, qword [rbp-55*8]
	mov	qword [rbp-2*8], r8
LABEL10:
	mov	qword [rbp-56*8], 3
	mov	r8, qword [rbp-56*8]
	mov	qword [rbp-57*8], r8
	mov	r8, qword [rbp-57*8]
	imul	r8, 8
	mov	qword [rbp-57*8], r8
	mov	r8, qword [rbp-1*8]
	add	qword [rbp-57*8], r8
	mov	r8, qword [rbp-57*8]
	mov	r9, [r8]
	mov	qword [rbp-58*8], r9
	mov	rdi, qword [rbp-58*8]
	call	FUNCTION_size
	mov	qword [rbp-59*8], rax
	mov	r8, qword [rbp-59*8]
	cmp	qword [rbp-2*8], r8
	setl	[rbp-60*8]
	cmp	qword [rbp-60*8], 0
	jz	LABEL12
	jmp	LABEL10
LABEL11:
	mov	qword [rbp-61*8], 3
	mov	r8, qword [rbp-61*8]
	mov	qword [rbp-62*8], r8
	mov	r8, qword [rbp-62*8]
	imul	r8, 8
	mov	qword [rbp-62*8], r8
	mov	r8, qword [rbp-1*8]
	add	qword [rbp-62*8], r8
	mov	r8, qword [rbp-62*8]
	mov	r9, [r8]
	mov	qword [rbp-63*8], r9
	mov	r8, qword [rbp-2*8]
	mov	qword [rbp-64*8], r8
	mov	r8, qword [rbp-64*8]
	imul	r8, 8
	mov	qword [rbp-64*8], r8
	mov	r8, qword [rbp-63*8]
	add	qword [rbp-64*8], r8
	mov	r8, qword [rbp-64*8]
	mov	r9, [r8]
	mov	qword [rbp-65*8], r9
	mov	rdi, qword [rbp-65*8]
	call	FUNCTION_toString
	mov	qword [rbp-66*8], rax
	mov	rdi, qword [rbp-66*8]
	call	FUNCTION_print
	mov	qword [rbp-67*8], rax
	inc	qword [rbp-2*8]
	jmp	LABEL10
LABEL12:
	mov	qword [rbp-68*8], 0
	mov	r8, qword [rbp-68*8]
	mov	qword [rbp-69*8], r8
	jmp	LABEL13
LABEL13:
	mov	rax, qword [rbp-69*8]
	leave
	ret
LABEL14:
	SECTION .data
	SECTION .bss
	LABEL0:	resq	1
	SECTION .rodata
	L_022:	db 25H, 73H, 00H
