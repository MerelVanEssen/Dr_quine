global main
extern fopen
extern fprintf
extern fclose

%macro OPEN_FILE 2
lea rdi, [rel %1]
lea rsi, [rel %2]
call fopen wrt ..plt
mov rbx, rax
%endmacro

%macro WRITE_FILE 3
mov rdi, rbx
lea rsi, [rel %1]
mov edx, %2
mov ecx, %3
lea r8,  [rel %1]
xor eax, eax
call fprintf wrt ..plt
%endmacro

%macro RUN 0
; one comment
sub rsp, 8
OPEN_FILE filename, mode
WRITE_FILE text, 10, 34
mov rdi, rbx
call fclose wrt ..plt
add rsp, 8
ret
%endmacro

section .text
main:
RUN

section .data
filename db "Grace_kid.s",0
mode db "w",0
text db "global main%1$cextern fopen%1$cextern fprintf%1$cextern fclose%1$c%1$c%%macro OPEN_FILE 2%1$clea rdi, [rel %%1]%1$clea rsi, [rel %%2]%1$ccall fopen wrt ..plt%1$cmov rbx, rax%1$c%%endmacro%1$c%1$c%%macro WRITE_FILE 3%1$cmov rdi, rbx%1$clea rsi, [rel %%1]%1$cmov edx, %%2%1$cmov ecx, %%3%1$clea r8,  [rel %%1]%1$cxor eax, eax%1$ccall fprintf wrt ..plt%1$c%%endmacro%1$c%1$c%%macro RUN 0%1$c; one comment%1$csub rsp, 8%1$cOPEN_FILE filename, mode%1$cWRITE_FILE text, 10, 34%1$cmov rdi, rbx%1$ccall fclose wrt ..plt%1$cadd rsp, 8%1$cret%1$c%%endmacro%1$c%1$csection .text%1$cmain:%1$cRUN%1$c%1$csection .data%1$cfilename db %2$cGrace_kid.s%2$c,0%1$cmode db %2$cw%2$c,0%1$ctext db %2$c%3$s%2$c"