	default rel
	global main
	global FUNCTION_random
	global FUNCTION_initialize
	global FUNCTION_swap
	global FUNCTION_pd
	global FUNCTION_show
	global FUNCTION_win
	global FUNCTION_merge
	global FUNCTION_move
	global FUNCTION_main
	global LABEL4
	global LABEL5
	global LABEL8
	global LABEL6
	global LABEL7
	global LABEL3
	global LABEL1
	global LABEL2
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
	extern strlen
	extern __stack_chk_fail
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
	        mov     edi, 256
	        call    malloc
	        mov     qword [rbp-8H], rax
	        mov     rax, qword [rbp-8H]
	        mov     rsi, rax
	        lea     rdi, [rel L_022]
	        mov     eax, 0
	        call    __isoc99_scanf
	        mov     rax, qword [rbp-8H]
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
	        sub     rsp, 16
	        mov     qword [rbp-8H], rdi
	        mov     rax, qword [rbp-8H]
	        mov     rdi, rax
	        call    strlen
	        leave
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
	sub	rsp, 328
	mov	r8, 48271
	mov	qword [rel LABEL4], r8
	; 6
	mov	r8, 2147483647
	mov	qword [rel LABEL5], r8
	; 7
	mov	r8, 1
	mov	qword [rel LABEL8], r8
	; 10
	call	FUNCTION_main
	mov	qword [rbp-4*8], rax
	mov	rax, qword [rbp-4*8]
	leave
	ret
FUNCTION_random:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 2568
	mov	r8, qword [rel LABEL4]
	mov	qword [rbp-3*8], r8
	mov	r8, qword [rel LABEL8]
	mov	qword [rbp-4*8], r8
	mov	r8, qword [rel LABEL6]
	mov	rax, qword [rbp-4*8]
	cqo
	idiv	r8
	mov	qword [rbp-4*8], rdx
	mov	r8, qword [rbp-4*8]
	mov	r9, qword [rbp-3*8]
	imul	r9, r8
	mov	qword [rbp-3*8], r9
	mov	r8, qword [rbp-3*8]
	mov	qword [rbp-5*8], r8
	mov	r8, qword [rel LABEL7]
	mov	qword [rbp-6*8], r8
	mov	r8, qword [rel LABEL8]
	mov	qword [rbp-7*8], r8
	mov	r8, qword [rel LABEL6]
	mov	rax, qword [rbp-7*8]
	cqo
	idiv	r8
	mov	qword [rbp-7*8], rax
	mov	r8, qword [rbp-7*8]
	mov	r9, qword [rbp-6*8]
	imul	r9, r8
	mov	qword [rbp-6*8], r9
	mov	r8, qword [rbp-6*8]
	sub	qword [rbp-5*8], r8
	mov	r8, qword [rbp-5*8]
	mov	qword [rbp-2*8], r8
	; 12
	mov	rdi, qword [rel LABEL4]
	call	FUNCTION_toString
	mov	qword [rbp-8*8], rax
	mov	r8, 10
	mov	rdi, r8
	call	malloc
	mov	qword [rbp-9*8], rax
	mov	r8, 1
	mov	r9, qword [rbp-9*8]
	mov	qword [r9], r8
	mov	r8, 8
	add	qword [rbp-9*8], r8
	mov	r8, qword [rbp-9*8]
	mov	qword [rbp-10*8], r8
	mov	r8, 0
	add	qword [rbp-10*8], r8
	mov	r8, 32
	mov	r9, qword [rbp-10*8]
	mov	qword [r9], r8
	mov	rsi, qword [rbp-9*8]
	mov	rdi, qword [rbp-8*8]
	call	FUNCTION_string_concat
	mov	qword [rbp-11*8], rax
	mov	rdi, qword [rel LABEL6]
	call	FUNCTION_toString
	mov	qword [rbp-12*8], rax
	mov	rsi, qword [rbp-12*8]
	mov	rdi, qword [rbp-11*8]
	call	FUNCTION_string_concat
	mov	qword [rbp-13*8], rax
	mov	r8, 10
	mov	rdi, r8
	call	malloc
	mov	qword [rbp-14*8], rax
	mov	r8, 1
	mov	r9, qword [rbp-14*8]
	mov	qword [r9], r8
	mov	r8, 8
	add	qword [rbp-14*8], r8
	mov	r8, qword [rbp-14*8]
	mov	qword [rbp-15*8], r8
	mov	r8, 0
	add	qword [rbp-15*8], r8
	mov	r8, 32
	mov	r9, qword [rbp-15*8]
	mov	qword [r9], r8
	mov	rsi, qword [rbp-14*8]
	mov	rdi, qword [rbp-13*8]
	call	FUNCTION_string_concat
	mov	qword [rbp-16*8], rax
	mov	rdi, qword [rel LABEL7]
	call	FUNCTION_toString
	mov	qword [rbp-17*8], rax
	mov	rsi, qword [rbp-17*8]
	mov	rdi, qword [rbp-16*8]
	call	FUNCTION_string_concat
	mov	qword [rbp-18*8], rax
	mov	r8, 10
	mov	rdi, r8
	call	malloc
	mov	qword [rbp-19*8], rax
	mov	r8, 1
	mov	r9, qword [rbp-19*8]
	mov	qword [r9], r8
	mov	r8, 8
	add	qword [rbp-19*8], r8
	mov	r8, qword [rbp-19*8]
	mov	qword [rbp-20*8], r8
	mov	r8, 0
	add	qword [rbp-20*8], r8
	mov	r8, 32
	mov	r9, qword [rbp-20*8]
	mov	qword [r9], r8
	mov	rsi, qword [rbp-19*8]
	mov	rdi, qword [rbp-18*8]
	call	FUNCTION_string_concat
	mov	qword [rbp-21*8], rax
	mov	rdi, qword [rel LABEL8]
	call	FUNCTION_toString
	mov	qword [rbp-22*8], rax
	mov	rsi, qword [rbp-22*8]
	mov	rdi, qword [rbp-21*8]
	call	FUNCTION_string_concat
	mov	qword [rbp-23*8], rax
	mov	r8, 10
	mov	rdi, r8
	call	malloc
	mov	qword [rbp-24*8], rax
	mov	r8, 1
	mov	r9, qword [rbp-24*8]
	mov	qword [r9], r8
	mov	r8, 8
	add	qword [rbp-24*8], r8
	mov	r8, qword [rbp-24*8]
	mov	qword [rbp-25*8], r8
	mov	r8, 0
	add	qword [rbp-25*8], r8
	mov	r8, 32
	mov	r9, qword [rbp-25*8]
	mov	qword [r9], r8
	mov	rsi, qword [rbp-24*8]
	mov	rdi, qword [rbp-23*8]
	call	FUNCTION_string_concat
	mov	qword [rbp-26*8], rax
	mov	rdi, qword [rbp-2*8]
	call	FUNCTION_toString
	mov	qword [rbp-27*8], rax
	mov	rsi, qword [rbp-27*8]
	mov	rdi, qword [rbp-26*8]
	call	FUNCTION_string_concat
	mov	qword [rbp-28*8], rax
	mov	rdi, qword [rbp-28*8]
	call	FUNCTION_println
	mov	qword [rbp-29*8], rax
	; 13
	mov	r8, 0
	mov	qword [rbp-30*8], r8
	mov	r8, qword [rbp-30*8]
	cmp	qword [rbp-2*8], r8
	setge al
	movzx	eax, al
	mov	qword [rbp-31*8], rax
	cmp	qword [rbp-31*8], 0
	jz	LABEL10
LABEL9:
	mov	r8, qword [rbp-2*8]
	mov	qword [rel LABEL8], r8
	; 15
	jmp	LABEL11
LABEL10:
	mov	r8, qword [rbp-2*8]
	mov	qword [rbp-32*8], r8
	mov	r8, qword [rel LABEL5]
	add	qword [rbp-32*8], r8
	mov	r8, qword [rbp-32*8]
	mov	qword [rel LABEL8], r8
	; 17
LABEL11:
	mov	r8, qword [rel LABEL8]
	mov	qword [rbp-1*8], r8
	jmp	LABEL12
LABEL12:
	mov	rax, qword [rbp-1*8]
	leave
	ret
FUNCTION_initialize:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 168
	mov	qword [rbp-1*8], rdi
	mov	r8, 0
	mov	qword [rbp-2*8], r8
	mov	r8, 0
	add	qword [rbp-1*8], r8
	mov	r8, qword [rbp-1*8]
	mov	qword [rel LABEL8], r8
	; 21
LABEL13:
	mov	rax, qword [rbp-2*8]
	leave
	ret
FUNCTION_swap:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 808
	mov	qword [rbp-1*8], rdi
	mov	qword [rbp-2*8], rsi
	mov	r8, 0
	mov	qword [rbp-3*8], r8
	mov	r8, 0
	add	qword [rbp-1*8], r8
	mov	r8, 0
	add	qword [rbp-2*8], r8
	mov	r8, qword [rbp-1*8]
	mov	qword [rbp-5*8], r8
	mov	r8, 3
	mov	rcx, r8
	shl	qword [rbp-5*8] ,cl
	mov	r8, qword [rel LABEL3]
	add	qword [rbp-5*8], r8
	mov	r8, qword [rbp-5*8]
	mov	r9, [r8]
	mov	qword [rbp-6*8], r9
	mov	r8, qword [rbp-6*8]
	mov	qword [rbp-4*8], r8
	; 24
	mov	r8, qword [rbp-1*8]
	mov	qword [rbp-7*8], r8
	mov	r8, 3
	mov	rcx, r8
	shl	qword [rbp-7*8] ,cl
	mov	r8, qword [rel LABEL3]
	add	qword [rbp-7*8], r8
	mov	r8, qword [rbp-2*8]
	mov	qword [rbp-8*8], r8
	mov	r8, 3
	mov	rcx, r8
	shl	qword [rbp-8*8] ,cl
	mov	r8, qword [rel LABEL3]
	add	qword [rbp-8*8], r8
	mov	r8, qword [rbp-8*8]
	mov	r9, [r8]
	mov	qword [rbp-9*8], r9
	mov	r8, qword [rbp-9*8]
	mov	r9, qword [rbp-7*8]
	mov	qword [r9], r8
	; 25
	mov	r8, qword [rbp-2*8]
	mov	qword [rbp-10*8], r8
	mov	r8, 3
	mov	rcx, r8
	shl	qword [rbp-10*8] ,cl
	mov	r8, qword [rel LABEL3]
	add	qword [rbp-10*8], r8
	mov	r8, qword [rbp-4*8]
	mov	r9, qword [rbp-10*8]
	mov	qword [r9], r8
	; 26
LABEL14:
	mov	rax, qword [rbp-3*8]
	leave
	ret
FUNCTION_pd:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 968
	mov	qword [rbp-1*8], rdi
	mov	r8, 0
	add	qword [rbp-1*8], r8
LABEL15:
	mov	r8, qword [rbp-1*8]
	cmp	qword [rel LABEL1], r8
	setle al
	movzx	eax, al
	mov	qword [rbp-3*8], rax
	cmp	qword [rbp-3*8], 0
	jz	LABEL20
LABEL16:
	mov	r8, qword [rel LABEL1]
	mov	qword [rbp-4*8], r8
	mov	r8, qword [rel LABEL1]
	mov	qword [rbp-5*8], r8
	mov	r8, 1
	add	qword [rbp-5*8], r8
	mov	r8, qword [rbp-5*8]
	mov	r9, qword [rbp-4*8]
	imul	r9, r8
	mov	qword [rbp-4*8], r9
	mov	r8, qword [rbp-4*8]
	mov	qword [rbp-7*8], r8
	mov	r8, 2
	mov	rax, qword [rbp-7*8]
	cqo
	idiv	r8
	mov	qword [rbp-7*8], rax
	mov	r8, qword [rbp-7*8]
	cmp	qword [rbp-1*8], r8
	sete al
	movzx	eax, al
	mov	qword [rbp-9*8], rax
	cmp	qword [rbp-9*8], 0
	jz	LABEL18
LABEL17:
	mov	r8, 1
	mov	qword [rbp-2*8], r8
	jmp	LABEL21
	jmp	LABEL19
LABEL18:
LABEL19:
	mov	r8, 1
	add	qword [rel LABEL1], r8
	jmp	LABEL15
LABEL20:
	mov	r8, 0
	mov	qword [rbp-2*8], r8
	jmp	LABEL21
LABEL21:
	mov	rax, qword [rbp-2*8]
	leave
	ret
FUNCTION_show:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 1288
	mov	r8, 0
	mov	qword [rbp-1*8], r8
	mov	r8, 0
	mov	qword [rbp-2*8], r8
LABEL22:
	mov	r8, qword [rel LABEL2]
	cmp	qword [rbp-2*8], r8
	setl al
	movzx	eax, al
	mov	qword [rbp-4*8], rax
	cmp	qword [rbp-4*8], 0
	jz	LABEL24
LABEL23:
	mov	r8, qword [rbp-2*8]
	mov	qword [rbp-5*8], r8
	mov	r8, 3
	mov	rcx, r8
	shl	qword [rbp-5*8] ,cl
	mov	r8, qword [rel LABEL3]
	add	qword [rbp-5*8], r8
	mov	r8, qword [rbp-5*8]
	mov	r9, [r8]
	mov	qword [rbp-6*8], r9
	mov	rdi, qword [rbp-6*8]
	call	FUNCTION_toString
	mov	qword [rbp-7*8], rax
	mov	r8, 10
	mov	rdi, r8
	call	malloc
	mov	qword [rbp-8*8], rax
	mov	r8, 1
	mov	r9, qword [rbp-8*8]
	mov	qword [r9], r8
	mov	r8, 8
	add	qword [rbp-8*8], r8
	mov	r8, qword [rbp-8*8]
	mov	qword [rbp-9*8], r8
	mov	r8, 0
	add	qword [rbp-9*8], r8
	mov	r8, 32
	mov	r9, qword [rbp-9*8]
	mov	qword [r9], r8
	mov	rsi, qword [rbp-8*8]
	mov	rdi, qword [rbp-7*8]
	call	FUNCTION_string_concat
	mov	qword [rbp-10*8], rax
	mov	rdi, qword [rbp-10*8]
	call	FUNCTION_print
	mov	qword [rbp-11*8], rax
	; 37
	mov	r8, 1
	add	qword [rbp-2*8], r8
	jmp	LABEL22
LABEL24:
	mov	r8, 9
	mov	rdi, r8
	call	malloc
	mov	qword [rbp-13*8], rax
	mov	r8, 0
	mov	r9, qword [rbp-13*8]
	mov	qword [r9], r8
	mov	r8, 8
	add	qword [rbp-13*8], r8
	mov	r8, qword [rbp-13*8]
	mov	qword [rbp-14*8], r8
	mov	r8, 0
	add	qword [rbp-14*8], r8
	mov	r8, 0
	mov	r9, qword [rbp-14*8]
	mov	qword [r9], r8
	mov	rdi, qword [rbp-13*8]
	call	FUNCTION_println
	mov	qword [rbp-15*8], rax
	; 38
LABEL25:
	mov	rax, qword [rbp-1*8]
	leave
	ret
FUNCTION_win:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 3688
	mov	r8, 808
	mov	rdi, r8
	call	malloc
	mov	qword [rbp-8*8], rax
	mov	r8, 100
	mov	r9, qword [rbp-8*8]
	mov	qword [r9], r8
	mov	r8, 8
	add	qword [rbp-8*8], r8
	mov	r8, qword [rbp-8*8]
	mov	qword [rbp-4*8], r8
	; 44
	mov	r8, qword [rel LABEL1]
	cmp	qword [rel LABEL2], r8
	setne al
	movzx	eax, al
	mov	qword [rbp-9*8], rax
	cmp	qword [rbp-9*8], 0
	jz	LABEL27
LABEL26:
	mov	r8, 0
	mov	qword [rbp-1*8], r8
	jmp	LABEL47
	jmp	LABEL28
LABEL27:
LABEL28:
	mov	r8, 0
	mov	qword [rbp-3*8], r8
LABEL29:
	mov	r8, qword [rel LABEL2]
	cmp	qword [rbp-3*8], r8
	setl al
	movzx	eax, al
	mov	qword [rbp-12*8], rax
	cmp	qword [rbp-12*8], 0
	jz	LABEL31
LABEL30:
	mov	r8, qword [rbp-3*8]
	mov	qword [rbp-13*8], r8
	mov	r8, 3
	mov	rcx, r8
	shl	qword [rbp-13*8] ,cl
	mov	r8, qword [rbp-4*8]
	add	qword [rbp-13*8], r8
	mov	r8, qword [rbp-3*8]
	mov	qword [rbp-14*8], r8
	mov	r8, 3
	mov	rcx, r8
	shl	qword [rbp-14*8] ,cl
	mov	r8, qword [rel LABEL3]
	add	qword [rbp-14*8], r8
	mov	r8, qword [rbp-14*8]
	mov	r9, [r8]
	mov	qword [rbp-15*8], r9
	mov	r8, qword [rbp-15*8]
	mov	r9, qword [rbp-13*8]
	mov	qword [r9], r8
	; 49
	mov	r8, 1
	add	qword [rbp-3*8], r8
	jmp	LABEL29
LABEL31:
	mov	r8, 0
	mov	qword [rbp-2*8], r8
LABEL32:
	mov	r8, qword [rel LABEL2]
	mov	qword [rbp-18*8], r8
	mov	r8, 1
	sub	qword [rbp-18*8], r8
	mov	r8, qword [rbp-18*8]
	cmp	qword [rbp-2*8], r8
	setl al
	movzx	eax, al
	mov	qword [rbp-20*8], rax
	cmp	qword [rbp-20*8], 0
	jz	LABEL40
LABEL33:
	mov	r8, qword [rbp-2*8]
	mov	qword [rbp-21*8], r8
	mov	r8, 1
	add	qword [rbp-21*8], r8
	mov	r8, qword [rbp-21*8]
	mov	qword [rbp-3*8], r8
LABEL34:
	mov	r8, qword [rel LABEL2]
	cmp	qword [rbp-3*8], r8
	setl al
	movzx	eax, al
	mov	qword [rbp-23*8], rax
	cmp	qword [rbp-23*8], 0
	jz	LABEL39
LABEL35:
	mov	r8, qword [rbp-2*8]
	mov	qword [rbp-24*8], r8
	mov	r8, 3
	mov	rcx, r8
	shl	qword [rbp-24*8] ,cl
	mov	r8, qword [rbp-4*8]
	add	qword [rbp-24*8], r8
	mov	r8, qword [rbp-24*8]
	mov	r9, [r8]
	mov	qword [rbp-25*8], r9
	mov	r8, qword [rbp-3*8]
	mov	qword [rbp-26*8], r8
	mov	r8, 3
	mov	rcx, r8
	shl	qword [rbp-26*8] ,cl
	mov	r8, qword [rbp-4*8]
	add	qword [rbp-26*8], r8
	mov	r8, qword [rbp-26*8]
	mov	r9, [r8]
	mov	qword [rbp-27*8], r9
	mov	r8, qword [rbp-27*8]
	cmp	qword [rbp-25*8], r8
	setg al
	movzx	eax, al
	mov	qword [rbp-28*8], rax
	cmp	qword [rbp-28*8], 0
	jz	LABEL37
LABEL36:
	mov	r8, qword [rbp-2*8]
	mov	qword [rbp-29*8], r8
	mov	r8, 3
	mov	rcx, r8
	shl	qword [rbp-29*8] ,cl
	mov	r8, qword [rbp-4*8]
	add	qword [rbp-29*8], r8
	mov	r8, qword [rbp-29*8]
	mov	r9, [r8]
	mov	qword [rbp-30*8], r9
	mov	r8, qword [rbp-30*8]
	mov	qword [rbp-5*8], r8
	; 53
	mov	r8, qword [rbp-2*8]
	mov	qword [rbp-31*8], r8
	mov	r8, 3
	mov	rcx, r8
	shl	qword [rbp-31*8] ,cl
	mov	r8, qword [rbp-4*8]
	add	qword [rbp-31*8], r8
	mov	r8, qword [rbp-3*8]
	mov	qword [rbp-32*8], r8
	mov	r8, 3
	mov	rcx, r8
	shl	qword [rbp-32*8] ,cl
	mov	r8, qword [rbp-4*8]
	add	qword [rbp-32*8], r8
	mov	r8, qword [rbp-32*8]
	mov	r9, [r8]
	mov	qword [rbp-33*8], r9
	mov	r8, qword [rbp-33*8]
	mov	r9, qword [rbp-31*8]
	mov	qword [r9], r8
	; 54
	mov	r8, qword [rbp-3*8]
	mov	qword [rbp-34*8], r8
	mov	r8, 3
	mov	rcx, r8
	shl	qword [rbp-34*8] ,cl
	mov	r8, qword [rbp-4*8]
	add	qword [rbp-34*8], r8
	mov	r8, qword [rbp-5*8]
	mov	r9, qword [rbp-34*8]
	mov	qword [r9], r8
	; 55
	jmp	LABEL38
LABEL37:
LABEL38:
	mov	r8, 1
	add	qword [rbp-3*8], r8
	jmp	LABEL34
LABEL39:
	mov	r8, 1
	add	qword [rbp-2*8], r8
	jmp	LABEL32
LABEL40:
	mov	r8, 0
	mov	qword [rbp-2*8], r8
LABEL41:
	mov	r8, qword [rel LABEL2]
	cmp	qword [rbp-2*8], r8
	setl al
	movzx	eax, al
	mov	qword [rbp-38*8], rax
	cmp	qword [rbp-38*8], 0
	jz	LABEL46
LABEL42:
	mov	r8, qword [rbp-2*8]
	mov	qword [rbp-39*8], r8
	mov	r8, 3
	mov	rcx, r8
	shl	qword [rbp-39*8] ,cl
	mov	r8, qword [rbp-4*8]
	add	qword [rbp-39*8], r8
	mov	r8, qword [rbp-39*8]
	mov	r9, [r8]
	mov	qword [rbp-40*8], r9
	mov	r8, qword [rbp-2*8]
	mov	qword [rbp-41*8], r8
	mov	r8, 1
	add	qword [rbp-41*8], r8
	mov	r8, qword [rbp-41*8]
	cmp	qword [rbp-40*8], r8
	setne al
	movzx	eax, al
	mov	qword [rbp-43*8], rax
	cmp	qword [rbp-43*8], 0
	jz	LABEL44
LABEL43:
	mov	r8, 0
	mov	qword [rbp-1*8], r8
	jmp	LABEL47
	jmp	LABEL45
LABEL44:
LABEL45:
	mov	r8, 1
	add	qword [rbp-2*8], r8
	jmp	LABEL41
LABEL46:
	mov	r8, 1
	mov	qword [rbp-1*8], r8
	jmp	LABEL47
LABEL47:
	mov	rax, qword [rbp-1*8]
	leave
	ret
FUNCTION_merge:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 2088
	mov	r8, 0
	mov	qword [rbp-1*8], r8
	mov	r8, 0
	mov	qword [rbp-2*8], r8
LABEL48:
	mov	r8, qword [rel LABEL2]
	cmp	qword [rbp-2*8], r8
	setl al
	movzx	eax, al
	mov	qword [rbp-4*8], rax
	cmp	qword [rbp-4*8], 0
	jz	LABEL59
LABEL49:
	mov	r8, qword [rbp-2*8]
	mov	qword [rbp-5*8], r8
	mov	r8, 3
	mov	rcx, r8
	shl	qword [rbp-5*8] ,cl
	mov	r8, qword [rel LABEL3]
	add	qword [rbp-5*8], r8
	mov	r8, qword [rbp-5*8]
	mov	r9, [r8]
	mov	qword [rbp-6*8], r9
	mov	r8, 0
	mov	qword [rbp-7*8], r8
	mov	r8, qword [rbp-7*8]
	cmp	qword [rbp-6*8], r8
	sete al
	movzx	eax, al
	mov	qword [rbp-8*8], rax
	cmp	qword [rbp-8*8], 0
	jz	LABEL57
LABEL50:
	mov	r8, qword [rbp-2*8]
	mov	qword [rbp-10*8], r8
	mov	r8, 1
	add	qword [rbp-10*8], r8
	mov	r8, qword [rbp-10*8]
	mov	qword [rbp-9*8], r8
LABEL51:
	mov	r8, qword [rel LABEL2]
	cmp	qword [rbp-9*8], r8
	setl al
	movzx	eax, al
	mov	qword [rbp-12*8], rax
	cmp	qword [rbp-12*8], 0
	jz	LABEL56
LABEL52:
	mov	r8, qword [rbp-9*8]
	mov	qword [rbp-13*8], r8
	mov	r8, 3
	mov	rcx, r8
	shl	qword [rbp-13*8] ,cl
	mov	r8, qword [rel LABEL3]
	add	qword [rbp-13*8], r8
	mov	r8, qword [rbp-13*8]
	mov	r9, [r8]
	mov	qword [rbp-14*8], r9
	mov	r8, 0
	mov	qword [rbp-15*8], r8
	mov	r8, qword [rbp-15*8]
	cmp	qword [rbp-14*8], r8
	setne al
	movzx	eax, al
	mov	qword [rbp-16*8], rax
	cmp	qword [rbp-16*8], 0
	jz	LABEL54
LABEL53:
	mov	rsi, qword [rbp-9*8]
	mov	rdi, qword [rbp-2*8]
	call	FUNCTION_swap
	mov	qword [rbp-17*8], rax
	; 70
	jmp	LABEL56
	jmp	LABEL55
LABEL54:
LABEL55:
	mov	r8, 1
	add	qword [rbp-9*8], r8
	jmp	LABEL51
LABEL56:
	jmp	LABEL58
LABEL57:
LABEL58:
	mov	r8, 1
	add	qword [rbp-2*8], r8
	jmp	LABEL48
LABEL59:
	mov	r8, 0
	mov	qword [rbp-2*8], r8
LABEL60:
	mov	r8, qword [rel LABEL2]
	cmp	qword [rbp-2*8], r8
	setl al
	movzx	eax, al
	mov	qword [rbp-21*8], rax
	cmp	qword [rbp-21*8], 0
	jz	LABEL65
LABEL61:
	mov	r8, qword [rbp-2*8]
	mov	qword [rbp-22*8], r8
	mov	r8, 3
	mov	rcx, r8
	shl	qword [rbp-22*8] ,cl
	mov	r8, qword [rel LABEL3]
	add	qword [rbp-22*8], r8
	mov	r8, qword [rbp-22*8]
	mov	r9, [r8]
	mov	qword [rbp-23*8], r9
	mov	r8, 0
	mov	qword [rbp-24*8], r8
	mov	r8, qword [rbp-24*8]
	cmp	qword [rbp-23*8], r8
	sete al
	movzx	eax, al
	mov	qword [rbp-25*8], rax
	cmp	qword [rbp-25*8], 0
	jz	LABEL63
LABEL62:
	mov	r8, qword [rbp-2*8]
	mov	qword [rel LABEL2], r8
	; 76
	jmp	LABEL65
	jmp	LABEL64
LABEL63:
LABEL64:
	mov	r8, 1
	add	qword [rbp-2*8], r8
	jmp	LABEL60
LABEL65:
LABEL66:
	mov	rax, qword [rbp-1*8]
	leave
	ret
FUNCTION_move:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 968
	mov	r8, 0
	mov	qword [rbp-1*8], r8
	mov	r8, 0
	mov	qword [rbp-2*8], r8
	; 81
LABEL67:
	mov	r8, qword [rel LABEL2]
	cmp	qword [rbp-2*8], r8
	setl al
	movzx	eax, al
	mov	qword [rbp-4*8], rax
	cmp	qword [rbp-4*8], 0
	jz	LABEL69
LABEL68:
	mov	r8, qword [rbp-2*8]
	mov	qword [rbp-5*8], r8
	mov	r8, 3
	mov	rcx, r8
	shl	qword [rbp-5*8] ,cl
	mov	r8, qword [rel LABEL3]
	add	qword [rbp-5*8], r8
	mov	r8, qword [rbp-5*8]
	mov	qword [rbp-6*8], r8
	mov	r8, qword [rbp-6*8]
	mov	r9, [r8]
	mov	qword [rbp-7*8], r9
	mov	r8, 1
	sub	qword [rbp-7*8], r8
	mov	r8, qword [rbp-7*8]
	mov	r9, qword [rbp-5*8]
	mov	qword [r9], r8
	; 83
	mov	r8, qword [rbp-2*8]
	mov	qword [rbp-9*8], r8
	mov	r8, 1
	add	qword [rbp-9*8], r8
	mov	r8, qword [rbp-9*8]
	mov	qword [rbp-2*8], r8
	; 84
	jmp	LABEL67
LABEL69:
	mov	r8, qword [rel LABEL2]
	mov	qword [rbp-11*8], r8
	mov	r8, 3
	mov	rcx, r8
	shl	qword [rbp-11*8] ,cl
	mov	r8, qword [rel LABEL3]
	add	qword [rbp-11*8], r8
	mov	r8, qword [rel LABEL2]
	mov	r9, qword [rbp-11*8]
	mov	qword [r9], r8
	; 86
	mov	r8, 1
	add	qword [rel LABEL2], r8
	; 87
LABEL70:
	mov	rax, qword [rbp-1*8]
	leave
	ret
FUNCTION_main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 3688
	mov	r8, 0
	mov	qword [rbp-1*8], r8
	; 90
	; 91
	; 92
	mov	r8, 210
	mov	qword [rel LABEL0], r8
	; 93
	mov	r8, 0
	mov	qword [rel LABEL1], r8
	; 94
	mov	r8, 808
	mov	rdi, r8
	call	malloc
	mov	qword [rbp-16*8], rax
	mov	r8, 100
	mov	r9, qword [rbp-16*8]
	mov	qword [r9], r8
	mov	r8, 8
	add	qword [rbp-16*8], r8
	mov	r8, qword [rbp-16*8]
	mov	qword [rel LABEL3], r8
	; 95
	mov	r8, qword [rel LABEL5]
	mov	qword [rbp-17*8], r8
	mov	r8, qword [rel LABEL4]
	mov	rax, qword [rbp-17*8]
	cqo
	idiv	r8
	mov	qword [rbp-17*8], rax
	mov	r8, qword [rbp-17*8]
	mov	qword [rel LABEL6], r8
	; 96
	mov	r8, qword [rel LABEL5]
	mov	qword [rbp-18*8], r8
	mov	r8, qword [rel LABEL4]
	mov	rax, qword [rbp-18*8]
	cqo
	idiv	r8
	mov	qword [rbp-18*8], rdx
	mov	r8, qword [rbp-18*8]
	mov	qword [rel LABEL7], r8
	; 97
	mov	rdi, qword [rel LABEL0]
	call	FUNCTION_pd
	mov	qword [rbp-19*8], rax
	mov	r8, 1
	mov	qword [rbp-20*8], r8
	mov	r8, qword [rbp-19*8]
	xor	qword [rbp-20*8], r8
	cmp	qword [rbp-20*8], 0
	jz	LABEL72
LABEL71:
	mov	r8, 88
	mov	rdi, r8
	call	malloc
	mov	qword [rbp-21*8], rax
	mov	r8, 79
	mov	r9, qword [rbp-21*8]
	mov	qword [r9], r8
	mov	r8, 8
	add	qword [rbp-21*8], r8
	mov	r8, qword [rbp-21*8]
	mov	qword [rbp-22*8], r8
	mov	r8, 0
	add	qword [rbp-22*8], r8
	mov	r8, 8367737007777148755
	mov	r9, qword [rbp-22*8]
	mov	qword [r9], r8
	mov	r8, qword [rbp-21*8]
	mov	qword [rbp-23*8], r8
	mov	r8, 8
	add	qword [rbp-23*8], r8
	mov	r8, 7305521896674583912
	mov	r9, qword [rbp-23*8]
	mov	qword [r9], r8
	mov	r8, qword [rbp-21*8]
	mov	qword [rbp-24*8], r8
	mov	r8, 16
	add	qword [rbp-24*8], r8
	mov	r8, 8391179642277339250
	mov	r9, qword [rbp-24*8]
	mov	qword [r9], r8
	mov	r8, qword [rbp-21*8]
	mov	qword [rbp-25*8], r8
	mov	r8, 24
	add	qword [rbp-25*8], r8
	mov	r8, 8461736351403172384
	mov	r9, qword [rbp-25*8]
	mov	qword [r9], r8
	mov	r8, qword [rbp-21*8]
	mov	qword [rbp-26*8], r8
	mov	r8, 32
	add	qword [rbp-26*8], r8
	mov	r8, 8371755340523725421
	mov	r9, qword [rbp-26*8]
	mov	qword [r9], r8
	mov	r8, qword [rbp-21*8]
	mov	qword [rbp-27*8], r8
	mov	r8, 40
	add	qword [rbp-27*8], r8
	mov	r8, 2334397761731174446
	mov	r9, qword [rbp-27*8]
	mov	qword [r9], r8
	mov	r8, qword [rbp-21*8]
	mov	qword [rbp-28*8], r8
	mov	r8, 48
	add	qword [rbp-28*8], r8
	mov	r8, 7575181517226866789
	mov	r9, qword [rbp-28*8]
	mov	qword [r9], r8
	mov	r8, qword [rbp-21*8]
	mov	qword [rbp-29*8], r8
	mov	r8, 56
	add	qword [rbp-29*8], r8
	mov	r8, 8747806222975071008
	mov	r9, qword [rbp-29*8]
	mov	qword [r9], r8
	mov	r8, qword [rbp-21*8]
	mov	qword [rbp-30*8], r8
	mov	r8, 64
	add	qword [rbp-30*8], r8
	mov	r8, 3112336360689069673
	mov	r9, qword [rbp-30*8]
	mov	qword [r9], r8
	mov	r8, qword [rbp-21*8]
	mov	qword [rbp-31*8], r8
	mov	r8, 72
	add	qword [rbp-31*8], r8
	mov	r8, 29602349897886514
	mov	r9, qword [rbp-31*8]
	mov	qword [r9], r8
	mov	rdi, qword [rbp-21*8]
	call	FUNCTION_println
	mov	qword [rbp-32*8], rax
	; 99
	mov	r8, 1
	mov	qword [rbp-1*8], r8
	jmp	LABEL74
	jmp	LABEL73
LABEL72:
LABEL73:
	mov	r8, 21
	mov	rdi, r8
	call	malloc
	mov	qword [rbp-34*8], rax
	mov	r8, 12
	mov	r9, qword [rbp-34*8]
	mov	qword [r9], r8
	mov	r8, 8
	add	qword [rbp-34*8], r8
	mov	r8, qword [rbp-34*8]
	mov	qword [rbp-35*8], r8
	mov	r8, 0
	add	qword [rbp-35*8], r8
	mov	r8, 8391086209676633420
	mov	r9, qword [rbp-35*8]
	mov	qword [r9], r8
	mov	r8, qword [rbp-34*8]
	mov	qword [rbp-36*8], r8
	mov	r8, 8
	add	qword [rbp-36*8], r8
	mov	r8, 561279585
	mov	r9, qword [rbp-36*8]
	mov	qword [r9], r8
	mov	rdi, qword [rbp-34*8]
	call	FUNCTION_println
	mov	qword [rbp-37*8], rax
	; 102
	mov	r8, 3654898
	mov	qword [rbp-38*8], r8
	mov	rdi, qword [rbp-38*8]
	call	FUNCTION_initialize
	mov	qword [rbp-39*8], rax
	; 103
	call	FUNCTION_random
	mov	qword [rbp-40*8], rax
	mov	r8, qword [rbp-40*8]
	mov	qword [rbp-41*8], r8
	mov	r8, 10
	mov	rax, qword [rbp-41*8]
	cqo
	idiv	r8
	mov	qword [rbp-41*8], rdx
	mov	r8, qword [rbp-41*8]
	mov	qword [rbp-43*8], r8
	mov	r8, 1
	add	qword [rbp-43*8], r8
	mov	r8, qword [rbp-43*8]
	mov	qword [rel LABEL2], r8
	; 104
	mov	rdi, qword [rel LABEL2]
	call	FUNCTION_toString
	mov	qword [rbp-45*8], rax
	mov	rdi, qword [rbp-45*8]
	call	FUNCTION_println
	mov	qword [rbp-46*8], rax
	; 105
LABEL74:
	mov	rax, qword [rbp-1*8]
	leave
	ret
LABEL75:
	SECTION .data
	SECTION .bss
	LABEL4:	resq	1
	LABEL5:	resq	1
	LABEL8:	resq	1
	LABEL6:	resq	1
	LABEL7:	resq	1
	LABEL3:	resq	1
	LABEL1:	resq	1
	LABEL2:	resq	1
	LABEL0:	resq	1
	SECTION .rodata
	L_022:	db 25H, 73H, 00H
