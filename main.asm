	default rel
	global main
	global FUNCTION_printBool
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
	sub	rsp, 168
	call	FUNCTION_main
	mov	qword [rbp-1*8], rax
	mov	rax, qword [rbp-1*8]
	leave
	ret
FUNCTION_printBool:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 648
	mov	qword [rbp-1*8], rdi
	mov	r8, 0
	add	qword [rbp-1*8], r8
	cmp	qword [rbp-1*8], 0
	jz	LABEL1
LABEL0:
	mov	r8, 13
	mov	rdi, r8
	call	malloc
	mov	qword [rbp-3*8], rax
	mov	r8, 4
	mov	r9, qword [rbp-3*8]
	mov	qword [r9], r8
	mov	r8, 8
	add	qword [rbp-3*8], r8
	mov	r8, qword [rbp-3*8]
	mov	qword [rbp-4*8], r8
	mov	r8, 0
	add	qword [rbp-4*8], r8
	mov	r8, 1702195796
	mov	r9, qword [rbp-4*8]
	mov	qword [r9], r8
	mov	rdi, qword [rbp-3*8]
	call	FUNCTION_println
	mov	qword [rbp-5*8], rax
	; 3
	jmp	LABEL2
LABEL1:
	mov	r8, 14
	mov	rdi, r8
	call	malloc
	mov	qword [rbp-6*8], rax
	mov	r8, 5
	mov	r9, qword [rbp-6*8]
	mov	qword [r9], r8
	mov	r8, 8
	add	qword [rbp-6*8], r8
	mov	r8, qword [rbp-6*8]
	mov	qword [rbp-7*8], r8
	mov	r8, 0
	add	qword [rbp-7*8], r8
	mov	r8, 435728179526
	mov	r9, qword [rbp-7*8]
	mov	qword [r9], r8
	mov	rdi, qword [rbp-6*8]
	call	FUNCTION_println
	mov	qword [rbp-8*8], rax
	; 5
LABEL2:
LABEL3:
	mov	rax, qword [rbp-2*8]
	leave
	ret
FUNCTION_main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 4648
	mov	r8, 12
	mov	rdi, r8
	call	malloc
	mov	qword [rbp-6*8], rax
	mov	r8, 3
	mov	r9, qword [rbp-6*8]
	mov	qword [r9], r8
	mov	r8, 8
	add	qword [rbp-6*8], r8
	mov	r8, qword [rbp-6*8]
	mov	qword [rbp-7*8], r8
	mov	r8, 0
	add	qword [rbp-7*8], r8
	mov	r8, 5063489
	mov	r9, qword [rbp-7*8]
	mov	qword [r9], r8
	mov	r8, qword [rbp-6*8]
	mov	qword [rbp-2*8], r8
	; 9
	mov	r8, 16
	mov	rdi, r8
	call	malloc
	mov	qword [rbp-8*8], rax
	mov	r8, 7
	mov	r9, qword [rbp-8*8]
	mov	qword [r9], r8
	mov	r8, 8
	add	qword [rbp-8*8], r8
	mov	r8, qword [rbp-8*8]
	mov	qword [rbp-9*8], r8
	mov	r8, 0
	add	qword [rbp-9*8], r8
	mov	r8, 31069365689205569
	mov	r9, qword [rbp-9*8]
	mov	qword [r9], r8
	mov	r8, qword [rbp-8*8]
	mov	qword [rbp-3*8], r8
	; 10
	mov	r8, 17
	mov	rdi, r8
	call	malloc
	mov	qword [rbp-10*8], rax
	mov	r8, 8
	mov	r9, qword [rbp-10*8]
	mov	qword [r9], r8
	mov	r8, 8
	add	qword [rbp-10*8], r8
	mov	r8, qword [rbp-10*8]
	mov	qword [rbp-11*8], r8
	mov	r8, 0
	add	qword [rbp-11*8], r8
	mov	r8, 8319100054296937281
	mov	r9, qword [rbp-11*8]
	mov	qword [r9], r8
	mov	r8, qword [rbp-10*8]
	mov	qword [rbp-12*8], r8
	mov	r8, 8
	add	qword [rbp-12*8], r8
	mov	r8, 0
	mov	r9, qword [rbp-12*8]
	mov	qword [r9], r8
	mov	r8, qword [rbp-10*8]
	mov	qword [rbp-4*8], r8
	; 11
	mov	r8, 0
	mov	qword [rbp-13*8], r8
	mov	r8, 2
	mov	qword [rbp-14*8], r8
	mov	rdx, qword [rbp-14*8]
	mov	rsi, qword [rbp-13*8]
	mov	rdi, qword [rbp-3*8]
	call	CLASS_string_MEMBER_substring
	mov	qword [rbp-15*8], rax
	mov	r8, qword [rbp-15*8]
	mov	qword [rbp-5*8], r8
	; 12
	mov	rsi, qword [rbp-5*8]
	mov	rdi, qword [rbp-2*8]
	call	FUNCTION_string_equal
	mov	qword [rbp-16*8], rax
	mov	rdi, qword [rbp-16*8]
	call	FUNCTION_printBool
	mov	qword [rbp-17*8], rax
	; 14
	mov	rsi, qword [rbp-5*8]
	mov	rdi, qword [rbp-2*8]
	call	FUNCTION_string_notequal
	mov	qword [rbp-18*8], rax
	mov	rdi, qword [rbp-18*8]
	call	FUNCTION_printBool
	mov	qword [rbp-19*8], rax
	; 15
	mov	rsi, qword [rbp-5*8]
	mov	rdi, qword [rbp-2*8]
	call	FUNCTION_string_lt
	mov	qword [rbp-20*8], rax
	mov	rdi, qword [rbp-20*8]
	call	FUNCTION_printBool
	mov	qword [rbp-21*8], rax
	; 16
	mov	rsi, qword [rbp-5*8]
	mov	rdi, qword [rbp-2*8]
	call	FUNCTION_string_gt
	mov	qword [rbp-22*8], rax
	mov	rdi, qword [rbp-22*8]
	call	FUNCTION_printBool
	mov	qword [rbp-23*8], rax
	; 17
	mov	rsi, qword [rbp-5*8]
	mov	rdi, qword [rbp-2*8]
	call	FUNCTION_string_leq
	mov	qword [rbp-24*8], rax
	mov	rdi, qword [rbp-24*8]
	call	FUNCTION_printBool
	mov	qword [rbp-25*8], rax
	; 18
	mov	rsi, qword [rbp-5*8]
	mov	rdi, qword [rbp-2*8]
	call	FUNCTION_string_geq
	mov	qword [rbp-26*8], rax
	mov	rdi, qword [rbp-26*8]
	call	FUNCTION_printBool
	mov	qword [rbp-27*8], rax
	; 19
	mov	r8, 9
	mov	rdi, r8
	call	malloc
	mov	qword [rbp-28*8], rax
	mov	r8, 0
	mov	r9, qword [rbp-28*8]
	mov	qword [r9], r8
	mov	r8, 8
	add	qword [rbp-28*8], r8
	mov	r8, qword [rbp-28*8]
	mov	qword [rbp-29*8], r8
	mov	r8, 0
	add	qword [rbp-29*8], r8
	mov	r8, 0
	mov	r9, qword [rbp-29*8]
	mov	qword [r9], r8
	mov	rdi, qword [rbp-28*8]
	call	FUNCTION_println
	mov	qword [rbp-30*8], rax
	; 21
	mov	rsi, qword [rbp-3*8]
	mov	rdi, qword [rbp-2*8]
	call	FUNCTION_string_equal
	mov	qword [rbp-31*8], rax
	mov	rdi, qword [rbp-31*8]
	call	FUNCTION_printBool
	mov	qword [rbp-32*8], rax
	; 23
	mov	rsi, qword [rbp-3*8]
	mov	rdi, qword [rbp-2*8]
	call	FUNCTION_string_notequal
	mov	qword [rbp-33*8], rax
	mov	rdi, qword [rbp-33*8]
	call	FUNCTION_printBool
	mov	qword [rbp-34*8], rax
	; 24
	mov	rsi, qword [rbp-3*8]
	mov	rdi, qword [rbp-2*8]
	call	FUNCTION_string_lt
	mov	qword [rbp-35*8], rax
	mov	rdi, qword [rbp-35*8]
	call	FUNCTION_printBool
	mov	qword [rbp-36*8], rax
	; 25
	mov	rsi, qword [rbp-3*8]
	mov	rdi, qword [rbp-2*8]
	call	FUNCTION_string_gt
	mov	qword [rbp-37*8], rax
	mov	rdi, qword [rbp-37*8]
	call	FUNCTION_printBool
	mov	qword [rbp-38*8], rax
	; 26
	mov	rsi, qword [rbp-3*8]
	mov	rdi, qword [rbp-2*8]
	call	FUNCTION_string_leq
	mov	qword [rbp-39*8], rax
	mov	rdi, qword [rbp-39*8]
	call	FUNCTION_printBool
	mov	qword [rbp-40*8], rax
	; 27
	mov	rsi, qword [rbp-3*8]
	mov	rdi, qword [rbp-2*8]
	call	FUNCTION_string_geq
	mov	qword [rbp-41*8], rax
	mov	rdi, qword [rbp-41*8]
	call	FUNCTION_printBool
	mov	qword [rbp-42*8], rax
	; 28
	mov	r8, 9
	mov	rdi, r8
	call	malloc
	mov	qword [rbp-43*8], rax
	mov	r8, 0
	mov	r9, qword [rbp-43*8]
	mov	qword [r9], r8
	mov	r8, 8
	add	qword [rbp-43*8], r8
	mov	r8, qword [rbp-43*8]
	mov	qword [rbp-44*8], r8
	mov	r8, 0
	add	qword [rbp-44*8], r8
	mov	r8, 0
	mov	r9, qword [rbp-44*8]
	mov	qword [r9], r8
	mov	rdi, qword [rbp-43*8]
	call	FUNCTION_println
	mov	qword [rbp-45*8], rax
	; 30
	mov	rsi, qword [rbp-4*8]
	mov	rdi, qword [rbp-3*8]
	call	FUNCTION_string_equal
	mov	qword [rbp-46*8], rax
	mov	rdi, qword [rbp-46*8]
	call	FUNCTION_printBool
	mov	qword [rbp-47*8], rax
	; 32
	mov	rsi, qword [rbp-4*8]
	mov	rdi, qword [rbp-3*8]
	call	FUNCTION_string_notequal
	mov	qword [rbp-48*8], rax
	mov	rdi, qword [rbp-48*8]
	call	FUNCTION_printBool
	mov	qword [rbp-49*8], rax
	; 33
	mov	rsi, qword [rbp-4*8]
	mov	rdi, qword [rbp-3*8]
	call	FUNCTION_string_lt
	mov	qword [rbp-50*8], rax
	mov	rdi, qword [rbp-50*8]
	call	FUNCTION_printBool
	mov	qword [rbp-51*8], rax
	; 34
	mov	rsi, qword [rbp-4*8]
	mov	rdi, qword [rbp-3*8]
	call	FUNCTION_string_gt
	mov	qword [rbp-52*8], rax
	mov	rdi, qword [rbp-52*8]
	call	FUNCTION_printBool
	mov	qword [rbp-53*8], rax
	; 35
	mov	rsi, qword [rbp-4*8]
	mov	rdi, qword [rbp-3*8]
	call	FUNCTION_string_leq
	mov	qword [rbp-54*8], rax
	mov	rdi, qword [rbp-54*8]
	call	FUNCTION_printBool
	mov	qword [rbp-55*8], rax
	; 36
	mov	rsi, qword [rbp-4*8]
	mov	rdi, qword [rbp-3*8]
	call	FUNCTION_string_geq
	mov	qword [rbp-56*8], rax
	mov	rdi, qword [rbp-56*8]
	call	FUNCTION_printBool
	mov	qword [rbp-57*8], rax
	; 37
LABEL4:
	mov	rax, qword [rbp-1*8]
	leave
	ret
LABEL5:
	SECTION .data
	SECTION .bss
	SECTION .rodata
	L_022:	db 25H, 73H, 00H
