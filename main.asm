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
	sub	rsp, 328
	; IR
	mov	rcx, 40
	mov	rdi, rcx
	call	malloc
	mov	r14, rax
	; IR
	mov	rcx, 4
	mov	rdx, r14
	mov	qword [rdx], rcx
	; IR
	mov	rcx, 8
	add	r14, rcx
	; IR
	mov	rcx, r14
	mov	qword [rel LABEL0], rcx
	; IR
	; 1
	; IR
	push	r14
	sub	rsp, 8
	call	FUNCTION_main
	add	rsp, 0
	add	rsp, 8
	pop	r14
	mov	r14, rax
	; IR
	mov	rax, r14
	leave
	ret
	; IR
FUNCTION_main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 5928
	; IR
	mov	rcx, 40
	mov	rdi, rcx
	call	malloc
	mov	r14, rax
	; IR
	mov	rcx, 4
	mov	rdx, r14
	mov	qword [rdx], rcx
	; IR
	mov	rcx, 8
	add	r14, rcx
	; IR
	mov	rcx, r14
	mov	r15, rcx
	; IR
	; 4
	; IR
	mov	rcx, 0
	mov	r14, rcx
	; IR
	mov	rcx, r15
	add	r14, rcx
	; IR
	mov	rcx, qword [rel LABEL0]
	mov	rdx, r14
	mov	qword [rdx], rcx
	; IR
	; 6
	; IR
	mov	rcx, 8
	mov	r14, rcx
	; IR
	mov	rcx, r15
	add	r14, rcx
	; IR
	mov	rcx, qword [rel LABEL0]
	mov	rdx, r14
	mov	qword [rdx], rcx
	; IR
	; 7
	; IR
	mov	rcx, 16
	mov	r14, rcx
	; IR
	mov	rcx, r15
	add	r14, rcx
	; IR
	mov	rcx, qword [rel LABEL0]
	mov	rdx, r14
	mov	qword [rdx], rcx
	; IR
	; 8
	; IR
	mov	rcx, 24
	mov	r14, rcx
	; IR
	mov	rcx, r15
	add	r14, rcx
	; IR
	mov	rcx, qword [rel LABEL0]
	mov	rdx, r14
	mov	qword [rdx], rcx
	; IR
	; 9
	; IR
	push	r14
	push	r15
	mov	rdi, r15
	call	FUNCTION_size
	add	rsp, 0
	pop	r15
	pop	r14
	mov	r14, rax
	; IR
	push	r14
	push	r15
	mov	rdi, r14
	call	FUNCTION_toString
	add	rsp, 0
	pop	r15
	pop	r14
	mov	r14, rax
	; IR
	push	r14
	push	r15
	mov	rdi, r14
	call	FUNCTION_println
	add	rsp, 0
	pop	r15
	pop	r14
	mov	qword [rbp-17*8], rax
	; IR
	; 10
	; IR
	mov	rcx, 0
	mov	rbx, rcx
	; IR
LABEL1:
	; IR
	mov	rcx, 0
	mov	r14, rcx
	; IR
	mov	rcx, r15
	add	r14, rcx
	; IR
	mov	rcx, r14
	mov	rdx, qword [rcx]
	mov	r14, rdx
	; IR
	push	r14
	push	rbx
	push	r15
	sub	rsp, 8
	mov	rdi, r14
	call	FUNCTION_size
	add	rsp, 0
	add	rsp, 8
	pop	r15
	pop	rbx
	pop	r14
	mov	r14, rax
	; IR
	mov	rcx, r14
	cmp	rbx, rcx
	setl al
	movzx	eax, al
	mov	r14, rax
	; IR
	cmp	r14, 0
	jz	LABEL4
	; IR
LABEL2:
	; IR
	mov	rcx, 0
	mov	r14, rcx
	; IR
	mov	rcx, r15
	add	r14, rcx
	; IR
	mov	rcx, r14
	mov	rdx, qword [rcx]
	mov	r14, rdx
	; IR
	mov	rcx, rbx
	mov	r13, rcx
	; IR
	mov	rcx, 3
	mov	rcx, rcx
	shl	r13 ,cl
	; IR
	mov	rcx, r14
	add	r13, rcx
	; IR
	push	r14
	push	r13
	push	rbx
	push	r15
	call	FUNCTION_getInt
	add	rsp, 0
	pop	r15
	pop	rbx
	pop	r13
	pop	r14
	mov	r14, rax
	; IR
	mov	rcx, r14
	mov	rdx, r13
	mov	qword [rdx], rcx
	; IR
	; 12
	; IR
LABEL3:
	; IR
	mov	rcx, 1
	add	rbx, rcx
	; IR
	jmp	LABEL1
	; IR
LABEL4:
	; IR
	mov	rcx, 0
	mov	rbx, rcx
	; IR
LABEL5:
	; IR
	mov	rcx, 8
	mov	r14, rcx
	; IR
	mov	rcx, r15
	add	r14, rcx
	; IR
	mov	rcx, r14
	mov	rdx, qword [rcx]
	mov	r14, rdx
	; IR
	push	r14
	push	r13
	push	rbx
	push	r15
	mov	rdi, r14
	call	FUNCTION_size
	add	rsp, 0
	pop	r15
	pop	rbx
	pop	r13
	pop	r14
	mov	r14, rax
	; IR
	mov	rcx, r14
	cmp	rbx, rcx
	setl al
	movzx	eax, al
	mov	r14, rax
	; IR
	cmp	r14, 0
	jz	LABEL8
	; IR
LABEL6:
	; IR
	mov	rcx, 8
	mov	r14, rcx
	; IR
	mov	rcx, r15
	add	r14, rcx
	; IR
	mov	rcx, r14
	mov	rdx, qword [rcx]
	mov	r14, rdx
	; IR
	mov	rcx, rbx
	mov	r13, rcx
	; IR
	mov	rcx, 3
	mov	rcx, rcx
	shl	r13 ,cl
	; IR
	mov	rcx, r14
	add	r13, rcx
	; IR
	mov	rcx, r13
	mov	rdx, qword [rcx]
	mov	r14, rdx
	; IR
	push	r14
	push	r13
	push	rbx
	push	r15
	mov	rdi, r14
	call	FUNCTION_toString
	add	rsp, 0
	pop	r15
	pop	rbx
	pop	r13
	pop	r14
	mov	r14, rax
	; IR
	push	r14
	push	r13
	push	rbx
	push	r15
	mov	rdi, r14
	call	FUNCTION_print
	add	rsp, 0
	pop	r15
	pop	rbx
	pop	r13
	pop	r14
	mov	qword [rbp-42*8], rax
	; IR
	; 14
	; IR
LABEL7:
	; IR
	mov	rcx, 1
	add	rbx, rcx
	; IR
	jmp	LABEL5
	; IR
LABEL8:
	; IR
	mov	rcx, 9
	push	r14
	push	r13
	push	rbx
	push	r15
	mov	rdi, rcx
	call	malloc
	pop	r15
	pop	rbx
	pop	r13
	pop	r14
	mov	r14, rax
	; IR
	mov	rcx, 0
	mov	rdx, r14
	mov	qword [rdx], rcx
	; IR
	mov	rcx, 8
	add	r14, rcx
	; IR
	mov	rcx, r14
	mov	r13, rcx
	; IR
	mov	rcx, 0
	add	r13, rcx
	; IR
	mov	rcx, 0
	mov	rdx, r13
	mov	qword [rdx], rcx
	; IR
	push	r14
	push	r13
	push	rbx
	push	r15
	mov	rdi, r14
	call	FUNCTION_println
	add	rsp, 0
	pop	r15
	pop	rbx
	pop	r13
	pop	r14
	mov	qword [rbp-46*8], rax
	; IR
	; 15
	; IR
	mov	rcx, 0
	mov	rbx, rcx
	; IR
LABEL9:
	; IR
	mov	rcx, 16
	mov	r14, rcx
	; IR
	mov	rcx, r15
	add	r14, rcx
	; IR
	mov	rcx, r14
	mov	rdx, qword [rcx]
	mov	r14, rdx
	; IR
	push	r14
	push	r13
	push	rbx
	push	r15
	mov	rdi, r14
	call	FUNCTION_size
	add	rsp, 0
	pop	r15
	pop	rbx
	pop	r13
	pop	r14
	mov	r14, rax
	; IR
	mov	rcx, r14
	cmp	rbx, rcx
	setl al
	movzx	eax, al
	mov	r14, rax
	; IR
	cmp	r14, 0
	jz	LABEL12
	; IR
LABEL10:
	; IR
	mov	rcx, 16
	mov	r14, rcx
	; IR
	mov	rcx, r15
	add	r14, rcx
	; IR
	mov	rcx, r14
	mov	rdx, qword [rcx]
	mov	r14, rdx
	; IR
	mov	rcx, rbx
	mov	r13, rcx
	; IR
	mov	rcx, 3
	mov	rcx, rcx
	shl	r13 ,cl
	; IR
	mov	rcx, r14
	add	r13, rcx
	; IR
	mov	rcx, 0
	mov	rdx, r13
	mov	qword [rdx], rcx
	; IR
	; 17
	; IR
LABEL11:
	; IR
	mov	rcx, 1
	add	rbx, rcx
	; IR
	jmp	LABEL9
	; IR
LABEL12:
	; IR
	mov	rcx, 0
	mov	rbx, rcx
	; IR
LABEL13:
	; IR
	mov	rcx, 24
	mov	r14, rcx
	; IR
	mov	rcx, r15
	add	r14, rcx
	; IR
	mov	rcx, r14
	mov	rdx, qword [rcx]
	mov	r14, rdx
	; IR
	push	r14
	push	r13
	push	rbx
	push	r15
	mov	rdi, r14
	call	FUNCTION_size
	add	rsp, 0
	pop	r15
	pop	rbx
	pop	r13
	pop	r14
	mov	r14, rax
	; IR
	mov	rcx, r14
	cmp	rbx, rcx
	setl al
	movzx	eax, al
	mov	r14, rax
	; IR
	cmp	r14, 0
	jz	LABEL16
	; IR
LABEL14:
	; IR
	mov	rcx, 24
	mov	r14, rcx
	; IR
	mov	rcx, r15
	add	r14, rcx
	; IR
	mov	rcx, r14
	mov	rdx, qword [rcx]
	mov	r14, rdx
	; IR
	mov	rcx, rbx
	mov	r13, rcx
	; IR
	mov	rcx, 3
	mov	rcx, rcx
	shl	r13 ,cl
	; IR
	mov	rcx, r14
	add	r13, rcx
	; IR
	mov	rcx, r13
	mov	rdx, qword [rcx]
	mov	r14, rdx
	; IR
	push	r14
	push	r13
	push	rbx
	push	r15
	mov	rdi, r14
	call	FUNCTION_toString
	add	rsp, 0
	pop	r15
	pop	rbx
	pop	r13
	pop	r14
	mov	r14, rax
	; IR
	push	r14
	push	r13
	push	rbx
	push	r15
	mov	rdi, r14
	call	FUNCTION_print
	add	rsp, 0
	pop	r15
	pop	rbx
	pop	r13
	pop	r14
	mov	qword [rbp-71*8], rax
	; IR
	; 19
	; IR
LABEL15:
	; IR
	mov	rcx, 1
	add	rbx, rcx
	; IR
	jmp	LABEL13
	; IR
LABEL16:
	; IR
	mov	rcx, 0
	mov	r14, rcx
	; IR
	jmp	LABEL17
	; IR
LABEL17:
	; IR
	mov	rax, r14
	leave
	ret
	; IR
LABEL18:
	; IR
	SECTION .data
	SECTION .bss
	LABEL0:	resq	1
	SECTION .rodata
	L_022:	db 25H, 73H, 00H
