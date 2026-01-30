global main
extern system
extern fopen
extern fprintf
extern fclose

%macro OPEN_FILE 2
lea rdi, [rel %1]
lea rsi, [rel %2]
call fopen wrt ..plt
mov rbx, rax
%endmacro

%macro WRITE_CHAR 0
mov al, [rel start]
dec al
add al, '0'
movzx rdx, al
lea rsi, [rel format_char]
mov rdi, rbx
xor eax, eax
call fprintf wrt ..plt
%endmacro

%macro WRITE_TEXT 3
mov rdi, rbx
lea rsi, [rel %1]
mov edx, %2
mov ecx, %3
lea r8, [rel %1]
xor eax, eax
call fprintf wrt ..plt
%endmacro

%macro FILL 2
lea rbx, [rel %1]
lea rcx, [rel %2]
mov dl, [rel start]
add dl, 48
mov rsi, rcx
mov rdi, rbx
%%copy_loop:
mov al, [rcx]
cmp al, 'X'
jne %%copy_normal
mov al, dl
%%copy_normal:
mov [rbx], al
cmp byte [rcx], 0
je %%done
inc rcx
inc rbx
jmp %%copy_loop
%%done:
mov byte [rbx], 0
%endmacro

section .text
main:
FILL compile_bss, compile_data
FILL run_bss, run_data
FILL filename_bss, filename_data
FILL chmod_bss, chmod_data
sub rsp, 8
OPEN_FILE filename_bss, mode
test rbx, rbx
je .done
WRITE_TEXT text, 10, 34
WRITE_CHAR
cmp eax, 0
jl .done
mov rdi, rbx
call fclose wrt ..plt
mov al, [rel start]
cmp al, 0
je .done
lea rdi, [rel compile_bss]
call system wrt ..plt
test eax, eax
je .done
lea rdi, [rel chmod_bss]
call system wrt ..plt
lea rdi, [rel run_bss]
call system wrt ..plt
.done:
add rsp, 8
ret

section .bss
filename_bss resb 10
compile_bss resb 65
run_bss resb 10
chmod_bss resb 18

section .data
mode db "w",0
filename_data db "Sully_X.s",0
compile_data db "nasm -f elf64 Sully_X.s -o Sully_X.o && gcc Sully_X.o -o Sully_X",0
run_data db "./Sully_X",0
chmod_data db "chmod 777 Sully_X",0
text db "global main%1$cextern system%1$cextern fopen%1$cextern fprintf%1$cextern fclose%1$c%1$c%%macro OPEN_FILE 2%1$clea rdi, [rel %%1]%1$clea rsi, [rel %%2]%1$ccall fopen wrt ..plt%1$cmov rbx, rax%1$c%%endmacro%1$c%1$c%%macro WRITE_CHAR 0%1$cmov al, [rel start]%1$cdec al%1$cadd al, '0'%1$cmovzx rdx, al%1$clea rsi, [rel format_char]%1$cmov rdi, rbx%1$cxor eax, eax%1$ccall fprintf wrt ..plt%1$c%%endmacro%1$c%1$c%%macro WRITE_TEXT 3%1$cmov rdi, rbx%1$clea rsi, [rel %%1]%1$cmov edx, %%2%1$cmov ecx, %%3%1$clea r8, [rel %%1]%1$cxor eax, eax%1$ccall fprintf wrt ..plt%1$c%%endmacro%1$c%1$c%%macro FILL 2%1$clea rbx, [rel %%1]%1$clea rcx, [rel %%2]%1$cmov dl, [rel start]%1$cadd dl, 48%1$cmov rsi, rcx%1$cmov rdi, rbx%1$c%%%%copy_loop:%1$cmov al, [rcx]%1$ccmp al, 'X'%1$cjne %%%%copy_normal%1$cmov al, dl%1$c%%%%copy_normal:%1$cmov [rbx], al%1$ccmp byte [rcx], 0%1$cje %%%%done%1$cinc rcx%1$cinc rbx%1$cjmp %%%%copy_loop%1$c%%%%done:%1$cmov byte [rbx], 0%1$c%%endmacro%1$c%1$csection .text%1$cmain:%1$cFILL compile_bss, compile_data%1$cFILL run_bss, run_data%1$cFILL filename_bss, filename_data%1$cFILL chmod_bss, chmod_data%1$csub rsp, 8%1$cOPEN_FILE filename_bss, mode%1$ctest rbx, rbx%1$cje .done%1$cWRITE_TEXT text, 10, 34%1$cWRITE_CHAR%1$ccmp eax, 0%1$cjl .done%1$cmov rdi, rbx%1$ccall fclose wrt ..plt%1$cmov al, [rel start]%1$ccmp al, 0%1$cje .done%1$clea rdi, [rel compile_bss]%1$ccall system wrt ..plt%1$ctest eax, eax%1$cje .done%1$clea rdi, [rel chmod_bss]%1$ccall system wrt ..plt%1$clea rdi, [rel run_bss]%1$ccall system wrt ..plt%1$c.done:%1$cadd rsp, 8%1$cret%1$c%1$csection .bss%1$cfilename_bss resb 10%1$ccompile_bss resb 65%1$crun_bss resb 10%1$cchmod_bss resb 18%1$c%1$csection .data%1$cmode db %2$cw%2$c,0%1$cfilename_data db %2$cSully_X.s%2$c,0%1$ccompile_data db %2$cnasm -f elf64 Sully_X.s -o Sully_X.o && gcc Sully_X.o -o Sully_X%2$c,0%1$crun_data db %2$c./Sully_X%2$c,0%1$cchmod_data db %2$cchmod 777 Sully_X%2$c,0%1$ctext db %2$c%3$s%2$c,0%1$cformat_char db %2$c%%c%2$c,0%1$cstart db ",0
format_char db "%c",0
start db 5