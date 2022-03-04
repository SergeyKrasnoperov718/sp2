.data
print_format:
.string "%d\n"
array:
.long 138, 42, 13, 16, 4, 85, 21, 17, 18, 15
array_end:
.text
.global main
.type main, @function
main:
movl $0, %ecx /*ecx - результат, сумма*/
movl $array,%ebx /*ebx - адрес текущего элемента массива*/
movl (%ebx), %eax /*eax - значение текущего элемента массива,
потом XOR, AND*/
movl $255, %edx
jmp ch_bound
loop_start:
xor $128, %eax
and $128, %eax
cmpl $128, %eax /*срвнивает маску с результатом XOR, AND*/
je less /*если они равны, значит элемент не подходит
под условия, пропускаем его*/
/*notl (%ebx)
addl $256, (%ebx)*/
xor %edx, (%ebx)
add (%ebx), %ecx
addl $4, %ebx
movl (%ebx), %eax
jmp ch_bound
less:
add (%ebx), %ecx /*если не равны, значит складываем,
результат в %ecx*/
addl $4, %ebx /* переходим на следующий элемент массива*/
movl (%ebx), %eax
ch_bound:
cmpl $array_end, %ebx /*сравнить адрес текущего элемента и адре
конца массива*/
jne loop_start /*если не равны, то повторить цикл снова*/
pushl %ecx
pushl $print_format
call printf
addl $8, %esp
movl $0, %ecx
movl $0, %ebx
movl $0, %eax
ret
