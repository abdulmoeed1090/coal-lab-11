INCLUDE Irvine32.inc

.data
num1 dd ?
num2 dd ?
result dd ?
msg1 db "Enter first number : ",0ah,0dh,0
msg2 db "Enter second number : ",0ah,0dh,0
msg3 db "Result : ",0
arr dd 10 Dup(?)
index dd ?
n dd ?
msg db "Enter the index : ",0ah,0dh,0
msgg db "Enter the number to find at entered index : ",0ah,0dh,0
input db "Enter the input of array : ",0ah,0dh,0
nfound db "Not found!!",0ah,0dh,0
found db "Found at given index...",0ah,0dh,0
num db 10100011b



educationLevel db ?
yearsOfExperience db ?
hasRelevantCertification db ?
hasProgrammingSkills db ?

msg4 db "Enter your education level (1=High School, 2=Bachelor's, 3=Master's, 4=Ph.D.): ", 0
msg5 db "Enter your years of professional experience: ", 0
msg6 db "Do you have a relevant certification (1=Yes, 0=No): ", 0
msg7 db "Do you have programming skills (1=Yes, 0=No): ", 0

ifSenior db "Congratulations! You are eligible for the senior software engineer position.", 0
ifEngineer db "You are eligible for the software engineer position.", 0
ifJunior db "You are eligible for the junior software engineer position.", 0
ifNone db "Sorry, you are not eligible for any software engineering position at this time.", 0


byteArray WORD 810Dh, 0C064h, 93ABh
msggg db "Shifted values:", 0ah, 0dh, 0


nu dd 11010010b     
ms db "Shifted/Rotated Values:", 0ah, 0dh, 0


.code
main PROC
;------------------------------
;question no 4
comment @
        mov edx, offset msg
    call WriteString
    call ReadInt
    mov index, eax


     mov edx, offset msgg
    call WriteString
    call ReadInt
    mov n, eax

    lea esi,arr
    lea edi , arr


    
    mov edx, offset input
    call WriteString

   mov ecx,10
    l1:
    call ReadInt
    mov [esi],eax
    add esi,4
    loop l1

    
    mov ebx,n
    mov eax,index
    imul eax,4
    add edi,eax
    cmp [edi],ebx
    je foundd


    mov edx,offset nfound
    call writeString
    exit

    foundd:
    mov edx,offset found
    call writeString
    exit
    @
    comment @
 ;   -----------------------------------------
    ;question no 5
    mov al,num
    shl al,1 ;carry=1
    
    movzx eax, al
    call WriteInt
    
    call crlf
    
    sal al,1
    movzx eax, al
    call WriteInt

    ;----------------------------------
    ;queestion no 6


    mov edx, OFFSET msg4
    call WriteString
    call ReadInt
    mov educationLevel, al

    mov edx, OFFSET msg5
    call WriteString
    call ReadInt
    mov yearsOfExperience, al

    mov edx, OFFSET msg6
    call WriteString
    call ReadInt
    mov hasRelevantCertification, al

    mov edx, OFFSET msg7
    call WriteString
    call ReadInt
    mov hasProgrammingSkills, al

    mov al, educationLevel
    cmp al, 3
    jl checkEngineer
    mov al, yearsOfExperience
    cmp al, 8
    jl checkEngineer
    mov al, hasRelevantCertification
    cmp al, 1
    jne checkEngineer
    mov al, hasProgrammingSkills
    cmp al, 1
    jne checkEngineer

    mov edx, OFFSET ifSenior
    call WriteString
    jmp done

checkEngineer:
    mov al, educationLevel
    cmp al, 2
    jl checkJunior
    mov al, yearsOfExperience
    cmp al, 3
    jl checkJunior
    mov al, hasProgrammingSkills
    cmp al, 1
    jne checkJunior

    mov edx, OFFSET ifEngineer
    call WriteString
    jmp done

checkJunior:
    mov al, educationLevel
    cmp al, 2
    jl notEligible
    mov al, yearsOfExperience
    cmp al, 2
    jl notEligible

    mov edx, OFFSET ifJunior
    call WriteString
    jmp done

notEligible:
    mov edx, OFFSET ifNone
    call WriteString

    done:
    exit

    
  ;  ----------------------------------
    ;questin no 9
    


    mov edx, OFFSET msggg
    call WriteString

    mov ax, byteArray
    shl ax, 1
    mov byteArray, ax

    mov ax, byteArray + 2
    shl ax, 1
    mov byteArray + 2, ax

    mov ax, byteArray + 4
    shl ax, 1
    mov byteArray + 4, ax

    mov ax, byteArray
    call WriteInt
    call Crlf

    mov ax, byteArray + 2
    call WriteInt
    call Crlf

    mov ax, byteArray + 4
    call WriteInt
    call Crlf

    exit

;--------------------------------    
    ; question  no 7
    mov edx,offset msg1
call writestring
call readInt
mov num1,eax

mov edx,offset msg2
call writestring
call readInt
mov num2,eax

imul eax,num1

mov edx,offset msg3
call writestring

call writeint
exit
;-----------------------------
    ; question  no 2
    mov edx,offset msg1
call writestring
call readInt
mov ebx,eax

mov edx,offset msg2
call writestring
call readInt


imul eax,ebx

mov edx,offset msg3
call writestring

call writeint
exit

;-----------------------------------
;Question no 8
@
comment @
    mov edx, offset msg1
    call WriteString
    call ReadInt
    mov num1, eax

    mov edx, offset msg2
    call WriteString
    call ReadInt
    mov num2, eax

    mov eax, num1   
    cdq            
    idiv num2       

    mov edx, offset msg3
    call WriteString
    call crlf
    call WriteDec
    exit
    


;-----------------------------------
;Question no 3
@
comment @
    mov edx, offset msg1
    call WriteString
    call ReadInt
    mov ebx, eax

    mov edx, offset msg2
    call WriteString
    call ReadInt
    mov num2, eax

    mov eax, ebx   
    cdq            
    idiv num2       
    mov result, eax 

    mov edx, offset msg3
    call WriteString
    mov eax, result
    call crlf
    call WriteDec
    exit
    
;----------------------------
;Question no 1
    
    mov edx, OFFSET ms
    call WriteString
    mov eax, number
    call WriteInt
    call crlf

    
    mov eax, number
    shl eax, 1           
    mov num1, eax        
    call WriteInt 
    call crlf
    

    mov eax, number
    shr eax, 1           
    mov num1, eax        
    call WriteInt        
    call crlf
   

    
    mov eax, number
    sar eax, 1          
    mov num1, eax       
    call WriteInt       
    call crlf
    

    
    mov eax, number
    rol eax, 1           
    mov num1, eax        
    call WriteInt        
   

   
    mov eax, number
    ror eax, 1          
    mov num1, eax       
    call WriteInt       
    call crlf
    
    exit
    @


main ENDP
END main
