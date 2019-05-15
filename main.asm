	default rel
	global main
	global CLASS_vector_MEMBER_init
	global CLASS_vector_MEMBER_getDim
	global CLASS_vector_MEMBER_dot
	global CLASS_vector_MEMBER_scalarInPlaceMultiply
	global CLASS_vector_MEMBER_add
	global CLASS_vector_MEMBER_set
	global CLASS_vector_MEMBER_tostring
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
	        sub     rsp, 144
	        mov     qword [rbp-88H], rdi
	        mov     rax, qword [fs:abs 28H]
	        mov     qword [rbp-8H], rax
	        xor     eax, eax
	        mov     dword [rbp-74H], 0
	        mov     dword [rbp-70H], 0
	        cmp     qword [rbp-88H], 0
	        jns     L_001
	        mov     dword [rbp-74H], 1
	        neg     qword [rbp-88H]
	L_001:  cmp     qword [rbp-88H], 0
	        jne     L_003
	        add     dword [rbp-70H], 1
	        mov     eax, dword [rbp-70H]
	        cdqe
	        mov     dword [rbp+rax*4-60H], 0
	        jmp     L_004
	L_002:  mov     rcx, qword [rbp-88H]
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
	        add     dword [rbp-70H], 1
	        mov     eax, dword [rbp-70H]
	        cdqe
	        mov     dword [rbp+rax*4-60H], edx
	        mov     rcx, qword [rbp-88H]
	        mov     rdx, qword 6666666666666667H
	        mov     rax, rcx
	        imul    rdx
	        sar     rdx, 2
	        mov     rax, rcx
	        sar     rax, 63
	        sub     rdx, rax
	        mov     rax, rdx
	        mov     qword [rbp-88H], rax
	L_003:  cmp     qword [rbp-88H], 0
	        jnz     L_002
	L_004:  mov     edx, dword [rbp-70H]
	        mov     eax, dword [rbp-74H]
	        add     eax, edx
	        lea     edx, [rax+7H]
	        test    eax, eax
	        cmovs   eax, edx
	        sar     eax, 3
	        add     eax, 1
	        shl     eax, 3
	        cdqe
	        mov     rdi, rax
	        call    malloc
	        mov     qword [rbp-68H], rax
	        cmp     dword [rbp-74H], 0
	        jz      L_005
	        mov     rax, qword [rbp-68H]
	        mov     byte [rax], 45
	L_005:  mov     dword [rbp-6CH], 0
	        jmp     L_007
	L_006:  mov     eax, dword [rbp-70H]
	        sub     eax, dword [rbp-6CH]
	        cdqe
	        mov     eax, dword [rbp+rax*4-60H]
	        lea     ecx, [rax+30H]
	        mov     edx, dword [rbp-6CH]
	        mov     eax, dword [rbp-74H]
	        add     eax, edx
	        movsxd  rdx, eax
	        mov     rax, qword [rbp-68H]
	        add     rax, rdx
	        mov     edx, ecx
	        mov     byte [rax], dl
	        add     dword [rbp-6CH], 1
	L_007:  mov     eax, dword [rbp-6CH]
	        cmp     eax, dword [rbp-70H]
	        jl      L_006
	        mov     edx, dword [rbp-70H]
	        mov     eax, dword [rbp-74H]
	        add     eax, edx
	        movsxd  rdx, eax
	        mov     rax, qword [rbp-68H]
	        add     rax, rdx
	        mov     byte [rax], 0
	        mov     rax, qword [rbp-68H]
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
	        lea     edx, [rax+7H]
	        test    eax, eax
	        cmovs   eax, edx
	        sar     eax, 3
	        add     eax, 1
	        shl     eax, 3
	        cdqe
	        mov     rdi, rax
	        call    malloc
	        mov     qword [rbp-8H], rax
	        mov     eax, dword [rbp-1CH]
	        cdqe
	        add     qword [rbp-18H], rax
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
	        mov     rdi, rax
	        call    strlen
	        mov     dword [rbp-10H], eax
	        mov     rax, qword [rbp-30H]
	        mov     rdi, rax
	        call    strlen
	        mov     dword [rbp-0CH], eax
	        mov     edx, dword [rbp-10H]
	        mov     eax, dword [rbp-0CH]
	        add     eax, edx
	        lea     edx, [rax+7H]
	        test    eax, eax
	        cmovs   eax, edx
	        sar     eax, 3
	        add     eax, 1
	        shl     eax, 3
	        cdqe
	        mov     rdi, rax
	        call    malloc
	        mov     qword [rbp-8H], rax
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
	sub	rsp, 648
	; IR
	call	FUNCTION_main
	add	rsp, 0
	mov	r10, rax
	; IR
	mov	rax, r10
	leave
	ret
	; IR
CLASS_vector_MEMBER_init:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 648
	mov	qword [rbp-1*8], rdi
	mov	qword [rbp-2*8], rsi
	; IR
	mov	rcx, 0
	mov	r8, rcx
	; IR
	mov	rcx, 0
	; IR
	mov	rcx, 0
	; IR
	mov	rcx, 0
	mov	r10, rcx
	; IR
	mov	rcx, r10
	cmp	qword [rbp-2*8], rcx
	sete al
	movzx	eax, al
	mov	r10, rax
	; IR
	cmp	r10, 0
	jz	label1
	; IR
label0:
	; IR
	jmp	label7
	; IR
	jmp	label2
	; IR
label1:
	; IR
label2:
	; IR
	mov	rcx, qword [rbp-1*8]
	mov	rbx, rcx
	; IR
	mov	rcx, 8
	add	rbx, rcx
	; IR
	push	rbx
	push	r8
	mov	rdi, qword [rbp-2*8]
	call	FUNCTION_size
	add	rsp, 0
	pop	r8
	pop	rbx
	mov	r14, rax
	; IR
	mov	r10, r14
	; IR
	mov	rcx, 1
	add	r10, rcx
	; IR
	mov	rcx, 3
	shl	r10 ,cl
	; IR
	push	rbx
	push	r10
	push	r8
	push	r14
	mov	rdi, r10
	call	malloc
	pop	r14
	pop	r8
	pop	r10
	pop	rbx
	mov	r10, rax
	; IR
	mov	rdx, r10
	mov	qword [rdx], r14
	; IR
	mov	rcx, 8
	add	r10, rcx
	; IR
	mov	rdx, rbx
	mov	qword [rdx], r10
	; IR
	; 6
	; IR
	mov	rcx, 0
	mov	r14, rcx
	; IR
label3:
	; IR
	push	r14
	push	r8
	mov	rdi, qword [rbp-2*8]
	call	FUNCTION_size
	add	rsp, 0
	pop	r8
	pop	r14
	mov	r10, rax
	; IR
	mov	rcx, r10
	cmp	r14, rcx
	setl al
	movzx	eax, al
	mov	r10, rax
	; IR
	cmp	r10, 0
	jz	label6
	; IR
label4:
	; IR
	mov	rcx, qword [rbp-1*8]
	mov	r10, rcx
	; IR
	mov	rcx, 8
	add	r10, rcx
	; IR
	mov	rdx, qword [r10]
	mov	r10, rdx
	; IR
	mov	rbx, r14
	; IR
	mov	rcx, 3
	shl	rbx ,cl
	; IR
	add	rbx, r10
	; IR
	mov	r10, r14
	; IR
	mov	rcx, 3
	shl	r10 ,cl
	; IR
	mov	rcx, qword [rbp-2*8]
	add	r10, rcx
	; IR
	mov	rdx, qword [r10]
	mov	r10, rdx
	; IR
	mov	rdx, rbx
	mov	qword [rdx], r10
	; IR
	; 10
	; IR
label5:
	; IR
	mov	rcx, 1
	add	r14, rcx
	; IR
	jmp	label3
	; IR
label6:
	; IR
label7:
	; IR
	mov	rax, r8
	leave
	ret
	; IR
CLASS_vector_MEMBER_getDim:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 648
	mov	qword [rbp-1*8], rdi
	; IR
	mov	rcx, 0
	; IR
	mov	rcx, qword [rbp-1*8]
	mov	r10, rcx
	; IR
	mov	rcx, 8
	add	r10, rcx
	; IR
	mov	rdx, qword [r10]
	mov	r10, rdx
	; IR
	mov	rcx, 0
	mov	rbx, rcx
	; IR
	mov	rcx, rbx
	cmp	r10, rcx
	sete al
	movzx	eax, al
	mov	r10, rax
	; IR
	cmp	r10, 0
	jz	label9
	; IR
label8:
	; IR
	mov	rcx, 0
	mov	r10, rcx
	; IR
	jmp	label11
	; IR
	jmp	label10
	; IR
label9:
	; IR
label10:
	; IR
	mov	rcx, qword [rbp-1*8]
	mov	r10, rcx
	; IR
	mov	rcx, 8
	add	r10, rcx
	; IR
	mov	rdx, qword [r10]
	mov	r10, rdx
	; IR
	push	r10
	sub	rsp, 8
	mov	rdi, r10
	call	FUNCTION_size
	add	rsp, 0
	add	rsp, 8
	pop	r10
	mov	r10, rax
	; IR
	; IR
	jmp	label11
	; IR
label11:
	; IR
	mov	rax, r10
	leave
	ret
	; IR
CLASS_vector_MEMBER_dot:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 648
	mov	qword [rbp-1*8], rdi
	mov	qword [rbp-2*8], rsi
	; IR
	mov	rcx, 0
	; IR
	mov	rcx, 0
	; IR
	mov	rcx, 0
	mov	r8, rcx
	; IR
	; 20
	; IR
	mov	rcx, 0
	mov	rbx, rcx
	; IR
	; 21
	; IR
label12:
	; IR
	push	rbx
	sub	rsp, 8
	mov	rdi, qword [rbp-1*8]
	call	CLASS_vector_MEMBER_getDim
	add	rsp, 0
	add	rsp, 8
	pop	rbx
	mov	r10, rax
	; IR
	mov	rcx, r10
	cmp	r8, rcx
	setl al
	movzx	eax, al
	mov	r10, rax
	; IR
	cmp	r10, 0
	jz	label15
	; IR
label13:
	; IR
	mov	rcx, qword [rbp-1*8]
	mov	r10, rcx
	; IR
	mov	rcx, 8
	add	r10, rcx
	; IR
	mov	rdx, qword [r10]
	mov	r10, rdx
	; IR
	mov	rbx, r8
	; IR
	mov	rcx, 3
	shl	rbx ,cl
	; IR
	add	rbx, r10
	; IR
	mov	rdx, qword [rbx]
	mov	r10, rdx
	; IR
	mov	r14, r10
	; IR
	mov	rcx, qword [rbp-2*8]
	mov	r10, rcx
	; IR
	mov	rcx, 8
	add	r10, rcx
	; IR
	mov	rdx, qword [r10]
	mov	r10, rdx
	; IR
	mov	rbx, r8
	; IR
	mov	rcx, 3
	shl	rbx ,cl
	; IR
	add	rbx, r10
	; IR
	mov	rdx, qword [rbx]
	mov	r10, rdx
	; IR
	mov	rdx, r14
	imul	rdx, r10
	mov	r14, rdx
	; IR
	mov	rbx, r14
	; IR
	; 24
	; IR
	mov	rcx, 1
	add	r8, rcx
	; IR
	; 25
	; IR
label14:
	; IR
	jmp	label12
	; IR
label15:
	; IR
	mov	r10, rbx
	; IR
	jmp	label16
	; IR
label16:
	; IR
	mov	rax, r10
	leave
	ret
	; IR
CLASS_vector_MEMBER_scalarInPlaceMultiply:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 648
	mov	qword [rbp-1*8], rdi
	mov	qword [rbp-2*8], rsi
	; IR
	mov	rcx, 0
	; IR
	mov	rcx, 0
	; IR
	mov	rcx, qword [rbp-1*8]
	mov	r10, rcx
	; IR
	mov	rcx, 8
	add	r10, rcx
	; IR
	mov	rdx, qword [r10]
	mov	r10, rdx
	; IR
	mov	rcx, 0
	mov	rbx, rcx
	; IR
	mov	rcx, rbx
	cmp	r10, rcx
	sete al
	movzx	eax, al
	mov	r10, rax
	; IR
	cmp	r10, 0
	jz	label18
	; IR
label17:
	; IR
	mov	rcx, 0
	mov	r10, rcx
	; IR
	jmp	label24
	; IR
	jmp	label19
	; IR
label18:
	; IR
label19:
	; IR
	mov	rcx, 0
	mov	r12, rcx
	; IR
label20:
	; IR
	mov	rdi, qword [rbp-1*8]
	call	CLASS_vector_MEMBER_getDim
	add	rsp, 0
	mov	r10, rax
	; IR
	mov	rcx, r10
	cmp	r12, rcx
	setl al
	movzx	eax, al
	mov	r10, rax
	; IR
	cmp	r10, 0
	jz	label23
	; IR
label21:
	; IR
	mov	rcx, qword [rbp-1*8]
	mov	r10, rcx
	; IR
	mov	rcx, 8
	add	r10, rcx
	; IR
	mov	rdx, qword [r10]
	mov	r10, rdx
	; IR
	mov	r8, r12
	; IR
	mov	rcx, 3
	shl	r8 ,cl
	; IR
	add	r8, r10
	; IR
	mov	rcx, qword [rbp-2*8]
	mov	r14, rcx
	; IR
	mov	rcx, qword [rbp-1*8]
	mov	r10, rcx
	; IR
	mov	rcx, 8
	add	r10, rcx
	; IR
	mov	rdx, qword [r10]
	mov	r10, rdx
	; IR
	mov	rbx, r12
	; IR
	mov	rcx, 3
	shl	rbx ,cl
	; IR
	add	rbx, r10
	; IR
	mov	rdx, qword [rbx]
	mov	r10, rdx
	; IR
	mov	rdx, r14
	imul	rdx, r10
	mov	r14, rdx
	; IR
	mov	rdx, r8
	mov	qword [rdx], r14
	; IR
	; 34
	; IR
label22:
	; IR
	mov	rcx, 1
	add	r12, rcx
	; IR
	jmp	label20
	; IR
label23:
	; IR
	mov	rcx, qword [rbp-1*8]
	mov	r10, rcx
	; IR
	jmp	label24
	; IR
label24:
	; IR
	mov	rax, r10
	leave
	ret
	; IR
CLASS_vector_MEMBER_add:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 648
	mov	qword [rbp-1*8], rdi
	mov	qword [rbp-2*8], rsi
	; IR
	mov	rcx, 0
	; IR
	mov	rcx, 0
	; IR
	mov	rdi, qword [rbp-1*8]
	call	CLASS_vector_MEMBER_getDim
	add	rsp, 0
	mov	r10, rax
	; IR
	push	r10
	sub	rsp, 8
	mov	rdi, qword [rbp-2*8]
	call	CLASS_vector_MEMBER_getDim
	add	rsp, 0
	add	rsp, 8
	pop	r10
	mov	rbx, rax
	; IR
	mov	rcx, rbx
	cmp	r10, rcx
	setne al
	movzx	eax, al
	mov	r10, rax
	; IR
	mov	rcx, 1
	xor	r10, rcx
	; IR
	cmp	r10, 0
	jz	label26
	; IR
label25:
	; IR
	mov	rdi, qword [rbp-1*8]
	call	CLASS_vector_MEMBER_getDim
	add	rsp, 0
	mov	r10, rax
	; IR
	mov	rcx, 0
	mov	rbx, rcx
	; IR
	mov	rcx, rbx
	cmp	r10, rcx
	sete al
	movzx	eax, al
	mov	r10, rax
	; IR
	; IR
	jmp	label27
	; IR
label26:
	; IR
	mov	rcx, 1
	mov	r10, rcx
	; IR
label27:
	; IR
	cmp	r10, 0
	jz	label29
	; IR
label28:
	; IR
	mov	rcx, 0
	mov	r10, rcx
	; IR
	jmp	label35
	; IR
	jmp	label30
	; IR
label29:
	; IR
label30:
	; IR
	mov	rcx, 16
	mov	rdi, rcx
	call	malloc
	mov	r10, rax
	; IR
	mov	r11, r10
	; IR
	; 42
	; IR
	mov	rbx, r11
	; IR
	mov	rcx, 8
	add	rbx, rcx
	; IR
	push	rbx
	sub	rsp, 8
	mov	rdi, qword [rbp-1*8]
	call	CLASS_vector_MEMBER_getDim
	add	rsp, 0
	add	rsp, 8
	pop	rbx
	mov	r14, rax
	; IR
	mov	r10, r14
	; IR
	mov	rcx, 1
	add	r10, rcx
	; IR
	mov	rcx, 3
	shl	r10 ,cl
	; IR
	push	rbx
	push	r10
	push	r14
	push	r11
	mov	rdi, r10
	call	malloc
	pop	r11
	pop	r14
	pop	r10
	pop	rbx
	mov	r10, rax
	; IR
	mov	rdx, r10
	mov	qword [rdx], r14
	; IR
	mov	rcx, 8
	add	r10, rcx
	; IR
	mov	rdx, rbx
	mov	qword [rdx], r10
	; IR
	; 44
	; IR
	mov	rcx, 0
	mov	r12, rcx
	; IR
label31:
	; IR
	mov	rdi, qword [rbp-1*8]
	call	CLASS_vector_MEMBER_getDim
	add	rsp, 0
	mov	r10, rax
	; IR
	mov	rcx, r10
	cmp	r12, rcx
	setl al
	movzx	eax, al
	mov	r10, rax
	; IR
	cmp	r10, 0
	jz	label34
	; IR
label32:
	; IR
	mov	r10, r11
	; IR
	mov	rcx, 8
	add	r10, rcx
	; IR
	mov	rdx, qword [r10]
	mov	r10, rdx
	; IR
	mov	r8, r12
	; IR
	mov	rcx, 3
	shl	r8 ,cl
	; IR
	add	r8, r10
	; IR
	mov	rcx, qword [rbp-1*8]
	mov	r10, rcx
	; IR
	mov	rcx, 8
	add	r10, rcx
	; IR
	mov	rdx, qword [r10]
	mov	r10, rdx
	; IR
	mov	rbx, r12
	; IR
	mov	rcx, 3
	shl	rbx ,cl
	; IR
	add	rbx, r10
	; IR
	mov	rdx, qword [rbx]
	mov	r10, rdx
	; IR
	mov	r14, r10
	; IR
	mov	rcx, qword [rbp-2*8]
	mov	r10, rcx
	; IR
	mov	rcx, 8
	add	r10, rcx
	; IR
	mov	rdx, qword [r10]
	mov	r10, rdx
	; IR
	mov	rbx, r12
	; IR
	mov	rcx, 3
	shl	rbx ,cl
	; IR
	add	rbx, r10
	; IR
	mov	rdx, qword [rbx]
	mov	r10, rdx
	; IR
	add	r14, r10
	; IR
	mov	rdx, r8
	mov	qword [rdx], r14
	; IR
	; 46
	; IR
label33:
	; IR
	mov	rcx, 1
	add	r12, rcx
	; IR
	jmp	label31
	; IR
label34:
	; IR
	mov	r10, r11
	; IR
	jmp	label35
	; IR
label35:
	; IR
	mov	rax, r10
	leave
	ret
	; IR
CLASS_vector_MEMBER_set:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 648
	mov	qword [rbp-1*8], rdi
	mov	qword [rbp-2*8], rsi
	mov	qword [rbp-3*8], rdx
	; IR
	mov	rcx, 0
	; IR
	mov	rcx, 0
	; IR
	mov	rcx, 0
	; IR
	mov	rdi, qword [rbp-1*8]
	call	CLASS_vector_MEMBER_getDim
	add	rsp, 0
	mov	r10, rax
	; IR
	mov	rcx, qword [rbp-2*8]
	cmp	r10, rcx
	setl al
	movzx	eax, al
	mov	r10, rax
	; IR
	cmp	r10, 0
	jz	label37
	; IR
label36:
	; IR
	mov	rcx, 0
	mov	r10, rcx
	; IR
	jmp	label39
	; IR
	jmp	label38
	; IR
label37:
	; IR
label38:
	; IR
	mov	rcx, qword [rbp-1*8]
	mov	r10, rcx
	; IR
	mov	rcx, 8
	add	r10, rcx
	; IR
	mov	rdx, qword [r10]
	mov	r10, rdx
	; IR
	mov	rcx, qword [rbp-2*8]
	mov	rbx, rcx
	; IR
	mov	rcx, 3
	shl	rbx ,cl
	; IR
	add	rbx, r10
	; IR
	mov	rcx, qword [rbp-3*8]
	mov	rdx, rbx
	mov	qword [rdx], rcx
	; IR
	; 53
	; IR
	mov	rcx, 1
	mov	r10, rcx
	; IR
	jmp	label39
	; IR
label39:
	; IR
	mov	rax, r10
	leave
	ret
	; IR
CLASS_vector_MEMBER_tostring:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 648
	mov	qword [rbp-1*8], rdi
	; IR
	mov	rcx, 0
	; IR
	mov	rcx, 11
	mov	rdi, rcx
	call	malloc
	mov	r10, rax
	; IR
	mov	rcx, 2
	mov	rdx, r10
	mov	qword [rdx], rcx
	; IR
	mov	rcx, 8
	add	r10, rcx
	; IR
	mov	rbx, r10
	; IR
	mov	rcx, 0
	; IR
	mov	rcx, 8232
	mov	rdx, rbx
	mov	qword [rdx], rcx
	; IR
	mov	r14, r10
	; IR
	; 58
	; IR
	mov	rdi, qword [rbp-1*8]
	call	CLASS_vector_MEMBER_getDim
	add	rsp, 0
	mov	r10, rax
	; IR
	mov	rcx, 0
	mov	rbx, rcx
	; IR
	mov	rcx, rbx
	cmp	r10, rcx
	setg al
	movzx	eax, al
	mov	r10, rax
	; IR
	cmp	r10, 0
	jz	label41
	; IR
label40:
	; IR
	mov	rcx, qword [rbp-1*8]
	mov	r10, rcx
	; IR
	mov	rcx, 8
	add	r10, rcx
	; IR
	mov	rdx, qword [r10]
	mov	r10, rdx
	; IR
	mov	rcx, 0
	mov	rbx, rcx
	; IR
	add	rbx, r10
	; IR
	mov	rdx, qword [rbx]
	mov	r10, rdx
	; IR
	push	r14
	push	r10
	mov	rdi, r10
	call	FUNCTION_toString
	add	rsp, 0
	pop	r10
	pop	r14
	mov	r10, rax
	; IR
	push	r14
	push	r10
	mov	rsi, r10
	mov	rdi, r14
	call	FUNCTION_string_concat
	add	rsp, 0
	pop	r10
	pop	r14
	mov	r10, rax
	; IR
	mov	r14, r10
	; IR
	; 60
	; IR
	jmp	label42
	; IR
label41:
	; IR
label42:
	; IR
	mov	rcx, 1
	mov	r8, rcx
	; IR
label43:
	; IR
	mov	rdi, qword [rbp-1*8]
	call	CLASS_vector_MEMBER_getDim
	add	rsp, 0
	mov	r10, rax
	; IR
	mov	rcx, r10
	cmp	r8, rcx
	setl al
	movzx	eax, al
	mov	r10, rax
	; IR
	cmp	r10, 0
	jz	label46
	; IR
label44:
	; IR
	mov	rcx, 11
	push	r14
	push	r8
	mov	rdi, rcx
	call	malloc
	pop	r8
	pop	r14
	mov	r10, rax
	; IR
	mov	rcx, 2
	mov	rdx, r10
	mov	qword [rdx], rcx
	; IR
	mov	rcx, 8
	add	r10, rcx
	; IR
	mov	rbx, r10
	; IR
	mov	rcx, 0
	; IR
	mov	rcx, 8236
	mov	rdx, rbx
	mov	qword [rdx], rcx
	; IR
	push	r14
	push	r10
	push	r8
	sub	rsp, 8
	mov	rsi, r10
	mov	rdi, r14
	call	FUNCTION_string_concat
	add	rsp, 0
	add	rsp, 8
	pop	r8
	pop	r10
	pop	r14
	mov	r14, rax
	; IR
	mov	rcx, qword [rbp-1*8]
	mov	r10, rcx
	; IR
	mov	rcx, 8
	add	r10, rcx
	; IR
	mov	rdx, qword [r10]
	mov	r10, rdx
	; IR
	mov	rbx, r8
	; IR
	mov	rcx, 3
	shl	rbx ,cl
	; IR
	add	rbx, r10
	; IR
	mov	rdx, qword [rbx]
	mov	r10, rdx
	; IR
	push	r14
	push	r8
	push	r10
	sub	rsp, 8
	mov	rdi, r10
	call	FUNCTION_toString
	add	rsp, 0
	add	rsp, 8
	pop	r10
	pop	r8
	pop	r14
	mov	r10, rax
	; IR
	push	r10
	push	r14
	push	r8
	sub	rsp, 8
	mov	rsi, r10
	mov	rdi, r14
	call	FUNCTION_string_concat
	add	rsp, 0
	add	rsp, 8
	pop	r8
	pop	r14
	pop	r10
	mov	r10, rax
	; IR
	mov	r14, r10
	; IR
	; 64
	; IR
label45:
	; IR
	mov	rcx, 1
	add	r8, rcx
	; IR
	jmp	label43
	; IR
label46:
	; IR
	mov	rcx, 11
	push	r14
	sub	rsp, 8
	mov	rdi, rcx
	call	malloc
	add	rsp, 8
	pop	r14
	mov	r10, rax
	; IR
	mov	rcx, 2
	mov	rdx, r10
	mov	qword [rdx], rcx
	; IR
	mov	rcx, 8
	add	r10, rcx
	; IR
	mov	rbx, r10
	; IR
	mov	rcx, 0
	; IR
	mov	rcx, 10528
	mov	rdx, rbx
	mov	qword [rdx], rcx
	; IR
	push	r14
	push	r10
	mov	rsi, r10
	mov	rdi, r14
	call	FUNCTION_string_concat
	add	rsp, 0
	pop	r10
	pop	r14
	mov	r10, rax
	; IR
	mov	r14, r10
	; IR
	; 66
	; IR
	mov	r10, r14
	; IR
	jmp	label47
	; IR
label47:
	; IR
	mov	rax, r10
	leave
	ret
	; IR
CLASS_vector_MEMBER_copy:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 648
	mov	qword [rbp-1*8], rdi
	mov	qword [rbp-2*8], rsi
	; IR
	mov	rcx, 0
	; IR
	mov	rcx, 0
	; IR
	mov	rcx, 0
	mov	r10, rcx
	; IR
	mov	rcx, r10
	cmp	qword [rbp-2*8], rcx
	sete al
	movzx	eax, al
	mov	r10, rax
	; IR
	cmp	r10, 0
	jz	label49
	; IR
label48:
	; IR
	mov	rcx, 0
	mov	r10, rcx
	; IR
	jmp	label58
	; IR
	jmp	label50
	; IR
label49:
	; IR
label50:
	; IR
	mov	rdi, qword [rbp-2*8]
	call	CLASS_vector_MEMBER_getDim
	add	rsp, 0
	mov	r10, rax
	; IR
	mov	rcx, 0
	mov	rbx, rcx
	; IR
	mov	rcx, rbx
	cmp	r10, rcx
	sete al
	movzx	eax, al
	mov	r10, rax
	; IR
	cmp	r10, 0
	jz	label52
	; IR
label51:
	; IR
	mov	rcx, qword [rbp-1*8]
	mov	r10, rcx
	; IR
	mov	rcx, 8
	add	r10, rcx
	; IR
	mov	rcx, 0
	mov	rdx, r10
	mov	qword [rdx], rcx
	; IR
	; 73
	; IR
	jmp	label57
	; IR
label52:
	; IR
	mov	rcx, qword [rbp-1*8]
	mov	rbx, rcx
	; IR
	mov	rcx, 8
	add	rbx, rcx
	; IR
	push	rbx
	sub	rsp, 8
	mov	rdi, qword [rbp-2*8]
	call	CLASS_vector_MEMBER_getDim
	add	rsp, 0
	add	rsp, 8
	pop	rbx
	mov	r14, rax
	; IR
	mov	r10, r14
	; IR
	mov	rcx, 1
	add	r10, rcx
	; IR
	mov	rcx, 3
	shl	r10 ,cl
	; IR
	push	r10
	push	rbx
	push	r14
	sub	rsp, 8
	mov	rdi, r10
	call	malloc
	add	rsp, 8
	pop	r14
	pop	rbx
	pop	r10
	mov	r10, rax
	; IR
	mov	rdx, r10
	mov	qword [rdx], r14
	; IR
	mov	rcx, 8
	add	r10, rcx
	; IR
	mov	rdx, rbx
	mov	qword [rdx], r10
	; IR
	; 75
	; IR
	mov	rcx, 0
	mov	r8, rcx
	; IR
label53:
	; IR
	mov	rdi, qword [rbp-1*8]
	call	CLASS_vector_MEMBER_getDim
	add	rsp, 0
	mov	r10, rax
	; IR
	mov	rcx, r10
	cmp	r8, rcx
	setl al
	movzx	eax, al
	mov	r10, rax
	; IR
	cmp	r10, 0
	jz	label56
	; IR
label54:
	; IR
	mov	rcx, qword [rbp-1*8]
	mov	r10, rcx
	; IR
	mov	rcx, 8
	add	r10, rcx
	; IR
	mov	rdx, qword [r10]
	mov	r10, rdx
	; IR
	mov	r14, r8
	; IR
	mov	rcx, 3
	shl	r14 ,cl
	; IR
	add	r14, r10
	; IR
	mov	rcx, qword [rbp-2*8]
	mov	r10, rcx
	; IR
	mov	rcx, 8
	add	r10, rcx
	; IR
	mov	rdx, qword [r10]
	mov	r10, rdx
	; IR
	mov	rbx, r8
	; IR
	mov	rcx, 3
	shl	rbx ,cl
	; IR
	add	rbx, r10
	; IR
	mov	rdx, qword [rbx]
	mov	r10, rdx
	; IR
	mov	rdx, r14
	mov	qword [rdx], r10
	; IR
	; 78
	; IR
label55:
	; IR
	mov	rcx, 1
	add	r8, rcx
	; IR
	jmp	label53
	; IR
label56:
	; IR
label57:
	; IR
	mov	rcx, 1
	mov	r10, rcx
	; IR
	jmp	label58
	; IR
label58:
	; IR
	mov	rax, r10
	leave
	ret
	; IR
FUNCTION_main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 1608
	; IR
	mov	rcx, 16
	mov	rdi, rcx
	call	malloc
	mov	r10, rax
	; IR
	mov	r12, r10
	; IR
	; 86
	; IR
	mov	rcx, 88
	push	r12
	sub	rsp, 8
	mov	rdi, rcx
	call	malloc
	add	rsp, 8
	pop	r12
	mov	r10, rax
	; IR
	mov	rcx, 10
	mov	rdx, r10
	mov	qword [rdx], rcx
	; IR
	mov	rcx, 8
	add	r10, rcx
	; IR
	mov	r14, r10
	; IR
	; 87
	; IR
	mov	rcx, 0
	mov	r8, rcx
	; IR
label59:
	; IR
	mov	rcx, 10
	mov	r10, rcx
	; IR
	mov	rcx, r10
	cmp	r8, rcx
	setl al
	movzx	eax, al
	mov	r10, rax
	; IR
	cmp	r10, 0
	jz	label62
	; IR
label60:
	; IR
	mov	r10, r8
	; IR
	mov	rcx, 3
	shl	r10 ,cl
	; IR
	add	r10, r14
	; IR
	mov	rcx, 9
	mov	rbx, rcx
	; IR
	sub	rbx, r8
	; IR
	mov	rdx, r10
	mov	qword [rdx], rbx
	; IR
	; 90
	; IR
label61:
	; IR
	mov	rcx, 1
	add	r8, rcx
	; IR
	jmp	label59
	; IR
label62:
	; IR
	push	r14
	sub	rsp, 8
	mov	rsi, r14
	mov	rdi, r12
	call	CLASS_vector_MEMBER_init
	add	rsp, 0
	add	rsp, 8
	pop	r14
	mov	qword [rbp-8*8], rax
	; IR
	; 92
	; IR
	mov	rcx, 19
	push	r12
	sub	rsp, 8
	mov	rdi, rcx
	call	malloc
	add	rsp, 8
	pop	r12
	mov	rbx, rax
	; IR
	mov	rcx, 10
	mov	rdx, rbx
	mov	qword [rdx], rcx
	; IR
	mov	rcx, 8
	add	rbx, rcx
	; IR
	mov	r10, rbx
	; IR
	mov	rcx, 0
	; IR
	mov	rcx, 8656044306825700726
	mov	rdx, r10
	mov	qword [rdx], rcx
	; IR
	mov	r10, rbx
	; IR
	mov	rcx, 8
	add	r10, rcx
	; IR
	mov	rcx, 8250
	mov	rdx, r10
	mov	qword [rdx], rcx
	; IR
	push	rbx
	push	r12
	mov	rdi, rbx
	call	FUNCTION_print
	add	rsp, 0
	pop	r12
	pop	rbx
	mov	qword [rbp-9*8], rax
	; IR
	; 93
	; IR
	mov	rdi, r12
	call	CLASS_vector_MEMBER_tostring
	add	rsp, 0
	mov	r10, rax
	; IR
	push	r12
	push	r10
	mov	rdi, r10
	call	FUNCTION_println
	add	rsp, 0
	pop	r10
	pop	r12
	mov	qword [rbp-10*8], rax
	; IR
	; 94
	; IR
	mov	rcx, 16
	push	r12
	sub	rsp, 8
	mov	rdi, rcx
	call	malloc
	add	rsp, 8
	pop	r12
	mov	r10, rax
	; IR
	mov	r14, r10
	; IR
	; 96
	; IR
	push	r14
	sub	rsp, 8
	mov	rsi, r12
	mov	rdi, r14
	call	CLASS_vector_MEMBER_copy
	add	rsp, 0
	add	rsp, 8
	pop	r14
	mov	qword [rbp-11*8], rax
	; IR
	; 97
	; IR
	mov	rcx, 3
	mov	r10, rcx
	; IR
	mov	rcx, 817
	mov	rbx, rcx
	; IR
	push	rbx
	push	r10
	mov	rdx, rbx
	mov	rsi, r10
	mov	rdi, r14
	call	CLASS_vector_MEMBER_set
	add	rsp, 0
	pop	r10
	pop	rbx
	mov	r10, rax
	; IR
	cmp	r10, 0
	jz	label64
	; IR
label63:
	; IR
	mov	rcx, 17
	push	r12
	push	r14
	mov	rdi, rcx
	call	malloc
	pop	r14
	pop	r12
	mov	rbx, rax
	; IR
	mov	rcx, 8
	mov	rdx, rbx
	mov	qword [rdx], rcx
	; IR
	mov	rcx, 8
	add	rbx, rcx
	; IR
	mov	r10, rbx
	; IR
	mov	rcx, 0
	; IR
	mov	rcx, 2406159651581425765
	mov	rdx, r10
	mov	qword [rdx], rcx
	; IR
	mov	r10, rbx
	; IR
	mov	rcx, 8
	add	r10, rcx
	; IR
	mov	rcx, 0
	mov	rdx, r10
	mov	qword [rdx], rcx
	; IR
	push	r12
	push	rbx
	push	r14
	sub	rsp, 8
	mov	rdi, rbx
	call	FUNCTION_println
	add	rsp, 0
	add	rsp, 8
	pop	r14
	pop	rbx
	pop	r12
	mov	qword [rbp-12*8], rax
	; IR
	; 99
	; IR
	jmp	label65
	; IR
label64:
	; IR
label65:
	; IR
	mov	rcx, 19
	push	r12
	push	r14
	mov	rdi, rcx
	call	malloc
	pop	r14
	pop	r12
	mov	rbx, rax
	; IR
	mov	rcx, 10
	mov	rdx, rbx
	mov	qword [rdx], rcx
	; IR
	mov	rcx, 8
	add	rbx, rcx
	; IR
	mov	r10, rbx
	; IR
	mov	rcx, 0
	; IR
	mov	rcx, 8728101900863628662
	mov	rdx, r10
	mov	qword [rdx], rcx
	; IR
	mov	r10, rbx
	; IR
	mov	rcx, 8
	add	r10, rcx
	; IR
	mov	rcx, 8250
	mov	rdx, r10
	mov	qword [rdx], rcx
	; IR
	push	rbx
	push	r12
	push	r14
	sub	rsp, 8
	mov	rdi, rbx
	call	FUNCTION_print
	add	rsp, 0
	add	rsp, 8
	pop	r14
	pop	r12
	pop	rbx
	mov	qword [rbp-13*8], rax
	; IR
	; 101
	; IR
	push	r14
	sub	rsp, 8
	mov	rdi, r14
	call	CLASS_vector_MEMBER_tostring
	add	rsp, 0
	add	rsp, 8
	pop	r14
	mov	r10, rax
	; IR
	push	r10
	push	r12
	push	r14
	sub	rsp, 8
	mov	rdi, r10
	call	FUNCTION_println
	add	rsp, 0
	add	rsp, 8
	pop	r14
	pop	r12
	pop	r10
	mov	qword [rbp-14*8], rax
	; IR
	; 102
	; IR
	mov	rcx, 16
	push	r12
	push	r14
	mov	rdi, rcx
	call	malloc
	pop	r14
	pop	r12
	mov	r10, rax
	; IR
	mov	rcx, 7
	mov	rdx, r10
	mov	qword [rdx], rcx
	; IR
	mov	rcx, 8
	add	r10, rcx
	; IR
	mov	rbx, r10
	; IR
	mov	rcx, 0
	; IR
	mov	rcx, 9071491159892088
	mov	rdx, rbx
	mov	qword [rdx], rcx
	; IR
	push	r12
	push	r14
	push	r10
	sub	rsp, 8
	mov	rdi, r10
	call	FUNCTION_print
	add	rsp, 0
	add	rsp, 8
	pop	r10
	pop	r14
	pop	r12
	mov	qword [rbp-15*8], rax
	; IR
	; 103
	; IR
	push	r12
	push	r14
	mov	rsi, r14
	mov	rdi, r12
	call	CLASS_vector_MEMBER_add
	add	rsp, 0
	pop	r14
	pop	r12
	mov	r10, rax
	; IR
	push	r14
	push	r10
	mov	rdi, r10
	call	CLASS_vector_MEMBER_tostring
	add	rsp, 0
	pop	r10
	pop	r14
	mov	r10, rax
	; IR
	push	r12
	push	r14
	push	r10
	sub	rsp, 8
	mov	rdi, r10
	call	FUNCTION_println
	add	rsp, 0
	add	rsp, 8
	pop	r10
	pop	r14
	pop	r12
	mov	qword [rbp-16*8], rax
	; IR
	; 104
	; IR
	mov	rcx, 16
	push	r12
	push	r14
	mov	rdi, rcx
	call	malloc
	pop	r14
	pop	r12
	mov	r10, rax
	; IR
	mov	rcx, 7
	mov	rdx, r10
	mov	qword [rdx], rcx
	; IR
	mov	rcx, 8
	add	r10, rcx
	; IR
	mov	rbx, r10
	; IR
	mov	rcx, 0
	; IR
	mov	rcx, 9071491159826552
	mov	rdx, rbx
	mov	qword [rdx], rcx
	; IR
	push	r10
	push	r12
	push	r14
	sub	rsp, 8
	mov	rdi, r10
	call	FUNCTION_print
	add	rsp, 0
	add	rsp, 8
	pop	r14
	pop	r12
	pop	r10
	mov	qword [rbp-17*8], rax
	; IR
	; 105
	; IR
	push	r14
	sub	rsp, 8
	mov	rsi, r14
	mov	rdi, r12
	call	CLASS_vector_MEMBER_dot
	add	rsp, 0
	add	rsp, 8
	pop	r14
	mov	r10, rax
	; IR
	push	r14
	push	r10
	mov	rdi, r10
	call	FUNCTION_toString
	add	rsp, 0
	pop	r10
	pop	r14
	mov	r10, rax
	; IR
	push	r14
	push	r10
	mov	rdi, r10
	call	FUNCTION_println
	add	rsp, 0
	pop	r10
	pop	r14
	mov	qword [rbp-18*8], rax
	; IR
	; 106
	; IR
	mov	rcx, 23
	push	r14
	sub	rsp, 8
	mov	rdi, rcx
	call	malloc
	add	rsp, 8
	pop	r14
	mov	rbx, rax
	; IR
	mov	rcx, 14
	mov	rdx, rbx
	mov	qword [rdx], rcx
	; IR
	mov	rcx, 8
	add	rbx, rcx
	; IR
	mov	r10, rbx
	; IR
	mov	rcx, 0
	; IR
	mov	rcx, 2968752022446158120
	mov	rdx, r10
	mov	qword [rdx], rcx
	; IR
	mov	r10, rbx
	; IR
	mov	rcx, 8
	add	r10, rcx
	; IR
	mov	rcx, 35435512343072
	mov	rdx, r10
	mov	qword [rdx], rcx
	; IR
	push	rbx
	push	r14
	mov	rdi, rbx
	call	FUNCTION_print
	add	rsp, 0
	pop	r14
	pop	rbx
	mov	qword [rbp-19*8], rax
	; IR
	; 107
	; IR
	mov	rcx, 8
	mov	r10, rcx
	; IR
	push	r14
	push	r10
	mov	rsi, r10
	mov	rdi, r14
	call	CLASS_vector_MEMBER_scalarInPlaceMultiply
	add	rsp, 0
	pop	r10
	pop	r14
	mov	r10, rax
	; IR
	push	r10
	sub	rsp, 8
	mov	rdi, r10
	call	CLASS_vector_MEMBER_tostring
	add	rsp, 0
	add	rsp, 8
	pop	r10
	mov	r10, rax
	; IR
	push	r10
	sub	rsp, 8
	mov	rdi, r10
	call	FUNCTION_println
	add	rsp, 0
	add	rsp, 8
	pop	r10
	mov	qword [rbp-20*8], rax
	; IR
	; 108
	; IR
	mov	rcx, 0
	mov	r10, rcx
	; IR
	jmp	label66
	; IR
label66:
	; IR
	mov	rax, r10
	leave
	ret
	; IR
label67:
	; IR
	SECTION .data
	SECTION .bss
	SECTION .rodata
	L_022:	db 25H, 73H, 00H
