.586P						;система команд (процессор Pentium)
.MODEL FLAT, STDCALL		;модель памяти, соглашение о вызовах
includelib kernel32.lib		;компановщику: компоновать с kernel32

ExitProcess PROTO : DWORD								;прототип функции для завершения процесса Windows
MessageBoxA PROTO : DWORD, : DWORD, : DWORD, : DWORD	;прототип API-функции MessageBoxA
.STACK 4096												;выделение стека

.CONST						;сегмент констант 

.DATA
MB_OK EQU 0
STR1  DB "Моя первая программа", 0
STR2  DB "Привет всем!", 0

HW    DD ?                   ;двойное слово длиной в 4 байта. неинециализированно

.CODE     

main PROC  ;точка фхода в main

START :									;метка
		PUSH	MB_OK
		PUSH	OFFSET STR1
		PUSH	OFFSET STR2
		PUSH	HW
		CALL MessageBoxA				;вызов функции
;INVOKE MessageBoxA, HW, OFFSET STR2, OFFSET STR1, MB_OK

	push - 1							;код возврата процесса Windows(параметр ExitProcess)
	call ExitProcess					;так завершается любой процесс в Windows
main ENDP								;конец процедуры

end main		;конец модуля main