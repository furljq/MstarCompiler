	default rel
	global main
	global CLASS_vector_MEMBER_init
	global CLASS_vector_MEMBER_getDim
	global CLASS_vector_MEMBER_dot
	global CLASS_vector_MEMBER_scalarInPlaceMultiply
	global CLASS_vector_MEMBER_add
	global CLASS_vector_MEMBER_set
	global CLASS_vector_MEMBER_toString
	global CLASS_vector_MEMBER_copy
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
	sub	rsp, 16
	call	FUNCTION_main
	mov	qword [rbp-1*8], rax
	mov	rax, qword [rbp-1*8]
	leave
	ret
CLASS_vector_MEMBER_init:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 200
	mov	qword [rbp-1*8], com.fur.nasm.register.NASMRegister@5b0abc94
	mov	qword [rbp-2*8], com.fur.nasm.register.NASMRegister@75c072cb
	mov	qword [rbp-3*8], 0
	mov	qword [rbp-1*8], 0
	mov	qword [rbp-2*8], 0
	mov	qword [rbp-4*8], 0
	mov	qword [rbp-5*8], 0
	mov	r8, qword [rbp-5*8]
	cmp	qword [rbp-2*8], r8
	sete	qword [rbp-6*8]
	cmp	qword [rbp-6*8], 0
	jz	LABEL1
	jmp	LABEL0
LABEL0:
	jmp	LABEL9
	jmp	LABEL2
LABEL1:
	jmp	LABEL9
	jmp	LABEL2
LABEL2:
	mov	qword [rbp-7*8], 1
	mov	r8, qword [rbp-1*8]
	add	qword [rbp-8*8], r8
	mov	r8, qword [rbp-7*8]
	add	qword [rbp-8*8], r8
	mov	rdi, qword [rbp-2*8]
	call	FUNCTION_size
	mov	qword [rbp-9*8], rax
	mov	r8, qword [rbp-9*8]
	mov	qword [rbp-10*8], r8
	add	qword [rbp-10*8], 1
	imul	qword [rbp-10*8], 8
	mov	rdi, qword [rbp-9*8]
	call	malloc
	mov	qword [rbp-11*8], rax
	sub	qword [rbp-9*8], 1
	mov	r8, qword [rbp-11*8]
	mov	r9, qword [rbp-9*8]
	mov	qword [r8], r9
	add	r8, 8
LABEL3:
	mov	qword [rbp-11*8], r8
	mov	r8, qword [rbp-9*8]
	cmp	qword [rbp-13*8], r8
	setl	qword [rbp-12*8]
	cmp	qword [rbp-12*8], 0
	jz	LABEL5
	jmp	LABEL3
LABEL4:
	mov	r8, qword [rbp-13*8]
	add	qword [rbp-14*8], r8
	imul	qword [rbp-14*8], 8
	mov	r8, qword [rbp-11*8]
	add	qword [rbp-14*8], r8
	mov	r8, qword [rbp-14*8]
	mov	r9, qword [rbp-15*8]
	mov	qword [r8], r9
	add	qword [rbp-13*8], 1
	jmp	LABEL3
LABEL5:
	mov	qword [rbp-14*8], r8
	mov	r8, qword [rbp-11*8]
	mov	qword [rbp-8*8], r8
	mov	qword [rbp-16*8], 0
	mov	r8, qword [rbp-16*8]
	mov	qword [rbp-4*8], r8
LABEL6:
	mov	rdi, qword [rbp-2*8]
	call	FUNCTION_size
	mov	qword [rbp-17*8], rax
	mov	r8, qword [rbp-17*8]
	cmp	qword [rbp-4*8], r8
	setl	qword [rbp-18*8]
	cmp	qword [rbp-18*8], 0
	jz	LABEL8
	jmp	LABEL6
LABEL7:
	mov	qword [rbp-19*8], 1
	mov	r8, qword [rbp-1*8]
	add	qword [rbp-20*8], r8
	mov	r8, qword [rbp-19*8]
	add	qword [rbp-20*8], r8
	mov	r8, qword [rbp-20*8]
	mov	qword [rbp-21*8], r8
	mov	r8, qword [rbp-4*8]
	add	qword [rbp-21*8], r8
	mov	r8, qword [rbp-2*8]
	mov	qword [rbp-22*8], r8
	mov	r8, qword [rbp-4*8]
	add	qword [rbp-22*8], r8
	mov	r8, qword [rbp-22*8]
	mov	r9, [r8]
	mov	com.fur.intermediateRepresentation.IRRegister@57f23557, r9
	mov	r8, qword [rbp-21*8]
	mov	r9, qword [rbp-23*8]
	mov	qword [r8], r9
	null	qword [rbp-4*8], 1
	jmp	LABEL6
LABEL8:
LABEL9:
	mov	qword [rbp-21*8], r8
	mov	rax, qword [rbp-24*8]
	leave
	ret
CLASS_vector_MEMBER_getDim:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 104
	mov	qword [rbp-1*8], com.fur.nasm.register.NASMRegister@5b0abc94
	mov	qword [rbp-2*8], 0
	mov	qword [rbp-1*8], 0
	mov	qword [rbp-3*8], 1
	mov	r8, qword [rbp-1*8]
	add	qword [rbp-4*8], r8
	mov	r8, qword [rbp-3*8]
	add	qword [rbp-4*8], r8
	mov	qword [rbp-5*8], 0
	mov	r8, qword [rbp-5*8]
	cmp	qword [rbp-4*8], r8
	sete	qword [rbp-6*8]
	cmp	qword [rbp-6*8], 0
	jz	LABEL11
	jmp	LABEL10
LABEL10:
	mov	qword [rbp-7*8], 0
	mov	r8, qword [rbp-7*8]
	mov	qword [rbp-8*8], r8
	jmp	LABEL13
	jmp	LABEL12
LABEL11:
	mov	qword [rbp-9*8], 0
	mov	r8, qword [rbp-9*8]
	mov	qword [rbp-8*8], r8
	jmp	LABEL13
	jmp	LABEL12
LABEL12:
	mov	qword [rbp-10*8], 1
	mov	r8, qword [rbp-1*8]
	add	qword [rbp-11*8], r8
	mov	r8, qword [rbp-10*8]
	add	qword [rbp-11*8], r8
	mov	rdi, qword [rbp-11*8]
	call	FUNCTION_size
	mov	qword [rbp-12*8], rax
	mov	r8, qword [rbp-12*8]
	mov	qword [rbp-8*8], r8
	jmp	LABEL13
LABEL13:
	mov	rax, qword [rbp-8*8]
	leave
	ret
CLASS_vector_MEMBER_dot:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 160
	mov	qword [rbp-1*8], com.fur.nasm.register.NASMRegister@5b0abc94
	mov	qword [rbp-2*8], com.fur.nasm.register.NASMRegister@75c072cb
	mov	qword [rbp-3*8], 0
	mov	qword [rbp-1*8], 0
	mov	qword [rbp-2*8], 0
	mov	qword [rbp-4*8], 0
	mov	qword [rbp-5*8], 0
	mov	qword [rbp-6*8], 0
	mov	r8, qword [rbp-6*8]
	mov	qword [rbp-4*8], r8
	mov	qword [rbp-7*8], 0
	mov	r8, qword [rbp-7*8]
	mov	qword [rbp-5*8], r8
LABEL14:
	call	CLASS_vector_MEMBER_getDim
	mov	qword [rbp-8*8], rax
	mov	r8, qword [rbp-8*8]
	cmp	qword [rbp-4*8], r8
	setl	qword [rbp-9*8]
	cmp	qword [rbp-9*8], 0
	jz	LABEL16
	jmp	LABEL14
LABEL15:
	mov	qword [rbp-10*8], 1
	mov	r8, qword [rbp-1*8]
	add	qword [rbp-11*8], r8
	mov	r8, qword [rbp-10*8]
	add	qword [rbp-11*8], r8
	mov	r8, qword [rbp-11*8]
	mov	qword [rbp-12*8], r8
	mov	r8, qword [rbp-4*8]
	add	qword [rbp-12*8], r8
	mov	r8, qword [rbp-12*8]
	mov	r9, [r8]
	mov	com.fur.intermediateRepresentation.IRRegister@dbd940d, r9
	mov	r8, qword [rbp-13*8]
	mov	qword [rbp-14*8], r8
	mov	r8, qword [rbp-2*8]
	add	qword [rbp-15*8], r8
	add	qword [rbp-15*8], 1
	mov	r8, qword [rbp-15*8]
	mov	r9, [r8]
	mov	com.fur.intermediateRepresentation.IRRegister@6c9f5c0d, r9
	mov	r8, qword [rbp-16*8]
	mov	qword [rbp-17*8], r8
	mov	r8, qword [rbp-4*8]
	add	qword [rbp-17*8], r8
	mov	r8, qword [rbp-17*8]
	mov	r9, [r8]
	mov	com.fur.intermediateRepresentation.IRRegister@de3a06f, r9
	mov	r8, qword [rbp-18*8]
	imul	qword [rbp-14*8], r8
	mov	r8, qword [rbp-14*8]
	mov	qword [rbp-5*8], r8
	add	qword [rbp-4*8], 1
	jmp	LABEL14
LABEL16:
	mov	r8, qword [rbp-5*8]
	mov	qword [rbp-19*8], r8
	jmp	LABEL17
LABEL17:
	mov	rax, qword [rbp-19*8]
	leave
	ret
CLASS_vector_MEMBER_scalarInPlaceMultiply:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 184
	mov	qword [rbp-1*8], com.fur.nasm.register.NASMRegister@5b0abc94
	mov	qword [rbp-2*8], com.fur.nasm.register.NASMRegister@75c072cb
	mov	qword [rbp-3*8], 0
	mov	qword [rbp-1*8], 0
	mov	qword [rbp-2*8], 0
	mov	qword [rbp-4*8], 0
	mov	qword [rbp-5*8], 1
	mov	r8, qword [rbp-1*8]
	add	qword [rbp-6*8], r8
	mov	r8, qword [rbp-5*8]
	add	qword [rbp-6*8], r8
	mov	qword [rbp-7*8], 0
	mov	r8, qword [rbp-7*8]
	cmp	qword [rbp-6*8], r8
	sete	qword [rbp-8*8]
	cmp	qword [rbp-8*8], 0
	jz	LABEL19
	jmp	LABEL18
LABEL18:
	mov	qword [rbp-9*8], 0
	mov	r8, qword [rbp-9*8]
	mov	qword [rbp-10*8], r8
	jmp	LABEL24
	jmp	LABEL20
LABEL19:
	mov	qword [rbp-11*8], 0
	mov	r8, qword [rbp-11*8]
	mov	qword [rbp-10*8], r8
	jmp	LABEL24
	jmp	LABEL20
LABEL20:
	mov	qword [rbp-12*8], 0
	mov	r8, qword [rbp-12*8]
	mov	qword [rbp-4*8], r8
LABEL21:
	call	CLASS_vector_MEMBER_getDim
	mov	qword [rbp-13*8], rax
	mov	r8, qword [rbp-13*8]
	cmp	qword [rbp-4*8], r8
	setl	qword [rbp-14*8]
	cmp	qword [rbp-14*8], 0
	jz	LABEL23
	jmp	LABEL21
LABEL22:
	mov	r8, qword [rbp-1*8]
	add	qword [rbp-15*8], r8
	add	qword [rbp-15*8], 1
	mov	r8, qword [rbp-15*8]
	mov	r9, [r8]
	mov	com.fur.intermediateRepresentation.IRRegister@276438c9, r9
	mov	r8, qword [rbp-16*8]
	mov	qword [rbp-17*8], r8
	mov	r8, qword [rbp-4*8]
	add	qword [rbp-17*8], r8
	mov	r8, qword [rbp-2*8]
	mov	qword [rbp-18*8], r8
	mov	r8, qword [rbp-1*8]
	add	qword [rbp-19*8], r8
	add	qword [rbp-19*8], 1
	mov	r8, qword [rbp-19*8]
	mov	r9, [r8]
	mov	com.fur.intermediateRepresentation.IRRegister@7181ae3f, r9
	mov	r8, qword [rbp-20*8]
	mov	qword [rbp-21*8], r8
	mov	r8, qword [rbp-4*8]
	add	qword [rbp-21*8], r8
	mov	r8, qword [rbp-21*8]
	mov	r9, [r8]
	mov	com.fur.intermediateRepresentation.IRRegister@46238e3f, r9
	mov	r8, qword [rbp-22*8]
	imul	qword [rbp-18*8], r8
	mov	r8, qword [rbp-17*8]
	mov	r9, qword [rbp-18*8]
	mov	qword [r8], r9
	null	qword [rbp-4*8], 1
	jmp	LABEL21
LABEL23:
	mov	qword [rbp-17*8], r8
	mov	r8, qword [rbp-1*8]
	mov	qword [rbp-10*8], r8
	jmp	LABEL24
LABEL24:
	mov	rax, qword [rbp-10*8]
	leave
	ret
CLASS_vector_MEMBER_add:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 256
	mov	qword [rbp-1*8], com.fur.nasm.register.NASMRegister@5b0abc94
	mov	qword [rbp-2*8], com.fur.nasm.register.NASMRegister@75c072cb
	mov	qword [rbp-3*8], 0
	mov	qword [rbp-1*8], 0
	mov	qword [rbp-2*8], 0
	mov	qword [rbp-4*8], 0
	mov	qword [rbp-5*8], 0
	call	CLASS_vector_MEMBER_getDim
	mov	qword [rbp-6*8], rax
	mov	rdi, qword [rbp-2*8]
	call	CLASS_vector_MEMBER_getDim
	mov	qword [rbp-7*8], rax
	mov	r8, qword [rbp-7*8]
	cmp	qword [rbp-6*8], r8
	setne	qword [rbp-8*8]
	cmp	qword [rbp-8*8], 0
	jz	LABEL25
	jmp	LABEL26
LABEL25:
	call	CLASS_vector_MEMBER_getDim
	mov	qword [rbp-9*8], rax
	mov	qword [rbp-10*8], 0
	mov	r8, qword [rbp-10*8]
	cmp	qword [rbp-9*8], r8
	sete	qword [rbp-11*8]
	mov	r8, qword [rbp-8*8]
	mov	qword [rbp-12*8], r8
	mov	r8, qword [rbp-11*8]
	or	qword [rbp-12*8], r8
	jmp	LABEL27
LABEL26:
	add	qword [rbp-12*8], 0
	jmp	LABEL27
LABEL27:
	cmp	qword [rbp-12*8], 0
	jz	LABEL29
	jmp	LABEL28
LABEL28:
	mov	qword [rbp-13*8], 0
	mov	r8, qword [rbp-13*8]
	mov	qword [rbp-14*8], r8
	jmp	LABEL34
	jmp	LABEL30
LABEL29:
	mov	qword [rbp-15*8], 0
	mov	r8, qword [rbp-15*8]
	mov	qword [rbp-14*8], r8
	jmp	LABEL34
	jmp	LABEL30
LABEL30:
	mov	rdi, 16
	call	malloc
	mov	qword [rbp-16*8], rax
	mov	r8, qword [rbp-16*8]
	mov	qword [rbp-4*8], r8
	mov	qword [rbp-17*8], 0
	mov	r8, qword [rbp-17*8]
	mov	qword [rbp-5*8], r8
LABEL31:
	call	CLASS_vector_MEMBER_getDim
	mov	qword [rbp-18*8], rax
	mov	r8, qword [rbp-18*8]
	cmp	qword [rbp-5*8], r8
	setl	qword [rbp-19*8]
	cmp	qword [rbp-19*8], 0
	jz	LABEL33
	jmp	LABEL31
LABEL32:
	mov	r8, qword [rbp-4*8]
	add	qword [rbp-20*8], r8
	add	qword [rbp-20*8], 1
	mov	r8, qword [rbp-20*8]
	mov	r9, [r8]
	mov	com.fur.intermediateRepresentation.IRRegister@2bbaf4f0, r9
	mov	r8, qword [rbp-21*8]
	mov	qword [rbp-22*8], r8
	mov	r8, qword [rbp-5*8]
	add	qword [rbp-22*8], r8
	mov	qword [rbp-23*8], 1
	mov	r8, qword [rbp-1*8]
	add	qword [rbp-24*8], r8
	mov	r8, qword [rbp-23*8]
	add	qword [rbp-24*8], r8
	mov	r8, qword [rbp-24*8]
	mov	qword [rbp-25*8], r8
	mov	r8, qword [rbp-5*8]
	add	qword [rbp-25*8], r8
	mov	r8, qword [rbp-25*8]
	mov	r9, [r8]
	mov	com.fur.intermediateRepresentation.IRRegister@33cb5951, r9
	mov	r8, qword [rbp-26*8]
	mov	qword [rbp-27*8], r8
	mov	r8, qword [rbp-2*8]
	add	qword [rbp-28*8], r8
	add	qword [rbp-28*8], 1
	mov	r8, qword [rbp-28*8]
	mov	r9, [r8]
	mov	com.fur.intermediateRepresentation.IRRegister@4148db48, r9
	mov	r8, qword [rbp-29*8]
	mov	qword [rbp-30*8], r8
	mov	r8, qword [rbp-5*8]
	add	qword [rbp-30*8], r8
	mov	r8, qword [rbp-30*8]
	mov	r9, [r8]
	mov	com.fur.intermediateRepresentation.IRRegister@282003e1, r9
	mov	r8, qword [rbp-31*8]
	add	qword [rbp-27*8], r8
	mov	r8, qword [rbp-22*8]
	mov	r9, qword [rbp-27*8]
	mov	qword [r8], r9
	null	qword [rbp-5*8], 1
	jmp	LABEL31
LABEL33:
	mov	qword [rbp-22*8], r8
	mov	r8, qword [rbp-4*8]
	mov	qword [rbp-14*8], r8
	jmp	LABEL34
LABEL34:
	mov	rax, qword [rbp-14*8]
	leave
	ret
CLASS_vector_MEMBER_set:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 112
	mov	qword [rbp-1*8], com.fur.nasm.register.NASMRegister@5b0abc94
	mov	qword [rbp-2*8], com.fur.nasm.register.NASMRegister@75c072cb
	mov	qword [rbp-3*8], com.fur.nasm.register.NASMRegister@78e94dcf
	mov	qword [rbp-4*8], 0
	mov	qword [rbp-1*8], 0
	mov	qword [rbp-2*8], 0
	mov	qword [rbp-3*8], 0
	call	CLASS_vector_MEMBER_getDim
	mov	qword [rbp-5*8], rax
	mov	r8, qword [rbp-2*8]
	cmp	qword [rbp-5*8], r8
	setl	qword [rbp-6*8]
	cmp	qword [rbp-6*8], 0
	jz	LABEL36
	jmp	LABEL35
LABEL35:
	mov	qword [rbp-7*8], 0
	mov	r8, qword [rbp-7*8]
	mov	qword [rbp-8*8], r8
	jmp	LABEL38
	jmp	LABEL37
LABEL36:
	mov	qword [rbp-9*8], 0
	mov	r8, qword [rbp-9*8]
	mov	qword [rbp-8*8], r8
	jmp	LABEL38
	jmp	LABEL37
LABEL37:
	mov	qword [rbp-10*8], 1
	mov	r8, qword [rbp-1*8]
	add	qword [rbp-11*8], r8
	mov	r8, qword [rbp-10*8]
	add	qword [rbp-11*8], r8
	mov	r8, qword [rbp-11*8]
	mov	qword [rbp-12*8], r8
	mov	r8, qword [rbp-2*8]
	add	qword [rbp-12*8], r8
	mov	r8, qword [rbp-12*8]
	mov	r9, qword [rbp-3*8]
	mov	qword [r8], r9
	mov	qword [rbp-13*8], 0
	mov	qword [rbp-12*8], r8
	mov	r8, qword [rbp-13*8]
	mov	qword [rbp-8*8], r8
	jmp	LABEL38
LABEL38:
	mov	rax, qword [rbp-8*8]
	leave
	ret
CLASS_vector_MEMBER_toString:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 208
	mov	qword [rbp-1*8], com.fur.nasm.register.NASMRegister@5b0abc94
	mov	qword [rbp-2*8], 0
	mov	qword [rbp-1*8], 0
	mov	qword [rbp-3*8], 0
	mov	qword [rbp-4*8], 0
	mov	rdi, 11
	call	malloc
	mov	qword [rbp-5*8], rax
	mov	r8, qword [rbp-5*8]
	mov	r9, 2
	mov	qword [r8], r9
	add	r8, 8
	mov	qword [rbp-5*8], r8
	mov	r8, qword [rbp-5*8]
	mov	qword [rbp-6*8], r8
	add	qword [rbp-6*8], 0
	mov	r8, qword [rbp-6*8]
	mov	r9, 8232
	mov	[r8], r9
	mov	qword [rbp-6*8], r8
	mov	r8, qword [rbp-5*8]
	mov	qword [rbp-3*8], r8
	call	CLASS_vector_MEMBER_getDim
	mov	qword [rbp-7*8], rax
	mov	qword [rbp-8*8], 0
	mov	r8, qword [rbp-8*8]
	cmp	qword [rbp-7*8], r8
	setg	qword [rbp-9*8]
	cmp	qword [rbp-9*8], 0
	jz	LABEL40
	jmp	LABEL39
LABEL39:
	call	CLASS_vector_MEMBER_toString
	mov	qword [rbp-10*8], rax
	mov	rsi, qword [rbp-10*8]
	mov	rdi, qword [rbp-3*8]
	call	FUNCTION_string_concat
	mov	qword [rbp-11*8], rax
	mov	r8, qword [rbp-11*8]
	mov	qword [rbp-3*8], r8
	jmp	LABEL41
LABEL40:
	call	CLASS_vector_MEMBER_toString
	mov	qword [rbp-12*8], rax
	mov	rsi, qword [rbp-12*8]
	mov	rdi, qword [rbp-3*8]
	call	FUNCTION_string_concat
	mov	qword [rbp-13*8], rax
	mov	r8, qword [rbp-13*8]
	mov	qword [rbp-3*8], r8
	jmp	LABEL41
LABEL41:
	mov	qword [rbp-14*8], 1
	mov	r8, qword [rbp-14*8]
	mov	qword [rbp-4*8], r8
LABEL42:
	call	CLASS_vector_MEMBER_getDim
	mov	qword [rbp-15*8], rax
	mov	r8, qword [rbp-15*8]
	cmp	qword [rbp-4*8], r8
	setl	qword [rbp-16*8]
	cmp	qword [rbp-16*8], 0
	jz	LABEL44
	jmp	LABEL42
LABEL43:
	mov	rdi, 11
	call	malloc
	mov	qword [rbp-17*8], rax
	mov	r8, qword [rbp-17*8]
	mov	r9, 2
	mov	qword [r8], r9
	add	r8, 8
	mov	qword [rbp-17*8], r8
	mov	r8, qword [rbp-17*8]
	mov	qword [rbp-18*8], r8
	add	qword [rbp-18*8], 0
	mov	r8, qword [rbp-18*8]
	mov	r9, 8236
	mov	[r8], r9
	mov	qword [rbp-18*8], r8
	mov	rsi, qword [rbp-17*8]
	mov	rdi, qword [rbp-3*8]
	call	FUNCTION_string_concat
	mov	qword [rbp-19*8], rax
	call	CLASS_vector_MEMBER_toString
	mov	qword [rbp-20*8], rax
	mov	rsi, qword [rbp-20*8]
	mov	rdi, qword [rbp-19*8]
	call	FUNCTION_string_concat
	mov	qword [rbp-21*8], rax
	mov	r8, qword [rbp-21*8]
	mov	qword [rbp-3*8], r8
	null	qword [rbp-4*8], 1
	jmp	LABEL42
LABEL44:
	mov	rdi, 11
	call	malloc
	mov	qword [rbp-22*8], rax
	mov	r8, qword [rbp-22*8]
	mov	r9, 2
	mov	qword [r8], r9
	add	r8, 8
	mov	qword [rbp-22*8], r8
	mov	r8, qword [rbp-22*8]
	mov	qword [rbp-23*8], r8
	add	qword [rbp-23*8], 0
	mov	r8, qword [rbp-23*8]
	mov	r9, 10528
	mov	[r8], r9
	mov	qword [rbp-23*8], r8
	mov	rsi, qword [rbp-22*8]
	mov	rdi, qword [rbp-3*8]
	call	FUNCTION_string_concat
	mov	qword [rbp-24*8], rax
	mov	r8, qword [rbp-24*8]
	mov	qword [rbp-3*8], r8
	mov	r8, qword [rbp-3*8]
	mov	qword [rbp-25*8], r8
	jmp	LABEL45
LABEL45:
	mov	rax, qword [rbp-25*8]
	leave
	ret
CLASS_vector_MEMBER_copy:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 152
	mov	qword [rbp-1*8], com.fur.nasm.register.NASMRegister@5b0abc94
	mov	qword [rbp-2*8], com.fur.nasm.register.NASMRegister@75c072cb
	mov	qword [rbp-3*8], 0
	mov	qword [rbp-1*8], 0
	mov	qword [rbp-2*8], 0
	mov	qword [rbp-4*8], 0
	mov	rsi, qword [rbp-4*8]
	mov	rdi, qword [rbp-2*8]
	call	FUNCTION_string_equal
	mov	qword [rbp-5*8], rax
	cmp	qword [rbp-5*8], 0
	jz	LABEL47
	jmp	LABEL46
LABEL46:
	mov	qword [rbp-6*8], 0
	mov	r8, qword [rbp-6*8]
	mov	qword [rbp-7*8], r8
	jmp	LABEL52
	jmp	LABEL48
LABEL47:
	mov	qword [rbp-8*8], 0
	mov	r8, qword [rbp-8*8]
	mov	qword [rbp-7*8], r8
	jmp	LABEL52
	jmp	LABEL48
LABEL48:
	mov	rdi, qword [rbp-2*8]
	call	CLASS_vector_MEMBER_getDim
	mov	qword [rbp-9*8], rax
	mov	qword [rbp-10*8], 0
	mov	r8, qword [rbp-10*8]
	cmp	qword [rbp-9*8], r8
	sete	qword [rbp-11*8]
	cmp	qword [rbp-11*8], 0
	jz	LABEL50
	jmp	LABEL49
LABEL49:
	mov	qword [rbp-12*8], 1
	mov	r8, qword [rbp-1*8]
	add	qword [rbp-13*8], r8
	mov	r8, qword [rbp-12*8]
	add	qword [rbp-13*8], r8
	mov	qword [rbp-14*8], 0
	mov	r8, qword [rbp-14*8]
	mov	qword [rbp-13*8], r8
	jmp	LABEL51
LABEL50:
	mov	qword [rbp-15*8], 1
	mov	r8, qword [rbp-1*8]
	add	qword [rbp-16*8], r8
	mov	r8, qword [rbp-15*8]
	add	qword [rbp-16*8], r8
	mov	qword [rbp-17*8], 0
	mov	r8, qword [rbp-17*8]
	mov	qword [rbp-16*8], r8
	jmp	LABEL51
LABEL51:
	mov	qword [rbp-18*8], 0
	mov	r8, qword [rbp-18*8]
	mov	qword [rbp-7*8], r8
	jmp	LABEL52
LABEL52:
	mov	rax, qword [rbp-7*8]
	leave
	ret
FUNCTION_main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 608
	mov	qword [rbp-1*8], 0
	mov	qword [rbp-2*8], 0
	mov	qword [rbp-3*8], 0
	mov	qword [rbp-4*8], 0
	mov	rdi, 16
	call	malloc
	mov	qword [rbp-5*8], rax
	mov	r8, qword [rbp-5*8]
	mov	qword [rbp-1*8], r8
	mov	qword [rbp-6*8], 10
	mov	r8, qword [rbp-6*8]
	mov	qword [rbp-7*8], r8
	add	qword [rbp-7*8], 1
	imul	qword [rbp-7*8], 8
	mov	rdi, qword [rbp-6*8]
	call	malloc
	mov	qword [rbp-8*8], rax
	sub	qword [rbp-6*8], 1
	mov	r8, qword [rbp-8*8]
	mov	r9, qword [rbp-6*8]
	mov	qword [r8], r9
	add	r8, 8
LABEL53:
	mov	qword [rbp-8*8], r8
	mov	r8, qword [rbp-6*8]
	cmp	qword [rbp-10*8], r8
	setl	qword [rbp-9*8]
	cmp	qword [rbp-9*8], 0
	jz	LABEL55
	jmp	LABEL53
LABEL54:
	mov	r8, qword [rbp-10*8]
	add	qword [rbp-11*8], r8
	imul	qword [rbp-11*8], 8
	mov	r8, qword [rbp-8*8]
	add	qword [rbp-11*8], r8
	mov	r8, qword [rbp-11*8]
	mov	r9, qword [rbp-12*8]
	mov	qword [r8], r9
	add	qword [rbp-10*8], 1
	jmp	LABEL53
LABEL55:
	mov	qword [rbp-11*8], r8
	mov	r8, qword [rbp-8*8]
	mov	qword [rbp-2*8], r8
	mov	qword [rbp-13*8], 0
	mov	r8, qword [rbp-13*8]
	mov	qword [rbp-3*8], r8
LABEL56:
	mov	qword [rbp-14*8], 10
	mov	r8, qword [rbp-14*8]
	cmp	qword [rbp-3*8], r8
	setl	qword [rbp-15*8]
	cmp	qword [rbp-15*8], 0
	jz	LABEL58
	jmp	LABEL56
LABEL57:
	mov	r8, qword [rbp-2*8]
	mov	qword [rbp-16*8], r8
	mov	r8, qword [rbp-3*8]
	add	qword [rbp-16*8], r8
	mov	qword [rbp-17*8], 9
	mov	r8, qword [rbp-17*8]
	mov	qword [rbp-18*8], r8
	mov	r8, qword [rbp-3*8]
	sub	qword [rbp-18*8], r8
	mov	r8, qword [rbp-16*8]
	mov	r9, qword [rbp-18*8]
	mov	qword [r8], r9
	null	qword [rbp-3*8], 1
	jmp	LABEL56
LABEL58:
	mov	qword [rbp-16*8], r8
	mov	rsi, qword [rbp-2*8]
	mov	rdi, qword [rbp-1*8]
	call	CLASS_vector_MEMBER_init
	mov	qword [rbp-19*8], rax
	mov	rdi, 19
	call	malloc
	mov	qword [rbp-20*8], rax
	mov	r8, qword [rbp-20*8]
	mov	r9, 10
	mov	qword [r8], r9
	add	r8, 8
	mov	qword [rbp-20*8], r8
	mov	r8, qword [rbp-20*8]
	mov	qword [rbp-21*8], r8
	add	qword [rbp-21*8], 0
	mov	r8, qword [rbp-21*8]
	mov	r9, 1952671094
	mov	[r8], r9
	mov	qword [rbp-21*8], r8
	mov	r8, qword [rbp-20*8]
	mov	qword [rbp-22*8], r8
	add	qword [rbp-22*8], 4
	mov	r8, qword [rbp-22*8]
	mov	r9, 2015392367
	mov	[r8], r9
	mov	qword [rbp-22*8], r8
	mov	r8, qword [rbp-20*8]
	mov	qword [rbp-23*8], r8
	add	qword [rbp-23*8], 8
	mov	r8, qword [rbp-23*8]
	mov	r9, 8250
	mov	[r8], r9
	mov	qword [rbp-23*8], r8
	mov	rdi, qword [rbp-20*8]
	call	FUNCTION_print
	mov	qword [rbp-24*8], rax
	mov	rdi, qword [rbp-1*8]
	call	CLASS_vector_MEMBER_toString
	mov	qword [rbp-25*8], rax
	mov	rdi, qword [rbp-25*8]
	call	FUNCTION_println
	mov	qword [rbp-26*8], rax
	mov	rdi, 16
	call	malloc
	mov	qword [rbp-27*8], rax
	mov	r8, qword [rbp-27*8]
	mov	qword [rbp-4*8], r8
	mov	rsi, qword [rbp-1*8]
	mov	rdi, qword [rbp-4*8]
	call	CLASS_vector_MEMBER_copy
	mov	qword [rbp-28*8], rax
	mov	qword [rbp-29*8], 3
	mov	qword [rbp-30*8], 817
	mov	rdx, qword [rbp-30*8]
	mov	rsi, qword [rbp-29*8]
	mov	rdi, qword [rbp-4*8]
	call	CLASS_vector_MEMBER_set
	mov	qword [rbp-31*8], rax
	cmp	qword [rbp-31*8], 0
	jz	LABEL60
	jmp	LABEL59
LABEL59:
	mov	rdi, 17
	call	malloc
	mov	qword [rbp-32*8], rax
	mov	r8, qword [rbp-32*8]
	mov	r9, 8
	mov	qword [r8], r9
	add	r8, 8
	mov	qword [rbp-32*8], r8
	mov	r8, qword [rbp-32*8]
	mov	qword [rbp-33*8], r8
	add	qword [rbp-33*8], 0
	mov	r8, qword [rbp-33*8]
	mov	r9, 1768126565
	mov	[r8], r9
	mov	qword [rbp-33*8], r8
	mov	r8, qword [rbp-32*8]
	mov	qword [rbp-34*8], r8
	add	qword [rbp-34*8], 4
	mov	r8, qword [rbp-34*8]
	mov	r9, 560227700
	mov	[r8], r9
	mov	qword [rbp-34*8], r8
	mov	r8, qword [rbp-32*8]
	mov	qword [rbp-35*8], r8
	add	qword [rbp-35*8], 8
	mov	r8, qword [rbp-35*8]
	mov	r9, 0
	mov	[r8], r9
	mov	qword [rbp-35*8], r8
	mov	rdi, qword [rbp-32*8]
	call	FUNCTION_println
	mov	qword [rbp-36*8], rax
	jmp	LABEL61
LABEL60:
	mov	rdi, 17
	call	malloc
	mov	qword [rbp-37*8], rax
	mov	r8, qword [rbp-37*8]
	mov	r9, 8
	mov	qword [r8], r9
	add	r8, 8
	mov	qword [rbp-37*8], r8
	mov	r8, qword [rbp-37*8]
	mov	qword [rbp-38*8], r8
	add	qword [rbp-38*8], 0
	mov	r8, qword [rbp-38*8]
	mov	r9, 1768126565
	mov	[r8], r9
	mov	qword [rbp-38*8], r8
	mov	r8, qword [rbp-37*8]
	mov	qword [rbp-39*8], r8
	add	qword [rbp-39*8], 4
	mov	r8, qword [rbp-39*8]
	mov	r9, 560227700
	mov	[r8], r9
	mov	qword [rbp-39*8], r8
	mov	r8, qword [rbp-37*8]
	mov	qword [rbp-40*8], r8
	add	qword [rbp-40*8], 8
	mov	r8, qword [rbp-40*8]
	mov	r9, 0
	mov	[r8], r9
	mov	qword [rbp-40*8], r8
	mov	rdi, qword [rbp-37*8]
	call	FUNCTION_println
	mov	qword [rbp-41*8], rax
	jmp	LABEL61
LABEL61:
	mov	rdi, 19
	call	malloc
	mov	qword [rbp-42*8], rax
	mov	r8, qword [rbp-42*8]
	mov	r9, 10
	mov	qword [r8], r9
	add	r8, 8
	mov	qword [rbp-42*8], r8
	mov	r8, qword [rbp-42*8]
	mov	qword [rbp-43*8], r8
	add	qword [rbp-43*8], 0
	mov	r8, qword [rbp-43*8]
	mov	r9, 1952671094
	mov	[r8], r9
	mov	qword [rbp-43*8], r8
	mov	r8, qword [rbp-42*8]
	mov	qword [rbp-44*8], r8
	add	qword [rbp-44*8], 4
	mov	r8, qword [rbp-44*8]
	mov	r9, 2032169583
	mov	[r8], r9
	mov	qword [rbp-44*8], r8
	mov	r8, qword [rbp-42*8]
	mov	qword [rbp-45*8], r8
	add	qword [rbp-45*8], 8
	mov	r8, qword [rbp-45*8]
	mov	r9, 8250
	mov	[r8], r9
	mov	qword [rbp-45*8], r8
	mov	rdi, qword [rbp-42*8]
	call	FUNCTION_print
	mov	qword [rbp-46*8], rax
	mov	rdi, qword [rbp-4*8]
	call	CLASS_vector_MEMBER_toString
	mov	qword [rbp-47*8], rax
	mov	rdi, qword [rbp-47*8]
	call	FUNCTION_println
	mov	qword [rbp-48*8], rax
	mov	rdi, 16
	call	malloc
	mov	qword [rbp-49*8], rax
	mov	r8, qword [rbp-49*8]
	mov	r9, 7
	mov	qword [r8], r9
	add	r8, 8
	mov	qword [rbp-49*8], r8
	mov	r8, qword [rbp-49*8]
	mov	qword [rbp-50*8], r8
	add	qword [rbp-50*8], 0
	mov	r8, qword [rbp-50*8]
	mov	r9, 539697272
	mov	[r8], r9
	mov	qword [rbp-50*8], r8
	mov	r8, qword [rbp-49*8]
	mov	qword [rbp-51*8], r8
	add	qword [rbp-51*8], 4
	mov	r8, qword [rbp-51*8]
	mov	r9, 2112121
	mov	[r8], r9
	mov	qword [rbp-51*8], r8
	mov	rdi, qword [rbp-49*8]
	call	FUNCTION_print
	mov	qword [rbp-52*8], rax
	mov	rsi, qword [rbp-4*8]
	mov	rdi, qword [rbp-1*8]
	call	CLASS_vector_MEMBER_add
	mov	qword [rbp-53*8], rax
	mov	rdi, qword [rbp-53*8]
	call	CLASS_vector_MEMBER_toString
	mov	qword [rbp-54*8], rax
	mov	rdi, qword [rbp-54*8]
	call	FUNCTION_println
	mov	qword [rbp-55*8], rax
	mov	rdi, 16
	call	malloc
	mov	qword [rbp-56*8], rax
	mov	r8, qword [rbp-56*8]
	mov	r9, 7
	mov	qword [r8], r9
	add	r8, 8
	mov	qword [rbp-56*8], r8
	mov	r8, qword [rbp-56*8]
	mov	qword [rbp-57*8], r8
	add	qword [rbp-57*8], 0
	mov	r8, qword [rbp-57*8]
	mov	r9, 539631736
	mov	[r8], r9
	mov	qword [rbp-57*8], r8
	mov	r8, qword [rbp-56*8]
	mov	qword [rbp-58*8], r8
	add	qword [rbp-58*8], 4
	mov	r8, qword [rbp-58*8]
	mov	r9, 2112121
	mov	[r8], r9
	mov	qword [rbp-58*8], r8
	mov	rdi, qword [rbp-56*8]
	call	FUNCTION_print
	mov	qword [rbp-59*8], rax
	mov	rsi, qword [rbp-4*8]
	mov	rdi, qword [rbp-1*8]
	call	CLASS_vector_MEMBER_dot
	mov	qword [rbp-60*8], rax
	mov	rdi, qword [rbp-60*8]
	call	FUNCTION_toString
	mov	qword [rbp-61*8], rax
	mov	rdi, qword [rbp-61*8]
	call	FUNCTION_println
	mov	qword [rbp-62*8], rax
	mov	rdi, 23
	call	malloc
	mov	qword [rbp-63*8], rax
	mov	r8, qword [rbp-63*8]
	mov	r9, 14
	mov	qword [r8], r9
	add	r8, 8
	mov	qword [rbp-63*8], r8
	mov	r8, qword [rbp-63*8]
	mov	qword [rbp-64*8], r8
	add	qword [rbp-64*8], 0
	mov	r8, qword [rbp-64*8]
	mov	r9, 1008742696
	mov	[r8], r9
	mov	qword [rbp-64*8], r8
	mov	r8, qword [rbp-63*8]
	mov	qword [rbp-65*8], r8
	add	qword [rbp-65*8], 4
	mov	r8, qword [rbp-65*8]
	mov	r9, 691216444
	mov	[r8], r9
	mov	qword [rbp-65*8], r8
	mov	r8, qword [rbp-63*8]
	mov	qword [rbp-66*8], r8
	add	qword [rbp-66*8], 8
	mov	r8, qword [rbp-66*8]
	mov	r9, 2032151072
	mov	[r8], r9
	mov	qword [rbp-66*8], r8
	mov	r8, qword [rbp-63*8]
	mov	qword [rbp-67*8], r8
	add	qword [rbp-67*8], 12
	mov	r8, qword [rbp-67*8]
	mov	r9, 8250
	mov	[r8], r9
	mov	qword [rbp-67*8], r8
	mov	rdi, qword [rbp-63*8]
	call	FUNCTION_print
	mov	qword [rbp-68*8], rax
	mov	qword [rbp-69*8], 1
	mov	r8, qword [rbp-69*8]
	mov	qword [rbp-70*8], r8
	mov	qword [rbp-71*8], 3
	mov	r8, qword [rbp-71*8]
	sal	qword [rbp-70*8], r8
	mov	rsi, qword [rbp-70*8]
	mov	rdi, qword [rbp-1*8]
	call	CLASS_vector_MEMBER_scalarInPlaceMultiply
	mov	qword [rbp-72*8], rax
	mov	rdi, qword [rbp-72*8]
	call	CLASS_vector_MEMBER_toString
	mov	qword [rbp-73*8], rax
	mov	rdi, qword [rbp-73*8]
	call	FUNCTION_println
	mov	qword [rbp-74*8], rax
LABEL62:
	mov	rax, qword [rbp-75*8]
	leave
	ret
LABEL63:
	SECTION .data
	SECTION .bss
	SECTION .rodata
	L_022:	db 25H, 73H, 00H
