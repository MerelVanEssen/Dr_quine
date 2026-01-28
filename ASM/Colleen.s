; comment1
global main
extern printf

section .text
main:
push rbp
mov rbp, rsp
lea rdi, [rel text]
mov rsi, 10
mov rdx, 34
lea rcx, [rel text]
xor eax, eax
call printf wrt ..plt
call comment
leave
ret

comment:
; comment2
ret

section .data
text db "; comment1%1$cglobal main%1$cextern printf%1$c%1$csection .text%1$cmain:%1$cpush rbp%1$cmov rbp, rsp%1$clea rdi, [rel text]%1$cmov rsi, 10%1$cmov rdx, 34%1$clea rcx, [rel text]%1$cxor eax, eax%1$ccall printf wrt ..plt%1$ccall comment%1$cleave%1$cret%1$c%1$ccomment:%1$c; comment2%1$cret%1$c%1$csection .data%1$ctext db %2$c%3$s%2$c"