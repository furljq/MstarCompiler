	default rel
	global main
	global FUNCTION_check
	global FUNCTION_main
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
	sub	rsp, 16
	call	FUNCTION_main
	mov	qword [rbp-1*8], rax
	mov	rax, qword [rbp-1*8]
	leave
	ret
FUNCTION_check:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 64
	mov	qword [rbp-1*8], rdi
	mov	qword [rbp-2*8], rsi
	add	qword [rbp-1*8], 0
	add	qword [rbp-2*8], 0
	mov	r8, qword [rbp-2*8]
	cmp	qword [rbp-1*8], r8
	setl al
	movzx	eax, al
	mov	qword [rbp-3*8], rax
	cmp	qword [rbp-3*8], 0
	jz	LABEL0
	mov	qword [rbp-4*8], 0
	mov	r8, qword [rbp-4*8]
	cmp	qword [rbp-1*8], r8
	setge al
	movzx	eax, al
	mov	qword [rbp-5*8], rax
	mov	r8, qword [rbp-5*8]
	mov	qword [rbp-6*8], r8
	jmp	LABEL1
LABEL0:
	mov	qword [rbp-6*8], 0
LABEL1:
	mov	r8, qword [rbp-6*8]
	mov	qword [rbp-7*8], r8
	jmp	LABEL2
LABEL2:
	mov	rax, qword [rbp-7*8]
	leave
	ret
FUNCTION_main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 2840
	mov	qword [rbp-1*8], 0
	mov	qword [rbp-2*8], 0
	mov	qword [rbp-3*8], 0
	mov	qword [rbp-4*8], 0
	mov	qword [rbp-5*8], 0
	mov	qword [rbp-6*8], 0
	mov	qword [rbp-7*8], 0
	mov	qword [rbp-8*8], 0
	mov	qword [rbp-9*8], 0
	mov	qword [rbp-10*8], 0
	mov	qword [rbp-11*8], 0
	mov	qword [rbp-12*8], 0
	mov	qword [rbp-13*8], 0
	mov	qword [rbp-14*8], 0
	mov	qword [rbp-15*8], 0
	mov	qword [rbp-16*8], 0
	call	FUNCTION_getInt
	mov	qword [rbp-17*8], rax
	mov	r8, qword [rbp-17*8]
	mov	qword [rbp-1*8], r8
	; 23
	mov	qword [rbp-18*8], 0
	mov	r8, qword [rbp-18*8]
	mov	qword [rbp-2*8], r8
	; 24
	mov	qword [rbp-19*8], 0
	mov	r8, qword [rbp-19*8]
	mov	qword [rbp-7*8], r8
	; 25
	mov	qword [rbp-20*8], 0
	mov	r8, qword [rbp-20*8]
	mov	qword [rbp-3*8], r8
	; 26
	mov	qword [rbp-21*8], 0
	mov	r8, qword [rbp-21*8]
	mov	qword [rbp-4*8], r8
	; 27
	mov	r8, qword [rbp-1*8]
	mov	qword [rbp-22*8], r8
	mov	qword [rbp-23*8], 1
	mov	r8, qword [rbp-23*8]
	sub	qword [rbp-22*8], r8
	mov	r8, qword [rbp-22*8]
	mov	qword [rbp-5*8], r8
	; 28
	mov	r8, qword [rbp-1*8]
	mov	qword [rbp-24*8], r8
	mov	qword [rbp-25*8], 1
	mov	r8, qword [rbp-25*8]
	sub	qword [rbp-24*8], r8
	mov	r8, qword [rbp-24*8]
	mov	qword [rbp-6*8], r8
	; 29
	mov	qword [rbp-26*8], 0
	mov	r8, qword [rbp-26*8]
	mov	qword [rbp-10*8], r8
	; 30
	mov	qword [rbp-27*8], 0
	mov	r8, qword [rbp-27*8]
	mov	qword [rbp-11*8], r8
	; 31
	mov	qword [rbp-28*8], 0
	mov	r8, qword [rbp-28*8]
	mov	qword [rbp-9*8], r8
	; 32
	mov	qword [rbp-29*8], 0
	mov	r8, qword [rbp-29*8]
	mov	qword [rbp-8*8], r8
	; 33
	mov	r8, qword [rbp-1*8]
	mov	qword [rbp-30*8], r8
	mov	r9, qword [rbp-30*8]
	mov	r8, qword [rbp-1*8]
	imul	r9, r8
	mov	qword [rbp-30*8], r9
	mov	r8, qword [rbp-30*8]
	mov	qword [rbp-31*8], r8
	add	qword [rbp-31*8], 1
	mov	r9, qword [rbp-31*8]
	mov	qword [rbp-31*8], r9
	mov	r8, qword [rbp-31*8]
	imul	r8, 8
	mov	qword [rbp-31*8], r8
	mov	rdi, qword [rbp-31*8]
	call	malloc
	mov	qword [rbp-32*8], rax
	mov	r8, qword [rbp-32*8]
	mov	r9, qword [rbp-30*8]
	mov	qword [r8], r9
	add	qword [rbp-32*8], 8
	mov	r8, qword [rbp-32*8]
	mov	qword [rbp-12*8], r8
	; 34
	mov	qword [rbp-33*8], 0
	mov	r8, qword [rbp-33*8]
	mov	qword [rbp-15*8], r8
LABEL3:
	mov	r8, qword [rbp-1*8]
	mov	qword [rbp-34*8], r8
	mov	r9, qword [rbp-34*8]
	mov	r8, qword [rbp-1*8]
	imul	r9, r8
	mov	qword [rbp-34*8], r9
	mov	r8, qword [rbp-34*8]
	cmp	qword [rbp-15*8], r8
	setl al
	movzx	eax, al
	mov	qword [rbp-35*8], rax
	cmp	qword [rbp-35*8], 0
	jz	LABEL4
	mov	r8, qword [rbp-15*8]
	mov	qword [rbp-36*8], r8
	mov	r9, qword [rbp-36*8]
	mov	qword [rbp-36*8], r9
	mov	r8, qword [rbp-36*8]
	imul	r8, 8
	mov	qword [rbp-36*8], r8
	mov	r8, qword [rbp-12*8]
	add	qword [rbp-36*8], r8
	mov	qword [rbp-37*8], 0
	mov	r8, qword [rbp-36*8]
	mov	r9, qword [rbp-37*8]
	mov	qword [r8], r9
	; 36
	mov	r8, qword [rbp-15*8]
	mov	qword [rbp-38*8], r8
	add	qword [rbp-15*8], 1
	jmp	LABEL3
LABEL4:
	mov	r8, qword [rbp-1*8]
	mov	qword [rbp-39*8], r8
	mov	r9, qword [rbp-39*8]
	mov	r8, qword [rbp-1*8]
	imul	r9, r8
	mov	qword [rbp-39*8], r9
	mov	r8, qword [rbp-39*8]
	mov	qword [rbp-40*8], r8
	add	qword [rbp-40*8], 1
	mov	r9, qword [rbp-40*8]
	mov	qword [rbp-40*8], r9
	mov	r8, qword [rbp-40*8]
	imul	r8, 8
	mov	qword [rbp-40*8], r8
	mov	rdi, qword [rbp-40*8]
	call	malloc
	mov	qword [rbp-41*8], rax
	mov	r8, qword [rbp-41*8]
	mov	r9, qword [rbp-39*8]
	mov	qword [r8], r9
	add	qword [rbp-41*8], 8
	mov	r8, qword [rbp-41*8]
	mov	qword [rbp-13*8], r8
	; 37
	mov	qword [rbp-42*8], 0
	mov	r8, qword [rbp-42*8]
	mov	qword [rbp-15*8], r8
LABEL5:
	mov	r8, qword [rbp-1*8]
	mov	qword [rbp-43*8], r8
	mov	r9, qword [rbp-43*8]
	mov	r8, qword [rbp-1*8]
	imul	r9, r8
	mov	qword [rbp-43*8], r9
	mov	r8, qword [rbp-43*8]
	cmp	qword [rbp-15*8], r8
	setl al
	movzx	eax, al
	mov	qword [rbp-44*8], rax
	cmp	qword [rbp-44*8], 0
	jz	LABEL6
	mov	r8, qword [rbp-15*8]
	mov	qword [rbp-45*8], r8
	mov	r9, qword [rbp-45*8]
	mov	qword [rbp-45*8], r9
	mov	r8, qword [rbp-45*8]
	imul	r8, 8
	mov	qword [rbp-45*8], r8
	mov	r8, qword [rbp-13*8]
	add	qword [rbp-45*8], r8
	mov	qword [rbp-46*8], 0
	mov	r8, qword [rbp-45*8]
	mov	r9, qword [rbp-46*8]
	mov	qword [r8], r9
	; 39
	mov	r8, qword [rbp-15*8]
	mov	qword [rbp-47*8], r8
	add	qword [rbp-15*8], 1
	jmp	LABEL5
LABEL6:
	mov	r8, qword [rbp-1*8]
	mov	qword [rbp-48*8], r8
	add	qword [rbp-48*8], 1
	mov	r9, qword [rbp-48*8]
	mov	qword [rbp-48*8], r9
	mov	r8, qword [rbp-48*8]
	imul	r8, 8
	mov	qword [rbp-48*8], r8
	mov	rdi, qword [rbp-48*8]
	call	malloc
	mov	qword [rbp-49*8], rax
	mov	r8, qword [rbp-49*8]
	mov	r9, qword [rbp-1*8]
	mov	qword [r8], r9
	add	qword [rbp-49*8], 8
	mov	r8, qword [rbp-49*8]
	mov	qword [rbp-14*8], r8
	; 40
	mov	qword [rbp-50*8], 0
	mov	r8, qword [rbp-50*8]
	mov	qword [rbp-15*8], r8
LABEL7:
	mov	r8, qword [rbp-1*8]
	cmp	qword [rbp-15*8], r8
	setl al
	movzx	eax, al
	mov	qword [rbp-51*8], rax
	cmp	qword [rbp-51*8], 0
	jz	LABEL10
	mov	r8, qword [rbp-15*8]
	mov	qword [rbp-52*8], r8
	mov	r9, qword [rbp-52*8]
	mov	qword [rbp-52*8], r9
	mov	r8, qword [rbp-52*8]
	imul	r8, 8
	mov	qword [rbp-52*8], r8
	mov	r8, qword [rbp-14*8]
	add	qword [rbp-52*8], r8
	mov	r8, qword [rbp-1*8]
	mov	qword [rbp-53*8], r8
	add	qword [rbp-53*8], 1
	mov	r9, qword [rbp-53*8]
	mov	qword [rbp-53*8], r9
	mov	r8, qword [rbp-53*8]
	imul	r8, 8
	mov	qword [rbp-53*8], r8
	mov	rdi, qword [rbp-53*8]
	call	malloc
	mov	qword [rbp-54*8], rax
	mov	r8, qword [rbp-54*8]
	mov	r9, qword [rbp-1*8]
	mov	qword [r8], r9
	add	qword [rbp-54*8], 8
	mov	r8, qword [rbp-52*8]
	mov	r9, qword [rbp-54*8]
	mov	qword [r8], r9
	; 42
	mov	qword [rbp-55*8], 0
	mov	r8, qword [rbp-55*8]
	mov	qword [rbp-16*8], r8
LABEL8:
	mov	r8, qword [rbp-1*8]
	cmp	qword [rbp-16*8], r8
	setl al
	movzx	eax, al
	mov	qword [rbp-56*8], rax
	cmp	qword [rbp-56*8], 0
	jz	LABEL9
	mov	r8, qword [rbp-15*8]
	mov	qword [rbp-57*8], r8
	mov	r9, qword [rbp-57*8]
	mov	qword [rbp-57*8], r9
	mov	r8, qword [rbp-57*8]
	imul	r8, 8
	mov	qword [rbp-57*8], r8
	mov	r8, qword [rbp-14*8]
	add	qword [rbp-57*8], r8
	mov	r8, qword [rbp-57*8]
	mov	r9, [r8]
	mov	qword [rbp-58*8], r9
	mov	r8, qword [rbp-16*8]
	mov	qword [rbp-59*8], r8
	mov	r9, qword [rbp-59*8]
	mov	qword [rbp-59*8], r9
	mov	r8, qword [rbp-59*8]
	imul	r8, 8
	mov	qword [rbp-59*8], r8
	mov	r8, qword [rbp-58*8]
	add	qword [rbp-59*8], r8
	mov	qword [rbp-60*8], 1
	mov	r8, qword [rbp-60*8]
	mov	qword [rbp-61*8], r8
	mov	r8, qword [rbp-61*8]
	neg	r8
	mov	qword [rbp-61*8], r8
	mov	r8, qword [rbp-59*8]
	mov	r9, qword [rbp-61*8]
	mov	qword [r8], r9
	; 44
	mov	r8, qword [rbp-16*8]
	mov	qword [rbp-62*8], r8
	add	qword [rbp-16*8], 1
	jmp	LABEL8
LABEL9:
	mov	r8, qword [rbp-15*8]
	mov	qword [rbp-63*8], r8
	add	qword [rbp-15*8], 1
	jmp	LABEL7
LABEL10:
	mov	qword [rbp-64*8], 0
	mov	r8, qword [rbp-64*8]
	mov	qword [rbp-65*8], r8
	mov	r9, qword [rbp-65*8]
	mov	qword [rbp-65*8], r9
	mov	r8, qword [rbp-65*8]
	imul	r8, 8
	mov	qword [rbp-65*8], r8
	mov	r8, qword [rbp-12*8]
	add	qword [rbp-65*8], r8
	mov	r8, qword [rbp-65*8]
	mov	r9, qword [rbp-3*8]
	mov	qword [r8], r9
	; 46
	mov	qword [rbp-66*8], 0
	mov	r8, qword [rbp-66*8]
	mov	qword [rbp-67*8], r8
	mov	r9, qword [rbp-67*8]
	mov	qword [rbp-67*8], r9
	mov	r8, qword [rbp-67*8]
	imul	r8, 8
	mov	qword [rbp-67*8], r8
	mov	r8, qword [rbp-13*8]
	add	qword [rbp-67*8], r8
	mov	r8, qword [rbp-67*8]
	mov	r9, qword [rbp-4*8]
	mov	qword [r8], r9
	; 47
	mov	r8, qword [rbp-3*8]
	mov	qword [rbp-68*8], r8
	mov	r9, qword [rbp-68*8]
	mov	qword [rbp-68*8], r9
	mov	r8, qword [rbp-68*8]
	imul	r8, 8
	mov	qword [rbp-68*8], r8
	mov	r8, qword [rbp-14*8]
	add	qword [rbp-68*8], r8
	mov	r8, qword [rbp-68*8]
	mov	r9, [r8]
	mov	qword [rbp-69*8], r9
	mov	r8, qword [rbp-4*8]
	mov	qword [rbp-70*8], r8
	mov	r9, qword [rbp-70*8]
	mov	qword [rbp-70*8], r9
	mov	r8, qword [rbp-70*8]
	imul	r8, 8
	mov	qword [rbp-70*8], r8
	mov	r8, qword [rbp-69*8]
	add	qword [rbp-70*8], r8
	mov	qword [rbp-71*8], 0
	mov	r8, qword [rbp-70*8]
	mov	r9, qword [rbp-71*8]
	mov	qword [r8], r9
	; 48
LABEL11:
	mov	r8, qword [rbp-7*8]
	cmp	qword [rbp-2*8], r8
	setle al
	movzx	eax, al
	mov	qword [rbp-72*8], rax
	cmp	qword [rbp-72*8], 0
	jz	LABEL94
	mov	r8, qword [rbp-2*8]
	mov	qword [rbp-73*8], r8
	mov	r9, qword [rbp-73*8]
	mov	qword [rbp-73*8], r9
	mov	r8, qword [rbp-73*8]
	imul	r8, 8
	mov	qword [rbp-73*8], r8
	mov	r8, qword [rbp-12*8]
	add	qword [rbp-73*8], r8
	mov	r8, qword [rbp-73*8]
	mov	r9, [r8]
	mov	qword [rbp-74*8], r9
	mov	r8, qword [rbp-74*8]
	mov	qword [rbp-75*8], r8
	mov	r9, qword [rbp-75*8]
	mov	qword [rbp-75*8], r9
	mov	r8, qword [rbp-75*8]
	imul	r8, 8
	mov	qword [rbp-75*8], r8
	mov	r8, qword [rbp-14*8]
	add	qword [rbp-75*8], r8
	mov	r8, qword [rbp-75*8]
	mov	r9, [r8]
	mov	qword [rbp-76*8], r9
	mov	r8, qword [rbp-2*8]
	mov	qword [rbp-77*8], r8
	mov	r9, qword [rbp-77*8]
	mov	qword [rbp-77*8], r9
	mov	r8, qword [rbp-77*8]
	imul	r8, 8
	mov	qword [rbp-77*8], r8
	mov	r8, qword [rbp-13*8]
	add	qword [rbp-77*8], r8
	mov	r8, qword [rbp-77*8]
	mov	r9, [r8]
	mov	qword [rbp-78*8], r9
	mov	r8, qword [rbp-78*8]
	mov	qword [rbp-79*8], r8
	mov	r9, qword [rbp-79*8]
	mov	qword [rbp-79*8], r9
	mov	r8, qword [rbp-79*8]
	imul	r8, 8
	mov	qword [rbp-79*8], r8
	mov	r8, qword [rbp-76*8]
	add	qword [rbp-79*8], r8
	mov	r8, qword [rbp-79*8]
	mov	r9, [r8]
	mov	qword [rbp-80*8], r9
	mov	r8, qword [rbp-80*8]
	mov	qword [rbp-9*8], r8
	; 51
	mov	r8, qword [rbp-2*8]
	mov	qword [rbp-81*8], r8
	mov	r9, qword [rbp-81*8]
	mov	qword [rbp-81*8], r9
	mov	r8, qword [rbp-81*8]
	imul	r8, 8
	mov	qword [rbp-81*8], r8
	mov	r8, qword [rbp-12*8]
	add	qword [rbp-81*8], r8
	mov	r8, qword [rbp-81*8]
	mov	r9, [r8]
	mov	qword [rbp-82*8], r9
	mov	r8, qword [rbp-82*8]
	mov	qword [rbp-83*8], r8
	mov	qword [rbp-84*8], 1
	mov	r8, qword [rbp-84*8]
	sub	qword [rbp-83*8], r8
	mov	r8, qword [rbp-83*8]
	mov	qword [rbp-10*8], r8
	; 52
	mov	r8, qword [rbp-2*8]
	mov	qword [rbp-85*8], r8
	mov	r9, qword [rbp-85*8]
	mov	qword [rbp-85*8], r9
	mov	r8, qword [rbp-85*8]
	imul	r8, 8
	mov	qword [rbp-85*8], r8
	mov	r8, qword [rbp-13*8]
	add	qword [rbp-85*8], r8
	mov	r8, qword [rbp-85*8]
	mov	r9, [r8]
	mov	qword [rbp-86*8], r9
	mov	r8, qword [rbp-86*8]
	mov	qword [rbp-87*8], r8
	mov	qword [rbp-88*8], 2
	mov	r8, qword [rbp-88*8]
	sub	qword [rbp-87*8], r8
	mov	r8, qword [rbp-87*8]
	mov	qword [rbp-11*8], r8
	; 53
	mov	rsi, qword [rbp-1*8]
	mov	rdi, qword [rbp-10*8]
	call	FUNCTION_check
	mov	qword [rbp-89*8], rax
	cmp	qword [rbp-89*8], 0
	jz	LABEL14
	mov	rsi, qword [rbp-1*8]
	mov	rdi, qword [rbp-11*8]
	call	FUNCTION_check
	mov	qword [rbp-90*8], rax
	cmp	qword [rbp-90*8], 0
	jz	LABEL12
	mov	r8, qword [rbp-10*8]
	mov	qword [rbp-91*8], r8
	mov	r9, qword [rbp-91*8]
	mov	qword [rbp-91*8], r9
	mov	r8, qword [rbp-91*8]
	imul	r8, 8
	mov	qword [rbp-91*8], r8
	mov	r8, qword [rbp-14*8]
	add	qword [rbp-91*8], r8
	mov	r8, qword [rbp-91*8]
	mov	r9, [r8]
	mov	qword [rbp-92*8], r9
	mov	r8, qword [rbp-11*8]
	mov	qword [rbp-93*8], r8
	mov	r9, qword [rbp-93*8]
	mov	qword [rbp-93*8], r9
	mov	r8, qword [rbp-93*8]
	imul	r8, 8
	mov	qword [rbp-93*8], r8
	mov	r8, qword [rbp-92*8]
	add	qword [rbp-93*8], r8
	mov	r8, qword [rbp-93*8]
	mov	r9, [r8]
	mov	qword [rbp-94*8], r9
	mov	qword [rbp-95*8], 1
	mov	r8, qword [rbp-95*8]
	mov	qword [rbp-96*8], r8
	mov	r8, qword [rbp-96*8]
	neg	r8
	mov	qword [rbp-96*8], r8
	mov	r8, qword [rbp-96*8]
	cmp	qword [rbp-94*8], r8
	sete al
	movzx	eax, al
	mov	qword [rbp-97*8], rax
	mov	r8, qword [rbp-97*8]
	mov	qword [rbp-98*8], r8
	jmp	LABEL13
LABEL12:
	mov	qword [rbp-98*8], 0
LABEL13:
	mov	r8, qword [rbp-98*8]
	mov	qword [rbp-99*8], r8
	jmp	LABEL15
LABEL14:
	mov	qword [rbp-99*8], 0
LABEL15:
	cmp	qword [rbp-99*8], 0
	jz	LABEL20
	mov	r8, qword [rbp-7*8]
	mov	qword [rbp-100*8], r8
	mov	qword [rbp-101*8], 1
	mov	r8, qword [rbp-101*8]
	add	qword [rbp-100*8], r8
	mov	r8, qword [rbp-100*8]
	mov	qword [rbp-7*8], r8
	; 56
	mov	r8, qword [rbp-7*8]
	mov	qword [rbp-102*8], r8
	mov	r9, qword [rbp-102*8]
	mov	qword [rbp-102*8], r9
	mov	r8, qword [rbp-102*8]
	imul	r8, 8
	mov	qword [rbp-102*8], r8
	mov	r8, qword [rbp-12*8]
	add	qword [rbp-102*8], r8
	mov	r8, qword [rbp-102*8]
	mov	r9, qword [rbp-10*8]
	mov	qword [r8], r9
	; 57
	mov	r8, qword [rbp-7*8]
	mov	qword [rbp-103*8], r8
	mov	r9, qword [rbp-103*8]
	mov	qword [rbp-103*8], r9
	mov	r8, qword [rbp-103*8]
	imul	r8, 8
	mov	qword [rbp-103*8], r8
	mov	r8, qword [rbp-13*8]
	add	qword [rbp-103*8], r8
	mov	r8, qword [rbp-103*8]
	mov	r9, qword [rbp-11*8]
	mov	qword [r8], r9
	; 58
	mov	r8, qword [rbp-10*8]
	mov	qword [rbp-104*8], r8
	mov	r9, qword [rbp-104*8]
	mov	qword [rbp-104*8], r9
	mov	r8, qword [rbp-104*8]
	imul	r8, 8
	mov	qword [rbp-104*8], r8
	mov	r8, qword [rbp-14*8]
	add	qword [rbp-104*8], r8
	mov	r8, qword [rbp-104*8]
	mov	r9, [r8]
	mov	qword [rbp-105*8], r9
	mov	r8, qword [rbp-11*8]
	mov	qword [rbp-106*8], r8
	mov	r9, qword [rbp-106*8]
	mov	qword [rbp-106*8], r9
	mov	r8, qword [rbp-106*8]
	imul	r8, 8
	mov	qword [rbp-106*8], r8
	mov	r8, qword [rbp-105*8]
	add	qword [rbp-106*8], r8
	mov	r8, qword [rbp-9*8]
	mov	qword [rbp-107*8], r8
	mov	qword [rbp-108*8], 1
	mov	r8, qword [rbp-108*8]
	add	qword [rbp-107*8], r8
	mov	r8, qword [rbp-106*8]
	mov	r9, qword [rbp-107*8]
	mov	qword [r8], r9
	; 59
	mov	r8, qword [rbp-5*8]
	cmp	qword [rbp-10*8], r8
	sete al
	movzx	eax, al
	mov	qword [rbp-109*8], rax
	cmp	qword [rbp-109*8], 0
	jz	LABEL16
	mov	r8, qword [rbp-6*8]
	cmp	qword [rbp-11*8], r8
	sete al
	movzx	eax, al
	mov	qword [rbp-110*8], rax
	mov	r8, qword [rbp-110*8]
	mov	qword [rbp-111*8], r8
	jmp	LABEL17
LABEL16:
	mov	qword [rbp-111*8], 0
LABEL17:
	cmp	qword [rbp-111*8], 0
	jz	LABEL18
	mov	qword [rbp-112*8], 1
	mov	r8, qword [rbp-112*8]
	mov	qword [rbp-8*8], r8
	; 60
	jmp	LABEL19
LABEL18:
LABEL19:
	jmp	LABEL21
LABEL20:
LABEL21:
	mov	r8, qword [rbp-2*8]
	mov	qword [rbp-113*8], r8
	mov	r9, qword [rbp-113*8]
	mov	qword [rbp-113*8], r9
	mov	r8, qword [rbp-113*8]
	imul	r8, 8
	mov	qword [rbp-113*8], r8
	mov	r8, qword [rbp-12*8]
	add	qword [rbp-113*8], r8
	mov	r8, qword [rbp-113*8]
	mov	r9, [r8]
	mov	qword [rbp-114*8], r9
	mov	r8, qword [rbp-114*8]
	mov	qword [rbp-115*8], r8
	mov	qword [rbp-116*8], 1
	mov	r8, qword [rbp-116*8]
	sub	qword [rbp-115*8], r8
	mov	r8, qword [rbp-115*8]
	mov	qword [rbp-10*8], r8
	; 62
	mov	r8, qword [rbp-2*8]
	mov	qword [rbp-117*8], r8
	mov	r9, qword [rbp-117*8]
	mov	qword [rbp-117*8], r9
	mov	r8, qword [rbp-117*8]
	imul	r8, 8
	mov	qword [rbp-117*8], r8
	mov	r8, qword [rbp-13*8]
	add	qword [rbp-117*8], r8
	mov	r8, qword [rbp-117*8]
	mov	r9, [r8]
	mov	qword [rbp-118*8], r9
	mov	r8, qword [rbp-118*8]
	mov	qword [rbp-119*8], r8
	mov	qword [rbp-120*8], 2
	mov	r8, qword [rbp-120*8]
	add	qword [rbp-119*8], r8
	mov	r8, qword [rbp-119*8]
	mov	qword [rbp-11*8], r8
	; 63
	mov	rsi, qword [rbp-1*8]
	mov	rdi, qword [rbp-10*8]
	call	FUNCTION_check
	mov	qword [rbp-121*8], rax
	cmp	qword [rbp-121*8], 0
	jz	LABEL24
	mov	rsi, qword [rbp-1*8]
	mov	rdi, qword [rbp-11*8]
	call	FUNCTION_check
	mov	qword [rbp-122*8], rax
	cmp	qword [rbp-122*8], 0
	jz	LABEL22
	mov	r8, qword [rbp-10*8]
	mov	qword [rbp-123*8], r8
	mov	r9, qword [rbp-123*8]
	mov	qword [rbp-123*8], r9
	mov	r8, qword [rbp-123*8]
	imul	r8, 8
	mov	qword [rbp-123*8], r8
	mov	r8, qword [rbp-14*8]
	add	qword [rbp-123*8], r8
	mov	r8, qword [rbp-123*8]
	mov	r9, [r8]
	mov	qword [rbp-124*8], r9
	mov	r8, qword [rbp-11*8]
	mov	qword [rbp-125*8], r8
	mov	r9, qword [rbp-125*8]
	mov	qword [rbp-125*8], r9
	mov	r8, qword [rbp-125*8]
	imul	r8, 8
	mov	qword [rbp-125*8], r8
	mov	r8, qword [rbp-124*8]
	add	qword [rbp-125*8], r8
	mov	r8, qword [rbp-125*8]
	mov	r9, [r8]
	mov	qword [rbp-126*8], r9
	mov	qword [rbp-127*8], 1
	mov	r8, qword [rbp-127*8]
	mov	qword [rbp-128*8], r8
	mov	r8, qword [rbp-128*8]
	neg	r8
	mov	qword [rbp-128*8], r8
	mov	r8, qword [rbp-128*8]
	cmp	qword [rbp-126*8], r8
	sete al
	movzx	eax, al
	mov	qword [rbp-129*8], rax
	mov	r8, qword [rbp-129*8]
	mov	qword [rbp-130*8], r8
	jmp	LABEL23
LABEL22:
	mov	qword [rbp-130*8], 0
LABEL23:
	mov	r8, qword [rbp-130*8]
	mov	qword [rbp-131*8], r8
	jmp	LABEL25
LABEL24:
	mov	qword [rbp-131*8], 0
LABEL25:
	cmp	qword [rbp-131*8], 0
	jz	LABEL30
	mov	r8, qword [rbp-7*8]
	mov	qword [rbp-132*8], r8
	mov	qword [rbp-133*8], 1
	mov	r8, qword [rbp-133*8]
	add	qword [rbp-132*8], r8
	mov	r8, qword [rbp-132*8]
	mov	qword [rbp-7*8], r8
	; 66
	mov	r8, qword [rbp-7*8]
	mov	qword [rbp-134*8], r8
	mov	r9, qword [rbp-134*8]
	mov	qword [rbp-134*8], r9
	mov	r8, qword [rbp-134*8]
	imul	r8, 8
	mov	qword [rbp-134*8], r8
	mov	r8, qword [rbp-12*8]
	add	qword [rbp-134*8], r8
	mov	r8, qword [rbp-134*8]
	mov	r9, qword [rbp-10*8]
	mov	qword [r8], r9
	; 67
	mov	r8, qword [rbp-7*8]
	mov	qword [rbp-135*8], r8
	mov	r9, qword [rbp-135*8]
	mov	qword [rbp-135*8], r9
	mov	r8, qword [rbp-135*8]
	imul	r8, 8
	mov	qword [rbp-135*8], r8
	mov	r8, qword [rbp-13*8]
	add	qword [rbp-135*8], r8
	mov	r8, qword [rbp-135*8]
	mov	r9, qword [rbp-11*8]
	mov	qword [r8], r9
	; 68
	mov	r8, qword [rbp-10*8]
	mov	qword [rbp-136*8], r8
	mov	r9, qword [rbp-136*8]
	mov	qword [rbp-136*8], r9
	mov	r8, qword [rbp-136*8]
	imul	r8, 8
	mov	qword [rbp-136*8], r8
	mov	r8, qword [rbp-14*8]
	add	qword [rbp-136*8], r8
	mov	r8, qword [rbp-136*8]
	mov	r9, [r8]
	mov	qword [rbp-137*8], r9
	mov	r8, qword [rbp-11*8]
	mov	qword [rbp-138*8], r8
	mov	r9, qword [rbp-138*8]
	mov	qword [rbp-138*8], r9
	mov	r8, qword [rbp-138*8]
	imul	r8, 8
	mov	qword [rbp-138*8], r8
	mov	r8, qword [rbp-137*8]
	add	qword [rbp-138*8], r8
	mov	r8, qword [rbp-9*8]
	mov	qword [rbp-139*8], r8
	mov	qword [rbp-140*8], 1
	mov	r8, qword [rbp-140*8]
	add	qword [rbp-139*8], r8
	mov	r8, qword [rbp-138*8]
	mov	r9, qword [rbp-139*8]
	mov	qword [r8], r9
	; 69
	mov	r8, qword [rbp-5*8]
	cmp	qword [rbp-10*8], r8
	sete al
	movzx	eax, al
	mov	qword [rbp-141*8], rax
	cmp	qword [rbp-141*8], 0
	jz	LABEL26
	mov	r8, qword [rbp-6*8]
	cmp	qword [rbp-11*8], r8
	sete al
	movzx	eax, al
	mov	qword [rbp-142*8], rax
	mov	r8, qword [rbp-142*8]
	mov	qword [rbp-143*8], r8
	jmp	LABEL27
LABEL26:
	mov	qword [rbp-143*8], 0
LABEL27:
	cmp	qword [rbp-143*8], 0
	jz	LABEL28
	mov	qword [rbp-144*8], 1
	mov	r8, qword [rbp-144*8]
	mov	qword [rbp-8*8], r8
	; 70
	jmp	LABEL29
LABEL28:
LABEL29:
	jmp	LABEL31
LABEL30:
LABEL31:
	mov	r8, qword [rbp-2*8]
	mov	qword [rbp-145*8], r8
	mov	r9, qword [rbp-145*8]
	mov	qword [rbp-145*8], r9
	mov	r8, qword [rbp-145*8]
	imul	r8, 8
	mov	qword [rbp-145*8], r8
	mov	r8, qword [rbp-12*8]
	add	qword [rbp-145*8], r8
	mov	r8, qword [rbp-145*8]
	mov	r9, [r8]
	mov	qword [rbp-146*8], r9
	mov	r8, qword [rbp-146*8]
	mov	qword [rbp-147*8], r8
	mov	qword [rbp-148*8], 1
	mov	r8, qword [rbp-148*8]
	add	qword [rbp-147*8], r8
	mov	r8, qword [rbp-147*8]
	mov	qword [rbp-10*8], r8
	; 72
	mov	r8, qword [rbp-2*8]
	mov	qword [rbp-149*8], r8
	mov	r9, qword [rbp-149*8]
	mov	qword [rbp-149*8], r9
	mov	r8, qword [rbp-149*8]
	imul	r8, 8
	mov	qword [rbp-149*8], r8
	mov	r8, qword [rbp-13*8]
	add	qword [rbp-149*8], r8
	mov	r8, qword [rbp-149*8]
	mov	r9, [r8]
	mov	qword [rbp-150*8], r9
	mov	r8, qword [rbp-150*8]
	mov	qword [rbp-151*8], r8
	mov	qword [rbp-152*8], 2
	mov	r8, qword [rbp-152*8]
	sub	qword [rbp-151*8], r8
	mov	r8, qword [rbp-151*8]
	mov	qword [rbp-11*8], r8
	; 73
	mov	rsi, qword [rbp-1*8]
	mov	rdi, qword [rbp-10*8]
	call	FUNCTION_check
	mov	qword [rbp-153*8], rax
	cmp	qword [rbp-153*8], 0
	jz	LABEL34
	mov	rsi, qword [rbp-1*8]
	mov	rdi, qword [rbp-11*8]
	call	FUNCTION_check
	mov	qword [rbp-154*8], rax
	cmp	qword [rbp-154*8], 0
	jz	LABEL32
	mov	r8, qword [rbp-10*8]
	mov	qword [rbp-155*8], r8
	mov	r9, qword [rbp-155*8]
	mov	qword [rbp-155*8], r9
	mov	r8, qword [rbp-155*8]
	imul	r8, 8
	mov	qword [rbp-155*8], r8
	mov	r8, qword [rbp-14*8]
	add	qword [rbp-155*8], r8
	mov	r8, qword [rbp-155*8]
	mov	r9, [r8]
	mov	qword [rbp-156*8], r9
	mov	r8, qword [rbp-11*8]
	mov	qword [rbp-157*8], r8
	mov	r9, qword [rbp-157*8]
	mov	qword [rbp-157*8], r9
	mov	r8, qword [rbp-157*8]
	imul	r8, 8
	mov	qword [rbp-157*8], r8
	mov	r8, qword [rbp-156*8]
	add	qword [rbp-157*8], r8
	mov	r8, qword [rbp-157*8]
	mov	r9, [r8]
	mov	qword [rbp-158*8], r9
	mov	qword [rbp-159*8], 1
	mov	r8, qword [rbp-159*8]
	mov	qword [rbp-160*8], r8
	mov	r8, qword [rbp-160*8]
	neg	r8
	mov	qword [rbp-160*8], r8
	mov	r8, qword [rbp-160*8]
	cmp	qword [rbp-158*8], r8
	sete al
	movzx	eax, al
	mov	qword [rbp-161*8], rax
	mov	r8, qword [rbp-161*8]
	mov	qword [rbp-162*8], r8
	jmp	LABEL33
LABEL32:
	mov	qword [rbp-162*8], 0
LABEL33:
	mov	r8, qword [rbp-162*8]
	mov	qword [rbp-163*8], r8
	jmp	LABEL35
LABEL34:
	mov	qword [rbp-163*8], 0
LABEL35:
	cmp	qword [rbp-163*8], 0
	jz	LABEL40
	mov	r8, qword [rbp-7*8]
	mov	qword [rbp-164*8], r8
	mov	qword [rbp-165*8], 1
	mov	r8, qword [rbp-165*8]
	add	qword [rbp-164*8], r8
	mov	r8, qword [rbp-164*8]
	mov	qword [rbp-7*8], r8
	; 76
	mov	r8, qword [rbp-7*8]
	mov	qword [rbp-166*8], r8
	mov	r9, qword [rbp-166*8]
	mov	qword [rbp-166*8], r9
	mov	r8, qword [rbp-166*8]
	imul	r8, 8
	mov	qword [rbp-166*8], r8
	mov	r8, qword [rbp-12*8]
	add	qword [rbp-166*8], r8
	mov	r8, qword [rbp-166*8]
	mov	r9, qword [rbp-10*8]
	mov	qword [r8], r9
	; 77
	mov	r8, qword [rbp-7*8]
	mov	qword [rbp-167*8], r8
	mov	r9, qword [rbp-167*8]
	mov	qword [rbp-167*8], r9
	mov	r8, qword [rbp-167*8]
	imul	r8, 8
	mov	qword [rbp-167*8], r8
	mov	r8, qword [rbp-13*8]
	add	qword [rbp-167*8], r8
	mov	r8, qword [rbp-167*8]
	mov	r9, qword [rbp-11*8]
	mov	qword [r8], r9
	; 78
	mov	r8, qword [rbp-10*8]
	mov	qword [rbp-168*8], r8
	mov	r9, qword [rbp-168*8]
	mov	qword [rbp-168*8], r9
	mov	r8, qword [rbp-168*8]
	imul	r8, 8
	mov	qword [rbp-168*8], r8
	mov	r8, qword [rbp-14*8]
	add	qword [rbp-168*8], r8
	mov	r8, qword [rbp-168*8]
	mov	r9, [r8]
	mov	qword [rbp-169*8], r9
	mov	r8, qword [rbp-11*8]
	mov	qword [rbp-170*8], r8
	mov	r9, qword [rbp-170*8]
	mov	qword [rbp-170*8], r9
	mov	r8, qword [rbp-170*8]
	imul	r8, 8
	mov	qword [rbp-170*8], r8
	mov	r8, qword [rbp-169*8]
	add	qword [rbp-170*8], r8
	mov	r8, qword [rbp-9*8]
	mov	qword [rbp-171*8], r8
	mov	qword [rbp-172*8], 1
	mov	r8, qword [rbp-172*8]
	add	qword [rbp-171*8], r8
	mov	r8, qword [rbp-170*8]
	mov	r9, qword [rbp-171*8]
	mov	qword [r8], r9
	; 79
	mov	r8, qword [rbp-5*8]
	cmp	qword [rbp-10*8], r8
	sete al
	movzx	eax, al
	mov	qword [rbp-173*8], rax
	cmp	qword [rbp-173*8], 0
	jz	LABEL36
	mov	r8, qword [rbp-6*8]
	cmp	qword [rbp-11*8], r8
	sete al
	movzx	eax, al
	mov	qword [rbp-174*8], rax
	mov	r8, qword [rbp-174*8]
	mov	qword [rbp-175*8], r8
	jmp	LABEL37
LABEL36:
	mov	qword [rbp-175*8], 0
LABEL37:
	cmp	qword [rbp-175*8], 0
	jz	LABEL38
	mov	qword [rbp-176*8], 1
	mov	r8, qword [rbp-176*8]
	mov	qword [rbp-8*8], r8
	; 80
	jmp	LABEL39
LABEL38:
LABEL39:
	jmp	LABEL41
LABEL40:
LABEL41:
	mov	r8, qword [rbp-2*8]
	mov	qword [rbp-177*8], r8
	mov	r9, qword [rbp-177*8]
	mov	qword [rbp-177*8], r9
	mov	r8, qword [rbp-177*8]
	imul	r8, 8
	mov	qword [rbp-177*8], r8
	mov	r8, qword [rbp-12*8]
	add	qword [rbp-177*8], r8
	mov	r8, qword [rbp-177*8]
	mov	r9, [r8]
	mov	qword [rbp-178*8], r9
	mov	r8, qword [rbp-178*8]
	mov	qword [rbp-179*8], r8
	mov	qword [rbp-180*8], 1
	mov	r8, qword [rbp-180*8]
	add	qword [rbp-179*8], r8
	mov	r8, qword [rbp-179*8]
	mov	qword [rbp-10*8], r8
	; 82
	mov	r8, qword [rbp-2*8]
	mov	qword [rbp-181*8], r8
	mov	r9, qword [rbp-181*8]
	mov	qword [rbp-181*8], r9
	mov	r8, qword [rbp-181*8]
	imul	r8, 8
	mov	qword [rbp-181*8], r8
	mov	r8, qword [rbp-13*8]
	add	qword [rbp-181*8], r8
	mov	r8, qword [rbp-181*8]
	mov	r9, [r8]
	mov	qword [rbp-182*8], r9
	mov	r8, qword [rbp-182*8]
	mov	qword [rbp-183*8], r8
	mov	qword [rbp-184*8], 2
	mov	r8, qword [rbp-184*8]
	add	qword [rbp-183*8], r8
	mov	r8, qword [rbp-183*8]
	mov	qword [rbp-11*8], r8
	; 83
	mov	rsi, qword [rbp-1*8]
	mov	rdi, qword [rbp-10*8]
	call	FUNCTION_check
	mov	qword [rbp-185*8], rax
	cmp	qword [rbp-185*8], 0
	jz	LABEL44
	mov	rsi, qword [rbp-1*8]
	mov	rdi, qword [rbp-11*8]
	call	FUNCTION_check
	mov	qword [rbp-186*8], rax
	cmp	qword [rbp-186*8], 0
	jz	LABEL42
	mov	r8, qword [rbp-10*8]
	mov	qword [rbp-187*8], r8
	mov	r9, qword [rbp-187*8]
	mov	qword [rbp-187*8], r9
	mov	r8, qword [rbp-187*8]
	imul	r8, 8
	mov	qword [rbp-187*8], r8
	mov	r8, qword [rbp-14*8]
	add	qword [rbp-187*8], r8
	mov	r8, qword [rbp-187*8]
	mov	r9, [r8]
	mov	qword [rbp-188*8], r9
	mov	r8, qword [rbp-11*8]
	mov	qword [rbp-189*8], r8
	mov	r9, qword [rbp-189*8]
	mov	qword [rbp-189*8], r9
	mov	r8, qword [rbp-189*8]
	imul	r8, 8
	mov	qword [rbp-189*8], r8
	mov	r8, qword [rbp-188*8]
	add	qword [rbp-189*8], r8
	mov	r8, qword [rbp-189*8]
	mov	r9, [r8]
	mov	qword [rbp-190*8], r9
	mov	qword [rbp-191*8], 1
	mov	r8, qword [rbp-191*8]
	mov	qword [rbp-192*8], r8
	mov	r8, qword [rbp-192*8]
	neg	r8
	mov	qword [rbp-192*8], r8
	mov	r8, qword [rbp-192*8]
	cmp	qword [rbp-190*8], r8
	sete al
	movzx	eax, al
	mov	qword [rbp-193*8], rax
	mov	r8, qword [rbp-193*8]
	mov	qword [rbp-194*8], r8
	jmp	LABEL43
LABEL42:
	mov	qword [rbp-194*8], 0
LABEL43:
	mov	r8, qword [rbp-194*8]
	mov	qword [rbp-195*8], r8
	jmp	LABEL45
LABEL44:
	mov	qword [rbp-195*8], 0
LABEL45:
	cmp	qword [rbp-195*8], 0
	jz	LABEL50
	mov	r8, qword [rbp-7*8]
	mov	qword [rbp-196*8], r8
	mov	qword [rbp-197*8], 1
	mov	r8, qword [rbp-197*8]
	add	qword [rbp-196*8], r8
	mov	r8, qword [rbp-196*8]
	mov	qword [rbp-7*8], r8
	; 86
	mov	r8, qword [rbp-7*8]
	mov	qword [rbp-198*8], r8
	mov	r9, qword [rbp-198*8]
	mov	qword [rbp-198*8], r9
	mov	r8, qword [rbp-198*8]
	imul	r8, 8
	mov	qword [rbp-198*8], r8
	mov	r8, qword [rbp-12*8]
	add	qword [rbp-198*8], r8
	mov	r8, qword [rbp-198*8]
	mov	r9, qword [rbp-10*8]
	mov	qword [r8], r9
	; 87
	mov	r8, qword [rbp-7*8]
	mov	qword [rbp-199*8], r8
	mov	r9, qword [rbp-199*8]
	mov	qword [rbp-199*8], r9
	mov	r8, qword [rbp-199*8]
	imul	r8, 8
	mov	qword [rbp-199*8], r8
	mov	r8, qword [rbp-13*8]
	add	qword [rbp-199*8], r8
	mov	r8, qword [rbp-199*8]
	mov	r9, qword [rbp-11*8]
	mov	qword [r8], r9
	; 88
	mov	r8, qword [rbp-10*8]
	mov	qword [rbp-200*8], r8
	mov	r9, qword [rbp-200*8]
	mov	qword [rbp-200*8], r9
	mov	r8, qword [rbp-200*8]
	imul	r8, 8
	mov	qword [rbp-200*8], r8
	mov	r8, qword [rbp-14*8]
	add	qword [rbp-200*8], r8
	mov	r8, qword [rbp-200*8]
	mov	r9, [r8]
	mov	qword [rbp-201*8], r9
	mov	r8, qword [rbp-11*8]
	mov	qword [rbp-202*8], r8
	mov	r9, qword [rbp-202*8]
	mov	qword [rbp-202*8], r9
	mov	r8, qword [rbp-202*8]
	imul	r8, 8
	mov	qword [rbp-202*8], r8
	mov	r8, qword [rbp-201*8]
	add	qword [rbp-202*8], r8
	mov	r8, qword [rbp-9*8]
	mov	qword [rbp-203*8], r8
	mov	qword [rbp-204*8], 1
	mov	r8, qword [rbp-204*8]
	add	qword [rbp-203*8], r8
	mov	r8, qword [rbp-202*8]
	mov	r9, qword [rbp-203*8]
	mov	qword [r8], r9
	; 89
	mov	r8, qword [rbp-5*8]
	cmp	qword [rbp-10*8], r8
	sete al
	movzx	eax, al
	mov	qword [rbp-205*8], rax
	cmp	qword [rbp-205*8], 0
	jz	LABEL46
	mov	r8, qword [rbp-6*8]
	cmp	qword [rbp-11*8], r8
	sete al
	movzx	eax, al
	mov	qword [rbp-206*8], rax
	mov	r8, qword [rbp-206*8]
	mov	qword [rbp-207*8], r8
	jmp	LABEL47
LABEL46:
	mov	qword [rbp-207*8], 0
LABEL47:
	cmp	qword [rbp-207*8], 0
	jz	LABEL48
	mov	qword [rbp-208*8], 1
	mov	r8, qword [rbp-208*8]
	mov	qword [rbp-8*8], r8
	; 90
	jmp	LABEL49
LABEL48:
LABEL49:
	jmp	LABEL51
LABEL50:
LABEL51:
	mov	r8, qword [rbp-2*8]
	mov	qword [rbp-209*8], r8
	mov	r9, qword [rbp-209*8]
	mov	qword [rbp-209*8], r9
	mov	r8, qword [rbp-209*8]
	imul	r8, 8
	mov	qword [rbp-209*8], r8
	mov	r8, qword [rbp-12*8]
	add	qword [rbp-209*8], r8
	mov	r8, qword [rbp-209*8]
	mov	r9, [r8]
	mov	qword [rbp-210*8], r9
	mov	r8, qword [rbp-210*8]
	mov	qword [rbp-211*8], r8
	mov	qword [rbp-212*8], 2
	mov	r8, qword [rbp-212*8]
	sub	qword [rbp-211*8], r8
	mov	r8, qword [rbp-211*8]
	mov	qword [rbp-10*8], r8
	; 92
	mov	r8, qword [rbp-2*8]
	mov	qword [rbp-213*8], r8
	mov	r9, qword [rbp-213*8]
	mov	qword [rbp-213*8], r9
	mov	r8, qword [rbp-213*8]
	imul	r8, 8
	mov	qword [rbp-213*8], r8
	mov	r8, qword [rbp-13*8]
	add	qword [rbp-213*8], r8
	mov	r8, qword [rbp-213*8]
	mov	r9, [r8]
	mov	qword [rbp-214*8], r9
	mov	r8, qword [rbp-214*8]
	mov	qword [rbp-215*8], r8
	mov	qword [rbp-216*8], 1
	mov	r8, qword [rbp-216*8]
	sub	qword [rbp-215*8], r8
	mov	r8, qword [rbp-215*8]
	mov	qword [rbp-11*8], r8
	; 93
	mov	rsi, qword [rbp-1*8]
	mov	rdi, qword [rbp-10*8]
	call	FUNCTION_check
	mov	qword [rbp-217*8], rax
	cmp	qword [rbp-217*8], 0
	jz	LABEL54
	mov	rsi, qword [rbp-1*8]
	mov	rdi, qword [rbp-11*8]
	call	FUNCTION_check
	mov	qword [rbp-218*8], rax
	cmp	qword [rbp-218*8], 0
	jz	LABEL52
	mov	r8, qword [rbp-10*8]
	mov	qword [rbp-219*8], r8
	mov	r9, qword [rbp-219*8]
	mov	qword [rbp-219*8], r9
	mov	r8, qword [rbp-219*8]
	imul	r8, 8
	mov	qword [rbp-219*8], r8
	mov	r8, qword [rbp-14*8]
	add	qword [rbp-219*8], r8
	mov	r8, qword [rbp-219*8]
	mov	r9, [r8]
	mov	qword [rbp-220*8], r9
	mov	r8, qword [rbp-11*8]
	mov	qword [rbp-221*8], r8
	mov	r9, qword [rbp-221*8]
	mov	qword [rbp-221*8], r9
	mov	r8, qword [rbp-221*8]
	imul	r8, 8
	mov	qword [rbp-221*8], r8
	mov	r8, qword [rbp-220*8]
	add	qword [rbp-221*8], r8
	mov	r8, qword [rbp-221*8]
	mov	r9, [r8]
	mov	qword [rbp-222*8], r9
	mov	qword [rbp-223*8], 1
	mov	r8, qword [rbp-223*8]
	mov	qword [rbp-224*8], r8
	mov	r8, qword [rbp-224*8]
	neg	r8
	mov	qword [rbp-224*8], r8
	mov	r8, qword [rbp-224*8]
	cmp	qword [rbp-222*8], r8
	sete al
	movzx	eax, al
	mov	qword [rbp-225*8], rax
	mov	r8, qword [rbp-225*8]
	mov	qword [rbp-226*8], r8
	jmp	LABEL53
LABEL52:
	mov	qword [rbp-226*8], 0
LABEL53:
	mov	r8, qword [rbp-226*8]
	mov	qword [rbp-227*8], r8
	jmp	LABEL55
LABEL54:
	mov	qword [rbp-227*8], 0
LABEL55:
	cmp	qword [rbp-227*8], 0
	jz	LABEL60
	mov	r8, qword [rbp-7*8]
	mov	qword [rbp-228*8], r8
	mov	qword [rbp-229*8], 1
	mov	r8, qword [rbp-229*8]
	add	qword [rbp-228*8], r8
	mov	r8, qword [rbp-228*8]
	mov	qword [rbp-7*8], r8
	; 96
	mov	r8, qword [rbp-7*8]
	mov	qword [rbp-230*8], r8
	mov	r9, qword [rbp-230*8]
	mov	qword [rbp-230*8], r9
	mov	r8, qword [rbp-230*8]
	imul	r8, 8
	mov	qword [rbp-230*8], r8
	mov	r8, qword [rbp-12*8]
	add	qword [rbp-230*8], r8
	mov	r8, qword [rbp-230*8]
	mov	r9, qword [rbp-10*8]
	mov	qword [r8], r9
	; 97
	mov	r8, qword [rbp-7*8]
	mov	qword [rbp-231*8], r8
	mov	r9, qword [rbp-231*8]
	mov	qword [rbp-231*8], r9
	mov	r8, qword [rbp-231*8]
	imul	r8, 8
	mov	qword [rbp-231*8], r8
	mov	r8, qword [rbp-13*8]
	add	qword [rbp-231*8], r8
	mov	r8, qword [rbp-231*8]
	mov	r9, qword [rbp-11*8]
	mov	qword [r8], r9
	; 98
	mov	r8, qword [rbp-10*8]
	mov	qword [rbp-232*8], r8
	mov	r9, qword [rbp-232*8]
	mov	qword [rbp-232*8], r9
	mov	r8, qword [rbp-232*8]
	imul	r8, 8
	mov	qword [rbp-232*8], r8
	mov	r8, qword [rbp-14*8]
	add	qword [rbp-232*8], r8
	mov	r8, qword [rbp-232*8]
	mov	r9, [r8]
	mov	qword [rbp-233*8], r9
	mov	r8, qword [rbp-11*8]
	mov	qword [rbp-234*8], r8
	mov	r9, qword [rbp-234*8]
	mov	qword [rbp-234*8], r9
	mov	r8, qword [rbp-234*8]
	imul	r8, 8
	mov	qword [rbp-234*8], r8
	mov	r8, qword [rbp-233*8]
	add	qword [rbp-234*8], r8
	mov	r8, qword [rbp-9*8]
	mov	qword [rbp-235*8], r8
	mov	qword [rbp-236*8], 1
	mov	r8, qword [rbp-236*8]
	add	qword [rbp-235*8], r8
	mov	r8, qword [rbp-234*8]
	mov	r9, qword [rbp-235*8]
	mov	qword [r8], r9
	; 99
	mov	r8, qword [rbp-5*8]
	cmp	qword [rbp-10*8], r8
	sete al
	movzx	eax, al
	mov	qword [rbp-237*8], rax
	cmp	qword [rbp-237*8], 0
	jz	LABEL56
	mov	r8, qword [rbp-6*8]
	cmp	qword [rbp-11*8], r8
	sete al
	movzx	eax, al
	mov	qword [rbp-238*8], rax
	mov	r8, qword [rbp-238*8]
	mov	qword [rbp-239*8], r8
	jmp	LABEL57
LABEL56:
	mov	qword [rbp-239*8], 0
LABEL57:
	cmp	qword [rbp-239*8], 0
	jz	LABEL58
	mov	qword [rbp-240*8], 1
	mov	r8, qword [rbp-240*8]
	mov	qword [rbp-8*8], r8
	; 100
	jmp	LABEL59
LABEL58:
LABEL59:
	jmp	LABEL61
LABEL60:
LABEL61:
	mov	r8, qword [rbp-2*8]
	mov	qword [rbp-241*8], r8
	mov	r9, qword [rbp-241*8]
	mov	qword [rbp-241*8], r9
	mov	r8, qword [rbp-241*8]
	imul	r8, 8
	mov	qword [rbp-241*8], r8
	mov	r8, qword [rbp-12*8]
	add	qword [rbp-241*8], r8
	mov	r8, qword [rbp-241*8]
	mov	r9, [r8]
	mov	qword [rbp-242*8], r9
	mov	r8, qword [rbp-242*8]
	mov	qword [rbp-243*8], r8
	mov	qword [rbp-244*8], 2
	mov	r8, qword [rbp-244*8]
	sub	qword [rbp-243*8], r8
	mov	r8, qword [rbp-243*8]
	mov	qword [rbp-10*8], r8
	; 102
	mov	r8, qword [rbp-2*8]
	mov	qword [rbp-245*8], r8
	mov	r9, qword [rbp-245*8]
	mov	qword [rbp-245*8], r9
	mov	r8, qword [rbp-245*8]
	imul	r8, 8
	mov	qword [rbp-245*8], r8
	mov	r8, qword [rbp-13*8]
	add	qword [rbp-245*8], r8
	mov	r8, qword [rbp-245*8]
	mov	r9, [r8]
	mov	qword [rbp-246*8], r9
	mov	r8, qword [rbp-246*8]
	mov	qword [rbp-247*8], r8
	mov	qword [rbp-248*8], 1
	mov	r8, qword [rbp-248*8]
	add	qword [rbp-247*8], r8
	mov	r8, qword [rbp-247*8]
	mov	qword [rbp-11*8], r8
	; 103
	mov	rsi, qword [rbp-1*8]
	mov	rdi, qword [rbp-10*8]
	call	FUNCTION_check
	mov	qword [rbp-249*8], rax
	cmp	qword [rbp-249*8], 0
	jz	LABEL64
	mov	rsi, qword [rbp-1*8]
	mov	rdi, qword [rbp-11*8]
	call	FUNCTION_check
	mov	qword [rbp-250*8], rax
	cmp	qword [rbp-250*8], 0
	jz	LABEL62
	mov	r8, qword [rbp-10*8]
	mov	qword [rbp-251*8], r8
	mov	r9, qword [rbp-251*8]
	mov	qword [rbp-251*8], r9
	mov	r8, qword [rbp-251*8]
	imul	r8, 8
	mov	qword [rbp-251*8], r8
	mov	r8, qword [rbp-14*8]
	add	qword [rbp-251*8], r8
	mov	r8, qword [rbp-251*8]
	mov	r9, [r8]
	mov	qword [rbp-252*8], r9
	mov	r8, qword [rbp-11*8]
	mov	qword [rbp-253*8], r8
	mov	r9, qword [rbp-253*8]
	mov	qword [rbp-253*8], r9
	mov	r8, qword [rbp-253*8]
	imul	r8, 8
	mov	qword [rbp-253*8], r8
	mov	r8, qword [rbp-252*8]
	add	qword [rbp-253*8], r8
	mov	r8, qword [rbp-253*8]
	mov	r9, [r8]
	mov	qword [rbp-254*8], r9
	mov	qword [rbp-255*8], 1
	mov	r8, qword [rbp-255*8]
	mov	qword [rbp-256*8], r8
	mov	r8, qword [rbp-256*8]
	neg	r8
	mov	qword [rbp-256*8], r8
	mov	r8, qword [rbp-256*8]
	cmp	qword [rbp-254*8], r8
	sete al
	movzx	eax, al
	mov	qword [rbp-257*8], rax
	mov	r8, qword [rbp-257*8]
	mov	qword [rbp-258*8], r8
	jmp	LABEL63
LABEL62:
	mov	qword [rbp-258*8], 0
LABEL63:
	mov	r8, qword [rbp-258*8]
	mov	qword [rbp-259*8], r8
	jmp	LABEL65
LABEL64:
	mov	qword [rbp-259*8], 0
LABEL65:
	cmp	qword [rbp-259*8], 0
	jz	LABEL70
	mov	r8, qword [rbp-7*8]
	mov	qword [rbp-260*8], r8
	mov	qword [rbp-261*8], 1
	mov	r8, qword [rbp-261*8]
	add	qword [rbp-260*8], r8
	mov	r8, qword [rbp-260*8]
	mov	qword [rbp-7*8], r8
	; 106
	mov	r8, qword [rbp-7*8]
	mov	qword [rbp-262*8], r8
	mov	r9, qword [rbp-262*8]
	mov	qword [rbp-262*8], r9
	mov	r8, qword [rbp-262*8]
	imul	r8, 8
	mov	qword [rbp-262*8], r8
	mov	r8, qword [rbp-12*8]
	add	qword [rbp-262*8], r8
	mov	r8, qword [rbp-262*8]
	mov	r9, qword [rbp-10*8]
	mov	qword [r8], r9
	; 107
	mov	r8, qword [rbp-7*8]
	mov	qword [rbp-263*8], r8
	mov	r9, qword [rbp-263*8]
	mov	qword [rbp-263*8], r9
	mov	r8, qword [rbp-263*8]
	imul	r8, 8
	mov	qword [rbp-263*8], r8
	mov	r8, qword [rbp-13*8]
	add	qword [rbp-263*8], r8
	mov	r8, qword [rbp-263*8]
	mov	r9, qword [rbp-11*8]
	mov	qword [r8], r9
	; 108
	mov	r8, qword [rbp-10*8]
	mov	qword [rbp-264*8], r8
	mov	r9, qword [rbp-264*8]
	mov	qword [rbp-264*8], r9
	mov	r8, qword [rbp-264*8]
	imul	r8, 8
	mov	qword [rbp-264*8], r8
	mov	r8, qword [rbp-14*8]
	add	qword [rbp-264*8], r8
	mov	r8, qword [rbp-264*8]
	mov	r9, [r8]
	mov	qword [rbp-265*8], r9
	mov	r8, qword [rbp-11*8]
	mov	qword [rbp-266*8], r8
	mov	r9, qword [rbp-266*8]
	mov	qword [rbp-266*8], r9
	mov	r8, qword [rbp-266*8]
	imul	r8, 8
	mov	qword [rbp-266*8], r8
	mov	r8, qword [rbp-265*8]
	add	qword [rbp-266*8], r8
	mov	r8, qword [rbp-9*8]
	mov	qword [rbp-267*8], r8
	mov	qword [rbp-268*8], 1
	mov	r8, qword [rbp-268*8]
	add	qword [rbp-267*8], r8
	mov	r8, qword [rbp-266*8]
	mov	r9, qword [rbp-267*8]
	mov	qword [r8], r9
	; 109
	mov	r8, qword [rbp-5*8]
	cmp	qword [rbp-10*8], r8
	sete al
	movzx	eax, al
	mov	qword [rbp-269*8], rax
	cmp	qword [rbp-269*8], 0
	jz	LABEL66
	mov	r8, qword [rbp-6*8]
	cmp	qword [rbp-11*8], r8
	sete al
	movzx	eax, al
	mov	qword [rbp-270*8], rax
	mov	r8, qword [rbp-270*8]
	mov	qword [rbp-271*8], r8
	jmp	LABEL67
LABEL66:
	mov	qword [rbp-271*8], 0
LABEL67:
	cmp	qword [rbp-271*8], 0
	jz	LABEL68
	mov	qword [rbp-272*8], 1
	mov	r8, qword [rbp-272*8]
	mov	qword [rbp-8*8], r8
	; 110
	jmp	LABEL69
LABEL68:
LABEL69:
	jmp	LABEL71
LABEL70:
LABEL71:
	mov	r8, qword [rbp-2*8]
	mov	qword [rbp-273*8], r8
	mov	r9, qword [rbp-273*8]
	mov	qword [rbp-273*8], r9
	mov	r8, qword [rbp-273*8]
	imul	r8, 8
	mov	qword [rbp-273*8], r8
	mov	r8, qword [rbp-12*8]
	add	qword [rbp-273*8], r8
	mov	r8, qword [rbp-273*8]
	mov	r9, [r8]
	mov	qword [rbp-274*8], r9
	mov	r8, qword [rbp-274*8]
	mov	qword [rbp-275*8], r8
	mov	qword [rbp-276*8], 2
	mov	r8, qword [rbp-276*8]
	add	qword [rbp-275*8], r8
	mov	r8, qword [rbp-275*8]
	mov	qword [rbp-10*8], r8
	; 112
	mov	r8, qword [rbp-2*8]
	mov	qword [rbp-277*8], r8
	mov	r9, qword [rbp-277*8]
	mov	qword [rbp-277*8], r9
	mov	r8, qword [rbp-277*8]
	imul	r8, 8
	mov	qword [rbp-277*8], r8
	mov	r8, qword [rbp-13*8]
	add	qword [rbp-277*8], r8
	mov	r8, qword [rbp-277*8]
	mov	r9, [r8]
	mov	qword [rbp-278*8], r9
	mov	r8, qword [rbp-278*8]
	mov	qword [rbp-279*8], r8
	mov	qword [rbp-280*8], 1
	mov	r8, qword [rbp-280*8]
	sub	qword [rbp-279*8], r8
	mov	r8, qword [rbp-279*8]
	mov	qword [rbp-11*8], r8
	; 113
	mov	rsi, qword [rbp-1*8]
	mov	rdi, qword [rbp-10*8]
	call	FUNCTION_check
	mov	qword [rbp-281*8], rax
	cmp	qword [rbp-281*8], 0
	jz	LABEL74
	mov	rsi, qword [rbp-1*8]
	mov	rdi, qword [rbp-11*8]
	call	FUNCTION_check
	mov	qword [rbp-282*8], rax
	cmp	qword [rbp-282*8], 0
	jz	LABEL72
	mov	r8, qword [rbp-10*8]
	mov	qword [rbp-283*8], r8
	mov	r9, qword [rbp-283*8]
	mov	qword [rbp-283*8], r9
	mov	r8, qword [rbp-283*8]
	imul	r8, 8
	mov	qword [rbp-283*8], r8
	mov	r8, qword [rbp-14*8]
	add	qword [rbp-283*8], r8
	mov	r8, qword [rbp-283*8]
	mov	r9, [r8]
	mov	qword [rbp-284*8], r9
	mov	r8, qword [rbp-11*8]
	mov	qword [rbp-285*8], r8
	mov	r9, qword [rbp-285*8]
	mov	qword [rbp-285*8], r9
	mov	r8, qword [rbp-285*8]
	imul	r8, 8
	mov	qword [rbp-285*8], r8
	mov	r8, qword [rbp-284*8]
	add	qword [rbp-285*8], r8
	mov	r8, qword [rbp-285*8]
	mov	r9, [r8]
	mov	qword [rbp-286*8], r9
	mov	qword [rbp-287*8], 1
	mov	r8, qword [rbp-287*8]
	mov	qword [rbp-288*8], r8
	mov	r8, qword [rbp-288*8]
	neg	r8
	mov	qword [rbp-288*8], r8
	mov	r8, qword [rbp-288*8]
	cmp	qword [rbp-286*8], r8
	sete al
	movzx	eax, al
	mov	qword [rbp-289*8], rax
	mov	r8, qword [rbp-289*8]
	mov	qword [rbp-290*8], r8
	jmp	LABEL73
LABEL72:
	mov	qword [rbp-290*8], 0
LABEL73:
	mov	r8, qword [rbp-290*8]
	mov	qword [rbp-291*8], r8
	jmp	LABEL75
LABEL74:
	mov	qword [rbp-291*8], 0
LABEL75:
	cmp	qword [rbp-291*8], 0
	jz	LABEL80
	mov	r8, qword [rbp-7*8]
	mov	qword [rbp-292*8], r8
	mov	qword [rbp-293*8], 1
	mov	r8, qword [rbp-293*8]
	add	qword [rbp-292*8], r8
	mov	r8, qword [rbp-292*8]
	mov	qword [rbp-7*8], r8
	; 116
	mov	r8, qword [rbp-7*8]
	mov	qword [rbp-294*8], r8
	mov	r9, qword [rbp-294*8]
	mov	qword [rbp-294*8], r9
	mov	r8, qword [rbp-294*8]
	imul	r8, 8
	mov	qword [rbp-294*8], r8
	mov	r8, qword [rbp-12*8]
	add	qword [rbp-294*8], r8
	mov	r8, qword [rbp-294*8]
	mov	r9, qword [rbp-10*8]
	mov	qword [r8], r9
	; 117
	mov	r8, qword [rbp-7*8]
	mov	qword [rbp-295*8], r8
	mov	r9, qword [rbp-295*8]
	mov	qword [rbp-295*8], r9
	mov	r8, qword [rbp-295*8]
	imul	r8, 8
	mov	qword [rbp-295*8], r8
	mov	r8, qword [rbp-13*8]
	add	qword [rbp-295*8], r8
	mov	r8, qword [rbp-295*8]
	mov	r9, qword [rbp-11*8]
	mov	qword [r8], r9
	; 118
	mov	r8, qword [rbp-10*8]
	mov	qword [rbp-296*8], r8
	mov	r9, qword [rbp-296*8]
	mov	qword [rbp-296*8], r9
	mov	r8, qword [rbp-296*8]
	imul	r8, 8
	mov	qword [rbp-296*8], r8
	mov	r8, qword [rbp-14*8]
	add	qword [rbp-296*8], r8
	mov	r8, qword [rbp-296*8]
	mov	r9, [r8]
	mov	qword [rbp-297*8], r9
	mov	r8, qword [rbp-11*8]
	mov	qword [rbp-298*8], r8
	mov	r9, qword [rbp-298*8]
	mov	qword [rbp-298*8], r9
	mov	r8, qword [rbp-298*8]
	imul	r8, 8
	mov	qword [rbp-298*8], r8
	mov	r8, qword [rbp-297*8]
	add	qword [rbp-298*8], r8
	mov	r8, qword [rbp-9*8]
	mov	qword [rbp-299*8], r8
	mov	qword [rbp-300*8], 1
	mov	r8, qword [rbp-300*8]
	add	qword [rbp-299*8], r8
	mov	r8, qword [rbp-298*8]
	mov	r9, qword [rbp-299*8]
	mov	qword [r8], r9
	; 119
	mov	r8, qword [rbp-5*8]
	cmp	qword [rbp-10*8], r8
	sete al
	movzx	eax, al
	mov	qword [rbp-301*8], rax
	cmp	qword [rbp-301*8], 0
	jz	LABEL76
	mov	r8, qword [rbp-6*8]
	cmp	qword [rbp-11*8], r8
	sete al
	movzx	eax, al
	mov	qword [rbp-302*8], rax
	mov	r8, qword [rbp-302*8]
	mov	qword [rbp-303*8], r8
	jmp	LABEL77
LABEL76:
	mov	qword [rbp-303*8], 0
LABEL77:
	cmp	qword [rbp-303*8], 0
	jz	LABEL78
	mov	qword [rbp-304*8], 1
	mov	r8, qword [rbp-304*8]
	mov	qword [rbp-8*8], r8
	; 120
	jmp	LABEL79
LABEL78:
LABEL79:
	jmp	LABEL81
LABEL80:
LABEL81:
	mov	r8, qword [rbp-2*8]
	mov	qword [rbp-305*8], r8
	mov	r9, qword [rbp-305*8]
	mov	qword [rbp-305*8], r9
	mov	r8, qword [rbp-305*8]
	imul	r8, 8
	mov	qword [rbp-305*8], r8
	mov	r8, qword [rbp-12*8]
	add	qword [rbp-305*8], r8
	mov	r8, qword [rbp-305*8]
	mov	r9, [r8]
	mov	qword [rbp-306*8], r9
	mov	r8, qword [rbp-306*8]
	mov	qword [rbp-307*8], r8
	mov	qword [rbp-308*8], 2
	mov	r8, qword [rbp-308*8]
	add	qword [rbp-307*8], r8
	mov	r8, qword [rbp-307*8]
	mov	qword [rbp-10*8], r8
	; 122
	mov	r8, qword [rbp-2*8]
	mov	qword [rbp-309*8], r8
	mov	r9, qword [rbp-309*8]
	mov	qword [rbp-309*8], r9
	mov	r8, qword [rbp-309*8]
	imul	r8, 8
	mov	qword [rbp-309*8], r8
	mov	r8, qword [rbp-13*8]
	add	qword [rbp-309*8], r8
	mov	r8, qword [rbp-309*8]
	mov	r9, [r8]
	mov	qword [rbp-310*8], r9
	mov	r8, qword [rbp-310*8]
	mov	qword [rbp-311*8], r8
	mov	qword [rbp-312*8], 1
	mov	r8, qword [rbp-312*8]
	add	qword [rbp-311*8], r8
	mov	r8, qword [rbp-311*8]
	mov	qword [rbp-11*8], r8
	; 123
	mov	rsi, qword [rbp-1*8]
	mov	rdi, qword [rbp-10*8]
	call	FUNCTION_check
	mov	qword [rbp-313*8], rax
	cmp	qword [rbp-313*8], 0
	jz	LABEL84
	mov	rsi, qword [rbp-1*8]
	mov	rdi, qword [rbp-11*8]
	call	FUNCTION_check
	mov	qword [rbp-314*8], rax
	cmp	qword [rbp-314*8], 0
	jz	LABEL82
	mov	r8, qword [rbp-10*8]
	mov	qword [rbp-315*8], r8
	mov	r9, qword [rbp-315*8]
	mov	qword [rbp-315*8], r9
	mov	r8, qword [rbp-315*8]
	imul	r8, 8
	mov	qword [rbp-315*8], r8
	mov	r8, qword [rbp-14*8]
	add	qword [rbp-315*8], r8
	mov	r8, qword [rbp-315*8]
	mov	r9, [r8]
	mov	qword [rbp-316*8], r9
	mov	r8, qword [rbp-11*8]
	mov	qword [rbp-317*8], r8
	mov	r9, qword [rbp-317*8]
	mov	qword [rbp-317*8], r9
	mov	r8, qword [rbp-317*8]
	imul	r8, 8
	mov	qword [rbp-317*8], r8
	mov	r8, qword [rbp-316*8]
	add	qword [rbp-317*8], r8
	mov	r8, qword [rbp-317*8]
	mov	r9, [r8]
	mov	qword [rbp-318*8], r9
	mov	qword [rbp-319*8], 1
	mov	r8, qword [rbp-319*8]
	mov	qword [rbp-320*8], r8
	mov	r8, qword [rbp-320*8]
	neg	r8
	mov	qword [rbp-320*8], r8
	mov	r8, qword [rbp-320*8]
	cmp	qword [rbp-318*8], r8
	sete al
	movzx	eax, al
	mov	qword [rbp-321*8], rax
	mov	r8, qword [rbp-321*8]
	mov	qword [rbp-322*8], r8
	jmp	LABEL83
LABEL82:
	mov	qword [rbp-322*8], 0
LABEL83:
	mov	r8, qword [rbp-322*8]
	mov	qword [rbp-323*8], r8
	jmp	LABEL85
LABEL84:
	mov	qword [rbp-323*8], 0
LABEL85:
	cmp	qword [rbp-323*8], 0
	jz	LABEL90
	mov	r8, qword [rbp-7*8]
	mov	qword [rbp-324*8], r8
	mov	qword [rbp-325*8], 1
	mov	r8, qword [rbp-325*8]
	add	qword [rbp-324*8], r8
	mov	r8, qword [rbp-324*8]
	mov	qword [rbp-7*8], r8
	; 126
	mov	r8, qword [rbp-7*8]
	mov	qword [rbp-326*8], r8
	mov	r9, qword [rbp-326*8]
	mov	qword [rbp-326*8], r9
	mov	r8, qword [rbp-326*8]
	imul	r8, 8
	mov	qword [rbp-326*8], r8
	mov	r8, qword [rbp-12*8]
	add	qword [rbp-326*8], r8
	mov	r8, qword [rbp-326*8]
	mov	r9, qword [rbp-10*8]
	mov	qword [r8], r9
	; 127
	mov	r8, qword [rbp-7*8]
	mov	qword [rbp-327*8], r8
	mov	r9, qword [rbp-327*8]
	mov	qword [rbp-327*8], r9
	mov	r8, qword [rbp-327*8]
	imul	r8, 8
	mov	qword [rbp-327*8], r8
	mov	r8, qword [rbp-13*8]
	add	qword [rbp-327*8], r8
	mov	r8, qword [rbp-327*8]
	mov	r9, qword [rbp-11*8]
	mov	qword [r8], r9
	; 128
	mov	r8, qword [rbp-10*8]
	mov	qword [rbp-328*8], r8
	mov	r9, qword [rbp-328*8]
	mov	qword [rbp-328*8], r9
	mov	r8, qword [rbp-328*8]
	imul	r8, 8
	mov	qword [rbp-328*8], r8
	mov	r8, qword [rbp-14*8]
	add	qword [rbp-328*8], r8
	mov	r8, qword [rbp-328*8]
	mov	r9, [r8]
	mov	qword [rbp-329*8], r9
	mov	r8, qword [rbp-11*8]
	mov	qword [rbp-330*8], r8
	mov	r9, qword [rbp-330*8]
	mov	qword [rbp-330*8], r9
	mov	r8, qword [rbp-330*8]
	imul	r8, 8
	mov	qword [rbp-330*8], r8
	mov	r8, qword [rbp-329*8]
	add	qword [rbp-330*8], r8
	mov	r8, qword [rbp-9*8]
	mov	qword [rbp-331*8], r8
	mov	qword [rbp-332*8], 1
	mov	r8, qword [rbp-332*8]
	add	qword [rbp-331*8], r8
	mov	r8, qword [rbp-330*8]
	mov	r9, qword [rbp-331*8]
	mov	qword [r8], r9
	; 129
	mov	r8, qword [rbp-5*8]
	cmp	qword [rbp-10*8], r8
	sete al
	movzx	eax, al
	mov	qword [rbp-333*8], rax
	cmp	qword [rbp-333*8], 0
	jz	LABEL86
	mov	r8, qword [rbp-6*8]
	cmp	qword [rbp-11*8], r8
	sete al
	movzx	eax, al
	mov	qword [rbp-334*8], rax
	mov	r8, qword [rbp-334*8]
	mov	qword [rbp-335*8], r8
	jmp	LABEL87
LABEL86:
	mov	qword [rbp-335*8], 0
LABEL87:
	cmp	qword [rbp-335*8], 0
	jz	LABEL88
	mov	qword [rbp-336*8], 1
	mov	r8, qword [rbp-336*8]
	mov	qword [rbp-8*8], r8
	; 130
	jmp	LABEL89
LABEL88:
LABEL89:
	jmp	LABEL91
LABEL90:
LABEL91:
	mov	qword [rbp-337*8], 1
	mov	r8, qword [rbp-337*8]
	cmp	qword [rbp-8*8], r8
	sete al
	movzx	eax, al
	mov	qword [rbp-338*8], rax
	cmp	qword [rbp-338*8], 0
	jz	LABEL92
	jmp	LABEL94
	jmp	LABEL93
LABEL92:
LABEL93:
	mov	r8, qword [rbp-2*8]
	mov	qword [rbp-339*8], r8
	mov	qword [rbp-340*8], 1
	mov	r8, qword [rbp-340*8]
	add	qword [rbp-339*8], r8
	mov	r8, qword [rbp-339*8]
	mov	qword [rbp-2*8], r8
	; 133
	jmp	LABEL11
LABEL94:
	mov	qword [rbp-341*8], 1
	mov	r8, qword [rbp-341*8]
	cmp	qword [rbp-8*8], r8
	sete al
	movzx	eax, al
	mov	qword [rbp-342*8], rax
	cmp	qword [rbp-342*8], 0
	jz	LABEL95
	mov	r8, qword [rbp-5*8]
	mov	qword [rbp-343*8], r8
	mov	r9, qword [rbp-343*8]
	mov	qword [rbp-343*8], r9
	mov	r8, qword [rbp-343*8]
	imul	r8, 8
	mov	qword [rbp-343*8], r8
	mov	r8, qword [rbp-14*8]
	add	qword [rbp-343*8], r8
	mov	r8, qword [rbp-343*8]
	mov	r9, [r8]
	mov	qword [rbp-344*8], r9
	mov	r8, qword [rbp-6*8]
	mov	qword [rbp-345*8], r8
	mov	r9, qword [rbp-345*8]
	mov	qword [rbp-345*8], r9
	mov	r8, qword [rbp-345*8]
	imul	r8, 8
	mov	qword [rbp-345*8], r8
	mov	r8, qword [rbp-344*8]
	add	qword [rbp-345*8], r8
	mov	r8, qword [rbp-345*8]
	mov	r9, [r8]
	mov	qword [rbp-346*8], r9
	mov	rdi, qword [rbp-346*8]
	call	FUNCTION_toString
	mov	qword [rbp-347*8], rax
	mov	rdi, qword [rbp-347*8]
	call	FUNCTION_println
	mov	qword [rbp-348*8], rax
	; 135
	jmp	LABEL96
LABEL95:
	mov	rdi, 22
	call	malloc
	mov	qword [rbp-349*8], rax
	mov	r8, qword [rbp-349*8]
	mov	r9, 13
	mov	qword [r8], r9
	add	qword [rbp-349*8], 8
	mov	r8, qword [rbp-349*8]
	mov	qword [rbp-350*8], r8
	add	qword [rbp-350*8], 0
	mov	r8, qword [rbp-350*8]
	mov	r9, 8391732706603462510
	mov	qword [r8], r9
	mov	r8, qword [rbp-349*8]
	mov	qword [rbp-351*8], r8
	add	qword [rbp-351*8], 8
	mov	r8, qword [rbp-351*8]
	mov	r9, 43510558569
	mov	qword [r8], r9
	mov	rdi, qword [rbp-349*8]
	call	FUNCTION_print
	mov	qword [rbp-352*8], rax
	; 136
LABEL96:
	mov	qword [rbp-353*8], 0
	mov	r8, qword [rbp-353*8]
	mov	qword [rbp-354*8], r8
	jmp	LABEL97
LABEL97:
	mov	rax, qword [rbp-354*8]
	leave
	ret
LABEL98:
	SECTION .data
	SECTION .bss
	SECTION .rodata
	L_027:	db 25H, 73H, 00H
