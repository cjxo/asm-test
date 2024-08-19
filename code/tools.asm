.code

str8_to_upper_case_n proc
	sub rsp, 8
	
	mov rsi, rcx
	mov rcx, rdx
	
upper_case_loop:
	and byte ptr [rsi], 11011111b
	inc rsi
	loop upper_case_loop

	add rsp, 8
	ret
str8_to_upper_case_n endp
	
end