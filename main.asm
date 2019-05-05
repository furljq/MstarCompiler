	default rel
	global main
	global FUNCTION_main
	global LABEL0
	global LABEL1
	global LABEL2
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
	sub	rsp, 56
	mov	qword [rbp-1*8], 15000
	mov	r8, qword [rbp-1*8]
	mov	qword [rel LABEL0], r8
	mov	qword [rbp-2*8], 15001
	mov	r8, qword [rbp-2*8]
	mov	qword [rbp-3*8], r8
	add	qword [rbp-3*8], 1
	mov	r9, qword [rbp-3*8]
	mov	qword [rbp-3*8], r9
	mov	r8, qword [rbp-3*8]
	imul	r8, 8
	mov	qword [rbp-3*8], r8
	mov	rdi, qword [rbp-3*8]
	call	malloc
	mov	qword [rbp-4*8], rax
	mov	r8, qword [rbp-4*8]
	mov	r9, qword [rbp-2*8]
	mov	qword [r8], r9
	add	r8, 8
	mov	qword [rbp-4*8], r8
	mov	r8, qword [rbp-4*8]
	mov	qword [rel LABEL1], r8
	mov	qword [rbp-5*8], 0
	mov	r8, qword [rbp-5*8]
	mov	qword [rel LABEL2], r8
	call	FUNCTION_main
	mov	qword [rbp-6*8], rax
	mov	rax, qword [rbp-6*8]
	leave
	ret
FUNCTION_main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 352
	mov	qword [rbp-1*8], 0
	mov	qword [rbp-2*8], 1
	mov	r8, qword [rbp-2*8]
	mov	qword [rbp-1*8], r8
LABEL3:
	mov	r8, qword [rel LABEL0]
	cmp	qword [rbp-1*8], r8
	setle al
	movzx	eax, al
	mov	qword [rbp-3*8], rax
	cmp	qword [rbp-3*8], 0
	jz	LABEL4
	mov	r8, qword [rbp-1*8]
	mov	qword [rbp-4*8], r8
	mov	r9, qword [rbp-4*8]
	mov	qword [rbp-4*8], r9
	mov	r8, qword [rbp-4*8]
	imul	r8, 8
	mov	qword [rbp-4*8], r8
	mov	r8, qword [rel LABEL1]
	add	qword [rbp-4*8], r8
	mov	qword [rbp-5*8], 1
	mov	r8, qword [rbp-4*8]
	mov	r9, qword [rbp-5*8]
	mov	qword [r8], r9
	mov	qword [rbp-4*8], r8
	mov	r8, qword [rbp-1*8]
	mov	qword [rbp-6*8], r8
	add	qword [rbp-1*8], 1
	jmp	LABEL3
LABEL4:
	mov	qword [rbp-7*8], 2
	mov	r8, qword [rbp-7*8]
	mov	qword [rbp-1*8], r8
LABEL5:
	mov	r8, qword [rel LABEL0]
	cmp	qword [rbp-1*8], r8
	setle al
	movzx	eax, al
	mov	qword [rbp-8*8], rax
	cmp	qword [rbp-8*8], 0
	jz	LABEL14
	mov	r8, qword [rbp-1*8]
	mov	qword [rbp-9*8], r8
	mov	r9, qword [rbp-9*8]
	mov	qword [rbp-9*8], r9
	mov	r8, qword [rbp-9*8]
	imul	r8, 8
	mov	qword [rbp-9*8], r8
	mov	r8, qword [rel LABEL1]
	add	qword [rbp-9*8], r8
	mov	r8, qword [rbp-9*8]
	mov	r9, [r8]
	mov	qword [rbp-10*8], r9
	cmp	qword [rbp-10*8], 0
	jz	LABEL12
	mov	qword [rbp-11*8], 0
	mov	qword [rbp-12*8], 2
	mov	r8, qword [rbp-12*8]
	mov	qword [rbp-11*8], r8
	mov	qword [rbp-13*8], 3
	mov	r8, qword [rbp-13*8]
	cmp	qword [rbp-1*8], r8
	setg al
	movzx	eax, al
	mov	qword [rbp-14*8], rax
	cmp	qword [rbp-14*8], 0
	jz	LABEL6
	mov	r8, qword [rbp-1*8]
	mov	qword [rbp-15*8], r8
	mov	qword [rbp-16*8], 2
	mov	r8, qword [rbp-16*8]
	sub	qword [rbp-15*8], r8
	mov	r8, qword [rbp-15*8]
	mov	qword [rbp-17*8], r8
	mov	r9, qword [rbp-17*8]
	mov	qword [rbp-17*8], r9
	mov	r8, qword [rbp-17*8]
	imul	r8, 8
	mov	qword [rbp-17*8], r8
	mov	r8, qword [rel LABEL1]
	add	qword [rbp-17*8], r8
	mov	r8, qword [rbp-17*8]
	mov	r9, [r8]
	mov	qword [rbp-18*8], r9
	mov	r8, qword [rbp-18*8]
	mov	qword [rbp-19*8], r8
	jmp	LABEL7
LABEL6:
	mov	qword [rbp-19*8], 0
LABEL7:
	cmp	qword [rbp-19*8], 0
	jz	LABEL8
	mov	r8, qword [rel LABEL2]
	mov	qword [rbp-20*8], r8
	add	qword [rel LABEL2], 1
	mov	r8, qword [rbp-1*8]
	mov	qword [rbp-21*8], r8
	mov	qword [rbp-22*8], 2
	mov	r8, qword [rbp-22*8]
	sub	qword [rbp-21*8], r8
	mov	rdi, qword [rbp-21*8]
	call	FUNCTION_toString
	mov	qword [rbp-23*8], rax
	mov	rdi, 10
	call	malloc
	mov	qword [rbp-24*8], rax
	mov	r8, qword [rbp-24*8]
	mov	r9, 1
	mov	qword [r8], r9
	add	r8, 8
	mov	qword [rbp-24*8], r8
	mov	r8, qword [rbp-24*8]
	mov	qword [rbp-25*8], r8
	add	qword [rbp-25*8], 0
	mov	r8, qword [rbp-25*8]
	mov	r9, 32
	mov	qword [r8], r9
	mov	qword [rbp-25*8], r8
	mov	rsi, qword [rbp-24*8]
	mov	rdi, qword [rbp-23*8]
	call	FUNCTION_string_concat
	mov	qword [rbp-26*8], rax
	mov	rdi, qword [rbp-1*8]
	call	FUNCTION_toString
	mov	qword [rbp-27*8], rax
	mov	rsi, qword [rbp-27*8]
	mov	rdi, qword [rbp-26*8]
	call	FUNCTION_string_concat
	mov	qword [rbp-28*8], rax
	mov	rdi, qword [rbp-28*8]
	call	FUNCTION_println
	mov	qword [rbp-29*8], rax
	jmp	LABEL9
LABEL8:
LABEL9:
LABEL10:
	mov	r8, qword [rbp-1*8]
	mov	qword [rbp-30*8], r8
	mov	r9, qword [rbp-30*8]
	mov	r8, qword [rbp-11*8]
	imul	r9, r8
	mov	qword [rbp-30*8], r9
	mov	r8, qword [rel LABEL0]
	cmp	qword [rbp-30*8], r8
	setle al
	movzx	eax, al
	mov	qword [rbp-31*8], rax
	cmp	qword [rbp-31*8], 0
	jz	LABEL11
	mov	r8, qword [rbp-1*8]
	mov	qword [rbp-32*8], r8
	mov	r9, qword [rbp-32*8]
	mov	r8, qword [rbp-11*8]
	imul	r9, r8
	mov	qword [rbp-32*8], r9
	mov	r8, qword [rbp-32*8]
	mov	qword [rbp-33*8], r8
	mov	r9, qword [rbp-33*8]
	mov	qword [rbp-33*8], r9
	mov	r8, qword [rbp-33*8]
	imul	r8, 8
	mov	qword [rbp-33*8], r8
	mov	r8, qword [rel LABEL1]
	add	qword [rbp-33*8], r8
	mov	qword [rbp-34*8], 0
	mov	r8, qword [rbp-33*8]
	mov	r9, qword [rbp-34*8]
	mov	qword [r8], r9
	mov	qword [rbp-33*8], r8
	mov	r8, qword [rbp-11*8]
	mov	qword [rbp-35*8], r8
	add	qword [rbp-11*8], 1
	jmp	LABEL10
LABEL11:
	jmp	LABEL13
LABEL12:
LABEL13:
	mov	r8, qword [rbp-1*8]
	mov	qword [rbp-36*8], r8
	add	qword [rbp-1*8], 1
	jmp	LABEL5
LABEL14:
	mov	rdi, 16
	call	malloc
	mov	qword [rbp-37*8], rax
	mov	r8, qword [rbp-37*8]
	mov	r9, 7
	mov	qword [r8], r9
	add	r8, 8
	mov	qword [rbp-37*8], r8
	mov	r8, qword [rbp-37*8]
	mov	qword [rbp-38*8], r8
	add	qword [rbp-38*8], 0
	mov	r8, qword [rbp-38*8]
	mov	r9, 9071436420640596
	mov	qword [r8], r9
	mov	qword [rbp-38*8], r8
	mov	rdi, qword [rel LABEL2]
	call	FUNCTION_toString
	mov	qword [rbp-39*8], rax
	mov	rsi, qword [rbp-39*8]
	mov	rdi, qword [rbp-37*8]
	call	FUNCTION_string_concat
	mov	qword [rbp-40*8], rax
	mov	rdi, qword [rbp-40*8]
	call	FUNCTION_println
	mov	qword [rbp-41*8], rax
	mov	qword [rbp-42*8], 0
	mov	r8, qword [rbp-42*8]
	mov	qword [rbp-43*8], r8
	jmp	LABEL15
LABEL15:
	mov	rax, qword [rbp-43*8]
	leave
	ret
LABEL16:
	SECTION .data
	SECTION .bss
	LABEL0:	resq	1
	LABEL1:	resq	1
	LABEL2:	resq	1
	SECTION .rodata
	L_027:	db 25H, 73H, 00H
