MessageBoxA proto
GetStdHandle proto
WriteFile proto

.const
non_zero_failed_str byte "Unable To Find Non-Zero String!", 0
non_zero_failed_title byte "Failed", 0

non_zero_success_str byte "Non-Zero String Found!", 0
non_zero_success_title byte "Success", 0

.code

; str stuff
str8_to_upper_case_n proc
	sub rsp, 40
	
	mov rsi, rcx
	mov rcx, rdx
	
upper_case_loop:
	and byte ptr [rsi], 11011111b
	inc rsi
	loop upper_case_loop

	add rsp, 40
	ret
str8_to_upper_case_n endp

is_even proc
	sub rsp, 40
	
	mov rax, rcx
	test rax, 1

	je return_1
	
	mov rax, 0
	jmp end_is_even

return_1:
	mov rax, 1

end_is_even:
	add rsp, 40
	ret
is_even endp

find_non_zero proc
	sub rsp, 40
	
	mov rsi, rcx
	mov rcx, rdx

find_loop:
	cmp word ptr [rsi], 0
	jnz found_non_zero
	add rsi, 2
	loop find_loop

	mov rcx, 0
	mov rdx, offset non_zero_failed_str
	mov r8, offset non_zero_failed_title
	mov r9, 0
	jmp end_find_non_zero

found_non_zero:
	mov rcx, 0
	mov rdx, offset non_zero_success_str
	mov r8, offset non_zero_success_title
	mov r9, 0

end_find_non_zero:
	call MessageBoxA

	add rsp, 40
	ret
find_non_zero endp

maximum_s32 proc
	sub rsp, 40
	
	mov eax, ecx ; assume ecx > edx
	
	cmp ecx, edx
	jg end_max
	mov eax, edx
end_max:
	add rsp, 40
	ret
maximum_s32 endp

minimum_s32 proc
	sub rsp, 40
	
	;mov dword ptr [rsp + 16], edx
	;mov dword ptr [rsp + 8], ecx

	; mov eax, ecx ; assume ecx < edx

	cmovle edx, ecx
	mov eax, edx
;	cmp ecx, edx
;	jl end_min
;	mov eax, edx
;end_min:
	
	add rsp, 40
	ret
minimum_s32 endp

is_multiple_of_3_or_5_u64 proc
	sub rsp, 40
	
	mov qword ptr [rsp + 8], rcx

	xor rdx, rdx
	mov rax, rcx
	mov rcx, 3
	div rcx
	test rdx, rdx
	mov eax, 1
	jz end_multiple

	xor rdx, rdx
	mov rax, qword ptr [rsp + 8]
	mov rcx, 5
	div rcx
	test rdx, rdx
	mov eax, 1
	jz end_multiple

	xor eax, eax

end_multiple:
	add rsp, 40
	ret
is_multiple_of_3_or_5_u64 endp

sum_of_multiples proc
	sub rsp, 40

	mov rsi, 1
	mov rdi, rcx
	xor rax, rax
loop_l:
	mov rcx, rsi
	push rax
	call is_multiple_of_3_or_5_u64
	test rax, rax
	pop rax
	jz continue_loop
	add rax, rsi
continue_loop:
	inc rsi
	cmp rsi, rdi
	jb loop_l

	add rsp, 40
	ret
sum_of_multiples endp

sum_of_multiples_better proc
	sub rsp, 40

	push rsi
	push rdi
	push rbx

	mov rsi, 3
	mov rdi, 5

	xor rax, rax
	mov rbx, 1
loop_start:
	xor rdx, rdx
	push rax
	mov rax, rbx
	div rsi
	test rdx, rdx
	pop rax
	jz add_thing

	xor rdx, rdx
	push rax
	mov rax, rbx
	div rdi
	test rdx, rdx
	pop rax
	jnz loop_increment

add_thing:
	add rax, rbx
loop_increment:
	inc rbx
	cmp rbx, rcx
	jb loop_start

	pop rbx
	pop rdi
	pop rsi

	add rsp, 40
	ret
sum_of_multiples_better endp

add_even_fib_numbers_4m proc
	sub rsp, 40
	
	mov qword ptr [rsp + 8], 2
	mov rcx, 1
	mov rdx, 2
	xor rax, rax

loop_4m:
	test rcx, 1
	jnz is_not_even
	add rax, rcx

is_not_even:
	mov r9, rcx
	mov rcx, rdx
	add rdx, r9
	cmp rcx, 4000000
	jb loop_4m

	add rsp, 40
	ret
add_even_fib_numbers_4m endp

print_to_screen proc
	sub rsp, 48
	
	mov [rsp + 40], rcx
	mov [rsp + 32], rdx

	mov ecx, -11
	call GetStdHandle

	mov rcx, rax
	mov rdx, qword ptr [rsp + 40]
	mov r8, qword ptr [rsp + 32]
	mov r9, 0
	mov rax, 0
	push rax
	call WriteFile
	pop rax

	add rsp, 48
	ret
print_to_screen endp

; NOTE: an integer larger than 1 is said to be prime
; if it cannot be written as a product of two smaller positive
; integers.
end