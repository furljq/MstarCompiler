	default rel
	global main
	global FUNCTION_getHash
	global FUNCTION_put
	global FUNCTION_get
	global FUNCTION_main
	global LABEL0
	global LABEL1
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
	        sub     rax, 64
	        mov     rax, qword [rax]
	        lea     rdx, [rax+7H]
	        test    rax, rax
	        cmovs   rax, rdx
	        sar     rax, 3
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
	        mov     dword [rbp-1CH], -1
	        mov     dword [rbp-18H], 0
	        jmp     L_019
	L_018:  mov     eax, dword [rbp-18H]
	        movsxd  rdx, eax
	        mov     rax, qword [rbp-28H]
	        add     rax, rdx
	        add     dword [rbp-1CH], 1
	        mov     edx, dword [rbp-1CH]
	        movsxd  rcx, edx
	        mov     rdx, qword [rbp-8H]
	        add     rdx, rcx
	        movzx   eax, byte [rax]
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
	        add     rax, rdx
	        add     dword [rbp-1CH], 1
	        mov     edx, dword [rbp-1CH]
	        movsxd  rcx, edx
	        mov     rdx, qword [rbp-8H]
	        add     rdx, rcx
	        movzx   eax, byte [rax]
	        mov     byte [rdx], al
	        add     dword [rbp-14H], 1
	L_021:  mov     eax, dword [rbp-14H]
	        cmp     eax, dword [rbp-0CH]
	        jl      L_020
	        mov     eax, dword [rbp-1CH]
	        cdqe
	        lea     rdx, [rax+1H]
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
	sub	rsp, 24
	mov	qword [rbp-1*8], 100
	mov	r8, qword [rbp-1*8]
	mov	[rel com.fur.nasm.label.NASMLabel@16267862], r8
	call	FUNCTION_main
	mov	qword [rbp-2*8], rax
	mov	rax, qword [rbp-2*8]
	leave
	ret
FUNCTION_getHash:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 48
	mov	qword [rbp-1*8], com.fur.nasm.register.NASMRegister@78a2da20
	mov	qword [rbp-1*8], 0
	mov	r8, qword [rbp-1*8]
	mov	qword [rbp-2*8], r8
	mov	qword [rbp-3*8], 237
	mov	r8, qword [rbp-3*8]
	imul	qword [rbp-2*8], r8
	mov	r8, qword [rbp-2*8]
	mov	qword [rbp-4*8], r8
	mov	rax, qword [rbp-4*8]
	cqo
	idiv	[rel com.fur.nasm.label.NASMLabel@16267862]
	mov	rax, rdx
	mov	r8, qword [rbp-4*8]
	mov	qword [rbp-5*8], r8
	jmp	LABEL2
LABEL2:
	mov	rax, qword [rbp-5*8]
	leave
	ret
FUNCTION_put:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 528
	mov	qword [rbp-1*8], com.fur.nasm.register.NASMRegister@78a2da20
	mov	qword [rbp-2*8], com.fur.nasm.register.NASMRegister@dd3b207
	mov	qword [rbp-1*8], 0
	mov	qword [rbp-2*8], 0
	mov	qword [rbp-3*8], 0
	mov	qword [rbp-4*8], 0
	mov	qword [rbp-5*8], 0
	mov	r8, qword [rbp-5*8]
	mov	qword [rbp-4*8], r8
	mov	rdi, qword [rbp-1*8]
	call	FUNCTION_getHash
	mov	qword [rbp-6*8], rax
	mov	r8, qword [rbp-6*8]
	mov	qword [rbp-3*8], r8
	mov	r8, [rel com.fur.nasm.label.NASMLabel@551bdc27]
	mov	qword [rbp-7*8], r8
	mov	r8, qword [rbp-3*8]
	add	qword [rbp-7*8], r8
	mov	r8, qword [rbp-7*8]
	null	qword [rbp-8*8], r8
	mov	qword [rbp-9*8], 0
	mov	rsi, qword [rbp-9*8]
	mov	rdi, qword [rbp-8*8]
	call	FUNCTION_string_equal
	mov	qword [rbp-10*8], rax
	cmp	qword [rbp-10*8], 0
	jz	LABEL4
	jmp	LABEL3
LABEL3:
	mov	r8, [rel com.fur.nasm.label.NASMLabel@551bdc27]
	mov	qword [rbp-11*8], r8
	mov	r8, qword [rbp-3*8]
	add	qword [rbp-11*8], r8
	mov	rdi, 32
	call	malloc
	mov	qword [rbp-12*8], rax
	mov	r8, qword [rbp-11*8]
	mov	r9, qword [rbp-12*8]
	mov	qword [r8], r9
	mov	qword [rbp-11*8], r8
	mov	r8, [rel com.fur.nasm.label.NASMLabel@551bdc27]
	mov	qword [rbp-13*8], r8
	mov	r8, qword [rbp-3*8]
	add	qword [rbp-13*8], r8
	mov	r8, qword [rbp-13*8]
	null	qword [rbp-14*8], r8
	mov	r8, qword [rbp-14*8]
	add	qword [rbp-15*8], r8
	add	qword [rbp-15*8], 1
	mov	r8, qword [rbp-15*8]
	mov	r9, qword [rbp-1*8]
	mov	qword [r8], r9
	mov	qword [rbp-15*8], r8
	mov	r8, [rel com.fur.nasm.label.NASMLabel@551bdc27]
	mov	qword [rbp-16*8], r8
	mov	r8, qword [rbp-3*8]
	add	qword [rbp-16*8], r8
	mov	r8, qword [rbp-16*8]
	null	qword [rbp-17*8], r8
	mov	r8, qword [rbp-17*8]
	add	qword [rbp-18*8], r8
	add	qword [rbp-18*8], 2
	mov	r8, qword [rbp-18*8]
	mov	r9, qword [rbp-2*8]
	mov	qword [r8], r9
	mov	qword [rbp-18*8], r8
	mov	r8, [rel com.fur.nasm.label.NASMLabel@551bdc27]
	mov	qword [rbp-19*8], r8
	mov	r8, qword [rbp-3*8]
	add	qword [rbp-19*8], r8
	mov	r8, qword [rbp-19*8]
	null	qword [rbp-20*8], r8
	mov	r8, qword [rbp-20*8]
	add	qword [rbp-21*8], r8
	add	qword [rbp-21*8], 3
	mov	qword [rbp-22*8], 0
	mov	r8, qword [rbp-21*8]
	mov	r9, qword [rbp-22*8]
	mov	qword [r8], r9
	jmp	LABEL12
	jmp	LABEL5
LABEL4:
	mov	qword [rbp-21*8], r8
	mov	r8, [rel com.fur.nasm.label.NASMLabel@551bdc27]
	mov	qword [rbp-23*8], r8
	mov	r8, qword [rbp-3*8]
	add	qword [rbp-23*8], r8
	mov	rdi, 32
	call	malloc
	mov	qword [rbp-24*8], rax
	mov	r8, qword [rbp-23*8]
	mov	r9, qword [rbp-24*8]
	mov	qword [r8], r9
	mov	qword [rbp-23*8], r8
	mov	r8, [rel com.fur.nasm.label.NASMLabel@551bdc27]
	mov	qword [rbp-25*8], r8
	mov	r8, qword [rbp-3*8]
	add	qword [rbp-25*8], r8
	mov	r8, qword [rbp-25*8]
	null	qword [rbp-26*8], r8
	mov	r8, qword [rbp-26*8]
	add	qword [rbp-27*8], r8
	add	qword [rbp-27*8], 1
	mov	r8, qword [rbp-27*8]
	mov	r9, qword [rbp-1*8]
	mov	qword [r8], r9
	mov	qword [rbp-27*8], r8
	mov	r8, [rel com.fur.nasm.label.NASMLabel@551bdc27]
	mov	qword [rbp-28*8], r8
	mov	r8, qword [rbp-3*8]
	add	qword [rbp-28*8], r8
	mov	r8, qword [rbp-28*8]
	null	qword [rbp-29*8], r8
	mov	r8, qword [rbp-29*8]
	add	qword [rbp-30*8], r8
	add	qword [rbp-30*8], 2
	mov	r8, qword [rbp-30*8]
	mov	r9, qword [rbp-2*8]
	mov	qword [r8], r9
	mov	qword [rbp-30*8], r8
	mov	r8, [rel com.fur.nasm.label.NASMLabel@551bdc27]
	mov	qword [rbp-31*8], r8
	mov	r8, qword [rbp-3*8]
	add	qword [rbp-31*8], r8
	mov	r8, qword [rbp-31*8]
	null	qword [rbp-32*8], r8
	mov	r8, qword [rbp-32*8]
	add	qword [rbp-33*8], r8
	add	qword [rbp-33*8], 3
	mov	qword [rbp-34*8], 0
	mov	r8, qword [rbp-33*8]
	mov	r9, qword [rbp-34*8]
	mov	qword [r8], r9
	jmp	LABEL12
	jmp	LABEL5
LABEL5:
	mov	qword [rbp-33*8], r8
	mov	r8, [rel com.fur.nasm.label.NASMLabel@551bdc27]
	mov	qword [rbp-35*8], r8
	mov	r8, qword [rbp-3*8]
	add	qword [rbp-35*8], r8
	mov	r8, qword [rbp-35*8]
	null	qword [rbp-36*8], r8
	mov	r8, qword [rbp-36*8]
	mov	qword [rbp-4*8], r8
LABEL6:
	mov	r8, qword [rbp-4*8]
	add	qword [rbp-37*8], r8
	add	qword [rbp-37*8], 1
	mov	r8, qword [rbp-37*8]
	null	qword [rbp-38*8], r8
	mov	r8, qword [rbp-1*8]
	cmp	qword [rbp-38*8], r8
	setne	qword [rbp-39*8]
	cmp	qword [rbp-39*8], 0
	jz	LABEL11
	jmp	LABEL6
LABEL7:
	mov	r8, qword [rbp-4*8]
	add	qword [rbp-40*8], r8
	add	qword [rbp-40*8], 3
	mov	r8, qword [rbp-40*8]
	null	qword [rbp-41*8], r8
	mov	qword [rbp-42*8], 0
	mov	rsi, qword [rbp-42*8]
	mov	rdi, qword [rbp-41*8]
	call	FUNCTION_string_equal
	mov	qword [rbp-43*8], rax
	cmp	qword [rbp-43*8], 0
	jz	LABEL9
	jmp	LABEL8
LABEL8:
	mov	r8, qword [rbp-4*8]
	add	qword [rbp-44*8], r8
	add	qword [rbp-44*8], 3
	mov	rdi, 32
	call	malloc
	mov	qword [rbp-45*8], rax
	mov	r8, qword [rbp-44*8]
	mov	r9, qword [rbp-45*8]
	mov	qword [r8], r9
	mov	qword [rbp-44*8], r8
	mov	r8, qword [rbp-4*8]
	add	qword [rbp-46*8], r8
	add	qword [rbp-46*8], 3
	mov	r8, qword [rbp-46*8]
	null	qword [rbp-47*8], r8
	mov	r8, qword [rbp-47*8]
	add	qword [rbp-48*8], r8
	add	qword [rbp-48*8], 1
	mov	r8, qword [rbp-48*8]
	mov	r9, qword [rbp-1*8]
	mov	qword [r8], r9
	mov	qword [rbp-48*8], r8
	mov	r8, qword [rbp-4*8]
	add	qword [rbp-49*8], r8
	add	qword [rbp-49*8], 3
	mov	r8, qword [rbp-49*8]
	null	qword [rbp-50*8], r8
	mov	r8, qword [rbp-50*8]
	add	qword [rbp-51*8], r8
	add	qword [rbp-51*8], 3
	mov	qword [rbp-52*8], 0
	mov	r8, qword [rbp-51*8]
	mov	r9, qword [rbp-52*8]
	mov	qword [r8], r9
	jmp	LABEL10
LABEL9:
	mov	qword [rbp-51*8], r8
	mov	r8, qword [rbp-4*8]
	add	qword [rbp-53*8], r8
	add	qword [rbp-53*8], 3
	mov	rdi, 32
	call	malloc
	mov	qword [rbp-54*8], rax
	mov	r8, qword [rbp-53*8]
	mov	r9, qword [rbp-54*8]
	mov	qword [r8], r9
	mov	qword [rbp-53*8], r8
	mov	r8, qword [rbp-4*8]
	add	qword [rbp-55*8], r8
	add	qword [rbp-55*8], 3
	mov	r8, qword [rbp-55*8]
	null	qword [rbp-56*8], r8
	mov	r8, qword [rbp-56*8]
	add	qword [rbp-57*8], r8
	add	qword [rbp-57*8], 1
	mov	r8, qword [rbp-57*8]
	mov	r9, qword [rbp-1*8]
	mov	qword [r8], r9
	mov	qword [rbp-57*8], r8
	mov	r8, qword [rbp-4*8]
	add	qword [rbp-58*8], r8
	add	qword [rbp-58*8], 3
	mov	r8, qword [rbp-58*8]
	null	qword [rbp-59*8], r8
	mov	r8, qword [rbp-59*8]
	add	qword [rbp-60*8], r8
	add	qword [rbp-60*8], 3
	mov	qword [rbp-61*8], 0
	mov	r8, qword [rbp-60*8]
	mov	r9, qword [rbp-61*8]
	mov	qword [r8], r9
	jmp	LABEL10
LABEL10:
	mov	qword [rbp-60*8], r8
	mov	r8, qword [rbp-4*8]
	add	qword [rbp-62*8], r8
	add	qword [rbp-62*8], 3
	mov	r8, qword [rbp-62*8]
	null	qword [rbp-63*8], r8
	mov	r8, qword [rbp-63*8]
	mov	qword [rbp-4*8], r8
	jmp	LABEL6
LABEL11:
	mov	r8, qword [rbp-4*8]
	add	qword [rbp-64*8], r8
	add	qword [rbp-64*8], 2
	mov	r8, qword [rbp-64*8]
	mov	r9, qword [rbp-2*8]
	mov	qword [r8], r9
LABEL12:
	mov	qword [rbp-64*8], r8
	mov	rax, qword [rbp-65*8]
	leave
	ret
FUNCTION_get:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 112
	mov	qword [rbp-1*8], com.fur.nasm.register.NASMRegister@78a2da20
	mov	qword [rbp-1*8], 0
	mov	qword [rbp-2*8], 0
	mov	qword [rbp-3*8], 0
	mov	r8, qword [rbp-3*8]
	mov	qword [rbp-2*8], r8
	mov	rdi, qword [rbp-1*8]
	call	FUNCTION_getHash
	mov	qword [rbp-4*8], rax
	mov	r8, [rel com.fur.nasm.label.NASMLabel@551bdc27]
	mov	qword [rbp-5*8], r8
	mov	r8, qword [rbp-4*8]
	add	qword [rbp-5*8], r8
	mov	r8, qword [rbp-5*8]
	null	qword [rbp-6*8], r8
	mov	r8, qword [rbp-6*8]
	mov	qword [rbp-2*8], r8
LABEL13:
	mov	r8, qword [rbp-2*8]
	add	qword [rbp-7*8], r8
	add	qword [rbp-7*8], 1
	mov	r8, qword [rbp-7*8]
	null	qword [rbp-8*8], r8
	mov	r8, qword [rbp-1*8]
	cmp	qword [rbp-8*8], r8
	setne	qword [rbp-9*8]
	cmp	qword [rbp-9*8], 0
	jz	LABEL15
	jmp	LABEL13
LABEL14:
	mov	r8, qword [rbp-2*8]
	add	qword [rbp-10*8], r8
	add	qword [rbp-10*8], 3
	mov	r8, qword [rbp-10*8]
	null	qword [rbp-11*8], r8
	mov	r8, qword [rbp-11*8]
	mov	qword [rbp-2*8], r8
	jmp	LABEL13
LABEL15:
	mov	r8, qword [rbp-2*8]
	add	qword [rbp-12*8], r8
	add	qword [rbp-12*8], 2
	mov	r8, qword [rbp-12*8]
	mov	qword [rbp-13*8], r8
	jmp	LABEL16
LABEL16:
	mov	rax, qword [rbp-13*8]
	leave
	ret
FUNCTION_main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 240
	mov	qword [rbp-1*8], 0
	mov	qword [rbp-2*8], 100
	mov	r8, qword [rbp-2*8]
	mov	qword [rbp-3*8], r8
	add	qword [rbp-3*8], 1
	imul	qword [rbp-3*8], 8
	mov	rdi, qword [rbp-2*8]
	call	malloc
	mov	qword [rbp-4*8], rax
	sub	qword [rbp-2*8], 1
	mov	r8, qword [rbp-4*8]
	mov	r9, qword [rbp-2*8]
	mov	qword [r8], r9
	add	r8, 8
LABEL17:
	mov	qword [rbp-4*8], r8
	mov	r8, qword [rbp-2*8]
	cmp	qword [rbp-6*8], r8
	setl	qword [rbp-5*8]
	cmp	qword [rbp-5*8], 0
	jz	LABEL19
	jmp	LABEL17
LABEL18:
	mov	rdi, 32
	call	malloc
	mov	qword [rbp-7*8], rax
	mov	r8, qword [rbp-6*8]
	add	qword [rbp-8*8], r8
	imul	qword [rbp-8*8], 8
	mov	r8, qword [rbp-4*8]
	add	qword [rbp-8*8], r8
	mov	r8, qword [rbp-8*8]
	mov	r9, qword [rbp-7*8]
	mov	qword [r8], r9
	add	qword [rbp-6*8], 1
	jmp	LABEL17
LABEL19:
	mov	qword [rbp-8*8], r8
	mov	r8, qword [rbp-4*8]
	mov	[rel com.fur.nasm.label.NASMLabel@551bdc27], r8
	mov	qword [rbp-9*8], 0
	mov	r8, qword [rbp-9*8]
	mov	qword [rbp-1*8], r8
LABEL20:
	mov	r8, [rel com.fur.nasm.label.NASMLabel@16267862]
	cmp	qword [rbp-1*8], r8
	setl	qword [rbp-10*8]
	cmp	qword [rbp-10*8], 0
	jz	LABEL22
	jmp	LABEL20
LABEL21:
	mov	r8, [rel com.fur.nasm.label.NASMLabel@551bdc27]
	mov	qword [rbp-11*8], r8
	mov	r8, qword [rbp-1*8]
	add	qword [rbp-11*8], r8
	mov	qword [rbp-12*8], 0
	mov	r8, qword [rbp-11*8]
	mov	r9, qword [rbp-12*8]
	mov	qword [r8], r9
	null	qword [rbp-1*8], 1
	jmp	LABEL20
LABEL22:
	mov	qword [rbp-13*8], 0
	mov	qword [rbp-11*8], r8
	mov	r8, qword [rbp-13*8]
	mov	qword [rbp-1*8], r8
LABEL23:
	mov	qword [rbp-14*8], 1000
	mov	r8, qword [rbp-14*8]
	cmp	qword [rbp-1*8], r8
	setl	qword [rbp-15*8]
	cmp	qword [rbp-15*8], 0
	jz	LABEL25
	jmp	LABEL23
LABEL24:
	mov	rsi, qword [rbp-1*8]
	mov	qword [rbp-1*8], rsi
	mov	rdi, qword [rbp-1*8]
	call	FUNCTION_put
	mov	qword [rbp-16*8], rax
	null	qword [rbp-1*8], 1
	jmp	LABEL23
LABEL25:
	mov	qword [rbp-17*8], 0
	mov	r8, qword [rbp-17*8]
	mov	qword [rbp-1*8], r8
LABEL26:
	mov	qword [rbp-18*8], 1000
	mov	r8, qword [rbp-18*8]
	cmp	qword [rbp-1*8], r8
	setl	qword [rbp-19*8]
	cmp	qword [rbp-19*8], 0
	jz	LABEL28
	jmp	LABEL26
LABEL27:
	mov	rdi, qword [rbp-1*8]
	call	FUNCTION_toString
	mov	qword [rbp-20*8], rax
	mov	rdi, 10
	call	malloc
	mov	qword [rbp-21*8], rax
	mov	r8, qword [rbp-21*8]
	mov	r9, 1
	mov	qword [r8], r9
	add	r8, 8
	mov	qword [rbp-21*8], r8
	mov	r8, qword [rbp-21*8]
	mov	qword [rbp-22*8], r8
	add	qword [rbp-22*8], 0
	mov	r8, qword [rbp-22*8]
	mov	r9, 32
	mov	[r8], r9
	mov	qword [rbp-22*8], r8
	mov	rsi, qword [rbp-21*8]
	mov	rdi, qword [rbp-20*8]
	call	FUNCTION_string_concat
	mov	qword [rbp-23*8], rax
	mov	rdi, qword [rbp-1*8]
	call	FUNCTION_get
	mov	qword [rbp-24*8], rax
	mov	rdi, qword [rbp-24*8]
	call	FUNCTION_toString
	mov	qword [rbp-25*8], rax
	mov	rsi, qword [rbp-25*8]
	mov	rdi, qword [rbp-23*8]
	call	FUNCTION_string_concat
	mov	qword [rbp-26*8], rax
	mov	rdi, qword [rbp-26*8]
	call	FUNCTION_println
	mov	qword [rbp-27*8], rax
	null	qword [rbp-1*8], 1
	jmp	LABEL26
LABEL28:
	mov	qword [rbp-28*8], 0
	mov	r8, qword [rbp-28*8]
	mov	qword [rbp-29*8], r8
	jmp	LABEL29
LABEL29:
	mov	rax, qword [rbp-29*8]
	leave
	ret
LABEL30:
	SECTION .data
	SECTION .bss
	LABEL0:	resq	1
	LABEL1:	resq	1
	SECTION .rodata
	L_022:	db 25H, 73H, 00H
