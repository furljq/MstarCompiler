





default rel

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
extern memcpy
extern strlen
extern __stack_chk_fail
extern __isoc99_scanf
extern malloc
extern puts
extern __printf_chk
extern _GLOBAL_OFFSET_TABLE_


SECTION .text   6

FUNCTION_size:
        mov     rax, qword [rdi-8H]
        ret


        nop





ALIGN   16

FUNCTION_print:
        lea     rsi, [rel .LC0]
        mov     rdx, rdi
        xor     eax, eax
        mov     edi, 1
        jmp     __printf_chk







ALIGN   16

FUNCTION_println:
        jmp     puts


        nop





ALIGN   16

FUNCTION_getString:
        push    rbx
        mov     edi, 256
        call    malloc
        lea     rdi, [rel .LC0]
        mov     rbx, rax
        mov     rsi, rax
        xor     eax, eax
        call    __isoc99_scanf
        mov     rax, rbx
        pop     rbx
        ret







ALIGN   16

FUNCTION_toString:
        push    r13
        push    r12
        push    rbp
        push    rbx
        sub     rsp, 104


        mov     rax, qword [fs:abs 28H]
        mov     qword [rsp+58H], rax
        xor     eax, eax
        test    rdi, rdi
        js      L_003
        jne     L_006
        mov     edi, 8
        mov     dword [rsp+4H], 0
        mov     r12d, 1
        call    malloc
        xor     ebp, ebp
        mov     r8d, 1
        mov     rbx, rsp
L_001:  movsxd  rcx, r12d
        movsxd  rsi, ebp
        shl     rcx, 2
        add     rsi, rax
        lea     rdi, [rsp+rcx-4H]
        lea     rdx, [rbx+rcx]
        lea     ecx, [r12-1H]
        shl     rcx, 2
        sub     rdi, rcx




ALIGN   8
L_002:  movzx   ebx, byte [rdx]
        sub     rdx, 4
        add     rsi, 1
        lea     ecx, [rbx+30H]
        mov     byte [rsi-1H], cl
        cmp     rdi, rdx
        jnz     L_002
        mov     rbx, qword [rsp+58H]


        xor     rbx, qword [fs:abs 28H]
        mov     byte [rax+r8], 0
        jne     L_007
        add     rsp, 104
        pop     rbx
        pop     rbp
        pop     r12
        pop     r13
        ret





ALIGN   8
L_003:  neg     rdi
        mov     ebp, 1
L_004:  mov     ecx, 1
        mov     rbx, rsp
        mov     rsi, qword 6666666666666667H




ALIGN   8
L_005:  mov     rax, rdi
        mov     r12d, ecx
        imul    rsi
        mov     rax, rdi
        sar     rax, 63
        sar     rdx, 2
        sub     rdx, rax
        lea     rax, [rdx+rdx*4]
        add     rax, rax
        sub     rdi, rax
        mov     dword [rbx+rcx*4], edi
        add     rcx, 1
        test    rdx, rdx
        mov     rdi, rdx
        jnz     L_005
        lea     r13d, [r12+rbp]
        mov     eax, r13d
        sar     eax, 3
        lea     edi, [rax*8+8H]
        movsxd  rdi, edi
        call    malloc
        test    ebp, ebp
        movsxd  r8, r13d
        je      L_001
        mov     byte [rax], 45
        jmp     L_001





ALIGN   8
L_006:  xor     ebp, ebp
        jmp     L_004

L_007:  call    __stack_chk_fail




ALIGN   8

CLASS_string_MEMBER_length:
        jmp     strlen


        nop





ALIGN   16

CLASS_string_MEMBER_substring:
        push    r13
        movsxd  r13, esi
        push    r12
        push    rbp
        push    rbx
        mov     ebx, edx
        sub     ebx, r13d
        mov     r12, rdi
        lea     eax, [rbx+8H]
        mov     ebp, ebx
        sub     rsp, 8
        add     ebp, 1
        cmovns  eax, ebp
        sar     eax, 3
        lea     edi, [rax*8+8H]
        movsxd  rdi, edi
        call    malloc
        test    ebp, ebp
        mov     rcx, rax
        jle     L_008
        mov     edx, ebx
        lea     rsi, [r12+r13]
        mov     rdi, rax
        add     rdx, 1
        call    memcpy
        mov     rcx, rax
L_008:  movsxd  rbp, ebp
        mov     rax, rcx
        mov     byte [rcx+rbp], 0
        add     rsp, 8
        pop     rbx
        pop     rbp
        pop     r12
        pop     r13
        ret







ALIGN   16

CLASS_string_MEMBER_parseInt:
        mov     edx, 1
        xor     esi, esi
        mov     r9d, 1
        jmp     L_010





ALIGN   8
L_009:  cmp     al, 45
        cmove   esi, r9d
        add     rdx, 1
L_010:  movsx   eax, byte [rdi+rdx-1H]
        movsxd  r8, edx
        lea     ecx, [rax-30H]
        cmp     cl, 9
        ja      L_009
        movsx   rdx, byte [rdi+r8]
        sub     eax, 48
        cdqe
        lea     ecx, [rdx-30H]
        cmp     cl, 9
        ja      L_012
        lea     rcx, [rdi+r8+1H]




ALIGN   8
L_011:  lea     rax, [rax+rax*4]
        add     rcx, 1
        lea     rax, [rdx+rax*2-30H]
        movsx   rdx, byte [rcx-1H]
        lea     edi, [rdx-30H]
        cmp     dil, 9
        jbe     L_011
L_012:  mov     rdx, rax
        neg     rdx
        test    esi, esi
        cmovne  rax, rdx
        ret


FUNCTION_getInt:
        push    rbx
        mov     edi, 256
        call    malloc
        lea     rdi, [rel .LC0]
        mov     rsi, rax
        mov     rbx, rax
        xor     eax, eax
        call    __isoc99_scanf
        mov     edx, 1
        xor     esi, esi
        mov     r8d, 1
        jmp     L_014





ALIGN   8
L_013:  cmp     al, 45
        cmove   esi, r8d
        add     rdx, 1
L_014:  movsx   eax, byte [rbx+rdx-1H]
        movsxd  rdi, edx
        lea     ecx, [rax-30H]
        cmp     cl, 9
        ja      L_013
        movsx   rdx, byte [rbx+rdi]
        sub     eax, 48
        cdqe
        lea     ecx, [rdx-30H]
        cmp     cl, 9
        ja      L_016
        lea     rcx, [rbx+rdi+1H]




ALIGN   8
L_015:  lea     rax, [rax+rax*4]
        add     rcx, 1
        lea     rax, [rdx+rax*2-30H]
        movsx   rdx, byte [rcx-1H]
        lea     edi, [rdx-30H]
        cmp     dil, 9
        jbe     L_015
L_016:  mov     rdx, rax
        neg     rdx
        test    esi, esi
        cmovne  rax, rdx
        pop     rbx
        ret







ALIGN   16

CLASS_string_MEMBER_ord:
        movsxd  rsi, esi
        movsx   rax, byte [rdi+rsi]
        ret






ALIGN   8

FUNCTION_string_concat:
        push    r15
        push    r14
        mov     r15, rdi
        push    r13
        push    r12
        mov     r13, rsi
        push    rbp
        push    rbx
        sub     rsp, 8
        call    strlen
        mov     rdi, r13
        mov     rbx, rax
        mov     ebp, eax
        call    strlen
        lea     edx, [rax+rbx]
        mov     r12, rax
        lea     eax, [rdx+7H]
        test    edx, edx
        cmovns  eax, edx
        sar     eax, 3
        lea     edi, [rax*8+8H]
        movsxd  rdi, edi
        call    malloc
        test    ebx, ebx
        mov     r14, rax
        jle     L_019
        lea     edx, [rbx-1H]
        movsxd  rbx, ebx
        mov     rsi, r15
        mov     rdi, rax
        add     rbx, r14
        add     rdx, 1
        call    memcpy
L_017:  test    r12d, r12d
        jle     L_018
        lea     ebx, [rbp+r12]
        lea     edx, [r12-1H]
        movsxd  rdi, ebp
        add     rdi, r14
        mov     rsi, r13
        movsxd  rbx, ebx
        add     rdx, 1
        add     rbx, r14
        call    memcpy
L_018:  mov     byte [rbx], 0
        add     rsp, 8
        mov     rax, r14
        pop     rbx
        pop     rbp
        pop     r12
        pop     r13
        pop     r14
        pop     r15
        ret





ALIGN   8
L_019:  mov     rbx, rax
        xor     ebp, ebp
        jmp     L_017


        nop

ALIGN   16
FUNCTION_string_equal:
        sub     rsp, 8
        call    strcmp
        test    eax, eax
        sete    al
        add     rsp, 8
        movzx   eax, al
        ret







ALIGN   16

FUNCTION_string_notequal:
        sub     rsp, 8
        call    strcmp
        test    eax, eax
        setne   al
        add     rsp, 8
        movzx   eax, al
        ret







ALIGN   16

FUNCTION_string_lt:
        sub     rsp, 8
        call    strcmp
        cdqe
        add     rsp, 8
        shr     rax, 63
        ret







ALIGN   16

FUNCTION_string_leq:
        sub     rsp, 8
        call    strcmp
        test    eax, eax
        setle   al
        add     rsp, 8
        movzx   eax, al
        ret







ALIGN   16

FUNCTION_string_gt:
        sub     rsp, 8
        call    strcmp
        test    eax, eax
        setg    al
        add     rsp, 8
        movzx   eax, al
        ret







ALIGN   16

FUNCTION_string_geq:
        sub     rsp, 8
        call    strcmp
        cdqe
        add     rsp, 8
        not     rax
        shr     rax, 63
        ret



SECTION .data   


SECTION .bss    


SECTION .rodata.str1.1 

.LC0:
        db 25H, 73H, 00H


