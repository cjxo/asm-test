MessageBoxA proto

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

end