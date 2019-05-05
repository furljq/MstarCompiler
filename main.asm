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
	extern __stack_chk_fail
	extern getchar
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
	        lea     rdi, [rel L_027]
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
	        add     qword [rbp-8H], 8
	        mov     dword [rbp-0CH], 0
	        mov     byte [rbp-0EH], 0
	L_001:  call    getchar
	        mov     byte [rbp-0DH], al
	        cmp     byte [rbp-0DH], 32
	        jz      L_002
	        cmp     byte [rbp-0DH], 10
	        jz      L_002
	        cmp     byte [rbp-0DH], 13
	        jnz     L_003
	L_002:  mov     eax, dword [rbp-0CH]
	        movsxd  rdx, eax
	        mov     rax, qword [rbp-8H]
	        add     rax, rdx
	        mov     byte [rax], 0
	        cmp     byte [rbp-0EH], 0
	        jz      L_004
	        jmp     L_005
	L_003:  mov     byte [rbp-0EH], 1
	        mov     eax, dword [rbp-0CH]
	        lea     edx, [rax+1H]
	        mov     dword [rbp-0CH], edx
	        movsxd  rdx, eax
	        mov     rax, qword [rbp-8H]
	        add     rdx, rax
	        movzx   eax, byte [rbp-0DH]
	        mov     byte [rdx], al
	L_004:  jmp     L_001
	L_005:  mov     rax, qword [rbp-8H]
	        lea     rdx, [rax-8H]
	        mov     eax, dword [rbp-0CH]
	        cdqe
	        mov     qword [rdx], rax
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
	        jns     L_006
	        mov     dword [rbp-44H], 1
	        neg     qword [rbp-58H]
	L_006:  cmp     qword [rbp-58H], 0
	        jnz     L_008
	        add     dword [rbp-40H], 1
	        mov     eax, dword [rbp-40H]
	        cdqe
	        mov     dword [rbp+rax*4-30H], 0
	        jmp     L_009
	L_007:  mov     rcx, qword [rbp-58H]
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
	L_008:  cmp     qword [rbp-58H], 0
	        jnz     L_007
	L_009:  mov     edx, dword [rbp-40H]
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
	        jz      L_010
	        mov     rax, qword [rbp-38H]
	        mov     byte [rax], 45
	L_010:  mov     dword [rbp-3CH], 0
	        jmp     L_012
	L_011:  mov     eax, dword [rbp-40H]
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
	L_012:  mov     eax, dword [rbp-3CH]
	        cmp     eax, dword [rbp-40H]
	        jl      L_011
	        mov     rax, qword [rbp-38H]
	        mov     rsi, qword [rbp-8H]
	        xor     rsi, qword [fs:abs 28H]
	        jz      L_013
	        call    __stack_chk_fail
	L_013:  leave
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
	        jmp     L_015
	L_014:  mov     eax, dword [rbp-10H]
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
	L_015:  mov     eax, dword [rbp-10H]
	        cmp     eax, dword [rbp-0CH]
	        jl      L_014
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
	        jmp     L_017
	L_016:  mov     eax, dword [rbp-0CH]
	        lea     edx, [rax+1H]
	        mov     dword [rbp-0CH], edx
	        movsxd  rdx, eax
	        mov     rax, qword [rbp-18H]
	        add     rax, rdx
	        movzx   eax, byte [rax]
	        cmp     al, 45
	        jnz     L_017
	        mov     dword [rbp-10H], 1
	L_017:  mov     eax, dword [rbp-0CH]
	        movsxd  rdx, eax
	        mov     rax, qword [rbp-18H]
	        add     rax, rdx
	        movzx   eax, byte [rax]
	        cmp     al, 47
	        jle     L_016
	        mov     eax, dword [rbp-0CH]
	        movsxd  rdx, eax
	        mov     rax, qword [rbp-18H]
	        add     rax, rdx
	        movzx   eax, byte [rax]
	        cmp     al, 57
	        jg      L_016
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
	        jmp     L_019
	L_018:  mov     rdx, qword [rbp-8H]
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
	L_019:  mov     eax, dword [rbp-0CH]
	        movsxd  rdx, eax
	        mov     rax, qword [rbp-18H]
	        add     rax, rdx
	        movzx   eax, byte [rax]
	        cmp     al, 47
	        jle     L_020
	        mov     eax, dword [rbp-0CH]
	        movsxd  rdx, eax
	        mov     rax, qword [rbp-18H]
	        add     rax, rdx
	        movzx   eax, byte [rax]
	        cmp     al, 57
	        jle     L_018
	L_020:  cmp     dword [rbp-10H], 0
	        jz      L_021
	        mov     rax, qword [rbp-8H]
	        neg     rax
	        jmp     L_022
	L_021:  mov     rax, qword [rbp-8H]
	L_022:  pop     rbp
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
	        jmp     L_024
	L_023:  mov     eax, dword [rbp-18H]
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
	L_024:  mov     eax, dword [rbp-18H]
	        cmp     eax, dword [rbp-10H]
	        jl      L_023
	        mov     dword [rbp-14H], 0
	        jmp     L_026
	L_025:  mov     eax, dword [rbp-14H]
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
	L_026:  mov     eax, dword [rbp-14H]
	        cmp     eax, dword [rbp-0CH]
	        jl      L_025
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
	mov	qword [rbp-1*8], 48271
	mov	r8, qword [rbp-1*8]
	mov	qword [rel LABEL4], r8
	; 6
	mov	qword [rbp-2*8], 2147483647
	mov	r8, qword [rbp-2*8]
	mov	qword [rel LABEL5], r8
	; 7
	mov	qword [rbp-3*8], 1
	mov	r8, qword [rbp-3*8]
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
	sub	rsp, 88
	mov	qword [rbp-1*8], 0
	mov	qword [rbp-2*8], 0
	mov	r8, qword [rel LABEL4]
	mov	qword [rbp-3*8], r8
	mov	r8, qword [rel LABEL8]
	mov	qword [rbp-4*8], r8
	mov	rax, qword [rbp-4*8]
	cqo
	idiv	qword [rel LABEL6]
	mov	qword [rbp-4*8], rdx
	mov	r9, qword [rbp-3*8]
	mov	r8, qword [rbp-4*8]
	imul	r9, r8
	mov	qword [rbp-3*8], r9
	mov	r8, qword [rbp-3*8]
	mov	qword [rbp-5*8], r8
	mov	r8, qword [rel LABEL7]
	mov	qword [rbp-6*8], r8
	mov	r8, qword [rel LABEL8]
	mov	qword [rbp-7*8], r8
	mov	rax, qword [rbp-7*8]
	cqo
	idiv	qword [rel LABEL6]
	mov	qword [rbp-7*8], rax
	mov	r9, qword [rbp-6*8]
	mov	r8, qword [rbp-7*8]
	imul	r9, r8
	mov	qword [rbp-6*8], r9
	mov	r8, qword [rbp-6*8]
	sub	qword [rbp-5*8], r8
	mov	r8, qword [rbp-5*8]
	mov	qword [rbp-2*8], r8
	; 12
	mov	qword [rbp-8*8], 0
	mov	r8, qword [rbp-8*8]
	cmp	qword [rbp-2*8], r8
	setge al
	movzx	eax, al
	mov	qword [rbp-9*8], rax
	cmp	qword [rbp-9*8], 0
	jz	LABEL9
	mov	r8, qword [rbp-2*8]
	mov	qword [rel LABEL8], r8
	; 14
	jmp	LABEL10
LABEL9:
	mov	r8, qword [rbp-2*8]
	mov	qword [rbp-10*8], r8
	mov	r8, qword [rel LABEL5]
	add	qword [rbp-10*8], r8
	mov	r8, qword [rbp-10*8]
	mov	qword [rel LABEL8], r8
	; 16
LABEL10:
	mov	r8, qword [rel LABEL8]
	mov	qword [rbp-1*8], r8
	jmp	LABEL11
LABEL11:
	mov	rax, qword [rbp-1*8]
	leave
	ret
FUNCTION_initialize:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 24
	mov	qword [rbp-1*8], rdi
	mov	qword [rbp-2*8], 0
	add	qword [rbp-1*8], 0
	mov	r8, qword [rbp-1*8]
	mov	qword [rel LABEL8], r8
	; 20
LABEL12:
	mov	rax, qword [rbp-2*8]
	leave
	ret
FUNCTION_swap:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 88
	mov	qword [rbp-1*8], rdi
	mov	qword [rbp-2*8], rsi
	mov	qword [rbp-3*8], 0
	add	qword [rbp-1*8], 0
	add	qword [rbp-2*8], 0
	mov	qword [rbp-4*8], 0
	mov	r8, qword [rbp-1*8]
	mov	qword [rbp-5*8], r8
	mov	r9, qword [rbp-5*8]
	mov	qword [rbp-5*8], r9
	mov	r8, qword [rbp-5*8]
	imul	r8, 8
	mov	qword [rbp-5*8], r8
	mov	r8, qword [rel LABEL3]
	add	qword [rbp-5*8], r8
	mov	r8, qword [rbp-5*8]
	mov	r9, [r8]
	mov	qword [rbp-6*8], r9
	mov	r8, qword [rbp-6*8]
	mov	qword [rbp-4*8], r8
	; 23
	mov	r8, qword [rbp-1*8]
	mov	qword [rbp-7*8], r8
	mov	r9, qword [rbp-7*8]
	mov	qword [rbp-7*8], r9
	mov	r8, qword [rbp-7*8]
	imul	r8, 8
	mov	qword [rbp-7*8], r8
	mov	r8, qword [rel LABEL3]
	add	qword [rbp-7*8], r8
	mov	r8, qword [rbp-2*8]
	mov	qword [rbp-8*8], r8
	mov	r9, qword [rbp-8*8]
	mov	qword [rbp-8*8], r9
	mov	r8, qword [rbp-8*8]
	imul	r8, 8
	mov	qword [rbp-8*8], r8
	mov	r8, qword [rel LABEL3]
	add	qword [rbp-8*8], r8
	mov	r8, qword [rbp-8*8]
	mov	r9, [r8]
	mov	qword [rbp-9*8], r9
	mov	r8, qword [rbp-7*8]
	mov	r9, qword [rbp-9*8]
	mov	qword [r8], r9
	; 24
	mov	r8, qword [rbp-2*8]
	mov	qword [rbp-10*8], r8
	mov	r9, qword [rbp-10*8]
	mov	qword [rbp-10*8], r9
	mov	r8, qword [rbp-10*8]
	imul	r8, 8
	mov	qword [rbp-10*8], r8
	mov	r8, qword [rel LABEL3]
	add	qword [rbp-10*8], r8
	mov	r8, qword [rbp-10*8]
	mov	r9, qword [rbp-4*8]
	mov	qword [r8], r9
	; 25
LABEL13:
	mov	rax, qword [rbp-3*8]
	leave
	ret
FUNCTION_pd:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 104
	mov	qword [rbp-1*8], rdi
	mov	qword [rbp-2*8], 0
	add	qword [rbp-1*8], 0
LABEL14:
	mov	r8, qword [rbp-1*8]
	cmp	qword [rel LABEL1], r8
	setle al
	movzx	eax, al
	mov	qword [rbp-3*8], rax
	cmp	qword [rbp-3*8], 0
	jz	LABEL17
	mov	r8, qword [rel LABEL1]
	mov	qword [rbp-4*8], r8
	mov	r8, qword [rel LABEL1]
	mov	qword [rbp-5*8], r8
	mov	qword [rbp-6*8], 1
	mov	r8, qword [rbp-6*8]
	add	qword [rbp-5*8], r8
	mov	r9, qword [rbp-4*8]
	mov	r8, qword [rbp-5*8]
	imul	r9, r8
	mov	qword [rbp-4*8], r9
	mov	r8, qword [rbp-4*8]
	mov	qword [rbp-7*8], r8
	mov	qword [rbp-8*8], 2
	mov	rax, qword [rbp-7*8]
	cqo
	idiv	qword [rbp-8*8]
	mov	qword [rbp-7*8], rax
	mov	r8, qword [rbp-7*8]
	cmp	qword [rbp-1*8], r8
	sete al
	movzx	eax, al
	mov	qword [rbp-9*8], rax
	cmp	qword [rbp-9*8], 0
	jz	LABEL15
	mov	qword [rbp-10*8], 1
	mov	r8, qword [rbp-10*8]
	mov	qword [rbp-2*8], r8
	jmp	LABEL18
	jmp	LABEL16
LABEL15:
LABEL16:
	add	qword [rel LABEL1], 1
	mov	r8, qword [rel LABEL1]
	mov	qword [rbp-11*8], r8
	jmp	LABEL14
LABEL17:
	mov	qword [rbp-12*8], 0
	mov	r8, qword [rbp-12*8]
	mov	qword [rbp-2*8], r8
	jmp	LABEL18
LABEL18:
	mov	rax, qword [rbp-2*8]
	leave
	ret
FUNCTION_show:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 128
	mov	qword [rbp-1*8], 0
	mov	qword [rbp-2*8], 0
	mov	qword [rbp-3*8], 0
	mov	r8, qword [rbp-3*8]
	mov	qword [rbp-2*8], r8
LABEL19:
	mov	r8, qword [rel LABEL2]
	cmp	qword [rbp-2*8], r8
	setl al
	movzx	eax, al
	mov	qword [rbp-4*8], rax
	cmp	qword [rbp-4*8], 0
	jz	LABEL20
	mov	r8, qword [rbp-2*8]
	mov	qword [rbp-5*8], r8
	mov	r9, qword [rbp-5*8]
	mov	qword [rbp-5*8], r9
	mov	r8, qword [rbp-5*8]
	imul	r8, 8
	mov	qword [rbp-5*8], r8
	mov	r8, qword [rel LABEL3]
	add	qword [rbp-5*8], r8
	mov	r8, qword [rbp-5*8]
	mov	r9, [r8]
	mov	qword [rbp-6*8], r9
	mov	rdi, qword [rbp-6*8]
	call	FUNCTION_toString
	mov	qword [rbp-7*8], rax
	mov	rdi, 10
	call	malloc
	mov	qword [rbp-8*8], rax
	mov	r8, qword [rbp-8*8]
	mov	r9, 1
	mov	qword [r8], r9
	add	qword [rbp-8*8], 8
	mov	r8, qword [rbp-8*8]
	mov	qword [rbp-9*8], r8
	add	qword [rbp-9*8], 0
	mov	r8, qword [rbp-9*8]
	mov	r9, 32
	mov	qword [r8], r9
	mov	rsi, qword [rbp-8*8]
	mov	rdi, qword [rbp-7*8]
	call	FUNCTION_string_concat
	mov	qword [rbp-10*8], rax
	mov	rdi, qword [rbp-10*8]
	call	FUNCTION_print
	mov	qword [rbp-11*8], rax
	; 36
	add	qword [rbp-2*8], 1
	mov	r8, qword [rbp-2*8]
	mov	qword [rbp-12*8], r8
	jmp	LABEL19
LABEL20:
	mov	rdi, 9
	call	malloc
	mov	qword [rbp-13*8], rax
	mov	r8, qword [rbp-13*8]
	mov	r9, 0
	mov	qword [r8], r9
	add	qword [rbp-13*8], 8
	mov	r8, qword [rbp-13*8]
	mov	qword [rbp-14*8], r8
	add	qword [rbp-14*8], 0
	mov	r8, qword [rbp-14*8]
	mov	r9, 0
	mov	qword [r8], r9
	mov	rdi, qword [rbp-13*8]
	call	FUNCTION_println
	mov	qword [rbp-15*8], rax
	; 37
LABEL21:
	mov	rax, qword [rbp-1*8]
	leave
	ret
FUNCTION_win:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 376
	mov	qword [rbp-1*8], 0
	mov	qword [rbp-2*8], 0
	mov	qword [rbp-3*8], 0
	mov	qword [rbp-4*8], 0
	mov	qword [rbp-5*8], 0
	mov	qword [rbp-6*8], 100
	mov	r8, qword [rbp-6*8]
	mov	qword [rbp-7*8], r8
	add	qword [rbp-7*8], 1
	mov	r9, qword [rbp-7*8]
	mov	qword [rbp-7*8], r9
	mov	r8, qword [rbp-7*8]
	imul	r8, 8
	mov	qword [rbp-7*8], r8
	mov	rdi, qword [rbp-7*8]
	call	malloc
	mov	qword [rbp-8*8], rax
	mov	r8, qword [rbp-8*8]
	mov	r9, qword [rbp-6*8]
	mov	qword [r8], r9
	add	qword [rbp-8*8], 8
	mov	r8, qword [rbp-8*8]
	mov	qword [rbp-4*8], r8
	; 43
	mov	r8, qword [rel LABEL1]
	cmp	qword [rel LABEL2], r8
	setne al
	movzx	eax, al
	mov	qword [rbp-9*8], rax
	cmp	qword [rbp-9*8], 0
	jz	LABEL22
	mov	qword [rbp-10*8], 0
	mov	r8, qword [rbp-10*8]
	mov	qword [rbp-1*8], r8
	jmp	LABEL36
	jmp	LABEL23
LABEL22:
LABEL23:
	mov	qword [rbp-11*8], 0
	mov	r8, qword [rbp-11*8]
	mov	qword [rbp-3*8], r8
LABEL24:
	mov	r8, qword [rel LABEL2]
	cmp	qword [rbp-3*8], r8
	setl al
	movzx	eax, al
	mov	qword [rbp-12*8], rax
	cmp	qword [rbp-12*8], 0
	jz	LABEL25
	mov	r8, qword [rbp-3*8]
	mov	qword [rbp-13*8], r8
	mov	r9, qword [rbp-13*8]
	mov	qword [rbp-13*8], r9
	mov	r8, qword [rbp-13*8]
	imul	r8, 8
	mov	qword [rbp-13*8], r8
	mov	r8, qword [rbp-4*8]
	add	qword [rbp-13*8], r8
	mov	r8, qword [rbp-3*8]
	mov	qword [rbp-14*8], r8
	mov	r9, qword [rbp-14*8]
	mov	qword [rbp-14*8], r9
	mov	r8, qword [rbp-14*8]
	imul	r8, 8
	mov	qword [rbp-14*8], r8
	mov	r8, qword [rel LABEL3]
	add	qword [rbp-14*8], r8
	mov	r8, qword [rbp-14*8]
	mov	r9, [r8]
	mov	qword [rbp-15*8], r9
	mov	r8, qword [rbp-13*8]
	mov	r9, qword [rbp-15*8]
	mov	qword [r8], r9
	; 48
	add	qword [rbp-3*8], 1
	mov	r8, qword [rbp-3*8]
	mov	qword [rbp-16*8], r8
	jmp	LABEL24
LABEL25:
	mov	qword [rbp-17*8], 0
	mov	r8, qword [rbp-17*8]
	mov	qword [rbp-2*8], r8
LABEL26:
	mov	r8, qword [rel LABEL2]
	mov	qword [rbp-18*8], r8
	mov	qword [rbp-19*8], 1
	mov	r8, qword [rbp-19*8]
	sub	qword [rbp-18*8], r8
	mov	r8, qword [rbp-18*8]
	cmp	qword [rbp-2*8], r8
	setl al
	movzx	eax, al
	mov	qword [rbp-20*8], rax
	cmp	qword [rbp-20*8], 0
	jz	LABEL31
	mov	r8, qword [rbp-2*8]
	mov	qword [rbp-21*8], r8
	mov	qword [rbp-22*8], 1
	mov	r8, qword [rbp-22*8]
	add	qword [rbp-21*8], r8
	mov	r8, qword [rbp-21*8]
	mov	qword [rbp-3*8], r8
LABEL27:
	mov	r8, qword [rel LABEL2]
	cmp	qword [rbp-3*8], r8
	setl al
	movzx	eax, al
	mov	qword [rbp-23*8], rax
	cmp	qword [rbp-23*8], 0
	jz	LABEL30
	mov	r8, qword [rbp-2*8]
	mov	qword [rbp-24*8], r8
	mov	r9, qword [rbp-24*8]
	mov	qword [rbp-24*8], r9
	mov	r8, qword [rbp-24*8]
	imul	r8, 8
	mov	qword [rbp-24*8], r8
	mov	r8, qword [rbp-4*8]
	add	qword [rbp-24*8], r8
	mov	r8, qword [rbp-24*8]
	mov	r9, [r8]
	mov	qword [rbp-25*8], r9
	mov	r8, qword [rbp-3*8]
	mov	qword [rbp-26*8], r8
	mov	r9, qword [rbp-26*8]
	mov	qword [rbp-26*8], r9
	mov	r8, qword [rbp-26*8]
	imul	r8, 8
	mov	qword [rbp-26*8], r8
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
	jz	LABEL28
	mov	r8, qword [rbp-2*8]
	mov	qword [rbp-29*8], r8
	mov	r9, qword [rbp-29*8]
	mov	qword [rbp-29*8], r9
	mov	r8, qword [rbp-29*8]
	imul	r8, 8
	mov	qword [rbp-29*8], r8
	mov	r8, qword [rbp-4*8]
	add	qword [rbp-29*8], r8
	mov	r8, qword [rbp-29*8]
	mov	r9, [r8]
	mov	qword [rbp-30*8], r9
	mov	r8, qword [rbp-30*8]
	mov	qword [rbp-5*8], r8
	; 52
	mov	r8, qword [rbp-2*8]
	mov	qword [rbp-31*8], r8
	mov	r9, qword [rbp-31*8]
	mov	qword [rbp-31*8], r9
	mov	r8, qword [rbp-31*8]
	imul	r8, 8
	mov	qword [rbp-31*8], r8
	mov	r8, qword [rbp-4*8]
	add	qword [rbp-31*8], r8
	mov	r8, qword [rbp-3*8]
	mov	qword [rbp-32*8], r8
	mov	r9, qword [rbp-32*8]
	mov	qword [rbp-32*8], r9
	mov	r8, qword [rbp-32*8]
	imul	r8, 8
	mov	qword [rbp-32*8], r8
	mov	r8, qword [rbp-4*8]
	add	qword [rbp-32*8], r8
	mov	r8, qword [rbp-32*8]
	mov	r9, [r8]
	mov	qword [rbp-33*8], r9
	mov	r8, qword [rbp-31*8]
	mov	r9, qword [rbp-33*8]
	mov	qword [r8], r9
	; 53
	mov	r8, qword [rbp-3*8]
	mov	qword [rbp-34*8], r8
	mov	r9, qword [rbp-34*8]
	mov	qword [rbp-34*8], r9
	mov	r8, qword [rbp-34*8]
	imul	r8, 8
	mov	qword [rbp-34*8], r8
	mov	r8, qword [rbp-4*8]
	add	qword [rbp-34*8], r8
	mov	r8, qword [rbp-34*8]
	mov	r9, qword [rbp-5*8]
	mov	qword [r8], r9
	; 54
	jmp	LABEL29
LABEL28:
LABEL29:
	add	qword [rbp-3*8], 1
	mov	r8, qword [rbp-3*8]
	mov	qword [rbp-35*8], r8
	jmp	LABEL27
LABEL30:
	add	qword [rbp-2*8], 1
	mov	r8, qword [rbp-2*8]
	mov	qword [rbp-36*8], r8
	jmp	LABEL26
LABEL31:
	mov	qword [rbp-37*8], 0
	mov	r8, qword [rbp-37*8]
	mov	qword [rbp-2*8], r8
LABEL32:
	mov	r8, qword [rel LABEL2]
	cmp	qword [rbp-2*8], r8
	setl al
	movzx	eax, al
	mov	qword [rbp-38*8], rax
	cmp	qword [rbp-38*8], 0
	jz	LABEL35
	mov	r8, qword [rbp-2*8]
	mov	qword [rbp-39*8], r8
	mov	r9, qword [rbp-39*8]
	mov	qword [rbp-39*8], r9
	mov	r8, qword [rbp-39*8]
	imul	r8, 8
	mov	qword [rbp-39*8], r8
	mov	r8, qword [rbp-4*8]
	add	qword [rbp-39*8], r8
	mov	r8, qword [rbp-39*8]
	mov	r9, [r8]
	mov	qword [rbp-40*8], r9
	mov	r8, qword [rbp-2*8]
	mov	qword [rbp-41*8], r8
	mov	qword [rbp-42*8], 1
	mov	r8, qword [rbp-42*8]
	add	qword [rbp-41*8], r8
	mov	r8, qword [rbp-41*8]
	cmp	qword [rbp-40*8], r8
	setne al
	movzx	eax, al
	mov	qword [rbp-43*8], rax
	cmp	qword [rbp-43*8], 0
	jz	LABEL33
	mov	qword [rbp-44*8], 0
	mov	r8, qword [rbp-44*8]
	mov	qword [rbp-1*8], r8
	jmp	LABEL36
	jmp	LABEL34
LABEL33:
LABEL34:
	add	qword [rbp-2*8], 1
	mov	r8, qword [rbp-2*8]
	mov	qword [rbp-45*8], r8
	jmp	LABEL32
LABEL35:
	mov	qword [rbp-46*8], 1
	mov	r8, qword [rbp-46*8]
	mov	qword [rbp-1*8], r8
	jmp	LABEL36
LABEL36:
	mov	rax, qword [rbp-1*8]
	leave
	ret
FUNCTION_merge:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 216
	mov	qword [rbp-1*8], 0
	mov	qword [rbp-2*8], 0
	mov	qword [rbp-3*8], 0
	mov	r8, qword [rbp-3*8]
	mov	qword [rbp-2*8], r8
LABEL37:
	mov	r8, qword [rel LABEL2]
	cmp	qword [rbp-2*8], r8
	setl al
	movzx	eax, al
	mov	qword [rbp-4*8], rax
	cmp	qword [rbp-4*8], 0
	jz	LABEL44
	mov	r8, qword [rbp-2*8]
	mov	qword [rbp-5*8], r8
	mov	r9, qword [rbp-5*8]
	mov	qword [rbp-5*8], r9
	mov	r8, qword [rbp-5*8]
	imul	r8, 8
	mov	qword [rbp-5*8], r8
	mov	r8, qword [rel LABEL3]
	add	qword [rbp-5*8], r8
	mov	r8, qword [rbp-5*8]
	mov	r9, [r8]
	mov	qword [rbp-6*8], r9
	mov	qword [rbp-7*8], 0
	mov	r8, qword [rbp-7*8]
	cmp	qword [rbp-6*8], r8
	sete al
	movzx	eax, al
	mov	qword [rbp-8*8], rax
	cmp	qword [rbp-8*8], 0
	jz	LABEL42
	mov	qword [rbp-9*8], 0
	mov	r8, qword [rbp-2*8]
	mov	qword [rbp-10*8], r8
	mov	qword [rbp-11*8], 1
	mov	r8, qword [rbp-11*8]
	add	qword [rbp-10*8], r8
	mov	r8, qword [rbp-10*8]
	mov	qword [rbp-9*8], r8
LABEL38:
	mov	r8, qword [rel LABEL2]
	cmp	qword [rbp-9*8], r8
	setl al
	movzx	eax, al
	mov	qword [rbp-12*8], rax
	cmp	qword [rbp-12*8], 0
	jz	LABEL41
	mov	r8, qword [rbp-9*8]
	mov	qword [rbp-13*8], r8
	mov	r9, qword [rbp-13*8]
	mov	qword [rbp-13*8], r9
	mov	r8, qword [rbp-13*8]
	imul	r8, 8
	mov	qword [rbp-13*8], r8
	mov	r8, qword [rel LABEL3]
	add	qword [rbp-13*8], r8
	mov	r8, qword [rbp-13*8]
	mov	r9, [r8]
	mov	qword [rbp-14*8], r9
	mov	qword [rbp-15*8], 0
	mov	r8, qword [rbp-15*8]
	cmp	qword [rbp-14*8], r8
	setne al
	movzx	eax, al
	mov	qword [rbp-16*8], rax
	cmp	qword [rbp-16*8], 0
	jz	LABEL39
	mov	rsi, qword [rbp-9*8]
	mov	rdi, qword [rbp-2*8]
	call	FUNCTION_swap
	mov	qword [rbp-17*8], rax
	; 69
	jmp	LABEL41
	jmp	LABEL40
LABEL39:
LABEL40:
	add	qword [rbp-9*8], 1
	mov	r8, qword [rbp-9*8]
	mov	qword [rbp-18*8], r8
	jmp	LABEL38
LABEL41:
	jmp	LABEL43
LABEL42:
LABEL43:
	add	qword [rbp-2*8], 1
	mov	r8, qword [rbp-2*8]
	mov	qword [rbp-19*8], r8
	jmp	LABEL37
LABEL44:
	mov	qword [rbp-20*8], 0
	mov	r8, qword [rbp-20*8]
	mov	qword [rbp-2*8], r8
LABEL45:
	mov	r8, qword [rel LABEL2]
	cmp	qword [rbp-2*8], r8
	setl al
	movzx	eax, al
	mov	qword [rbp-21*8], rax
	cmp	qword [rbp-21*8], 0
	jz	LABEL48
	mov	r8, qword [rbp-2*8]
	mov	qword [rbp-22*8], r8
	mov	r9, qword [rbp-22*8]
	mov	qword [rbp-22*8], r9
	mov	r8, qword [rbp-22*8]
	imul	r8, 8
	mov	qword [rbp-22*8], r8
	mov	r8, qword [rel LABEL3]
	add	qword [rbp-22*8], r8
	mov	r8, qword [rbp-22*8]
	mov	r9, [r8]
	mov	qword [rbp-23*8], r9
	mov	qword [rbp-24*8], 0
	mov	r8, qword [rbp-24*8]
	cmp	qword [rbp-23*8], r8
	sete al
	movzx	eax, al
	mov	qword [rbp-25*8], rax
	cmp	qword [rbp-25*8], 0
	jz	LABEL46
	mov	r8, qword [rbp-2*8]
	mov	qword [rel LABEL2], r8
	; 75
	jmp	LABEL48
	jmp	LABEL47
LABEL46:
LABEL47:
	add	qword [rbp-2*8], 1
	mov	r8, qword [rbp-2*8]
	mov	qword [rbp-26*8], r8
	jmp	LABEL45
LABEL48:
LABEL49:
	mov	rax, qword [rbp-1*8]
	leave
	ret
FUNCTION_move:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 104
	mov	qword [rbp-1*8], 0
	mov	qword [rbp-2*8], 0
	mov	qword [rbp-3*8], 0
	mov	r8, qword [rbp-3*8]
	mov	qword [rbp-2*8], r8
	; 80
LABEL50:
	mov	r8, qword [rel LABEL2]
	cmp	qword [rbp-2*8], r8
	setl al
	movzx	eax, al
	mov	qword [rbp-4*8], rax
	cmp	qword [rbp-4*8], 0
	jz	LABEL51
	mov	r8, qword [rbp-2*8]
	mov	qword [rbp-5*8], r8
	mov	r9, qword [rbp-5*8]
	mov	qword [rbp-5*8], r9
	mov	r8, qword [rbp-5*8]
	imul	r8, 8
	mov	qword [rbp-5*8], r8
	mov	r8, qword [rel LABEL3]
	add	qword [rbp-5*8], r8
	mov	r8, qword [rbp-5*8]
	mov	qword [rbp-6*8], r8
	mov	r8, qword [rbp-6*8]
	mov	r9, [r8]
	mov	qword [rbp-7*8], r9
	sub	qword [rbp-7*8], 1
	mov	r8, qword [rbp-7*8]
	mov	qword [rbp-8*8], r8
	mov	r8, qword [rbp-5*8]
	mov	r9, qword [rbp-7*8]
	mov	qword [r8], r9
	; 82
	mov	r8, qword [rbp-2*8]
	mov	qword [rbp-9*8], r8
	mov	qword [rbp-10*8], 1
	mov	r8, qword [rbp-10*8]
	add	qword [rbp-9*8], r8
	mov	r8, qword [rbp-9*8]
	mov	qword [rbp-2*8], r8
	; 83
	jmp	LABEL50
LABEL51:
	mov	r8, qword [rel LABEL2]
	mov	qword [rbp-11*8], r8
	mov	r9, qword [rbp-11*8]
	mov	qword [rbp-11*8], r9
	mov	r8, qword [rbp-11*8]
	imul	r8, 8
	mov	qword [rbp-11*8], r8
	mov	r8, qword [rel LABEL3]
	add	qword [rbp-11*8], r8
	mov	r8, qword [rbp-11*8]
	mov	r9, qword [rel LABEL2]
	mov	qword [r8], r9
	; 85
	mov	r8, qword [rel LABEL2]
	mov	qword [rbp-12*8], r8
	add	qword [rel LABEL2], 1
	; 86
LABEL52:
	mov	rax, qword [rbp-1*8]
	leave
	ret
FUNCTION_main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 808
	mov	qword [rbp-1*8], 0
	mov	qword [rbp-2*8], 0
	mov	qword [rbp-3*8], 0
	mov	qword [rbp-4*8], 0
	mov	qword [rbp-5*8], 0
	mov	r8, qword [rbp-5*8]
	mov	qword [rbp-2*8], r8
	; 89
	mov	qword [rbp-6*8], 0
	mov	r8, qword [rbp-6*8]
	mov	qword [rbp-3*8], r8
	; 90
	mov	qword [rbp-7*8], 0
	mov	r8, qword [rbp-7*8]
	mov	qword [rbp-4*8], r8
	; 91
	mov	qword [rbp-8*8], 3
	mov	r8, qword [rbp-8*8]
	mov	qword [rbp-9*8], r8
	mov	qword [rbp-10*8], 7
	mov	r9, qword [rbp-9*8]
	mov	r8, qword [rbp-10*8]
	imul	r9, r8
	mov	qword [rbp-9*8], r9
	mov	r8, qword [rbp-9*8]
	mov	qword [rbp-11*8], r8
	mov	qword [rbp-12*8], 10
	mov	r9, qword [rbp-11*8]
	mov	r8, qword [rbp-12*8]
	imul	r9, r8
	mov	qword [rbp-11*8], r9
	mov	r8, qword [rbp-11*8]
	mov	qword [rel LABEL0], r8
	; 92
	mov	qword [rbp-13*8], 0
	mov	r8, qword [rbp-13*8]
	mov	qword [rel LABEL1], r8
	; 93
	mov	qword [rbp-14*8], 100
	mov	r8, qword [rbp-14*8]
	mov	qword [rbp-15*8], r8
	add	qword [rbp-15*8], 1
	mov	r9, qword [rbp-15*8]
	mov	qword [rbp-15*8], r9
	mov	r8, qword [rbp-15*8]
	imul	r8, 8
	mov	qword [rbp-15*8], r8
	mov	rdi, qword [rbp-15*8]
	call	malloc
	mov	qword [rbp-16*8], rax
	mov	r8, qword [rbp-16*8]
	mov	r9, qword [rbp-14*8]
	mov	qword [r8], r9
	add	qword [rbp-16*8], 8
	mov	r8, qword [rbp-16*8]
	mov	qword [rel LABEL3], r8
	; 94
	mov	r8, qword [rel LABEL5]
	mov	qword [rbp-17*8], r8
	mov	rax, qword [rbp-17*8]
	cqo
	idiv	qword [rel LABEL4]
	mov	qword [rbp-17*8], rax
	mov	r8, qword [rbp-17*8]
	mov	qword [rel LABEL6], r8
	; 95
	mov	r8, qword [rel LABEL5]
	mov	qword [rbp-18*8], r8
	mov	rax, qword [rbp-18*8]
	cqo
	idiv	qword [rel LABEL4]
	mov	qword [rbp-18*8], rdx
	mov	r8, qword [rbp-18*8]
	mov	qword [rel LABEL7], r8
	; 96
	mov	rdi, qword [rel LABEL0]
	call	FUNCTION_pd
	mov	qword [rbp-19*8], rax
	mov	qword [rbp-20*8], 1
	mov	r8, qword [rbp-19*8]
	xor	qword [rbp-20*8], r8
	cmp	qword [rbp-20*8], 0
	jz	LABEL53
	mov	rdi, 88
	call	malloc
	mov	qword [rbp-21*8], rax
	mov	r8, qword [rbp-21*8]
	mov	r9, 79
	mov	qword [r8], r9
	add	qword [rbp-21*8], 8
	mov	r8, qword [rbp-21*8]
	mov	qword [rbp-22*8], r8
	add	qword [rbp-22*8], 0
	mov	r8, qword [rbp-22*8]
	mov	r9, 8367737007777148755
	mov	qword [r8], r9
	mov	r8, qword [rbp-21*8]
	mov	qword [rbp-23*8], r8
	add	qword [rbp-23*8], 8
	mov	r8, qword [rbp-23*8]
	mov	r9, 7305521896674583912
	mov	qword [r8], r9
	mov	r8, qword [rbp-21*8]
	mov	qword [rbp-24*8], r8
	add	qword [rbp-24*8], 16
	mov	r8, qword [rbp-24*8]
	mov	r9, 8391179642277339250
	mov	qword [r8], r9
	mov	r8, qword [rbp-21*8]
	mov	qword [rbp-25*8], r8
	add	qword [rbp-25*8], 24
	mov	r8, qword [rbp-25*8]
	mov	r9, 8461736351403172384
	mov	qword [r8], r9
	mov	r8, qword [rbp-21*8]
	mov	qword [rbp-26*8], r8
	add	qword [rbp-26*8], 32
	mov	r8, qword [rbp-26*8]
	mov	r9, 8371755340523725421
	mov	qword [r8], r9
	mov	r8, qword [rbp-21*8]
	mov	qword [rbp-27*8], r8
	add	qword [rbp-27*8], 40
	mov	r8, qword [rbp-27*8]
	mov	r9, 2334397761731174446
	mov	qword [r8], r9
	mov	r8, qword [rbp-21*8]
	mov	qword [rbp-28*8], r8
	add	qword [rbp-28*8], 48
	mov	r8, qword [rbp-28*8]
	mov	r9, 7575181517226866789
	mov	qword [r8], r9
	mov	r8, qword [rbp-21*8]
	mov	qword [rbp-29*8], r8
	add	qword [rbp-29*8], 56
	mov	r8, qword [rbp-29*8]
	mov	r9, 8747806222975071008
	mov	qword [r8], r9
	mov	r8, qword [rbp-21*8]
	mov	qword [rbp-30*8], r8
	add	qword [rbp-30*8], 64
	mov	r8, qword [rbp-30*8]
	mov	r9, 3112336360689069673
	mov	qword [r8], r9
	mov	r8, qword [rbp-21*8]
	mov	qword [rbp-31*8], r8
	add	qword [rbp-31*8], 72
	mov	r8, qword [rbp-31*8]
	mov	r9, 29602349897886514
	mov	qword [r8], r9
	mov	rdi, qword [rbp-21*8]
	call	FUNCTION_println
	mov	qword [rbp-32*8], rax
	; 98
	mov	qword [rbp-33*8], 1
	mov	r8, qword [rbp-33*8]
	mov	qword [rbp-1*8], r8
	jmp	LABEL61
	jmp	LABEL54
LABEL53:
LABEL54:
	mov	rdi, 21
	call	malloc
	mov	qword [rbp-34*8], rax
	mov	r8, qword [rbp-34*8]
	mov	r9, 12
	mov	qword [r8], r9
	add	qword [rbp-34*8], 8
	mov	r8, qword [rbp-34*8]
	mov	qword [rbp-35*8], r8
	add	qword [rbp-35*8], 0
	mov	r8, qword [rbp-35*8]
	mov	r9, 8391086209676633420
	mov	qword [r8], r9
	mov	r8, qword [rbp-34*8]
	mov	qword [rbp-36*8], r8
	add	qword [rbp-36*8], 8
	mov	r8, qword [rbp-36*8]
	mov	r9, 561279585
	mov	qword [r8], r9
	mov	rdi, qword [rbp-34*8]
	call	FUNCTION_println
	mov	qword [rbp-37*8], rax
	; 101
	mov	qword [rbp-38*8], 3654898
	mov	rdi, qword [rbp-38*8]
	call	FUNCTION_initialize
	mov	qword [rbp-39*8], rax
	; 102
	call	FUNCTION_random
	mov	qword [rbp-40*8], rax
	mov	r8, qword [rbp-40*8]
	mov	qword [rbp-41*8], r8
	mov	qword [rbp-42*8], 10
	mov	rax, qword [rbp-41*8]
	cqo
	idiv	qword [rbp-42*8]
	mov	qword [rbp-41*8], rdx
	mov	r8, qword [rbp-41*8]
	mov	qword [rbp-43*8], r8
	mov	qword [rbp-44*8], 1
	mov	r8, qword [rbp-44*8]
	add	qword [rbp-43*8], r8
	mov	r8, qword [rbp-43*8]
	mov	qword [rel LABEL2], r8
	; 103
	mov	rdi, qword [rel LABEL2]
	call	FUNCTION_toString
	mov	qword [rbp-45*8], rax
	mov	rdi, qword [rbp-45*8]
	call	FUNCTION_println
	mov	qword [rbp-46*8], rax
	; 104
LABEL55:
	mov	r8, qword [rel LABEL2]
	mov	qword [rbp-47*8], r8
	mov	qword [rbp-48*8], 1
	mov	r8, qword [rbp-48*8]
	sub	qword [rbp-47*8], r8
	mov	r8, qword [rbp-47*8]
	cmp	qword [rbp-2*8], r8
	setl al
	movzx	eax, al
	mov	qword [rbp-49*8], rax
	cmp	qword [rbp-49*8], 0
	jz	LABEL58
	mov	r8, qword [rbp-2*8]
	mov	qword [rbp-50*8], r8
	mov	r9, qword [rbp-50*8]
	mov	qword [rbp-50*8], r9
	mov	r8, qword [rbp-50*8]
	imul	r8, 8
	mov	qword [rbp-50*8], r8
	mov	r8, qword [rel LABEL3]
	add	qword [rbp-50*8], r8
	call	FUNCTION_random
	mov	qword [rbp-51*8], rax
	mov	r8, qword [rbp-51*8]
	mov	qword [rbp-52*8], r8
	mov	qword [rbp-53*8], 10
	mov	rax, qword [rbp-52*8]
	cqo
	idiv	qword [rbp-53*8]
	mov	qword [rbp-52*8], rdx
	mov	r8, qword [rbp-52*8]
	mov	qword [rbp-54*8], r8
	mov	qword [rbp-55*8], 1
	mov	r8, qword [rbp-55*8]
	add	qword [rbp-54*8], r8
	mov	r8, qword [rbp-50*8]
	mov	r9, qword [rbp-54*8]
	mov	qword [r8], r9
	; 107
LABEL56:
	mov	r8, qword [rbp-2*8]
	mov	qword [rbp-56*8], r8
	mov	r9, qword [rbp-56*8]
	mov	qword [rbp-56*8], r9
	mov	r8, qword [rbp-56*8]
	imul	r8, 8
	mov	qword [rbp-56*8], r8
	mov	r8, qword [rel LABEL3]
	add	qword [rbp-56*8], r8
	mov	r8, qword [rbp-56*8]
	mov	r9, [r8]
	mov	qword [rbp-57*8], r9
	mov	r8, qword [rbp-57*8]
	mov	qword [rbp-58*8], r8
	mov	r8, qword [rbp-3*8]
	add	qword [rbp-58*8], r8
	mov	r8, qword [rel LABEL0]
	cmp	qword [rbp-58*8], r8
	setg al
	movzx	eax, al
	mov	qword [rbp-59*8], rax
	cmp	qword [rbp-59*8], 0
	jz	LABEL57
	mov	r8, qword [rbp-2*8]
	mov	qword [rbp-60*8], r8
	mov	r9, qword [rbp-60*8]
	mov	qword [rbp-60*8], r9
	mov	r8, qword [rbp-60*8]
	imul	r8, 8
	mov	qword [rbp-60*8], r8
	mov	r8, qword [rel LABEL3]
	add	qword [rbp-60*8], r8
	call	FUNCTION_random
	mov	qword [rbp-61*8], rax
	mov	r8, qword [rbp-61*8]
	mov	qword [rbp-62*8], r8
	mov	qword [rbp-63*8], 10
	mov	rax, qword [rbp-62*8]
	cqo
	idiv	qword [rbp-63*8]
	mov	qword [rbp-62*8], rdx
	mov	r8, qword [rbp-62*8]
	mov	qword [rbp-64*8], r8
	mov	qword [rbp-65*8], 1
	mov	r8, qword [rbp-65*8]
	add	qword [rbp-64*8], r8
	mov	r8, qword [rbp-60*8]
	mov	r9, qword [rbp-64*8]
	mov	qword [r8], r9
	; 109
	jmp	LABEL56
LABEL57:
	mov	r8, qword [rbp-3*8]
	mov	qword [rbp-66*8], r8
	mov	r8, qword [rbp-2*8]
	mov	qword [rbp-67*8], r8
	mov	r9, qword [rbp-67*8]
	mov	qword [rbp-67*8], r9
	mov	r8, qword [rbp-67*8]
	imul	r8, 8
	mov	qword [rbp-67*8], r8
	mov	r8, qword [rel LABEL3]
	add	qword [rbp-67*8], r8
	mov	r8, qword [rbp-67*8]
	mov	r9, [r8]
	mov	qword [rbp-68*8], r9
	mov	r8, qword [rbp-68*8]
	add	qword [rbp-66*8], r8
	mov	r8, qword [rbp-66*8]
	mov	qword [rbp-3*8], r8
	; 110
	add	qword [rbp-2*8], 1
	mov	r8, qword [rbp-2*8]
	mov	qword [rbp-69*8], r8
	jmp	LABEL55
LABEL58:
	mov	r8, qword [rel LABEL2]
	mov	qword [rbp-70*8], r8
	mov	qword [rbp-71*8], 1
	mov	r8, qword [rbp-71*8]
	sub	qword [rbp-70*8], r8
	mov	r8, qword [rbp-70*8]
	mov	qword [rbp-72*8], r8
	mov	r9, qword [rbp-72*8]
	mov	qword [rbp-72*8], r9
	mov	r8, qword [rbp-72*8]
	imul	r8, 8
	mov	qword [rbp-72*8], r8
	mov	r8, qword [rel LABEL3]
	add	qword [rbp-72*8], r8
	mov	r8, qword [rel LABEL0]
	mov	qword [rbp-73*8], r8
	mov	r8, qword [rbp-3*8]
	sub	qword [rbp-73*8], r8
	mov	r8, qword [rbp-72*8]
	mov	r9, qword [rbp-73*8]
	mov	qword [r8], r9
	; 112
	call	FUNCTION_show
	mov	qword [rbp-74*8], rax
	; 113
	call	FUNCTION_merge
	mov	qword [rbp-75*8], rax
	; 114
LABEL59:
	call	FUNCTION_win
	mov	qword [rbp-76*8], rax
	mov	qword [rbp-77*8], 1
	mov	r8, qword [rbp-76*8]
	xor	qword [rbp-77*8], r8
	cmp	qword [rbp-77*8], 0
	jz	LABEL60
	mov	rdi, 14
	call	malloc
	mov	qword [rbp-78*8], rax
	mov	r8, qword [rbp-78*8]
	mov	r9, 5
	mov	qword [r8], r9
	add	qword [rbp-78*8], 8
	mov	r8, qword [rbp-78*8]
	mov	qword [rbp-79*8], r8
	add	qword [rbp-79*8], 0
	mov	r8, qword [rbp-79*8]
	mov	r9, 139324650611
	mov	qword [r8], r9
	add	qword [rbp-4*8], 1
	mov	r8, qword [rbp-4*8]
	mov	qword [rbp-80*8], r8
	mov	rdi, qword [rbp-80*8]
	call	FUNCTION_toString
	mov	qword [rbp-81*8], rax
	mov	rsi, qword [rbp-81*8]
	mov	rdi, qword [rbp-78*8]
	call	FUNCTION_string_concat
	mov	qword [rbp-82*8], rax
	mov	rdi, 10
	call	malloc
	mov	qword [rbp-83*8], rax
	mov	r8, qword [rbp-83*8]
	mov	r9, 1
	mov	qword [r8], r9
	add	qword [rbp-83*8], 8
	mov	r8, qword [rbp-83*8]
	mov	qword [rbp-84*8], r8
	add	qword [rbp-84*8], 0
	mov	r8, qword [rbp-84*8]
	mov	r9, 58
	mov	qword [r8], r9
	mov	rsi, qword [rbp-83*8]
	mov	rdi, qword [rbp-82*8]
	call	FUNCTION_string_concat
	mov	qword [rbp-85*8], rax
	mov	rdi, qword [rbp-85*8]
	call	FUNCTION_println
	mov	qword [rbp-86*8], rax
	; 116
	call	FUNCTION_move
	mov	qword [rbp-87*8], rax
	; 117
	call	FUNCTION_show
	mov	qword [rbp-88*8], rax
	; 118
	call	FUNCTION_merge
	mov	qword [rbp-89*8], rax
	; 119
	call	FUNCTION_show
	mov	qword [rbp-90*8], rax
	; 120
	jmp	LABEL59
LABEL60:
	mov	rdi, 16
	call	malloc
	mov	qword [rbp-91*8], rax
	mov	r8, qword [rbp-91*8]
	mov	r9, 7
	mov	qword [r8], r9
	add	qword [rbp-91*8], 8
	mov	r8, qword [rbp-91*8]
	mov	qword [rbp-92*8], r8
	add	qword [rbp-92*8], 0
	mov	r8, qword [rbp-92*8]
	mov	r9, 9071436420640596
	mov	qword [r8], r9
	mov	rdi, qword [rbp-4*8]
	call	FUNCTION_toString
	mov	qword [rbp-93*8], rax
	mov	rsi, qword [rbp-93*8]
	mov	rdi, qword [rbp-91*8]
	call	FUNCTION_string_concat
	mov	qword [rbp-94*8], rax
	mov	rdi, 17
	call	malloc
	mov	qword [rbp-95*8], rax
	mov	r8, qword [rbp-95*8]
	mov	r9, 8
	mov	qword [r8], r9
	add	qword [rbp-95*8], 8
	mov	r8, qword [rbp-95*8]
	mov	qword [rbp-96*8], r8
	add	qword [rbp-96*8], 0
	mov	r8, qword [rbp-96*8]
	mov	r9, 2986775441080349472
	mov	qword [r8], r9
	mov	r8, qword [rbp-95*8]
	mov	qword [rbp-97*8], r8
	add	qword [rbp-97*8], 8
	mov	r8, qword [rbp-97*8]
	mov	r9, 0
	mov	qword [r8], r9
	mov	rsi, qword [rbp-95*8]
	mov	rdi, qword [rbp-94*8]
	call	FUNCTION_string_concat
	mov	qword [rbp-98*8], rax
	mov	rdi, qword [rbp-98*8]
	call	FUNCTION_println
	mov	qword [rbp-99*8], rax
	; 122
	mov	qword [rbp-100*8], 0
	mov	r8, qword [rbp-100*8]
	mov	qword [rbp-1*8], r8
	jmp	LABEL61
LABEL61:
	mov	rax, qword [rbp-1*8]
	leave
	ret
LABEL62:
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
	L_027:	db 25H, 73H, 00H
