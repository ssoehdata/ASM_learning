.686
.model flat, stdcall

ExitProcess proto uExitCode:DWORD
MessageBoxA proto hWnd:DWORD, lpText:DWORD, lpCaption:DWORD,
uType:DWORD

.data
	msg db 'Hello from MASM Assembly in VisualStudio!', 0
	ti db 'Hello message', 0

.code

main PROC
<<<<<<< HEAD
	push 0						; Prepare the value to return to the operating system
	push offset msg			    ; Pass pointer to MessageBox's text to the show_message( ) function 
	push offset ti				; Pass pointer to MessageBox's title to the show_message( ) function
	call show_message           ; Call it 
	call ExitProcess			; and return to the operating system 
=======
	push 0					; Prepare the value to return to the operating system
	push offset msg			; Pass pointer to MessageBox's text to the show_message( ) function 
	push offset ti			; Pass pointer to MessageBox's title to the show_message( ) function
	call show_message       ; Call it 
	call ExitProcess		; and return to the operating system 
>>>>>>> 8e89a7a (cleanup)
main ENDP 

; This function's prototype would be: 
; void show_message(char* title, char* message); 
show_message PROC 
	push ebp 
	mov ebp, esp 
	push eax 

	push 0													; uType 
	mov eax,		[dword ptr ebp + 8] 
	push eax												; lpCaption 
    mov eax,		[dword ptr ebp + 12]
	push eax												; lpText
	push 0													; hWnd 
<<<<<<< HEAD
	call MessageBoxA								        ; call MessageBox( )
=======
	call MessageBoxA										; call MessageBox( )
>>>>>>> 8e89a7a (cleanup)
 
	pop eax 
	mov esp, ebp 
	pop  ebp
	ret 4 * 2												; Return and clean the stack 
show_message ENDP 
END main 
