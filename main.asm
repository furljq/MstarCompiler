	default rel
	global main
	global CLASS_A_MEMBER_Optimizer
	global CLASS_A_MEMBER_A
	global FUNCTION_restore
	global FUNCTION_quicksort
	global FUNCTION_calc
	global FUNCTION_mergesort
	global FUNCTION_heapsort
	global FUNCTION_main
	global static1
	global static3
	global static4
	global static5
	global static6
	global static7
	global static2
	global static0
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
	sub	rsp, 1608
	; IR
	mov	rcx, 100000
	mov	qword [rel static1], rcx
	; IR
	; 2
	; IR
	mov	rcx, 800008
	mov	rdi, rcx
	call	malloc
	mov	r13, rax
	; IR
	mov	rcx, 100000
	mov	rdx, r13
	mov	qword [rdx], rcx
	; IR
	mov	rcx, 8
	add	r13, rcx
	; IR
	mov	rcx, r13
	mov	qword [rel static3], rcx
	; IR
	; 4
	; IR
	mov	rcx, 800008
	push	r13
	sub	rsp, 8
	mov	rdi, rcx
	call	malloc
	add	rsp, 8
	pop	r13
	mov	r13, rax
	; IR
	mov	rcx, 100000
	mov	rdx, r13
	mov	qword [rdx], rcx
	; IR
	mov	rcx, 8
	add	r13, rcx
	; IR
	mov	rcx, r13
	mov	qword [rel static4], rcx
	; IR
	; 5
	; IR
	mov	rcx, 800008
	push	r13
	sub	rsp, 8
	mov	rdi, rcx
	call	malloc
	add	rsp, 8
	pop	r13
	mov	r13, rax
	; IR
	mov	rcx, 100000
	mov	rdx, r13
	mov	qword [rdx], rcx
	; IR
	mov	rcx, 8
	add	r13, rcx
	; IR
	mov	rcx, r13
	mov	qword [rel static5], rcx
	; IR
	; 6
	; IR
	mov	rcx, 800008
	push	r13
	sub	rsp, 8
	mov	rdi, rcx
	call	malloc
	add	rsp, 8
	pop	r13
	mov	r13, rax
	; IR
	mov	rcx, 100000
	mov	rdx, r13
	mov	qword [rdx], rcx
	; IR
	mov	rcx, 8
	add	r13, rcx
	; IR
	mov	rcx, r13
	mov	qword [rel static6], rcx
	; IR
	; 7
	; IR
	mov	rcx, 800008
	push	r13
	sub	rsp, 8
	mov	rdi, rcx
	call	malloc
	add	rsp, 8
	pop	r13
	mov	r13, rax
	; IR
	mov	rcx, 100000
	mov	rdx, r13
	mov	qword [rdx], rcx
	; IR
	mov	rcx, 8
	add	r13, rcx
	; IR
	mov	rcx, r13
	mov	qword [rel static7], rcx
	; IR
	; 8
	; IR
	push	r13
	sub	rsp, 8
	call	FUNCTION_main
	add	rsp, 0
	add	rsp, 8
	pop	r13
	mov	r13, rax
	; IR
	mov	rax, r13
	leave
	ret
	; IR
CLASS_A_MEMBER_Optimizer:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 42248
	mov	r13, rdi
	; IR
	mov	rcx, 0
	mov	qword [rbp-8*8], rcx
	; IR
	mov	rcx, 2
	mov	qword [rbp-26*8], rcx
	; IR
	mov	rcx, 24
	mov	rdi, rcx
	call	malloc
	mov	qword [rbp-28*8], rax
	; IR
	mov	rcx, 2
	mov	rdx, qword [rbp-28*8]
	mov	qword [rdx], rcx
	; IR
	mov	rcx, 8
	add	qword [rbp-28*8], rcx
	; IR
	mov	rcx, 0
	mov	qword [rbp-29*8], rcx
	; IR
label0:
	; IR
	mov	rcx, qword [rbp-26*8]
	cmp	qword [rbp-29*8], rcx
	setl al
	movzx	eax, al
	mov	r13, rax
	; IR
	cmp	r13, 0
	jz	label26
	; IR
label1:
	; IR
	mov	rcx, 2
	mov	qword [rbp-31*8], rcx
	; IR
	mov	rcx, 24
	push	r13
	sub	rsp, 8
	mov	rdi, rcx
	call	malloc
	add	rsp, 8
	pop	r13
	mov	qword [rbp-33*8], rax
	; IR
	mov	rcx, 2
	mov	rdx, qword [rbp-33*8]
	mov	qword [rdx], rcx
	; IR
	mov	rcx, 8
	add	qword [rbp-33*8], rcx
	; IR
	mov	rcx, 0
	mov	qword [rbp-34*8], rcx
	; IR
label2:
	; IR
	mov	rcx, qword [rbp-31*8]
	cmp	qword [rbp-34*8], rcx
	setl al
	movzx	eax, al
	mov	r13, rax
	; IR
	cmp	r13, 0
	jz	label25
	; IR
label3:
	; IR
	mov	rcx, 2
	mov	qword [rbp-36*8], rcx
	; IR
	mov	rcx, 24
	push	r13
	sub	rsp, 8
	mov	rdi, rcx
	call	malloc
	add	rsp, 8
	pop	r13
	mov	qword [rbp-38*8], rax
	; IR
	mov	rcx, 2
	mov	rdx, qword [rbp-38*8]
	mov	qword [rdx], rcx
	; IR
	mov	rcx, 8
	add	qword [rbp-38*8], rcx
	; IR
	mov	rcx, 0
	mov	qword [rbp-39*8], rcx
	; IR
label4:
	; IR
	mov	rcx, qword [rbp-36*8]
	cmp	qword [rbp-39*8], rcx
	setl al
	movzx	eax, al
	mov	r13, rax
	; IR
	cmp	r13, 0
	jz	label24
	; IR
label5:
	; IR
	mov	rcx, 2
	mov	qword [rbp-41*8], rcx
	; IR
	mov	rcx, 24
	push	r13
	sub	rsp, 8
	mov	rdi, rcx
	call	malloc
	add	rsp, 8
	pop	r13
	mov	qword [rbp-43*8], rax
	; IR
	mov	rcx, 2
	mov	rdx, qword [rbp-43*8]
	mov	qword [rdx], rcx
	; IR
	mov	rcx, 8
	add	qword [rbp-43*8], rcx
	; IR
	mov	rcx, 0
	mov	qword [rbp-44*8], rcx
	; IR
label6:
	; IR
	mov	rcx, qword [rbp-41*8]
	cmp	qword [rbp-44*8], rcx
	setl al
	movzx	eax, al
	mov	r13, rax
	; IR
	cmp	r13, 0
	jz	label23
	; IR
label7:
	; IR
	mov	rcx, 2
	mov	qword [rbp-46*8], rcx
	; IR
	mov	rcx, 24
	push	r13
	sub	rsp, 8
	mov	rdi, rcx
	call	malloc
	add	rsp, 8
	pop	r13
	mov	qword [rbp-48*8], rax
	; IR
	mov	rcx, 2
	mov	rdx, qword [rbp-48*8]
	mov	qword [rdx], rcx
	; IR
	mov	rcx, 8
	add	qword [rbp-48*8], rcx
	; IR
	mov	rcx, 0
	mov	qword [rbp-49*8], rcx
	; IR
label8:
	; IR
	mov	rcx, qword [rbp-46*8]
	cmp	qword [rbp-49*8], rcx
	setl al
	movzx	eax, al
	mov	r13, rax
	; IR
	cmp	r13, 0
	jz	label22
	; IR
label9:
	; IR
	mov	rcx, 2
	mov	qword [rbp-51*8], rcx
	; IR
	mov	rcx, 24
	push	r13
	sub	rsp, 8
	mov	rdi, rcx
	call	malloc
	add	rsp, 8
	pop	r13
	mov	qword [rbp-53*8], rax
	; IR
	mov	rcx, 2
	mov	rdx, qword [rbp-53*8]
	mov	qword [rdx], rcx
	; IR
	mov	rcx, 8
	add	qword [rbp-53*8], rcx
	; IR
	mov	rcx, 0
	mov	qword [rbp-54*8], rcx
	; IR
label10:
	; IR
	mov	rcx, qword [rbp-51*8]
	cmp	qword [rbp-54*8], rcx
	setl al
	movzx	eax, al
	mov	r13, rax
	; IR
	cmp	r13, 0
	jz	label21
	; IR
label11:
	; IR
	mov	rcx, 2
	mov	qword [rbp-56*8], rcx
	; IR
	mov	rcx, 24
	push	r13
	sub	rsp, 8
	mov	rdi, rcx
	call	malloc
	add	rsp, 8
	pop	r13
	mov	qword [rbp-58*8], rax
	; IR
	mov	rcx, 2
	mov	rdx, qword [rbp-58*8]
	mov	qword [rdx], rcx
	; IR
	mov	rcx, 8
	add	qword [rbp-58*8], rcx
	; IR
	mov	rcx, 0
	mov	qword [rbp-59*8], rcx
	; IR
label12:
	; IR
	mov	rcx, qword [rbp-56*8]
	cmp	qword [rbp-59*8], rcx
	setl al
	movzx	eax, al
	mov	r13, rax
	; IR
	cmp	r13, 0
	jz	label20
	; IR
label13:
	; IR
	mov	rcx, 2
	mov	r10, rcx
	; IR
	mov	rcx, 24
	push	r13
	push	r10
	mov	rdi, rcx
	call	malloc
	pop	r10
	pop	r13
	mov	qword [rbp-63*8], rax
	; IR
	mov	rcx, 2
	mov	rdx, qword [rbp-63*8]
	mov	qword [rdx], rcx
	; IR
	mov	rcx, 8
	add	qword [rbp-63*8], rcx
	; IR
	mov	rcx, 0
	mov	rbx, rcx
	; IR
label14:
	; IR
	mov	rcx, r10
	cmp	rbx, rcx
	setl al
	movzx	eax, al
	mov	r13, rax
	; IR
	cmp	r13, 0
	jz	label19
	; IR
label15:
	; IR
	mov	rcx, 2
	mov	r12, rcx
	; IR
	mov	rcx, 24
	push	r13
	push	r12
	push	r10
	push	rbx
	mov	rdi, rcx
	call	malloc
	pop	rbx
	pop	r10
	pop	r12
	pop	r13
	mov	r11, rax
	; IR
	mov	rcx, 2
	mov	rdx, r11
	mov	qword [rdx], rcx
	; IR
	mov	rcx, 8
	add	r11, rcx
	; IR
	mov	rcx, 0
	mov	r15, rcx
	; IR
label16:
	; IR
	mov	rcx, r12
	cmp	r15, rcx
	setl al
	movzx	eax, al
	mov	r13, rax
	; IR
	cmp	r13, 0
	jz	label18
	; IR
label17:
	; IR
	mov	rcx, 24
	push	r13
	push	r12
	push	r15
	push	r10
	push	r11
	push	rbx
	mov	rdi, rcx
	call	malloc
	pop	rbx
	pop	r11
	pop	r10
	pop	r15
	pop	r12
	pop	r13
	mov	r13, rax
	; IR
	mov	rcx, 2
	mov	rdx, r13
	mov	qword [rdx], rcx
	; IR
	mov	rcx, 8
	add	r13, rcx
	; IR
	mov	rcx, r15
	mov	r14, rcx
	; IR
	mov	rcx, 3
	mov	rcx, rcx
	shl	r14 ,cl
	; IR
	mov	rcx, r11
	add	r14, rcx
	; IR
	mov	rcx, r13
	mov	rdx, r14
	mov	qword [rdx], rcx
	; IR
	mov	rcx, 1
	add	r15, rcx
	; IR
	jmp	label16
	; IR
label18:
	; IR
	mov	rcx, rbx
	mov	r13, rcx
	; IR
	mov	rcx, 3
	mov	rcx, rcx
	shl	r13 ,cl
	; IR
	mov	rcx, qword [rbp-63*8]
	add	r13, rcx
	; IR
	mov	rcx, r11
	mov	rdx, r13
	mov	qword [rdx], rcx
	; IR
	mov	rcx, 1
	add	rbx, rcx
	; IR
	jmp	label14
	; IR
label19:
	; IR
	mov	rcx, qword [rbp-59*8]
	mov	r13, rcx
	; IR
	mov	rcx, 3
	mov	rcx, rcx
	shl	r13 ,cl
	; IR
	mov	rcx, qword [rbp-58*8]
	add	r13, rcx
	; IR
	mov	rcx, qword [rbp-63*8]
	mov	rdx, r13
	mov	qword [rdx], rcx
	; IR
	mov	rcx, 1
	add	qword [rbp-59*8], rcx
	; IR
	jmp	label12
	; IR
label20:
	; IR
	mov	rcx, qword [rbp-54*8]
	mov	r13, rcx
	; IR
	mov	rcx, 3
	mov	rcx, rcx
	shl	r13 ,cl
	; IR
	mov	rcx, qword [rbp-53*8]
	add	r13, rcx
	; IR
	mov	rcx, qword [rbp-58*8]
	mov	rdx, r13
	mov	qword [rdx], rcx
	; IR
	mov	rcx, 1
	add	qword [rbp-54*8], rcx
	; IR
	jmp	label10
	; IR
label21:
	; IR
	mov	rcx, qword [rbp-49*8]
	mov	r13, rcx
	; IR
	mov	rcx, 3
	mov	rcx, rcx
	shl	r13 ,cl
	; IR
	mov	rcx, qword [rbp-48*8]
	add	r13, rcx
	; IR
	mov	rcx, qword [rbp-53*8]
	mov	rdx, r13
	mov	qword [rdx], rcx
	; IR
	mov	rcx, 1
	add	qword [rbp-49*8], rcx
	; IR
	jmp	label8
	; IR
label22:
	; IR
	mov	rcx, qword [rbp-44*8]
	mov	r13, rcx
	; IR
	mov	rcx, 3
	mov	rcx, rcx
	shl	r13 ,cl
	; IR
	mov	rcx, qword [rbp-43*8]
	add	r13, rcx
	; IR
	mov	rcx, qword [rbp-48*8]
	mov	rdx, r13
	mov	qword [rdx], rcx
	; IR
	mov	rcx, 1
	add	qword [rbp-44*8], rcx
	; IR
	jmp	label6
	; IR
label23:
	; IR
	mov	rcx, qword [rbp-39*8]
	mov	r13, rcx
	; IR
	mov	rcx, 3
	mov	rcx, rcx
	shl	r13 ,cl
	; IR
	mov	rcx, qword [rbp-38*8]
	add	r13, rcx
	; IR
	mov	rcx, qword [rbp-43*8]
	mov	rdx, r13
	mov	qword [rdx], rcx
	; IR
	mov	rcx, 1
	add	qword [rbp-39*8], rcx
	; IR
	jmp	label4
	; IR
label24:
	; IR
	mov	rcx, qword [rbp-34*8]
	mov	r13, rcx
	; IR
	mov	rcx, 3
	mov	rcx, rcx
	shl	r13 ,cl
	; IR
	mov	rcx, qword [rbp-33*8]
	add	r13, rcx
	; IR
	mov	rcx, qword [rbp-38*8]
	mov	rdx, r13
	mov	qword [rdx], rcx
	; IR
	mov	rcx, 1
	add	qword [rbp-34*8], rcx
	; IR
	jmp	label2
	; IR
label25:
	; IR
	mov	rcx, qword [rbp-29*8]
	mov	r13, rcx
	; IR
	mov	rcx, 3
	mov	rcx, rcx
	shl	r13 ,cl
	; IR
	mov	rcx, qword [rbp-28*8]
	add	r13, rcx
	; IR
	mov	rcx, qword [rbp-33*8]
	mov	rdx, r13
	mov	qword [rdx], rcx
	; IR
	mov	rcx, 1
	add	qword [rbp-29*8], rcx
	; IR
	jmp	label0
	; IR
label26:
	; IR
	mov	rcx, qword [rbp-28*8]
	mov	qword [rbp-9*8], rcx
	; IR
	; 14
	; IR
	mov	rcx, 0
	mov	r12, rcx
	; IR
	; 18
	; IR
	mov	rcx, 1
	mov	qword [rbp-24*8], rcx
	; IR
label27:
	; IR
	mov	rcx, 1000
	mov	r13, rcx
	; IR
	mov	rcx, r13
	cmp	qword [rbp-24*8], rcx
	setle al
	movzx	eax, al
	mov	r13, rax
	; IR
	cmp	r13, 0
	jz	label30
	; IR
label28:
	; IR
	mov	rcx, 0
	mov	r13, rcx
	; IR
	mov	rcx, qword [rbp-9*8]
	add	r13, rcx
	; IR
	mov	rcx, r13
	mov	rdx, qword [rcx]
	mov	r13, rdx
	; IR
	mov	rcx, 8
	mov	r14, rcx
	; IR
	mov	rcx, r13
	add	r14, rcx
	; IR
	mov	rcx, r14
	mov	rdx, qword [rcx]
	mov	r13, rdx
	; IR
	mov	rcx, 0
	mov	r14, rcx
	; IR
	mov	rcx, r13
	add	r14, rcx
	; IR
	mov	rcx, r14
	mov	rdx, qword [rcx]
	mov	r13, rdx
	; IR
	mov	rcx, 8
	mov	r14, rcx
	; IR
	mov	rcx, r13
	add	r14, rcx
	; IR
	mov	rcx, r14
	mov	rdx, qword [rcx]
	mov	r13, rdx
	; IR
	mov	rcx, 0
	mov	r14, rcx
	; IR
	mov	rcx, r13
	add	r14, rcx
	; IR
	mov	rcx, r14
	mov	rdx, qword [rcx]
	mov	r13, rdx
	; IR
	mov	rcx, 8
	mov	r14, rcx
	; IR
	mov	rcx, r13
	add	r14, rcx
	; IR
	mov	rcx, r14
	mov	rdx, qword [rcx]
	mov	r13, rdx
	; IR
	mov	rcx, 0
	mov	r14, rcx
	; IR
	mov	rcx, r13
	add	r14, rcx
	; IR
	mov	rcx, r14
	mov	rdx, qword [rcx]
	mov	r13, rdx
	; IR
	mov	rcx, 8
	mov	r14, rcx
	; IR
	mov	rcx, r13
	add	r14, rcx
	; IR
	mov	rcx, r14
	mov	rdx, qword [rcx]
	mov	r13, rdx
	; IR
	mov	rcx, 0
	mov	r14, rcx
	; IR
	mov	rcx, r13
	add	r14, rcx
	; IR
	mov	rcx, r14
	mov	rdx, qword [rcx]
	mov	r13, rdx
	; IR
	mov	rcx, 8
	mov	r14, rcx
	; IR
	mov	rcx, r13
	add	r14, rcx
	; IR
	mov	rcx, 123
	mov	r13, rcx
	; IR
	mov	rcx, qword [rbp-24*8]
	add	r13, rcx
	; IR
	mov	rcx, r13
	mov	rdx, r14
	mov	qword [rdx], rcx
	; IR
	; 20
	; IR
	mov	rcx, r12
	mov	r12, rcx
	; IR
	mov	rcx, 0
	mov	r13, rcx
	; IR
	mov	rcx, qword [rbp-9*8]
	add	r13, rcx
	; IR
	mov	rcx, r13
	mov	rdx, qword [rcx]
	mov	r13, rdx
	; IR
	mov	rcx, 8
	mov	r14, rcx
	; IR
	mov	rcx, r13
	add	r14, rcx
	; IR
	mov	rcx, r14
	mov	rdx, qword [rcx]
	mov	r13, rdx
	; IR
	mov	rcx, 0
	mov	r14, rcx
	; IR
	mov	rcx, r13
	add	r14, rcx
	; IR
	mov	rcx, r14
	mov	rdx, qword [rcx]
	mov	r13, rdx
	; IR
	mov	rcx, 8
	mov	r14, rcx
	; IR
	mov	rcx, r13
	add	r14, rcx
	; IR
	mov	rcx, r14
	mov	rdx, qword [rcx]
	mov	r13, rdx
	; IR
	mov	rcx, 0
	mov	r14, rcx
	; IR
	mov	rcx, r13
	add	r14, rcx
	; IR
	mov	rcx, r14
	mov	rdx, qword [rcx]
	mov	r13, rdx
	; IR
	mov	rcx, 8
	mov	r14, rcx
	; IR
	mov	rcx, r13
	add	r14, rcx
	; IR
	mov	rcx, r14
	mov	rdx, qword [rcx]
	mov	r13, rdx
	; IR
	mov	rcx, 0
	mov	r14, rcx
	; IR
	mov	rcx, r13
	add	r14, rcx
	; IR
	mov	rcx, r14
	mov	rdx, qword [rcx]
	mov	r13, rdx
	; IR
	mov	rcx, 8
	mov	r14, rcx
	; IR
	mov	rcx, r13
	add	r14, rcx
	; IR
	mov	rcx, r14
	mov	rdx, qword [rcx]
	mov	r13, rdx
	; IR
	mov	rcx, 0
	mov	r14, rcx
	; IR
	mov	rcx, r13
	add	r14, rcx
	; IR
	mov	rcx, r14
	mov	rdx, qword [rcx]
	mov	r13, rdx
	; IR
	mov	rcx, 8
	mov	r14, rcx
	; IR
	mov	rcx, r13
	add	r14, rcx
	; IR
	mov	rcx, r14
	mov	rdx, qword [rcx]
	mov	r13, rdx
	; IR
	mov	rcx, r13
	add	r12, rcx
	; IR
	mov	rcx, r12
	mov	r12, rcx
	; IR
	; 21
	; IR
label29:
	; IR
	mov	rcx, 1
	add	qword [rbp-24*8], rcx
	; IR
	jmp	label27
	; IR
label30:
	; IR
	push	r13
	push	r12
	push	r14
	push	r15
	push	r10
	push	r11
	push	rbx
	sub	rsp, 8
	mov	rdi, r12
	call	FUNCTION_toString
	add	rsp, 0
	add	rsp, 8
	pop	rbx
	pop	r11
	pop	r10
	pop	r15
	pop	r14
	pop	r12
	pop	r13
	mov	r13, rax
	; IR
	push	r13
	push	r12
	push	r14
	push	r15
	push	r10
	push	r11
	push	rbx
	sub	rsp, 8
	mov	rdi, r13
	call	FUNCTION_println
	add	rsp, 0
	add	rsp, 8
	pop	rbx
	pop	r11
	pop	r10
	pop	r15
	pop	r14
	pop	r12
	pop	r13
	mov	qword [rbp-151*8], rax
	; IR
	; 23
	; IR
	mov	rcx, 1
	mov	qword [rbp-24*8], rcx
	; IR
label31:
	; IR
	mov	rcx, 1000000
	mov	r13, rcx
	; IR
	mov	rcx, r13
	cmp	qword [rbp-24*8], rcx
	setle al
	movzx	eax, al
	mov	r13, rax
	; IR
	cmp	r13, 0
	jz	label34
	; IR
label32:
	; IR
	mov	rcx, r12
	mov	r13, rcx
	; IR
	mov	rcx, 8
	add	r13, rcx
	; IR
	mov	rcx, r13
	mov	r12, rcx
	; IR
	; 25
	; IR
label33:
	; IR
	mov	rcx, 1
	add	qword [rbp-24*8], rcx
	; IR
	jmp	label31
	; IR
label34:
	; IR
	push	r13
	push	r12
	push	r14
	push	r15
	push	r10
	push	r11
	push	rbx
	sub	rsp, 8
	mov	rdi, r12
	call	FUNCTION_toString
	add	rsp, 0
	add	rsp, 8
	pop	rbx
	pop	r11
	pop	r10
	pop	r15
	pop	r14
	pop	r12
	pop	r13
	mov	r13, rax
	; IR
	push	r13
	push	r12
	push	r14
	push	r15
	push	r10
	push	r11
	push	rbx
	sub	rsp, 8
	mov	rdi, r13
	call	FUNCTION_println
	add	rsp, 0
	add	rsp, 8
	pop	rbx
	pop	r11
	pop	r10
	pop	r15
	pop	r14
	pop	r12
	pop	r13
	mov	qword [rbp-523*8], rax
	; IR
	; 49
	; IR
	mov	rcx, 1
	mov	qword [rbp-24*8], rcx
	; IR
label35:
	; IR
	mov	rcx, 200000000
	mov	r13, rcx
	; IR
	mov	rcx, r13
	cmp	qword [rbp-24*8], rcx
	setle al
	movzx	eax, al
	mov	r13, rax
	; IR
	cmp	r13, 0
	jz	label38
	; IR
label36:
	; IR
label37:
	; IR
	mov	rcx, 1
	add	qword [rbp-24*8], rcx
	; IR
	jmp	label35
	; IR
label38:
	; IR
label39:
	; IR
	mov	rax, qword [rbp-8*8]
	leave
	ret
	; IR
CLASS_A_MEMBER_A:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 5448
	mov	r13, rdi
	; IR
	mov	rcx, 0
	mov	qword [rbp-8*8], rcx
	; IR
	mov	rcx, 0
	add	r13, rcx
	; IR
	mov	rcx, r13
	mov	qword [rbp-10*8], rcx
	; IR
	mov	rcx, 8
	add	qword [rbp-10*8], rcx
	; IR
	mov	rcx, 2
	mov	qword [rbp-11*8], rcx
	; IR
	mov	rcx, 24
	push	r13
	sub	rsp, 8
	mov	rdi, rcx
	call	malloc
	add	rsp, 8
	pop	r13
	mov	qword [rbp-13*8], rax
	; IR
	mov	rcx, 2
	mov	rdx, qword [rbp-13*8]
	mov	qword [rdx], rcx
	; IR
	mov	rcx, 8
	add	qword [rbp-13*8], rcx
	; IR
	mov	rcx, 0
	mov	qword [rbp-14*8], rcx
	; IR
label40:
	; IR
	mov	rcx, qword [rbp-11*8]
	cmp	qword [rbp-14*8], rcx
	setl al
	movzx	eax, al
	mov	r13, rax
	; IR
	cmp	r13, 0
	jz	label66
	; IR
label41:
	; IR
	mov	rcx, 2
	mov	qword [rbp-16*8], rcx
	; IR
	mov	rcx, 24
	push	r13
	sub	rsp, 8
	mov	rdi, rcx
	call	malloc
	add	rsp, 8
	pop	r13
	mov	qword [rbp-18*8], rax
	; IR
	mov	rcx, 2
	mov	rdx, qword [rbp-18*8]
	mov	qword [rdx], rcx
	; IR
	mov	rcx, 8
	add	qword [rbp-18*8], rcx
	; IR
	mov	rcx, 0
	mov	qword [rbp-19*8], rcx
	; IR
label42:
	; IR
	mov	rcx, qword [rbp-16*8]
	cmp	qword [rbp-19*8], rcx
	setl al
	movzx	eax, al
	mov	r13, rax
	; IR
	cmp	r13, 0
	jz	label65
	; IR
label43:
	; IR
	mov	rcx, 3
	mov	qword [rbp-21*8], rcx
	; IR
	mov	rcx, 32
	push	r13
	sub	rsp, 8
	mov	rdi, rcx
	call	malloc
	add	rsp, 8
	pop	r13
	mov	qword [rbp-23*8], rax
	; IR
	mov	rcx, 3
	mov	rdx, qword [rbp-23*8]
	mov	qword [rdx], rcx
	; IR
	mov	rcx, 8
	add	qword [rbp-23*8], rcx
	; IR
	mov	rcx, 0
	mov	qword [rbp-24*8], rcx
	; IR
label44:
	; IR
	mov	rcx, qword [rbp-21*8]
	cmp	qword [rbp-24*8], rcx
	setl al
	movzx	eax, al
	mov	r13, rax
	; IR
	cmp	r13, 0
	jz	label64
	; IR
label45:
	; IR
	mov	rcx, 2
	mov	qword [rbp-26*8], rcx
	; IR
	mov	rcx, 24
	push	r13
	sub	rsp, 8
	mov	rdi, rcx
	call	malloc
	add	rsp, 8
	pop	r13
	mov	qword [rbp-28*8], rax
	; IR
	mov	rcx, 2
	mov	rdx, qword [rbp-28*8]
	mov	qword [rdx], rcx
	; IR
	mov	rcx, 8
	add	qword [rbp-28*8], rcx
	; IR
	mov	rcx, 0
	mov	qword [rbp-29*8], rcx
	; IR
label46:
	; IR
	mov	rcx, qword [rbp-26*8]
	cmp	qword [rbp-29*8], rcx
	setl al
	movzx	eax, al
	mov	r13, rax
	; IR
	cmp	r13, 0
	jz	label63
	; IR
label47:
	; IR
	mov	rcx, 3
	mov	qword [rbp-31*8], rcx
	; IR
	mov	rcx, 32
	push	r13
	sub	rsp, 8
	mov	rdi, rcx
	call	malloc
	add	rsp, 8
	pop	r13
	mov	qword [rbp-33*8], rax
	; IR
	mov	rcx, 3
	mov	rdx, qword [rbp-33*8]
	mov	qword [rdx], rcx
	; IR
	mov	rcx, 8
	add	qword [rbp-33*8], rcx
	; IR
	mov	rcx, 0
	mov	qword [rbp-34*8], rcx
	; IR
label48:
	; IR
	mov	rcx, qword [rbp-31*8]
	cmp	qword [rbp-34*8], rcx
	setl al
	movzx	eax, al
	mov	r13, rax
	; IR
	cmp	r13, 0
	jz	label62
	; IR
label49:
	; IR
	mov	rcx, 2
	mov	qword [rbp-36*8], rcx
	; IR
	mov	rcx, 24
	push	r13
	sub	rsp, 8
	mov	rdi, rcx
	call	malloc
	add	rsp, 8
	pop	r13
	mov	qword [rbp-38*8], rax
	; IR
	mov	rcx, 2
	mov	rdx, qword [rbp-38*8]
	mov	qword [rdx], rcx
	; IR
	mov	rcx, 8
	add	qword [rbp-38*8], rcx
	; IR
	mov	rcx, 0
	mov	qword [rbp-39*8], rcx
	; IR
label50:
	; IR
	mov	rcx, qword [rbp-36*8]
	cmp	qword [rbp-39*8], rcx
	setl al
	movzx	eax, al
	mov	r13, rax
	; IR
	cmp	r13, 0
	jz	label61
	; IR
label51:
	; IR
	mov	rcx, 2
	mov	qword [rbp-41*8], rcx
	; IR
	mov	rcx, 24
	push	r13
	sub	rsp, 8
	mov	rdi, rcx
	call	malloc
	add	rsp, 8
	pop	r13
	mov	qword [rbp-43*8], rax
	; IR
	mov	rcx, 2
	mov	rdx, qword [rbp-43*8]
	mov	qword [rdx], rcx
	; IR
	mov	rcx, 8
	add	qword [rbp-43*8], rcx
	; IR
	mov	rcx, 0
	mov	qword [rbp-44*8], rcx
	; IR
label52:
	; IR
	mov	rcx, qword [rbp-41*8]
	cmp	qword [rbp-44*8], rcx
	setl al
	movzx	eax, al
	mov	r13, rax
	; IR
	cmp	r13, 0
	jz	label60
	; IR
label53:
	; IR
	mov	rcx, 3
	mov	qword [rbp-46*8], rcx
	; IR
	mov	rcx, 32
	push	r13
	sub	rsp, 8
	mov	rdi, rcx
	call	malloc
	add	rsp, 8
	pop	r13
	mov	qword [rbp-48*8], rax
	; IR
	mov	rcx, 3
	mov	rdx, qword [rbp-48*8]
	mov	qword [rdx], rcx
	; IR
	mov	rcx, 8
	add	qword [rbp-48*8], rcx
	; IR
	mov	rcx, 0
	mov	qword [rbp-49*8], rcx
	; IR
label54:
	; IR
	mov	rcx, qword [rbp-46*8]
	cmp	qword [rbp-49*8], rcx
	setl al
	movzx	eax, al
	mov	r13, rax
	; IR
	cmp	r13, 0
	jz	label59
	; IR
label55:
	; IR
	mov	rcx, 2
	mov	r12, rcx
	; IR
	mov	rcx, 24
	push	r13
	push	r12
	mov	rdi, rcx
	call	malloc
	pop	r12
	pop	r13
	mov	r11, rax
	; IR
	mov	rcx, 2
	mov	rdx, r11
	mov	qword [rdx], rcx
	; IR
	mov	rcx, 8
	add	r11, rcx
	; IR
	mov	rcx, 0
	mov	r15, rcx
	; IR
label56:
	; IR
	mov	rcx, r12
	cmp	r15, rcx
	setl al
	movzx	eax, al
	mov	r13, rax
	; IR
	cmp	r13, 0
	jz	label58
	; IR
label57:
	; IR
	mov	rcx, 24
	push	r13
	push	r12
	push	r15
	push	r11
	mov	rdi, rcx
	call	malloc
	pop	r11
	pop	r15
	pop	r12
	pop	r13
	mov	r13, rax
	; IR
	mov	rcx, 2
	mov	rdx, r13
	mov	qword [rdx], rcx
	; IR
	mov	rcx, 8
	add	r13, rcx
	; IR
	mov	rcx, r15
	mov	r14, rcx
	; IR
	mov	rcx, 3
	mov	rcx, rcx
	shl	r14 ,cl
	; IR
	mov	rcx, r11
	add	r14, rcx
	; IR
	mov	rcx, r13
	mov	rdx, r14
	mov	qword [rdx], rcx
	; IR
	mov	rcx, 1
	add	r15, rcx
	; IR
	jmp	label56
	; IR
label58:
	; IR
	mov	rcx, qword [rbp-49*8]
	mov	r13, rcx
	; IR
	mov	rcx, 3
	mov	rcx, rcx
	shl	r13 ,cl
	; IR
	mov	rcx, qword [rbp-48*8]
	add	r13, rcx
	; IR
	mov	rcx, r11
	mov	rdx, r13
	mov	qword [rdx], rcx
	; IR
	mov	rcx, 1
	add	qword [rbp-49*8], rcx
	; IR
	jmp	label54
	; IR
label59:
	; IR
	mov	rcx, qword [rbp-44*8]
	mov	r13, rcx
	; IR
	mov	rcx, 3
	mov	rcx, rcx
	shl	r13 ,cl
	; IR
	mov	rcx, qword [rbp-43*8]
	add	r13, rcx
	; IR
	mov	rcx, qword [rbp-48*8]
	mov	rdx, r13
	mov	qword [rdx], rcx
	; IR
	mov	rcx, 1
	add	qword [rbp-44*8], rcx
	; IR
	jmp	label52
	; IR
label60:
	; IR
	mov	rcx, qword [rbp-39*8]
	mov	r13, rcx
	; IR
	mov	rcx, 3
	mov	rcx, rcx
	shl	r13 ,cl
	; IR
	mov	rcx, qword [rbp-38*8]
	add	r13, rcx
	; IR
	mov	rcx, qword [rbp-43*8]
	mov	rdx, r13
	mov	qword [rdx], rcx
	; IR
	mov	rcx, 1
	add	qword [rbp-39*8], rcx
	; IR
	jmp	label50
	; IR
label61:
	; IR
	mov	rcx, qword [rbp-34*8]
	mov	r13, rcx
	; IR
	mov	rcx, 3
	mov	rcx, rcx
	shl	r13 ,cl
	; IR
	mov	rcx, qword [rbp-33*8]
	add	r13, rcx
	; IR
	mov	rcx, qword [rbp-38*8]
	mov	rdx, r13
	mov	qword [rdx], rcx
	; IR
	mov	rcx, 1
	add	qword [rbp-34*8], rcx
	; IR
	jmp	label48
	; IR
label62:
	; IR
	mov	rcx, qword [rbp-29*8]
	mov	r13, rcx
	; IR
	mov	rcx, 3
	mov	rcx, rcx
	shl	r13 ,cl
	; IR
	mov	rcx, qword [rbp-28*8]
	add	r13, rcx
	; IR
	mov	rcx, qword [rbp-33*8]
	mov	rdx, r13
	mov	qword [rdx], rcx
	; IR
	mov	rcx, 1
	add	qword [rbp-29*8], rcx
	; IR
	jmp	label46
	; IR
label63:
	; IR
	mov	rcx, qword [rbp-24*8]
	mov	r13, rcx
	; IR
	mov	rcx, 3
	mov	rcx, rcx
	shl	r13 ,cl
	; IR
	mov	rcx, qword [rbp-23*8]
	add	r13, rcx
	; IR
	mov	rcx, qword [rbp-28*8]
	mov	rdx, r13
	mov	qword [rdx], rcx
	; IR
	mov	rcx, 1
	add	qword [rbp-24*8], rcx
	; IR
	jmp	label44
	; IR
label64:
	; IR
	mov	rcx, qword [rbp-19*8]
	mov	r13, rcx
	; IR
	mov	rcx, 3
	mov	rcx, rcx
	shl	r13 ,cl
	; IR
	mov	rcx, qword [rbp-18*8]
	add	r13, rcx
	; IR
	mov	rcx, qword [rbp-23*8]
	mov	rdx, r13
	mov	qword [rdx], rcx
	; IR
	mov	rcx, 1
	add	qword [rbp-19*8], rcx
	; IR
	jmp	label42
	; IR
label65:
	; IR
	mov	rcx, qword [rbp-14*8]
	mov	r13, rcx
	; IR
	mov	rcx, 3
	mov	rcx, rcx
	shl	r13 ,cl
	; IR
	mov	rcx, qword [rbp-13*8]
	add	r13, rcx
	; IR
	mov	rcx, qword [rbp-18*8]
	mov	rdx, r13
	mov	qword [rdx], rcx
	; IR
	mov	rcx, 1
	add	qword [rbp-14*8], rcx
	; IR
	jmp	label40
	; IR
label66:
	; IR
	mov	rcx, qword [rbp-13*8]
	mov	rdx, qword [rbp-10*8]
	mov	qword [rdx], rcx
	; IR
	; 53
	; IR
label67:
	; IR
	mov	rax, qword [rbp-8*8]
	leave
	ret
	; IR
FUNCTION_restore:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 1288
	; IR
	mov	rcx, 0
	mov	r12, rcx
	; IR
	mov	rcx, 1
	mov	r15, rcx
	; IR
label68:
	; IR
	mov	rcx, qword [rel static2]
	cmp	r15, rcx
	setle al
	movzx	eax, al
	mov	r13, rax
	; IR
	cmp	r13, 0
	jz	label71
	; IR
label69:
	; IR
	mov	rcx, r15
	mov	r14, rcx
	; IR
	mov	rcx, 3
	mov	rcx, rcx
	shl	r14 ,cl
	; IR
	mov	rcx, qword [rel static3]
	add	r14, rcx
	; IR
	mov	rcx, r15
	mov	r13, rcx
	; IR
	mov	rcx, 3
	mov	rcx, rcx
	shl	r13 ,cl
	; IR
	mov	rcx, qword [rel static4]
	add	r13, rcx
	; IR
	mov	rcx, r13
	mov	rdx, qword [rcx]
	mov	r13, rdx
	; IR
	mov	rcx, r13
	mov	rdx, r14
	mov	qword [rdx], rcx
	; IR
	; 59
	; IR
label70:
	; IR
	mov	rcx, 1
	add	r15, rcx
	; IR
	jmp	label68
	; IR
label71:
	; IR
label72:
	; IR
	mov	rax, r12
	leave
	ret
	; IR
FUNCTION_quicksort:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 6248
	mov	qword [rbp-1*8], rdi
	mov	qword [rbp-2*8], rsi
	; IR
	mov	rcx, 0
	add	qword [rbp-1*8], rcx
	; IR
	mov	rcx, 0
	add	qword [rbp-2*8], rcx
	; IR
	mov	rdi, qword [rel static0]
	call	FUNCTION_toString
	add	rsp, 0
	mov	r13, rax
	; IR
	push	r13
	sub	rsp, 8
	mov	rdi, r13
	call	FUNCTION_println
	add	rsp, 0
	add	rsp, 8
	pop	r13
	mov	qword [rbp-30*8], rax
	; IR
	; 62
	; IR
	mov	rcx, 1
	add	qword [rel static0], rcx
	; IR
	; 63
	; IR
	mov	rcx, 0
	mov	qword [rbp-23*8], rcx
	; IR
	; 66
	; IR
	mov	rcx, qword [rbp-1*8]
	mov	r13, rcx
	; IR
	mov	rcx, 3
	mov	rcx, rcx
	shl	r13 ,cl
	; IR
	mov	rcx, qword [rel static3]
	add	r13, rcx
	; IR
	mov	rcx, r13
	mov	rdx, qword [rcx]
	mov	r13, rdx
	; IR
	mov	rcx, r13
	mov	r15, rcx
	; IR
	; 67
	; IR
	mov	rcx, 0
	mov	qword [rbp-25*8], rcx
	; IR
	; 68
	; IR
	mov	rcx, 0
	mov	qword [rbp-26*8], rcx
	; IR
	; 69
	; IR
	mov	rcx, qword [rbp-1*8]
	mov	r13, rcx
	; IR
	mov	rcx, 1
	add	r13, rcx
	; IR
	mov	rcx, r13
	mov	r11, rcx
	; IR
label73:
	; IR
	mov	rcx, qword [rbp-2*8]
	cmp	r11, rcx
	setl al
	movzx	eax, al
	mov	r13, rax
	; IR
	cmp	r13, 0
	jz	label79
	; IR
label74:
	; IR
	mov	rcx, 1
	add	qword [rbp-23*8], rcx
	; IR
	; 72
	; IR
	mov	rcx, r11
	mov	r13, rcx
	; IR
	mov	rcx, 3
	mov	rcx, rcx
	shl	r13 ,cl
	; IR
	mov	rcx, qword [rel static3]
	add	r13, rcx
	; IR
	mov	rcx, r13
	mov	rdx, qword [rcx]
	mov	r13, rdx
	; IR
	mov	rcx, r15
	cmp	r13, rcx
	setl al
	movzx	eax, al
	mov	r13, rax
	; IR
	cmp	r13, 0
	jz	label76
	; IR
label75:
	; IR
	mov	rcx, qword [rbp-25*8]
	mov	r13, rcx
	; IR
	mov	rcx, 1
	add	qword [rbp-25*8], rcx
	; IR
	mov	rcx, r13
	mov	r14, rcx
	; IR
	mov	rcx, 3
	mov	rcx, rcx
	shl	r14 ,cl
	; IR
	mov	rcx, qword [rel static5]
	add	r14, rcx
	; IR
	mov	rcx, r11
	mov	r13, rcx
	; IR
	mov	rcx, 3
	mov	rcx, rcx
	shl	r13 ,cl
	; IR
	mov	rcx, qword [rel static3]
	add	r13, rcx
	; IR
	mov	rcx, r13
	mov	rdx, qword [rcx]
	mov	r13, rdx
	; IR
	mov	rcx, r13
	mov	rdx, r14
	mov	qword [rdx], rcx
	; IR
	; 74
	; IR
	jmp	label77
	; IR
label76:
	; IR
	mov	rcx, qword [rbp-26*8]
	mov	r13, rcx
	; IR
	mov	rcx, 1
	add	qword [rbp-26*8], rcx
	; IR
	mov	rcx, r13
	mov	r14, rcx
	; IR
	mov	rcx, 3
	mov	rcx, rcx
	shl	r14 ,cl
	; IR
	mov	rcx, qword [rel static6]
	add	r14, rcx
	; IR
	mov	rcx, r11
	mov	r13, rcx
	; IR
	mov	rcx, 3
	mov	rcx, rcx
	shl	r13 ,cl
	; IR
	mov	rcx, qword [rel static3]
	add	r13, rcx
	; IR
	mov	rcx, r13
	mov	rdx, qword [rcx]
	mov	r13, rdx
	; IR
	mov	rcx, r13
	mov	rdx, r14
	mov	qword [rdx], rcx
	; IR
	; 76
	; IR
label77:
	; IR
label78:
	; IR
	mov	rcx, 1
	add	r11, rcx
	; IR
	jmp	label73
	; IR
label79:
	; IR
	mov	rcx, qword [rbp-1*8]
	mov	r12, rcx
	; IR
	; 78
	; IR
	mov	rcx, 0
	mov	r11, rcx
	; IR
label80:
	; IR
	mov	rcx, qword [rbp-25*8]
	cmp	r11, rcx
	setl al
	movzx	eax, al
	mov	r13, rax
	; IR
	cmp	r13, 0
	jz	label83
	; IR
label81:
	; IR
	mov	rcx, r12
	mov	r13, rcx
	; IR
	mov	rcx, 1
	add	r12, rcx
	; IR
	mov	rcx, r13
	mov	r14, rcx
	; IR
	mov	rcx, 3
	mov	rcx, rcx
	shl	r14 ,cl
	; IR
	mov	rcx, qword [rel static3]
	add	r14, rcx
	; IR
	mov	rcx, r11
	mov	r13, rcx
	; IR
	mov	rcx, 3
	mov	rcx, rcx
	shl	r13 ,cl
	; IR
	mov	rcx, qword [rel static5]
	add	r13, rcx
	; IR
	mov	rcx, r13
	mov	rdx, qword [rcx]
	mov	r13, rdx
	; IR
	mov	rcx, r13
	mov	rdx, r14
	mov	qword [rdx], rcx
	; IR
	; 80
	; IR
label82:
	; IR
	mov	rcx, 1
	add	r11, rcx
	; IR
	jmp	label80
	; IR
label83:
	; IR
	mov	rcx, r12
	mov	r13, rcx
	; IR
	mov	rcx, 1
	add	r12, rcx
	; IR
	mov	rcx, r13
	mov	r13, rcx
	; IR
	mov	rcx, 3
	mov	rcx, rcx
	shl	r13 ,cl
	; IR
	mov	rcx, qword [rel static3]
	add	r13, rcx
	; IR
	mov	rcx, r15
	mov	rdx, r13
	mov	qword [rdx], rcx
	; IR
	; 81
	; IR
	mov	rcx, 0
	mov	r11, rcx
	; IR
label84:
	; IR
	mov	rcx, qword [rbp-26*8]
	cmp	r11, rcx
	setl al
	movzx	eax, al
	mov	r13, rax
	; IR
	cmp	r13, 0
	jz	label87
	; IR
label85:
	; IR
	mov	rcx, r12
	mov	r13, rcx
	; IR
	mov	rcx, 1
	add	r12, rcx
	; IR
	mov	rcx, r13
	mov	r14, rcx
	; IR
	mov	rcx, 3
	mov	rcx, rcx
	shl	r14 ,cl
	; IR
	mov	rcx, qword [rel static3]
	add	r14, rcx
	; IR
	mov	rcx, r11
	mov	r13, rcx
	; IR
	mov	rcx, 3
	mov	rcx, rcx
	shl	r13 ,cl
	; IR
	mov	rcx, qword [rel static6]
	add	r13, rcx
	; IR
	mov	rcx, r13
	mov	rdx, qword [rcx]
	mov	r13, rdx
	; IR
	mov	rcx, r13
	mov	rdx, r14
	mov	qword [rdx], rcx
	; IR
	; 83
	; IR
label86:
	; IR
	mov	rcx, 1
	add	r11, rcx
	; IR
	jmp	label84
	; IR
label87:
	; IR
	mov	rcx, 1
	mov	r13, rcx
	; IR
	mov	rcx, r13
	cmp	qword [rbp-25*8], rcx
	setg al
	movzx	eax, al
	mov	r13, rax
	; IR
	cmp	r13, 0
	jz	label89
	; IR
label88:
	; IR
	mov	rcx, qword [rbp-23*8]
	mov	r14, rcx
	; IR
	mov	rcx, qword [rbp-1*8]
	mov	r13, rcx
	; IR
	mov	rcx, qword [rbp-25*8]
	add	r13, rcx
	; IR
	push	r13
	push	r14
	push	r12
	push	r15
	push	r11
	sub	rsp, 8
	mov	rsi, r13
	mov	rdi, qword [rbp-1*8]
	call	FUNCTION_quicksort
	add	rsp, 0
	add	rsp, 8
	pop	r11
	pop	r15
	pop	r12
	pop	r14
	pop	r13
	mov	r13, rax
	; IR
	mov	rcx, r13
	add	r14, rcx
	; IR
	mov	rcx, r14
	mov	qword [rbp-23*8], rcx
	; IR
	; 85
	; IR
	jmp	label90
	; IR
label89:
	; IR
label90:
	; IR
	mov	rcx, 1
	mov	r13, rcx
	; IR
	mov	rcx, r13
	cmp	qword [rbp-26*8], rcx
	setg al
	movzx	eax, al
	mov	r13, rax
	; IR
	cmp	r13, 0
	jz	label92
	; IR
label91:
	; IR
	mov	rcx, qword [rbp-23*8]
	mov	r14, rcx
	; IR
	mov	rcx, qword [rbp-2*8]
	mov	r13, rcx
	; IR
	mov	rcx, qword [rbp-26*8]
	sub	r13, rcx
	; IR
	push	r13
	push	r14
	push	r12
	push	r15
	push	r11
	sub	rsp, 8
	mov	rsi, qword [rbp-2*8]
	mov	rdi, r13
	call	FUNCTION_quicksort
	add	rsp, 0
	add	rsp, 8
	pop	r11
	pop	r15
	pop	r12
	pop	r14
	pop	r13
	mov	r13, rax
	; IR
	mov	rcx, r13
	add	r14, rcx
	; IR
	mov	rcx, r14
	mov	qword [rbp-23*8], rcx
	; IR
	; 87
	; IR
	jmp	label93
	; IR
label92:
	; IR
label93:
	; IR
	mov	rcx, qword [rbp-23*8]
	mov	r13, rcx
	; IR
	jmp	label94
	; IR
label94:
	; IR
	mov	rax, r13
	leave
	ret
	; IR
FUNCTION_calc:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 4328
	; IR
	mov	rcx, 1
	mov	r11, rcx
	; IR
label95:
	; IR
	mov	rcx, qword [rel static2]
	cmp	r11, rcx
	setle al
	movzx	eax, al
	mov	r13, rax
	; IR
	cmp	r13, 0
	jz	label98
	; IR
label96:
	; IR
	mov	rcx, r11
	mov	r13, rcx
	; IR
	mov	rcx, 3
	mov	rcx, rcx
	shl	r13 ,cl
	; IR
	mov	rcx, qword [rel static5]
	add	r13, rcx
	; IR
	mov	rcx, r11
	mov	r14, rcx
	; IR
	mov	rcx, 1
	sub	r14, rcx
	; IR
	mov	rcx, r14
	mov	rdx, r13
	mov	qword [rdx], rcx
	; IR
	; 95
	; IR
	mov	rcx, r11
	mov	r13, rcx
	; IR
	mov	rcx, 3
	mov	rcx, rcx
	shl	r13 ,cl
	; IR
	mov	rcx, qword [rel static6]
	add	r13, rcx
	; IR
	mov	rcx, r11
	mov	r14, rcx
	; IR
	mov	rcx, 1
	add	r14, rcx
	; IR
	mov	rcx, r14
	mov	rdx, r13
	mov	qword [rdx], rcx
	; IR
	; 96
	; IR
label97:
	; IR
	mov	rcx, 1
	add	r11, rcx
	; IR
	jmp	label95
	; IR
label98:
	; IR
	mov	rcx, 0
	mov	r15, rcx
	; IR
	; 98
	; IR
	mov	rcx, qword [rel static2]
	mov	r11, rcx
	; IR
label99:
	; IR
	mov	rcx, 1
	mov	r13, rcx
	; IR
	mov	rcx, r13
	cmp	r11, rcx
	setge al
	movzx	eax, al
	mov	r13, rax
	; IR
	cmp	r13, 0
	jz	label102
	; IR
label100:
	; IR
	mov	rcx, r11
	mov	r13, rcx
	; IR
	mov	rcx, 3
	mov	rcx, rcx
	shl	r13 ,cl
	; IR
	mov	rcx, qword [rel static3]
	add	r13, rcx
	; IR
	mov	rcx, r13
	mov	rdx, qword [rcx]
	mov	r13, rdx
	; IR
	mov	rcx, r13
	mov	r13, rcx
	; IR
	mov	rcx, 3
	mov	rcx, rcx
	shl	r13 ,cl
	; IR
	mov	rcx, qword [rel static5]
	add	r13, rcx
	; IR
	mov	rcx, r13
	mov	rdx, qword [rcx]
	mov	r13, rdx
	; IR
	mov	rcx, r13
	mov	r12, rcx
	; IR
	; 100
	; IR
	mov	rcx, r11
	mov	r13, rcx
	; IR
	mov	rcx, 3
	mov	rcx, rcx
	shl	r13 ,cl
	; IR
	mov	rcx, qword [rel static3]
	add	r13, rcx
	; IR
	mov	rcx, r13
	mov	rdx, qword [rcx]
	mov	r13, rdx
	; IR
	mov	rcx, r13
	mov	r13, rcx
	; IR
	mov	rcx, 3
	mov	rcx, rcx
	shl	r13 ,cl
	; IR
	mov	rcx, qword [rel static6]
	add	r13, rcx
	; IR
	mov	rcx, r13
	mov	rdx, qword [rcx]
	mov	r13, rdx
	; IR
	mov	rcx, r13
	mov	r14, rcx
	; IR
	; 101
	; IR
	mov	rcx, r12
	mov	r13, rcx
	; IR
	mov	rcx, 3
	mov	rcx, rcx
	shl	r13 ,cl
	; IR
	mov	rcx, qword [rel static6]
	add	r13, rcx
	; IR
	mov	rcx, r14
	mov	rdx, r13
	mov	qword [rdx], rcx
	; IR
	; 102
	; IR
	mov	rcx, r14
	mov	r13, rcx
	; IR
	mov	rcx, 3
	mov	rcx, rcx
	shl	r13 ,cl
	; IR
	mov	rcx, qword [rel static5]
	add	r13, rcx
	; IR
	mov	rcx, r12
	mov	rdx, r13
	mov	qword [rdx], rcx
	; IR
	; 103
	; IR
	mov	rcx, r15
	mov	r13, rcx
	; IR
	mov	rcx, r14
	add	r13, rcx
	; IR
	mov	rcx, r13
	mov	r13, rcx
	; IR
	mov	rcx, r12
	sub	r13, rcx
	; IR
	mov	rcx, r13
	mov	r13, rcx
	; IR
	mov	rcx, 2
	sub	r13, rcx
	; IR
	mov	rcx, r13
	mov	r15, rcx
	; IR
	; 104
	; IR
label101:
	; IR
	mov	rcx, 1
	sub	r11, rcx
	; IR
	jmp	label99
	; IR
label102:
	; IR
	mov	rcx, r15
	mov	r13, rcx
	; IR
	jmp	label103
	; IR
label103:
	; IR
	mov	rax, r13
	leave
	ret
	; IR
FUNCTION_mergesort:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 7208
	mov	r10, rdi
	mov	r11, rsi
	; IR
	mov	rcx, 0
	add	r10, rcx
	; IR
	mov	rcx, 0
	add	r11, rcx
	; IR
	mov	rcx, r10
	mov	r13, rcx
	; IR
	mov	rcx, 1
	add	r13, rcx
	; IR
	mov	rcx, r11
	cmp	r13, rcx
	sete al
	movzx	eax, al
	mov	r13, rax
	; IR
	cmp	r13, 0
	jz	label105
	; IR
label104:
	; IR
	mov	rcx, 0
	mov	r13, rcx
	; IR
	jmp	label133
	; IR
	jmp	label106
	; IR
label105:
	; IR
label106:
	; IR
	mov	rcx, r10
	mov	r13, rcx
	; IR
	mov	rcx, r11
	add	r13, rcx
	; IR
	mov	rcx, r13
	mov	r13, rcx
	; IR
	mov	rcx, 1
	mov	rcx, rcx
	sar	r13 ,cl
	; IR
	mov	rcx, r13
	mov	r12, rcx
	; IR
	; 112
	; IR
	; 113
	; IR
	mov	rcx, 0
	mov	r13, rcx
	; IR
	push	r13
	push	r12
	push	r10
	push	r11
	mov	rsi, r12
	mov	rdi, r10
	call	FUNCTION_mergesort
	add	rsp, 0
	pop	r11
	pop	r10
	pop	r12
	pop	r13
	mov	r14, rax
	; IR
	mov	rcx, r14
	add	r13, rcx
	; IR
	mov	rcx, r13
	mov	qword [rbp-24*8], rcx
	; IR
	; 114
	; IR
	mov	rcx, qword [rbp-24*8]
	mov	r13, rcx
	; IR
	push	r13
	push	r12
	push	r14
	push	r10
	push	r11
	sub	rsp, 8
	mov	rsi, r11
	mov	rdi, r12
	call	FUNCTION_mergesort
	add	rsp, 0
	add	rsp, 8
	pop	r11
	pop	r10
	pop	r14
	pop	r12
	pop	r13
	mov	r14, rax
	; IR
	mov	rcx, r14
	add	r13, rcx
	; IR
	mov	rcx, r13
	mov	qword [rbp-24*8], rcx
	; IR
	; 115
	; IR
	mov	rcx, 0
	mov	qword [rbp-25*8], rcx
	; IR
	; 116
	; IR
	mov	rcx, 0
	mov	qword [rbp-26*8], rcx
	; IR
	; 117
	; IR
	mov	rcx, r10
	mov	r15, rcx
	; IR
label107:
	; IR
	mov	rcx, r12
	cmp	r15, rcx
	setl al
	movzx	eax, al
	mov	r13, rax
	; IR
	cmp	r13, 0
	jz	label110
	; IR
label108:
	; IR
	mov	rcx, qword [rbp-25*8]
	mov	r13, rcx
	; IR
	mov	rcx, 1
	add	qword [rbp-25*8], rcx
	; IR
	mov	rcx, r13
	mov	r14, rcx
	; IR
	mov	rcx, 3
	mov	rcx, rcx
	shl	r14 ,cl
	; IR
	mov	rcx, qword [rel static5]
	add	r14, rcx
	; IR
	mov	rcx, r15
	mov	r13, rcx
	; IR
	mov	rcx, 3
	mov	rcx, rcx
	shl	r13 ,cl
	; IR
	mov	rcx, qword [rel static3]
	add	r13, rcx
	; IR
	mov	rcx, r13
	mov	rdx, qword [rcx]
	mov	r13, rdx
	; IR
	mov	rcx, r13
	mov	rdx, r14
	mov	qword [rdx], rcx
	; IR
	; 120
	; IR
label109:
	; IR
	mov	rcx, 1
	add	r15, rcx
	; IR
	jmp	label107
	; IR
label110:
	; IR
	mov	rcx, r12
	mov	r15, rcx
	; IR
label111:
	; IR
	mov	rcx, r11
	cmp	r15, rcx
	setl al
	movzx	eax, al
	mov	r13, rax
	; IR
	cmp	r13, 0
	jz	label114
	; IR
label112:
	; IR
	mov	rcx, qword [rbp-26*8]
	mov	r13, rcx
	; IR
	mov	rcx, 1
	add	qword [rbp-26*8], rcx
	; IR
	mov	rcx, r13
	mov	r14, rcx
	; IR
	mov	rcx, 3
	mov	rcx, rcx
	shl	r14 ,cl
	; IR
	mov	rcx, qword [rel static6]
	add	r14, rcx
	; IR
	mov	rcx, r15
	mov	r13, rcx
	; IR
	mov	rcx, 3
	mov	rcx, rcx
	shl	r13 ,cl
	; IR
	mov	rcx, qword [rel static3]
	add	r13, rcx
	; IR
	mov	rcx, r13
	mov	rdx, qword [rcx]
	mov	r13, rdx
	; IR
	mov	rcx, r13
	mov	rdx, r14
	mov	qword [rdx], rcx
	; IR
	; 122
	; IR
label113:
	; IR
	mov	rcx, 1
	add	r15, rcx
	; IR
	jmp	label111
	; IR
label114:
	; IR
	mov	rcx, 0
	mov	r12, rcx
	; IR
	; 123
	; IR
	mov	rcx, 0
	mov	qword [rbp-29*8], rcx
	; IR
	; 124
	; IR
	mov	rcx, r10
	mov	qword [rbp-30*8], rcx
	; IR
	; 125
	; IR
label115:
	; IR
	mov	rcx, qword [rbp-25*8]
	cmp	r12, rcx
	setl al
	movzx	eax, al
	mov	r13, rax
	; IR
	cmp	r13, 0
	jz	label117
	; IR
label116:
	; IR
	mov	rcx, qword [rbp-26*8]
	cmp	qword [rbp-29*8], rcx
	setl al
	movzx	eax, al
	mov	r13, rax
	; IR
	mov	rcx, r13
	mov	r13, rcx
	; IR
	jmp	label118
	; IR
label117:
	; IR
	mov	rcx, 0
	mov	r13, rcx
	; IR
label118:
	; IR
	cmp	r13, 0
	jz	label124
	; IR
label119:
	; IR
	mov	rcx, 1
	add	qword [rbp-24*8], rcx
	; IR
	; 127
	; IR
	mov	rcx, r12
	mov	r13, rcx
	; IR
	mov	rcx, 3
	mov	rcx, rcx
	shl	r13 ,cl
	; IR
	mov	rcx, qword [rel static5]
	add	r13, rcx
	; IR
	mov	rcx, r13
	mov	rdx, qword [rcx]
	mov	r14, rdx
	; IR
	mov	rcx, qword [rbp-29*8]
	mov	r13, rcx
	; IR
	mov	rcx, 3
	mov	rcx, rcx
	shl	r13 ,cl
	; IR
	mov	rcx, qword [rel static6]
	add	r13, rcx
	; IR
	mov	rcx, r13
	mov	rdx, qword [rcx]
	mov	r13, rdx
	; IR
	mov	rcx, r13
	cmp	r14, rcx
	setl al
	movzx	eax, al
	mov	r13, rax
	; IR
	cmp	r13, 0
	jz	label121
	; IR
label120:
	; IR
	mov	rcx, qword [rbp-30*8]
	mov	r13, rcx
	; IR
	mov	rcx, 1
	add	qword [rbp-30*8], rcx
	; IR
	mov	rcx, r13
	mov	r14, rcx
	; IR
	mov	rcx, 3
	mov	rcx, rcx
	shl	r14 ,cl
	; IR
	mov	rcx, qword [rel static3]
	add	r14, rcx
	; IR
	mov	rcx, r12
	mov	r13, rcx
	; IR
	mov	rcx, 1
	add	r12, rcx
	; IR
	mov	rcx, r13
	mov	r13, rcx
	; IR
	mov	rcx, 3
	mov	rcx, rcx
	shl	r13 ,cl
	; IR
	mov	rcx, qword [rel static5]
	add	r13, rcx
	; IR
	mov	rcx, r13
	mov	rdx, qword [rcx]
	mov	r13, rdx
	; IR
	mov	rcx, r13
	mov	rdx, r14
	mov	qword [rdx], rcx
	; IR
	; 129
	; IR
	jmp	label122
	; IR
label121:
	; IR
	mov	rcx, qword [rbp-30*8]
	mov	r13, rcx
	; IR
	mov	rcx, 1
	add	qword [rbp-30*8], rcx
	; IR
	mov	rcx, r13
	mov	r14, rcx
	; IR
	mov	rcx, 3
	mov	rcx, rcx
	shl	r14 ,cl
	; IR
	mov	rcx, qword [rel static3]
	add	r14, rcx
	; IR
	mov	rcx, qword [rbp-29*8]
	mov	r13, rcx
	; IR
	mov	rcx, 1
	add	qword [rbp-29*8], rcx
	; IR
	mov	rcx, r13
	mov	r13, rcx
	; IR
	mov	rcx, 3
	mov	rcx, rcx
	shl	r13 ,cl
	; IR
	mov	rcx, qword [rel static6]
	add	r13, rcx
	; IR
	mov	rcx, r13
	mov	rdx, qword [rcx]
	mov	r13, rdx
	; IR
	mov	rcx, r13
	mov	rdx, r14
	mov	qword [rdx], rcx
	; IR
	; 131
	; IR
label122:
	; IR
label123:
	; IR
	jmp	label115
	; IR
label124:
	; IR
label125:
	; IR
	mov	rcx, qword [rbp-25*8]
	cmp	r12, rcx
	setl al
	movzx	eax, al
	mov	r13, rax
	; IR
	cmp	r13, 0
	jz	label128
	; IR
label126:
	; IR
	mov	rcx, qword [rbp-30*8]
	mov	r13, rcx
	; IR
	mov	rcx, 1
	add	qword [rbp-30*8], rcx
	; IR
	mov	rcx, r13
	mov	r14, rcx
	; IR
	mov	rcx, 3
	mov	rcx, rcx
	shl	r14 ,cl
	; IR
	mov	rcx, qword [rel static3]
	add	r14, rcx
	; IR
	mov	rcx, r12
	mov	r13, rcx
	; IR
	mov	rcx, 1
	add	r12, rcx
	; IR
	mov	rcx, r13
	mov	r13, rcx
	; IR
	mov	rcx, 3
	mov	rcx, rcx
	shl	r13 ,cl
	; IR
	mov	rcx, qword [rel static5]
	add	r13, rcx
	; IR
	mov	rcx, r13
	mov	rdx, qword [rcx]
	mov	r13, rdx
	; IR
	mov	rcx, r13
	mov	rdx, r14
	mov	qword [rdx], rcx
	; IR
	; 134
	; IR
label127:
	; IR
	jmp	label125
	; IR
label128:
	; IR
label129:
	; IR
	mov	rcx, qword [rbp-26*8]
	cmp	qword [rbp-29*8], rcx
	setl al
	movzx	eax, al
	mov	r13, rax
	; IR
	cmp	r13, 0
	jz	label132
	; IR
label130:
	; IR
	mov	rcx, qword [rbp-30*8]
	mov	r13, rcx
	; IR
	mov	rcx, 1
	add	qword [rbp-30*8], rcx
	; IR
	mov	rcx, r13
	mov	r14, rcx
	; IR
	mov	rcx, 3
	mov	rcx, rcx
	shl	r14 ,cl
	; IR
	mov	rcx, qword [rel static3]
	add	r14, rcx
	; IR
	mov	rcx, qword [rbp-29*8]
	mov	r13, rcx
	; IR
	mov	rcx, 1
	add	qword [rbp-29*8], rcx
	; IR
	mov	rcx, r13
	mov	r13, rcx
	; IR
	mov	rcx, 3
	mov	rcx, rcx
	shl	r13 ,cl
	; IR
	mov	rcx, qword [rel static6]
	add	r13, rcx
	; IR
	mov	rcx, r13
	mov	rdx, qword [rcx]
	mov	r13, rdx
	; IR
	mov	rcx, r13
	mov	rdx, r14
	mov	qword [rdx], rcx
	; IR
	; 136
	; IR
label131:
	; IR
	jmp	label129
	; IR
label132:
	; IR
	mov	rcx, qword [rbp-24*8]
	mov	r13, rcx
	; IR
	jmp	label133
	; IR
label133:
	; IR
	mov	rax, r13
	leave
	ret
	; IR
FUNCTION_heapsort:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 8008
	; IR
	mov	rcx, 0
	mov	qword [rbp-23*8], rcx
	; IR
	; 142
	; IR
	mov	rcx, 1
	mov	qword [rbp-24*8], rcx
	; IR
label134:
	; IR
	mov	rcx, qword [rel static2]
	cmp	qword [rbp-24*8], rcx
	setle al
	movzx	eax, al
	mov	r13, rax
	; IR
	cmp	r13, 0
	jz	label144
	; IR
label135:
	; IR
	mov	rcx, qword [rbp-24*8]
	mov	r14, rcx
	; IR
	mov	rcx, 3
	mov	rcx, rcx
	shl	r14 ,cl
	; IR
	mov	rcx, qword [rel static7]
	add	r14, rcx
	; IR
	mov	rcx, qword [rbp-24*8]
	mov	r13, rcx
	; IR
	mov	rcx, 3
	mov	rcx, rcx
	shl	r13 ,cl
	; IR
	mov	rcx, qword [rel static3]
	add	r13, rcx
	; IR
	mov	rcx, r13
	mov	rdx, qword [rcx]
	mov	r13, rdx
	; IR
	mov	rcx, r13
	mov	rdx, r14
	mov	qword [rdx], rcx
	; IR
	; 146
	; IR
	mov	rcx, qword [rbp-24*8]
	mov	r15, rcx
	; IR
	; 147
	; IR
label136:
	; IR
	mov	rcx, 1
	mov	r13, rcx
	; IR
	mov	rcx, r13
	cmp	r15, rcx
	setne al
	movzx	eax, al
	mov	r13, rax
	; IR
	cmp	r13, 0
	jz	label142
	; IR
label137:
	; IR
	mov	rcx, 1
	add	qword [rbp-23*8], rcx
	; IR
	; 149
	; IR
	mov	rcx, r15
	mov	r13, rcx
	; IR
	mov	rcx, 3
	mov	rcx, rcx
	shl	r13 ,cl
	; IR
	mov	rcx, qword [rel static7]
	add	r13, rcx
	; IR
	mov	rcx, r13
	mov	rdx, qword [rcx]
	mov	r14, rdx
	; IR
	mov	rcx, r15
	mov	r13, rcx
	; IR
	mov	rcx, 1
	mov	rcx, rcx
	sar	r13 ,cl
	; IR
	mov	rcx, r13
	mov	r13, rcx
	; IR
	mov	rcx, 3
	mov	rcx, rcx
	shl	r13 ,cl
	; IR
	mov	rcx, qword [rel static7]
	add	r13, rcx
	; IR
	mov	rcx, r13
	mov	rdx, qword [rcx]
	mov	r13, rdx
	; IR
	mov	rcx, r13
	cmp	r14, rcx
	setg al
	movzx	eax, al
	mov	r13, rax
	; IR
	cmp	r13, 0
	jz	label139
	; IR
label138:
	; IR
	jmp	label142
	; IR
	jmp	label140
	; IR
label139:
	; IR
label140:
	; IR
	mov	rcx, r15
	mov	r13, rcx
	; IR
	mov	rcx, 3
	mov	rcx, rcx
	shl	r13 ,cl
	; IR
	mov	rcx, qword [rel static7]
	add	r13, rcx
	; IR
	mov	rcx, r13
	mov	rdx, qword [rcx]
	mov	r13, rdx
	; IR
	mov	rcx, r13
	mov	r12, rcx
	; IR
	; 152
	; IR
	mov	rcx, r15
	mov	r14, rcx
	; IR
	mov	rcx, 3
	mov	rcx, rcx
	shl	r14 ,cl
	; IR
	mov	rcx, qword [rel static7]
	add	r14, rcx
	; IR
	mov	rcx, r15
	mov	r13, rcx
	; IR
	mov	rcx, 1
	mov	rcx, rcx
	sar	r13 ,cl
	; IR
	mov	rcx, r13
	mov	r13, rcx
	; IR
	mov	rcx, 3
	mov	rcx, rcx
	shl	r13 ,cl
	; IR
	mov	rcx, qword [rel static7]
	add	r13, rcx
	; IR
	mov	rcx, r13
	mov	rdx, qword [rcx]
	mov	r13, rdx
	; IR
	mov	rcx, r13
	mov	rdx, r14
	mov	qword [rdx], rcx
	; IR
	; 153
	; IR
	mov	rcx, r15
	mov	r13, rcx
	; IR
	mov	rcx, 1
	mov	rcx, rcx
	sar	r13 ,cl
	; IR
	mov	rcx, r13
	mov	r13, rcx
	; IR
	mov	rcx, 3
	mov	rcx, rcx
	shl	r13 ,cl
	; IR
	mov	rcx, qword [rel static7]
	add	r13, rcx
	; IR
	mov	rcx, r12
	mov	rdx, r13
	mov	qword [rdx], rcx
	; IR
	; 154
	; IR
	mov	rcx, r15
	mov	r13, rcx
	; IR
	mov	rcx, 1
	mov	rcx, rcx
	sar	r13 ,cl
	; IR
	mov	rcx, r13
	mov	r15, rcx
	; IR
	; 155
	; IR
label141:
	; IR
	jmp	label136
	; IR
label142:
	; IR
label143:
	; IR
	mov	rcx, 1
	add	qword [rbp-24*8], rcx
	; IR
	jmp	label134
	; IR
label144:
	; IR
	mov	rcx, qword [rel static2]
	mov	qword [rbp-26*8], rcx
	; IR
	; 158
	; IR
	mov	rcx, 1
	mov	qword [rbp-24*8], rcx
	; IR
label145:
	; IR
	mov	rcx, qword [rel static2]
	cmp	qword [rbp-24*8], rcx
	setle al
	movzx	eax, al
	mov	r13, rax
	; IR
	cmp	r13, 0
	jz	label161
	; IR
label146:
	; IR
	mov	rcx, qword [rbp-24*8]
	mov	r14, rcx
	; IR
	mov	rcx, 3
	mov	rcx, rcx
	shl	r14 ,cl
	; IR
	mov	rcx, qword [rel static3]
	add	r14, rcx
	; IR
	mov	rcx, 8
	mov	r13, rcx
	; IR
	mov	rcx, qword [rel static7]
	add	r13, rcx
	; IR
	mov	rcx, r13
	mov	rdx, qword [rcx]
	mov	r13, rdx
	; IR
	mov	rcx, r13
	mov	rdx, r14
	mov	qword [rdx], rcx
	; IR
	; 160
	; IR
	mov	rcx, 8
	mov	r14, rcx
	; IR
	mov	rcx, qword [rel static7]
	add	r14, rcx
	; IR
	mov	rcx, qword [rbp-26*8]
	mov	r13, rcx
	; IR
	mov	rcx, 1
	sub	qword [rbp-26*8], rcx
	; IR
	mov	rcx, r13
	mov	r13, rcx
	; IR
	mov	rcx, 3
	mov	rcx, rcx
	shl	r13 ,cl
	; IR
	mov	rcx, qword [rel static7]
	add	r13, rcx
	; IR
	mov	rcx, r13
	mov	rdx, qword [rcx]
	mov	r13, rdx
	; IR
	mov	rcx, r13
	mov	rdx, r14
	mov	qword [rdx], rcx
	; IR
	; 161
	; IR
	mov	rcx, 1
	mov	r10, rcx
	; IR
	; 162
	; IR
label147:
	; IR
	mov	rcx, r10
	mov	r13, rcx
	; IR
	mov	rcx, 1
	mov	rcx, rcx
	shl	r13 ,cl
	; IR
	mov	rcx, qword [rbp-26*8]
	cmp	r13, rcx
	setle al
	movzx	eax, al
	mov	r13, rax
	; IR
	cmp	r13, 0
	jz	label159
	; IR
label148:
	; IR
	mov	rcx, r10
	mov	r13, rcx
	; IR
	mov	rcx, 1
	mov	rcx, rcx
	shl	r13 ,cl
	; IR
	mov	rcx, r13
	mov	r12, rcx
	; IR
	; 164
	; IR
	mov	rcx, r12
	mov	r13, rcx
	; IR
	mov	rcx, 1
	add	r13, rcx
	; IR
	mov	rcx, r13
	mov	r15, rcx
	; IR
	; 165
	; IR
	mov	rcx, r12
	mov	r11, rcx
	; IR
	; 166
	; IR
	mov	rcx, qword [rbp-26*8]
	cmp	r15, rcx
	setle al
	movzx	eax, al
	mov	r13, rax
	; IR
	cmp	r13, 0
	jz	label153
	; IR
label149:
	; IR
	mov	rcx, 1
	add	qword [rbp-23*8], rcx
	; IR
	; 168
	; IR
	mov	rcx, r15
	mov	r13, rcx
	; IR
	mov	rcx, 3
	mov	rcx, rcx
	shl	r13 ,cl
	; IR
	mov	rcx, qword [rel static7]
	add	r13, rcx
	; IR
	mov	rcx, r13
	mov	rdx, qword [rcx]
	mov	r14, rdx
	; IR
	mov	rcx, r12
	mov	r13, rcx
	; IR
	mov	rcx, 3
	mov	rcx, rcx
	shl	r13 ,cl
	; IR
	mov	rcx, qword [rel static7]
	add	r13, rcx
	; IR
	mov	rcx, r13
	mov	rdx, qword [rcx]
	mov	r13, rdx
	; IR
	mov	rcx, r13
	cmp	r14, rcx
	setl al
	movzx	eax, al
	mov	r13, rax
	; IR
	cmp	r13, 0
	jz	label151
	; IR
label150:
	; IR
	mov	rcx, r15
	mov	r11, rcx
	; IR
	; 170
	; IR
	jmp	label152
	; IR
label151:
	; IR
label152:
	; IR
	jmp	label154
	; IR
label153:
	; IR
label154:
	; IR
	mov	rcx, 1
	add	qword [rbp-23*8], rcx
	; IR
	; 172
	; IR
	mov	rcx, r10
	mov	r13, rcx
	; IR
	mov	rcx, 3
	mov	rcx, rcx
	shl	r13 ,cl
	; IR
	mov	rcx, qword [rel static7]
	add	r13, rcx
	; IR
	mov	rcx, r13
	mov	rdx, qword [rcx]
	mov	r14, rdx
	; IR
	mov	rcx, r11
	mov	r13, rcx
	; IR
	mov	rcx, 3
	mov	rcx, rcx
	shl	r13 ,cl
	; IR
	mov	rcx, qword [rel static7]
	add	r13, rcx
	; IR
	mov	rcx, r13
	mov	rdx, qword [rcx]
	mov	r13, rdx
	; IR
	mov	rcx, r13
	cmp	r14, rcx
	setl al
	movzx	eax, al
	mov	r13, rax
	; IR
	cmp	r13, 0
	jz	label156
	; IR
label155:
	; IR
	jmp	label159
	; IR
	jmp	label157
	; IR
label156:
	; IR
label157:
	; IR
	mov	rcx, r10
	mov	r13, rcx
	; IR
	mov	rcx, 3
	mov	rcx, rcx
	shl	r13 ,cl
	; IR
	mov	rcx, qword [rel static7]
	add	r13, rcx
	; IR
	mov	rcx, r13
	mov	rdx, qword [rcx]
	mov	r13, rdx
	; IR
	mov	rcx, r13
	mov	r12, rcx
	; IR
	; 175
	; IR
	mov	rcx, r10
	mov	r14, rcx
	; IR
	mov	rcx, 3
	mov	rcx, rcx
	shl	r14 ,cl
	; IR
	mov	rcx, qword [rel static7]
	add	r14, rcx
	; IR
	mov	rcx, r11
	mov	r13, rcx
	; IR
	mov	rcx, 3
	mov	rcx, rcx
	shl	r13 ,cl
	; IR
	mov	rcx, qword [rel static7]
	add	r13, rcx
	; IR
	mov	rcx, r13
	mov	rdx, qword [rcx]
	mov	r13, rdx
	; IR
	mov	rcx, r13
	mov	rdx, r14
	mov	qword [rdx], rcx
	; IR
	; 176
	; IR
	mov	rcx, r11
	mov	r13, rcx
	; IR
	mov	rcx, 3
	mov	rcx, rcx
	shl	r13 ,cl
	; IR
	mov	rcx, qword [rel static7]
	add	r13, rcx
	; IR
	mov	rcx, r12
	mov	rdx, r13
	mov	qword [rdx], rcx
	; IR
	; 177
	; IR
	mov	rcx, r10
	mov	r12, rcx
	; IR
	; 178
	; IR
	mov	rcx, r11
	mov	r10, rcx
	; IR
	; 179
	; IR
	; 180
	; IR
label158:
	; IR
	jmp	label147
	; IR
label159:
	; IR
label160:
	; IR
	mov	rcx, 1
	add	qword [rbp-24*8], rcx
	; IR
	jmp	label145
	; IR
label161:
	; IR
	mov	rcx, qword [rbp-23*8]
	mov	r13, rcx
	; IR
	jmp	label162
	; IR
label162:
	; IR
	mov	rax, r13
	leave
	ret
	; IR
FUNCTION_main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 5448
	; IR
	call	FUNCTION_getInt
	add	rsp, 0
	mov	r13, rax
	; IR
	mov	rcx, r13
	mov	qword [rel static2], rcx
	; IR
	; 188
	; IR
	push	r13
	sub	rsp, 8
	call	FUNCTION_getInt
	add	rsp, 0
	add	rsp, 8
	pop	r13
	mov	r13, rax
	; IR
	mov	rcx, r13
	mov	r12, rcx
	; IR
	; 189
	; IR
	mov	rcx, 1
	mov	r15, rcx
	; IR
label163:
	; IR
	mov	rcx, qword [rel static2]
	cmp	r15, rcx
	setle al
	movzx	eax, al
	mov	r13, rax
	; IR
	cmp	r13, 0
	jz	label169
	; IR
label164:
	; IR
	mov	rcx, r15
	mov	r13, rcx
	; IR
	mov	rcx, 3
	mov	rcx, rcx
	shl	r13 ,cl
	; IR
	mov	rcx, qword [rel static3]
	add	r13, rcx
	; IR
	mov	rcx, r15
	mov	rdx, r13
	mov	qword [rdx], rcx
	; IR
	; 192
	; IR
	mov	rcx, r12
	cmp	r15, rcx
	setle al
	movzx	eax, al
	mov	r13, rax
	; IR
	cmp	r13, 0
	jz	label166
	; IR
label165:
	; IR
	mov	rcx, r15
	mov	r14, rcx
	; IR
	mov	rcx, 3
	mov	rcx, rcx
	shl	r14 ,cl
	; IR
	mov	rcx, qword [rel static3]
	add	r14, rcx
	; IR
	mov	rcx, r12
	mov	r13, rcx
	; IR
	mov	rcx, 1
	add	r13, rcx
	; IR
	mov	rcx, r13
	mov	r13, rcx
	; IR
	mov	rcx, r15
	sub	r13, rcx
	; IR
	mov	rcx, r13
	mov	rdx, r14
	mov	qword [rdx], rcx
	; IR
	; 194
	; IR
	jmp	label167
	; IR
label166:
	; IR
label167:
	; IR
	mov	rcx, r15
	mov	r14, rcx
	; IR
	mov	rcx, 3
	mov	rcx, rcx
	shl	r14 ,cl
	; IR
	mov	rcx, qword [rel static4]
	add	r14, rcx
	; IR
	mov	rcx, r15
	mov	r13, rcx
	; IR
	mov	rcx, 3
	mov	rcx, rcx
	shl	r13 ,cl
	; IR
	mov	rcx, qword [rel static3]
	add	r13, rcx
	; IR
	mov	rcx, r13
	mov	rdx, qword [rcx]
	mov	r13, rdx
	; IR
	mov	rcx, r13
	mov	rdx, r14
	mov	qword [rdx], rcx
	; IR
	; 196
	; IR
label168:
	; IR
	mov	rcx, 1
	add	r15, rcx
	; IR
	jmp	label163
	; IR
label169:
	; IR
	mov	rcx, 1
	mov	r13, rcx
	; IR
	mov	rcx, qword [rel static2]
	mov	r14, rcx
	; IR
	mov	rcx, 1
	add	r14, rcx
	; IR
	push	r13
	push	r12
	push	r14
	push	r15
	mov	rsi, r14
	mov	rdi, r13
	call	FUNCTION_quicksort
	add	rsp, 0
	pop	r15
	pop	r14
	pop	r12
	pop	r13
	mov	r13, rax
	; IR
	mov	rcx, r13
	mov	r15, rcx
	; IR
	; 198
	; IR
	push	r13
	push	r12
	push	r14
	push	r15
	call	FUNCTION_restore
	add	rsp, 0
	pop	r15
	pop	r14
	pop	r12
	pop	r13
	mov	qword [rbp-48*8], rax
	; IR
	; 200
	; IR
	push	r13
	push	r12
	push	r14
	push	r15
	call	FUNCTION_calc
	add	rsp, 0
	pop	r15
	pop	r14
	pop	r12
	pop	r13
	mov	r13, rax
	; IR
	mov	rcx, r13
	mov	r11, rcx
	; IR
	; 201
	; IR
	push	r13
	push	r12
	push	r14
	push	r15
	push	r11
	sub	rsp, 8
	call	FUNCTION_restore
	add	rsp, 0
	add	rsp, 8
	pop	r11
	pop	r15
	pop	r14
	pop	r12
	pop	r13
	mov	qword [rbp-50*8], rax
	; IR
	; 203
	; IR
	mov	rcx, 1
	mov	r13, rcx
	; IR
	mov	rcx, qword [rel static2]
	mov	r14, rcx
	; IR
	mov	rcx, 1
	add	r14, rcx
	; IR
	push	r13
	push	r12
	push	r14
	push	r15
	push	r11
	sub	rsp, 8
	mov	rsi, r14
	mov	rdi, r13
	call	FUNCTION_mergesort
	add	rsp, 0
	add	rsp, 8
	pop	r11
	pop	r15
	pop	r14
	pop	r12
	pop	r13
	mov	r13, rax
	; IR
	mov	rcx, r13
	mov	r14, rcx
	; IR
	; 204
	; IR
	push	r13
	push	r12
	push	r14
	push	r15
	push	r11
	sub	rsp, 8
	call	FUNCTION_restore
	add	rsp, 0
	add	rsp, 8
	pop	r11
	pop	r15
	pop	r14
	pop	r12
	pop	r13
	mov	qword [rbp-55*8], rax
	; IR
	; 206
	; IR
	push	r13
	push	r12
	push	r14
	push	r15
	push	r11
	sub	rsp, 8
	call	FUNCTION_heapsort
	add	rsp, 0
	add	rsp, 8
	pop	r11
	pop	r15
	pop	r14
	pop	r12
	pop	r13
	mov	r13, rax
	; IR
	mov	rcx, r13
	mov	r12, rcx
	; IR
	; 207
	; IR
	push	r13
	push	r12
	push	r14
	push	r15
	push	r11
	sub	rsp, 8
	mov	rdi, r15
	call	FUNCTION_toString
	add	rsp, 0
	add	rsp, 8
	pop	r11
	pop	r15
	pop	r14
	pop	r12
	pop	r13
	mov	r13, rax
	; IR
	push	r13
	push	r12
	push	r14
	push	r15
	push	r11
	sub	rsp, 8
	mov	rdi, r13
	call	FUNCTION_println
	add	rsp, 0
	add	rsp, 8
	pop	r11
	pop	r15
	pop	r14
	pop	r12
	pop	r13
	mov	qword [rbp-58*8], rax
	; IR
	; 209
	; IR
	push	r13
	push	r12
	push	r14
	push	r15
	push	r11
	sub	rsp, 8
	mov	rdi, r11
	call	FUNCTION_toString
	add	rsp, 0
	add	rsp, 8
	pop	r11
	pop	r15
	pop	r14
	pop	r12
	pop	r13
	mov	r13, rax
	; IR
	push	r13
	push	r12
	push	r14
	push	r15
	push	r11
	sub	rsp, 8
	mov	rdi, r13
	call	FUNCTION_println
	add	rsp, 0
	add	rsp, 8
	pop	r11
	pop	r15
	pop	r14
	pop	r12
	pop	r13
	mov	qword [rbp-60*8], rax
	; IR
	; 210
	; IR
	push	r13
	push	r12
	push	r14
	push	r15
	push	r11
	sub	rsp, 8
	mov	rdi, r14
	call	FUNCTION_toString
	add	rsp, 0
	add	rsp, 8
	pop	r11
	pop	r15
	pop	r14
	pop	r12
	pop	r13
	mov	r13, rax
	; IR
	push	r13
	push	r12
	push	r14
	push	r15
	push	r11
	sub	rsp, 8
	mov	rdi, r13
	call	FUNCTION_println
	add	rsp, 0
	add	rsp, 8
	pop	r11
	pop	r15
	pop	r14
	pop	r12
	pop	r13
	mov	qword [rbp-62*8], rax
	; IR
	; 211
	; IR
	push	r13
	push	r12
	push	r14
	push	r15
	push	r11
	sub	rsp, 8
	mov	rdi, r12
	call	FUNCTION_toString
	add	rsp, 0
	add	rsp, 8
	pop	r11
	pop	r15
	pop	r14
	pop	r12
	pop	r13
	mov	r13, rax
	; IR
	push	r13
	push	r12
	push	r14
	push	r15
	push	r11
	sub	rsp, 8
	mov	rdi, r13
	call	FUNCTION_println
	add	rsp, 0
	add	rsp, 8
	pop	r11
	pop	r15
	pop	r14
	pop	r12
	pop	r13
	mov	qword [rbp-64*8], rax
	; IR
	; 212
	; IR
	mov	rcx, 16
	push	r13
	push	r12
	push	r14
	push	r15
	push	r11
	sub	rsp, 8
	mov	rdi, rcx
	call	malloc
	add	rsp, 8
	pop	r11
	pop	r15
	pop	r14
	pop	r12
	pop	r13
	mov	r13, rax
	; IR
	push	r13
	push	r12
	push	r14
	push	r15
	push	r11
	sub	rsp, 8
	mov	rdi, r13
	call	CLASS_A_MEMBER_A
	add	rsp, 0
	add	rsp, 8
	pop	r11
	pop	r15
	pop	r14
	pop	r12
	pop	r13
	mov	qword [rbp-66*8], rax
	; IR
	mov	rcx, r13
	mov	r13, rcx
	; IR
	; 213
	; IR
	push	r13
	push	r12
	push	r14
	push	r15
	push	r11
	sub	rsp, 8
	mov	rdi, r13
	call	CLASS_A_MEMBER_Optimizer
	add	rsp, 0
	add	rsp, 8
	pop	r11
	pop	r15
	pop	r14
	pop	r12
	pop	r13
	mov	qword [rbp-67*8], rax
	; IR
	; 214
	; IR
	mov	rcx, 0
	mov	r13, rcx
	; IR
	jmp	label170
	; IR
label170:
	; IR
	mov	rax, r13
	leave
	ret
	; IR
label171:
	; IR
	SECTION .data
	SECTION .bss
	static1:	resq	1
	static3:	resq	1
	static4:	resq	1
	static5:	resq	1
	static6:	resq	1
	static7:	resq	1
	static2:	resq	1
	static0:	resq	1
	SECTION .rodata
	L_022:	db 25H, 73H, 00H
