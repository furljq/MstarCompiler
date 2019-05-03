	default rel
	global main
	global CLASS_point_MEMBER_point
	global CLASS_point_MEMBER_set
	global CLASS_point_MEMBER_sqrLen
	global CLASS_point_MEMBER_sqrDis
	global CLASS_point_MEMBER_dot
	global CLASS_point_MEMBER_cross
	global CLASS_point_MEMBER_add
	global CLASS_point_MEMBER_sub
	global CLASS_point_MEMBER_printPoint
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
CLASS_point_MEMBER_point:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 104
	mov	qword [rbp-1*8], com.fur.nasm.register.NASMRegister@7364985f
	mov	qword [rbp-2*8], 0
	mov	qword [rbp-1*8], 0
	mov	qword [rbp-3*8], 1
	mov	r8, qword [rbp-1*8]
	add	qword [rbp-4*8], r8
	mov	r8, qword [rbp-3*8]
	add	qword [rbp-4*8], r8
	mov	r8, qword [rbp-4*8]
	null	r8, r8
	mov	qword [rbp-5*8], 0
	mov	r8, qword [rbp-5*8]
	mov	qword [rbp-4*8], r8
	mov	qword [rbp-6*8], 2
	mov	r8, qword [rbp-1*8]
	add	qword [rbp-7*8], r8
	mov	r8, qword [rbp-6*8]
	add	qword [rbp-7*8], r8
	mov	r8, qword [rbp-7*8]
	null	r8, r8
	mov	qword [rbp-8*8], 0
	mov	r8, qword [rbp-8*8]
	mov	qword [rbp-7*8], r8
	mov	qword [rbp-9*8], 3
	mov	r8, qword [rbp-1*8]
	add	qword [rbp-10*8], r8
	mov	r8, qword [rbp-9*8]
	add	qword [rbp-10*8], r8
	mov	r8, qword [rbp-10*8]
	null	r8, r8
	mov	qword [rbp-11*8], 0
	mov	r8, qword [rbp-11*8]
	mov	qword [rbp-10*8], r8
LABEL0:
	mov	rax, qword [rbp-12*8]
	leave
	ret
CLASS_point_MEMBER_set:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 104
	mov	qword [rbp-1*8], com.fur.nasm.register.NASMRegister@7364985f
	mov	qword [rbp-2*8], com.fur.nasm.register.NASMRegister@36f0f1be
	mov	qword [rbp-3*8], com.fur.nasm.register.NASMRegister@157632c9
	mov	qword [rbp-4*8], com.fur.nasm.register.NASMRegister@6ee12bac
	mov	qword [rbp-5*8], 0
	mov	qword [rbp-1*8], 0
	mov	qword [rbp-2*8], 0
	mov	qword [rbp-3*8], 0
	mov	qword [rbp-4*8], 0
	mov	qword [rbp-6*8], 1
	mov	r8, qword [rbp-1*8]
	add	qword [rbp-7*8], r8
	mov	r8, qword [rbp-6*8]
	add	qword [rbp-7*8], r8
	mov	r8, qword [rbp-7*8]
	null	r8, r8
	mov	r8, qword [rbp-2*8]
	mov	qword [rbp-7*8], r8
	mov	qword [rbp-8*8], 2
	mov	r8, qword [rbp-1*8]
	add	qword [rbp-9*8], r8
	mov	r8, qword [rbp-8*8]
	add	qword [rbp-9*8], r8
	mov	r8, qword [rbp-9*8]
	null	r8, r8
	mov	r8, qword [rbp-3*8]
	mov	qword [rbp-9*8], r8
	mov	qword [rbp-10*8], 3
	mov	r8, qword [rbp-1*8]
	add	qword [rbp-11*8], r8
	mov	r8, qword [rbp-10*8]
	add	qword [rbp-11*8], r8
	mov	r8, qword [rbp-11*8]
	null	r8, r8
	mov	r8, qword [rbp-4*8]
	mov	qword [rbp-11*8], r8
LABEL1:
	mov	rax, qword [rbp-12*8]
	leave
	ret
CLASS_point_MEMBER_sqrLen:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 168
	mov	qword [rbp-1*8], com.fur.nasm.register.NASMRegister@7364985f
	mov	qword [rbp-2*8], 0
	mov	qword [rbp-1*8], 0
	mov	qword [rbp-3*8], 1
	mov	r8, qword [rbp-1*8]
	add	qword [rbp-4*8], r8
	mov	r8, qword [rbp-3*8]
	add	qword [rbp-4*8], r8
	mov	r8, qword [rbp-4*8]
	null	r8, r8
	mov	r8, qword [rbp-4*8]
	mov	qword [rbp-5*8], r8
	mov	qword [rbp-6*8], 1
	mov	r8, qword [rbp-1*8]
	add	qword [rbp-7*8], r8
	mov	r8, qword [rbp-6*8]
	add	qword [rbp-7*8], r8
	mov	r8, qword [rbp-7*8]
	null	r8, r8
	mov	r8, qword [rbp-7*8]
	imul	qword [rbp-5*8], r8
	mov	r8, qword [rbp-5*8]
	mov	qword [rbp-8*8], r8
	mov	qword [rbp-9*8], 2
	mov	r8, qword [rbp-1*8]
	add	qword [rbp-10*8], r8
	mov	r8, qword [rbp-9*8]
	add	qword [rbp-10*8], r8
	mov	r8, qword [rbp-10*8]
	null	r8, r8
	mov	r8, qword [rbp-10*8]
	mov	qword [rbp-11*8], r8
	mov	qword [rbp-12*8], 2
	mov	r8, qword [rbp-1*8]
	add	qword [rbp-13*8], r8
	mov	r8, qword [rbp-12*8]
	add	qword [rbp-13*8], r8
	mov	r8, qword [rbp-13*8]
	null	r8, r8
	mov	r8, qword [rbp-13*8]
	imul	qword [rbp-11*8], r8
	mov	r8, qword [rbp-11*8]
	add	qword [rbp-8*8], r8
	mov	r8, qword [rbp-8*8]
	mov	qword [rbp-14*8], r8
	mov	qword [rbp-15*8], 3
	mov	r8, qword [rbp-1*8]
	add	qword [rbp-16*8], r8
	mov	r8, qword [rbp-15*8]
	add	qword [rbp-16*8], r8
	mov	r8, qword [rbp-16*8]
	null	r8, r8
	mov	r8, qword [rbp-16*8]
	mov	qword [rbp-17*8], r8
	mov	qword [rbp-18*8], 3
	mov	r8, qword [rbp-1*8]
	add	qword [rbp-19*8], r8
	mov	r8, qword [rbp-18*8]
	add	qword [rbp-19*8], r8
	mov	r8, qword [rbp-19*8]
	null	r8, r8
	mov	r8, qword [rbp-19*8]
	imul	qword [rbp-17*8], r8
	mov	r8, qword [rbp-17*8]
	add	qword [rbp-14*8], r8
	mov	r8, qword [rbp-14*8]
	mov	qword [rbp-20*8], r8
	jmp	LABEL2
LABEL2:
	mov	rax, qword [rbp-20*8]
	leave
	ret
CLASS_point_MEMBER_sqrDis:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 272
	mov	qword [rbp-1*8], com.fur.nasm.register.NASMRegister@7364985f
	mov	qword [rbp-2*8], com.fur.nasm.register.NASMRegister@36f0f1be
	mov	qword [rbp-3*8], 0
	mov	qword [rbp-1*8], 0
	mov	qword [rbp-2*8], 0
	mov	qword [rbp-4*8], 1
	mov	r8, qword [rbp-1*8]
	add	qword [rbp-5*8], r8
	mov	r8, qword [rbp-4*8]
	add	qword [rbp-5*8], r8
	mov	r8, qword [rbp-5*8]
	null	r8, r8
	mov	r8, qword [rbp-5*8]
	mov	qword [rbp-6*8], r8
	mov	r8, qword [rbp-2*8]
	add	qword [rbp-7*8], r8
	add	qword [rbp-7*8], 1
	mov	r8, qword [rbp-7*8]
	sub	qword [rbp-6*8], r8
	mov	r8, qword [rbp-6*8]
	mov	qword [rbp-8*8], r8
	mov	qword [rbp-9*8], 1
	mov	r8, qword [rbp-1*8]
	add	qword [rbp-10*8], r8
	mov	r8, qword [rbp-9*8]
	add	qword [rbp-10*8], r8
	mov	r8, qword [rbp-10*8]
	null	r8, r8
	mov	r8, qword [rbp-10*8]
	mov	qword [rbp-11*8], r8
	mov	r8, qword [rbp-2*8]
	add	qword [rbp-12*8], r8
	add	qword [rbp-12*8], 1
	mov	r8, qword [rbp-12*8]
	sub	qword [rbp-11*8], r8
	mov	r8, qword [rbp-11*8]
	imul	qword [rbp-8*8], r8
	mov	r8, qword [rbp-8*8]
	mov	qword [rbp-13*8], r8
	mov	qword [rbp-14*8], 2
	mov	r8, qword [rbp-1*8]
	add	qword [rbp-15*8], r8
	mov	r8, qword [rbp-14*8]
	add	qword [rbp-15*8], r8
	mov	r8, qword [rbp-15*8]
	null	r8, r8
	mov	r8, qword [rbp-15*8]
	mov	qword [rbp-16*8], r8
	mov	r8, qword [rbp-2*8]
	add	qword [rbp-17*8], r8
	add	qword [rbp-17*8], 2
	mov	r8, qword [rbp-17*8]
	sub	qword [rbp-16*8], r8
	mov	r8, qword [rbp-16*8]
	mov	qword [rbp-18*8], r8
	mov	qword [rbp-19*8], 2
	mov	r8, qword [rbp-1*8]
	add	qword [rbp-20*8], r8
	mov	r8, qword [rbp-19*8]
	add	qword [rbp-20*8], r8
	mov	r8, qword [rbp-20*8]
	null	r8, r8
	mov	r8, qword [rbp-20*8]
	mov	qword [rbp-21*8], r8
	mov	r8, qword [rbp-2*8]
	add	qword [rbp-22*8], r8
	add	qword [rbp-22*8], 2
	mov	r8, qword [rbp-22*8]
	sub	qword [rbp-21*8], r8
	mov	r8, qword [rbp-21*8]
	imul	qword [rbp-18*8], r8
	mov	r8, qword [rbp-18*8]
	add	qword [rbp-13*8], r8
	mov	r8, qword [rbp-13*8]
	mov	qword [rbp-23*8], r8
	mov	qword [rbp-24*8], 3
	mov	r8, qword [rbp-1*8]
	add	qword [rbp-25*8], r8
	mov	r8, qword [rbp-24*8]
	add	qword [rbp-25*8], r8
	mov	r8, qword [rbp-25*8]
	null	r8, r8
	mov	r8, qword [rbp-25*8]
	mov	qword [rbp-26*8], r8
	mov	r8, qword [rbp-2*8]
	add	qword [rbp-27*8], r8
	add	qword [rbp-27*8], 3
	mov	r8, qword [rbp-27*8]
	sub	qword [rbp-26*8], r8
	mov	r8, qword [rbp-26*8]
	mov	qword [rbp-28*8], r8
	mov	qword [rbp-29*8], 3
	mov	r8, qword [rbp-1*8]
	add	qword [rbp-30*8], r8
	mov	r8, qword [rbp-29*8]
	add	qword [rbp-30*8], r8
	mov	r8, qword [rbp-30*8]
	null	r8, r8
	mov	r8, qword [rbp-30*8]
	mov	qword [rbp-31*8], r8
	mov	r8, qword [rbp-2*8]
	add	qword [rbp-32*8], r8
	add	qword [rbp-32*8], 3
	mov	r8, qword [rbp-32*8]
	sub	qword [rbp-31*8], r8
	mov	r8, qword [rbp-31*8]
	imul	qword [rbp-28*8], r8
	mov	r8, qword [rbp-28*8]
	add	qword [rbp-23*8], r8
	mov	r8, qword [rbp-23*8]
	mov	qword [rbp-33*8], r8
	jmp	LABEL3
LABEL3:
	mov	rax, qword [rbp-33*8]
	leave
	ret
CLASS_point_MEMBER_dot:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 152
	mov	qword [rbp-1*8], com.fur.nasm.register.NASMRegister@7364985f
	mov	qword [rbp-2*8], com.fur.nasm.register.NASMRegister@36f0f1be
	mov	qword [rbp-3*8], 0
	mov	qword [rbp-1*8], 0
	mov	qword [rbp-2*8], 0
	mov	qword [rbp-4*8], 1
	mov	r8, qword [rbp-1*8]
	add	qword [rbp-5*8], r8
	mov	r8, qword [rbp-4*8]
	add	qword [rbp-5*8], r8
	mov	r8, qword [rbp-5*8]
	null	r8, r8
	mov	r8, qword [rbp-5*8]
	mov	qword [rbp-6*8], r8
	mov	r8, qword [rbp-2*8]
	add	qword [rbp-7*8], r8
	add	qword [rbp-7*8], 1
	mov	r8, qword [rbp-7*8]
	imul	qword [rbp-6*8], r8
	mov	r8, qword [rbp-6*8]
	mov	qword [rbp-8*8], r8
	mov	qword [rbp-9*8], 2
	mov	r8, qword [rbp-1*8]
	add	qword [rbp-10*8], r8
	mov	r8, qword [rbp-9*8]
	add	qword [rbp-10*8], r8
	mov	r8, qword [rbp-10*8]
	null	r8, r8
	mov	r8, qword [rbp-10*8]
	mov	qword [rbp-11*8], r8
	mov	r8, qword [rbp-2*8]
	add	qword [rbp-12*8], r8
	add	qword [rbp-12*8], 2
	mov	r8, qword [rbp-12*8]
	imul	qword [rbp-11*8], r8
	mov	r8, qword [rbp-11*8]
	add	qword [rbp-8*8], r8
	mov	r8, qword [rbp-8*8]
	mov	qword [rbp-13*8], r8
	mov	qword [rbp-14*8], 3
	mov	r8, qword [rbp-1*8]
	add	qword [rbp-15*8], r8
	mov	r8, qword [rbp-14*8]
	add	qword [rbp-15*8], r8
	mov	r8, qword [rbp-15*8]
	null	r8, r8
	mov	r8, qword [rbp-15*8]
	mov	qword [rbp-16*8], r8
	mov	r8, qword [rbp-2*8]
	add	qword [rbp-17*8], r8
	add	qword [rbp-17*8], 3
	mov	r8, qword [rbp-17*8]
	imul	qword [rbp-16*8], r8
	mov	r8, qword [rbp-16*8]
	add	qword [rbp-13*8], r8
	mov	r8, qword [rbp-13*8]
	mov	qword [rbp-18*8], r8
	jmp	LABEL4
LABEL4:
	mov	rax, qword [rbp-18*8]
	leave
	ret
CLASS_point_MEMBER_cross:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 272
	mov	qword [rbp-1*8], com.fur.nasm.register.NASMRegister@7364985f
	mov	qword [rbp-2*8], com.fur.nasm.register.NASMRegister@36f0f1be
	mov	qword [rbp-3*8], 0
	mov	qword [rbp-1*8], 0
	mov	qword [rbp-2*8], 0
	mov	qword [rbp-4*8], 0
	mov	qword [rbp-5*8], 2
	mov	r8, qword [rbp-1*8]
	add	qword [rbp-6*8], r8
	mov	r8, qword [rbp-5*8]
	add	qword [rbp-6*8], r8
	mov	r8, qword [rbp-6*8]
	null	r8, r8
	mov	r8, qword [rbp-6*8]
	mov	qword [rbp-7*8], r8
	mov	r8, qword [rbp-2*8]
	add	qword [rbp-8*8], r8
	add	qword [rbp-8*8], 3
	mov	r8, qword [rbp-8*8]
	imul	qword [rbp-7*8], r8
	mov	r8, qword [rbp-7*8]
	mov	qword [rbp-9*8], r8
	mov	qword [rbp-10*8], 3
	mov	r8, qword [rbp-1*8]
	add	qword [rbp-11*8], r8
	mov	r8, qword [rbp-10*8]
	add	qword [rbp-11*8], r8
	mov	r8, qword [rbp-11*8]
	null	r8, r8
	mov	r8, qword [rbp-11*8]
	mov	qword [rbp-12*8], r8
	mov	r8, qword [rbp-2*8]
	add	qword [rbp-13*8], r8
	add	qword [rbp-13*8], 2
	mov	r8, qword [rbp-13*8]
	imul	qword [rbp-12*8], r8
	mov	r8, qword [rbp-12*8]
	sub	qword [rbp-9*8], r8
	mov	qword [rbp-14*8], 3
	mov	r8, qword [rbp-1*8]
	add	qword [rbp-15*8], r8
	mov	r8, qword [rbp-14*8]
	add	qword [rbp-15*8], r8
	mov	r8, qword [rbp-15*8]
	null	r8, r8
	mov	r8, qword [rbp-15*8]
	mov	qword [rbp-16*8], r8
	mov	r8, qword [rbp-2*8]
	add	qword [rbp-17*8], r8
	add	qword [rbp-17*8], 1
	mov	r8, qword [rbp-17*8]
	imul	qword [rbp-16*8], r8
	mov	r8, qword [rbp-16*8]
	mov	qword [rbp-18*8], r8
	mov	qword [rbp-19*8], 1
	mov	r8, qword [rbp-1*8]
	add	qword [rbp-20*8], r8
	mov	r8, qword [rbp-19*8]
	add	qword [rbp-20*8], r8
	mov	r8, qword [rbp-20*8]
	null	r8, r8
	mov	r8, qword [rbp-20*8]
	mov	qword [rbp-21*8], r8
	mov	r8, qword [rbp-2*8]
	add	qword [rbp-22*8], r8
	add	qword [rbp-22*8], 3
	mov	r8, qword [rbp-22*8]
	imul	qword [rbp-21*8], r8
	mov	r8, qword [rbp-21*8]
	sub	qword [rbp-18*8], r8
	mov	qword [rbp-23*8], 1
	mov	r8, qword [rbp-1*8]
	add	qword [rbp-24*8], r8
	mov	r8, qword [rbp-23*8]
	add	qword [rbp-24*8], r8
	mov	r8, qword [rbp-24*8]
	null	r8, r8
	mov	r8, qword [rbp-24*8]
	mov	qword [rbp-25*8], r8
	mov	r8, qword [rbp-2*8]
	add	qword [rbp-26*8], r8
	add	qword [rbp-26*8], 2
	mov	r8, qword [rbp-26*8]
	imul	qword [rbp-25*8], r8
	mov	r8, qword [rbp-25*8]
	mov	qword [rbp-27*8], r8
	mov	qword [rbp-28*8], 2
	mov	r8, qword [rbp-1*8]
	add	qword [rbp-29*8], r8
	mov	r8, qword [rbp-28*8]
	add	qword [rbp-29*8], r8
	mov	r8, qword [rbp-29*8]
	null	r8, r8
	mov	r8, qword [rbp-29*8]
	mov	qword [rbp-30*8], r8
	mov	r8, qword [rbp-2*8]
	add	qword [rbp-31*8], r8
	add	qword [rbp-31*8], 1
	mov	r8, qword [rbp-31*8]
	imul	qword [rbp-30*8], r8
	mov	r8, qword [rbp-30*8]
	sub	qword [rbp-27*8], r8
	mov	rcx, qword [rbp-27*8]
	mov	rdx, qword [rbp-18*8]
	mov	rsi, qword [rbp-9*8]
	mov	rdi, qword [rbp-4*8]
	call	CLASS_point_MEMBER_set
	mov	qword [rbp-32*8], rax
	mov	r8, qword [rbp-4*8]
	mov	qword [rbp-33*8], r8
	jmp	LABEL5
LABEL5:
	mov	rax, qword [rbp-33*8]
	leave
	ret
CLASS_point_MEMBER_add:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 184
	mov	qword [rbp-1*8], com.fur.nasm.register.NASMRegister@7364985f
	mov	qword [rbp-2*8], com.fur.nasm.register.NASMRegister@36f0f1be
	mov	qword [rbp-3*8], 0
	mov	qword [rbp-1*8], 0
	mov	qword [rbp-2*8], 0
	mov	qword [rbp-4*8], 1
	mov	r8, qword [rbp-1*8]
	add	qword [rbp-5*8], r8
	mov	r8, qword [rbp-4*8]
	add	qword [rbp-5*8], r8
	mov	r8, qword [rbp-5*8]
	null	r8, r8
	mov	qword [rbp-6*8], 1
	mov	r8, qword [rbp-1*8]
	add	qword [rbp-7*8], r8
	mov	r8, qword [rbp-6*8]
	add	qword [rbp-7*8], r8
	mov	r8, qword [rbp-7*8]
	null	r8, r8
	mov	r8, qword [rbp-7*8]
	mov	qword [rbp-8*8], r8
	mov	r8, qword [rbp-2*8]
	add	qword [rbp-9*8], r8
	add	qword [rbp-9*8], 1
	mov	r8, qword [rbp-9*8]
	add	qword [rbp-8*8], r8
	mov	r8, qword [rbp-8*8]
	mov	qword [rbp-5*8], r8
	mov	qword [rbp-10*8], 2
	mov	r8, qword [rbp-1*8]
	add	qword [rbp-11*8], r8
	mov	r8, qword [rbp-10*8]
	add	qword [rbp-11*8], r8
	mov	r8, qword [rbp-11*8]
	null	r8, r8
	mov	qword [rbp-12*8], 2
	mov	r8, qword [rbp-1*8]
	add	qword [rbp-13*8], r8
	mov	r8, qword [rbp-12*8]
	add	qword [rbp-13*8], r8
	mov	r8, qword [rbp-13*8]
	null	r8, r8
	mov	r8, qword [rbp-13*8]
	mov	qword [rbp-14*8], r8
	mov	r8, qword [rbp-2*8]
	add	qword [rbp-15*8], r8
	add	qword [rbp-15*8], 2
	mov	r8, qword [rbp-15*8]
	add	qword [rbp-14*8], r8
	mov	r8, qword [rbp-14*8]
	mov	qword [rbp-11*8], r8
	mov	qword [rbp-16*8], 3
	mov	r8, qword [rbp-1*8]
	add	qword [rbp-17*8], r8
	mov	r8, qword [rbp-16*8]
	add	qword [rbp-17*8], r8
	mov	r8, qword [rbp-17*8]
	null	r8, r8
	mov	qword [rbp-18*8], 3
	mov	r8, qword [rbp-1*8]
	add	qword [rbp-19*8], r8
	mov	r8, qword [rbp-18*8]
	add	qword [rbp-19*8], r8
	mov	r8, qword [rbp-19*8]
	null	r8, r8
	mov	r8, qword [rbp-19*8]
	mov	qword [rbp-20*8], r8
	mov	r8, qword [rbp-2*8]
	add	qword [rbp-21*8], r8
	add	qword [rbp-21*8], 3
	mov	r8, qword [rbp-21*8]
	add	qword [rbp-20*8], r8
	mov	r8, qword [rbp-20*8]
	mov	qword [rbp-17*8], r8
LABEL6:
	mov	rax, qword [rbp-22*8]
	leave
	ret
CLASS_point_MEMBER_sub:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 184
	mov	qword [rbp-1*8], com.fur.nasm.register.NASMRegister@7364985f
	mov	qword [rbp-2*8], com.fur.nasm.register.NASMRegister@36f0f1be
	mov	qword [rbp-3*8], 0
	mov	qword [rbp-1*8], 0
	mov	qword [rbp-2*8], 0
	mov	qword [rbp-4*8], 1
	mov	r8, qword [rbp-1*8]
	add	qword [rbp-5*8], r8
	mov	r8, qword [rbp-4*8]
	add	qword [rbp-5*8], r8
	mov	r8, qword [rbp-5*8]
	null	r8, r8
	mov	qword [rbp-6*8], 1
	mov	r8, qword [rbp-1*8]
	add	qword [rbp-7*8], r8
	mov	r8, qword [rbp-6*8]
	add	qword [rbp-7*8], r8
	mov	r8, qword [rbp-7*8]
	null	r8, r8
	mov	r8, qword [rbp-7*8]
	mov	qword [rbp-8*8], r8
	mov	r8, qword [rbp-2*8]
	add	qword [rbp-9*8], r8
	add	qword [rbp-9*8], 1
	mov	r8, qword [rbp-9*8]
	sub	qword [rbp-8*8], r8
	mov	r8, qword [rbp-8*8]
	mov	qword [rbp-5*8], r8
	mov	qword [rbp-10*8], 2
	mov	r8, qword [rbp-1*8]
	add	qword [rbp-11*8], r8
	mov	r8, qword [rbp-10*8]
	add	qword [rbp-11*8], r8
	mov	r8, qword [rbp-11*8]
	null	r8, r8
	mov	qword [rbp-12*8], 2
	mov	r8, qword [rbp-1*8]
	add	qword [rbp-13*8], r8
	mov	r8, qword [rbp-12*8]
	add	qword [rbp-13*8], r8
	mov	r8, qword [rbp-13*8]
	null	r8, r8
	mov	r8, qword [rbp-13*8]
	mov	qword [rbp-14*8], r8
	mov	r8, qword [rbp-2*8]
	add	qword [rbp-15*8], r8
	add	qword [rbp-15*8], 2
	mov	r8, qword [rbp-15*8]
	sub	qword [rbp-14*8], r8
	mov	r8, qword [rbp-14*8]
	mov	qword [rbp-11*8], r8
	mov	qword [rbp-16*8], 3
	mov	r8, qword [rbp-1*8]
	add	qword [rbp-17*8], r8
	mov	r8, qword [rbp-16*8]
	add	qword [rbp-17*8], r8
	mov	r8, qword [rbp-17*8]
	null	r8, r8
	mov	qword [rbp-18*8], 3
	mov	r8, qword [rbp-1*8]
	add	qword [rbp-19*8], r8
	mov	r8, qword [rbp-18*8]
	add	qword [rbp-19*8], r8
	mov	r8, qword [rbp-19*8]
	null	r8, r8
	mov	r8, qword [rbp-19*8]
	mov	qword [rbp-20*8], r8
	mov	r8, qword [rbp-2*8]
	add	qword [rbp-21*8], r8
	add	qword [rbp-21*8], 3
	mov	r8, qword [rbp-21*8]
	sub	qword [rbp-20*8], r8
	mov	r8, qword [rbp-20*8]
	mov	qword [rbp-17*8], r8
LABEL7:
	mov	rax, qword [rbp-22*8]
	leave
	ret
CLASS_point_MEMBER_printPoint:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 224
	mov	qword [rbp-1*8], com.fur.nasm.register.NASMRegister@7364985f
	mov	qword [rbp-2*8], 0
	mov	qword [rbp-1*8], 0
	mov	rdi, 10
	call	malloc
	mov	qword [rbp-3*8], rax
	mov	r8, qword [rbp-3*8]
	mov	r9, 1
	mov	qword [r8], r9
	add	r8, 8
	mov	qword [rbp-3*8], r8
	mov	r8, qword [rbp-3*8]
	mov	qword [rbp-4*8], r8
	add	qword [rbp-4*8], 0
	mov	r8, qword [rbp-4*8]
	mov	r9, 40
	mov	[r8], r9
	mov	qword [rbp-5*8], 1
	mov	qword [rbp-4*8], r8
	mov	r8, qword [rbp-1*8]
	add	qword [rbp-6*8], r8
	mov	r8, qword [rbp-5*8]
	add	qword [rbp-6*8], r8
	mov	r8, qword [rbp-6*8]
	null	r8, r8
	mov	rdi, qword [rbp-6*8]
	call	FUNCTION_toString
	mov	qword [rbp-7*8], rax
	mov	rsi, qword [rbp-7*8]
	mov	rdi, qword [rbp-3*8]
	call	FUNCTION_string_concat
	mov	qword [rbp-8*8], rax
	mov	r8, qword [rbp-8*8]
	mov	qword [rbp-9*8], r8
	mov	rdi, 11
	call	malloc
	mov	qword [rbp-10*8], rax
	mov	r8, qword [rbp-10*8]
	mov	r9, 2
	mov	qword [r8], r9
	add	r8, 8
	mov	qword [rbp-10*8], r8
	mov	r8, qword [rbp-10*8]
	mov	qword [rbp-11*8], r8
	add	qword [rbp-11*8], 0
	mov	r8, qword [rbp-11*8]
	mov	r9, 8236
	mov	[r8], r9
	mov	qword [rbp-11*8], r8
	mov	r8, qword [rbp-10*8]
	add	qword [rbp-9*8], r8
	mov	r8, qword [rbp-9*8]
	mov	qword [rbp-12*8], r8
	mov	qword [rbp-13*8], 2
	mov	r8, qword [rbp-1*8]
	add	qword [rbp-14*8], r8
	mov	r8, qword [rbp-13*8]
	add	qword [rbp-14*8], r8
	mov	r8, qword [rbp-14*8]
	null	r8, r8
	mov	rdi, qword [rbp-14*8]
	call	FUNCTION_toString
	mov	qword [rbp-15*8], rax
	mov	r8, qword [rbp-15*8]
	add	qword [rbp-12*8], r8
	mov	r8, qword [rbp-12*8]
	mov	qword [rbp-16*8], r8
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
	mov	r8, qword [rbp-17*8]
	add	qword [rbp-16*8], r8
	mov	r8, qword [rbp-16*8]
	mov	qword [rbp-19*8], r8
	mov	qword [rbp-20*8], 3
	mov	r8, qword [rbp-1*8]
	add	qword [rbp-21*8], r8
	mov	r8, qword [rbp-20*8]
	add	qword [rbp-21*8], r8
	mov	r8, qword [rbp-21*8]
	null	r8, r8
	mov	rdi, qword [rbp-21*8]
	call	FUNCTION_toString
	mov	qword [rbp-22*8], rax
	mov	r8, qword [rbp-22*8]
	add	qword [rbp-19*8], r8
	mov	r8, qword [rbp-19*8]
	mov	qword [rbp-23*8], r8
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
	mov	r9, 41
	mov	[r8], r9
	mov	qword [rbp-25*8], r8
	mov	r8, qword [rbp-24*8]
	add	qword [rbp-23*8], r8
	mov	rdi, qword [rbp-23*8]
	call	FUNCTION_println
	mov	qword [rbp-26*8], rax
LABEL8:
	mov	rax, qword [rbp-27*8]
	leave
	ret
FUNCTION_main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 520
	mov	qword [rbp-1*8], 0
	mov	qword [rbp-2*8], 0
	mov	qword [rbp-3*8], 0
	mov	qword [rbp-4*8], 0
	mov	rdi, qword [rbp-1*8]
	call	CLASS_point_MEMBER_printPoint
	mov	qword [rbp-5*8], rax
	mov	qword [rbp-6*8], 849
	mov	qword [rbp-7*8], 463
	mov	r8, qword [rbp-7*8]
	sub	qword [rbp-8*8], r8
	mov	qword [rbp-9*8], 480
	mov	rcx, qword [rbp-9*8]
	mov	rdx, qword [rbp-8*8]
	mov	rsi, qword [rbp-6*8]
	mov	rdi, qword [rbp-1*8]
	call	CLASS_point_MEMBER_set
	mov	qword [rbp-10*8], rax
	mov	qword [rbp-11*8], 208
	mov	r8, qword [rbp-11*8]
	sub	qword [rbp-12*8], r8
	mov	qword [rbp-13*8], 585
	mov	qword [rbp-14*8], 150
	mov	r8, qword [rbp-14*8]
	sub	qword [rbp-15*8], r8
	mov	rcx, qword [rbp-15*8]
	mov	rdx, qword [rbp-13*8]
	mov	rsi, qword [rbp-12*8]
	mov	rdi, qword [rbp-2*8]
	call	CLASS_point_MEMBER_set
	mov	qword [rbp-16*8], rax
	mov	qword [rbp-17*8], 360
	mov	qword [rbp-18*8], 670
	mov	r8, qword [rbp-18*8]
	sub	qword [rbp-19*8], r8
	mov	qword [rbp-20*8], 742
	mov	r8, qword [rbp-20*8]
	sub	qword [rbp-21*8], r8
	mov	rcx, qword [rbp-21*8]
	mov	rdx, qword [rbp-19*8]
	mov	rsi, qword [rbp-17*8]
	mov	rdi, qword [rbp-3*8]
	call	CLASS_point_MEMBER_set
	mov	qword [rbp-22*8], rax
	mov	qword [rbp-23*8], 29
	mov	r8, qword [rbp-23*8]
	sub	qword [rbp-24*8], r8
	mov	qword [rbp-25*8], 591
	mov	r8, qword [rbp-25*8]
	sub	qword [rbp-26*8], r8
	mov	qword [rbp-27*8], 960
	mov	r8, qword [rbp-27*8]
	sub	qword [rbp-28*8], r8
	mov	rcx, qword [rbp-28*8]
	mov	rdx, qword [rbp-26*8]
	mov	rsi, qword [rbp-24*8]
	mov	rdi, qword [rbp-4*8]
	call	CLASS_point_MEMBER_set
	mov	qword [rbp-29*8], rax
	mov	rsi, qword [rbp-2*8]
	mov	rdi, qword [rbp-1*8]
	call	CLASS_point_MEMBER_add
	mov	qword [rbp-30*8], rax
	mov	rsi, qword [rbp-3*8]
	mov	rdi, qword [rbp-2*8]
	call	CLASS_point_MEMBER_add
	mov	qword [rbp-31*8], rax
	mov	rsi, qword [rbp-3*8]
	mov	rdi, qword [rbp-4*8]
	call	CLASS_point_MEMBER_add
	mov	qword [rbp-32*8], rax
	mov	rsi, qword [rbp-1*8]
	mov	rdi, qword [rbp-3*8]
	call	CLASS_point_MEMBER_sub
	mov	qword [rbp-33*8], rax
	mov	rsi, qword [rbp-4*8]
	mov	rdi, qword [rbp-2*8]
	call	CLASS_point_MEMBER_sub
	mov	qword [rbp-34*8], rax
	mov	rsi, qword [rbp-3*8]
	mov	rdi, qword [rbp-4*8]
	call	CLASS_point_MEMBER_sub
	mov	qword [rbp-35*8], rax
	mov	rsi, qword [rbp-2*8]
	mov	rdi, qword [rbp-3*8]
	call	CLASS_point_MEMBER_add
	mov	qword [rbp-36*8], rax
	mov	rsi, qword [rbp-2*8]
	mov	rdi, qword [rbp-1*8]
	call	CLASS_point_MEMBER_add
	mov	qword [rbp-37*8], rax
	mov	rsi, qword [rbp-2*8]
	mov	qword [rbp-2*8], rsi
	mov	rdi, qword [rbp-2*8]
	call	CLASS_point_MEMBER_add
	mov	qword [rbp-38*8], rax
	mov	rsi, qword [rbp-3*8]
	mov	qword [rbp-3*8], rsi
	mov	rdi, qword [rbp-3*8]
	call	CLASS_point_MEMBER_add
	mov	qword [rbp-39*8], rax
	mov	rsi, qword [rbp-4*8]
	mov	rdi, qword [rbp-1*8]
	call	CLASS_point_MEMBER_sub
	mov	qword [rbp-40*8], rax
	mov	rsi, qword [rbp-2*8]
	mov	rdi, qword [rbp-1*8]
	call	CLASS_point_MEMBER_add
	mov	qword [rbp-41*8], rax
	mov	rsi, qword [rbp-3*8]
	mov	rdi, qword [rbp-2*8]
	call	CLASS_point_MEMBER_sub
	mov	qword [rbp-42*8], rax
	mov	rdi, qword [rbp-1*8]
	call	CLASS_point_MEMBER_sqrLen
	mov	qword [rbp-43*8], rax
	mov	rdi, qword [rbp-43*8]
	call	FUNCTION_toString
	mov	qword [rbp-44*8], rax
	mov	rdi, qword [rbp-44*8]
	call	FUNCTION_println
	mov	qword [rbp-45*8], rax
	mov	rdi, qword [rbp-2*8]
	call	CLASS_point_MEMBER_sqrLen
	mov	qword [rbp-46*8], rax
	mov	rdi, qword [rbp-46*8]
	call	FUNCTION_toString
	mov	qword [rbp-47*8], rax
	mov	rdi, qword [rbp-47*8]
	call	FUNCTION_println
	mov	qword [rbp-48*8], rax
	mov	rsi, qword [rbp-3*8]
	mov	rdi, qword [rbp-2*8]
	call	CLASS_point_MEMBER_sqrDis
	mov	qword [rbp-49*8], rax
	mov	rdi, qword [rbp-49*8]
	call	FUNCTION_toString
	mov	qword [rbp-50*8], rax
	mov	rdi, qword [rbp-50*8]
	call	FUNCTION_println
	mov	qword [rbp-51*8], rax
	mov	rsi, qword [rbp-1*8]
	mov	rdi, qword [rbp-4*8]
	call	CLASS_point_MEMBER_sqrDis
	mov	qword [rbp-52*8], rax
	mov	rdi, qword [rbp-52*8]
	call	FUNCTION_toString
	mov	qword [rbp-53*8], rax
	mov	rdi, qword [rbp-53*8]
	call	FUNCTION_println
	mov	qword [rbp-54*8], rax
	mov	rsi, qword [rbp-1*8]
	mov	rdi, qword [rbp-3*8]
	call	CLASS_point_MEMBER_dot
	mov	qword [rbp-55*8], rax
	mov	rdi, qword [rbp-55*8]
	call	FUNCTION_toString
	mov	qword [rbp-56*8], rax
	mov	rdi, qword [rbp-56*8]
	call	FUNCTION_println
	mov	qword [rbp-57*8], rax
	mov	rsi, qword [rbp-4*8]
	mov	rdi, qword [rbp-2*8]
	call	CLASS_point_MEMBER_cross
	mov	qword [rbp-58*8], rax
	mov	rdi, qword [rbp-58*8]
	call	CLASS_point_MEMBER_printPoint
	mov	qword [rbp-59*8], rax
	mov	rdi, qword [rbp-1*8]
	call	CLASS_point_MEMBER_printPoint
	mov	qword [rbp-60*8], rax
	mov	rdi, qword [rbp-2*8]
	call	CLASS_point_MEMBER_printPoint
	mov	qword [rbp-61*8], rax
	mov	rdi, qword [rbp-3*8]
	call	CLASS_point_MEMBER_printPoint
	mov	qword [rbp-62*8], rax
	mov	rdi, qword [rbp-4*8]
	call	CLASS_point_MEMBER_printPoint
	mov	qword [rbp-63*8], rax
LABEL9:
	mov	rax, qword [rbp-64*8]
	leave
	ret
LABEL10:
	SECTION .data
	SECTION .bss
	SECTION .rodata
	L_022:	db 25H, 73H, 00H
