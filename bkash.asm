.MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here  

PHN DB 12 DUP(?)

TAKAA DW 0
TAKA DW 100  
VAR DW 0 
REFF DW 0

BALL DB "YOU HAVE TO PAY LOAN = $"
YEAR DB "FOR HOW MANY YEARS DO YOU WANT LOAN (1DIGIT) ? $"
PINNN DB "NOW ENTER NEW PIN : $"
PLEASE DB "KINDLY SELECT A CORRECT OPTION !! $"
USERCODE DB "*247#" 
FIR DB "ENTER USSD CODE (5 DIGITS) : $"
AGA DB "DIDN'T MATCH YOUR CODE !! $"  
WLCC DB "WELCOME TO BKASH 8086 !!! $"
TRY DB "1. TRY AGAIN $"
LOGOUT DB "2. EXIT $" 
ENT DB "ENTER OPTION NO = $" 
INV DB "INVALID OPTION NO ! $"
TO DB "TO : $"
START DB "BKASH$"
ONE DB "1. SEND MONEY $"
TWO DB "2. SEND MONEY TO NON-BKASH USER $"
THREE DB "3. MOBILE RECHARGE $"
FOUR DB "4. PAYMENT $"
FIVE DB "5. CASH OUT $"
SIX DB "6. PAY BILL $"
SEVEN DB "7. MICROFINANCE $"
EIGHT DB "8. DOWNLOAD BKASH APP $"
NINE DB "9. MY BKASH $"
TEN DB "10. RESET PIN $"

PS DB "PIN RESET SUCCESSFUL ! $"
AMONT DB "AMOUNT: $"
ENOU DB "YOU DON'T HAVE ENOUGH BALANCE $"

NUM DB "ENTER RECEIVER BKASH ACCOUNT NO (11 DIGITS) : $"
FREE DB "FREE SEND MONEY TO 5 PRIYO NUMBERS.$"
FRE DB "DIAL *247# AND SELECT NUMBER 9 TO FIND PRIYO NUMBERS.$"
ENT_AM DB "ENTER AMOUNT & PRESS ENTER = $"

RRE DB "FREE SEND MONEY TO 5 PRIYO NUMBERS UPTO 25000 TK. EVERY MONTH.$"
REFER DB "ENTER REFERENCE: $" 
PIN DB "ENTER MENU PIN TO CONFIRM: $"  
SUC DB "SUCCESSFUL TRANSACTION !$"
BAL DB "YOUR BALANCE = $"


ONEE DB "1. ROBI$"
TWOO DB "2. AIRTEL$"
THREEE DB "3. BANGLALINK$"
FOURR DB "4. GRAMEENPHONE$"
FIVEE DB "5.TELETALK$"

ZERO DB "0. MAIN MENU$"

ONEEE DB "1. PREPAID$"
TWOOO DB "2. POSTPAID$"
THREEEE DB "3. SKITTO$"
FOURRR DB "4. AUTO RECHARGE$"
FIVEEE DB "5. BEST OFFERS$" 
SIXXX DB "6. INTERNET / VOICE / BUNDLE PACKS $"

OFFERS DB "Enjoy blazing-fast internet with 20GB data at just 99..stay connected anytime, anywhere!$"
PAYY DB "YOU HAVE TO ENTER MERCHANT'S BKASH ACCOUNT NO: $" 


PAYYY DB "PAY BILL$"
ONEEEE DB "1. ELECTRICITY PREPAID / POSTPAID $"
TWOOOO DB "2. GAS$"
THREEEEE DB "3. WATER$"
FOURRRR DB "4. INTERNET / PHONE / TV $"
FIVEEEE DB "5. CITY SERVICES$" 
SIXXXX DB "6. EDUCATION $"
SEVENNN DB "7. FINANCIAL SERVICES $"


A DB "1.PAY BIDYUT$"
B DB "2. DESCO$"
C DB "3.DPDC$"
D DB "4. BPDB$"
E DB "5.WESTZONE$"
F DB "6.NESCO$"

G DB "7. ENTER ID OR CARD NO FOR AVAILING SERVICE: $"


AA DB "1.BRAC$"
BB DB "2. BURO$"
CC DB "3. UDDIPAN$"
DD DB "4. SHAKTI$"

DOWNLOAD DB "DOWNLOADINGG BKASH APP !! $"
DOWNLOADD DB "ENTER NATIONAL ID NO AND SCAN YOUR FACE WITH BKASH PIN FOR LOGIN SECCESSFULLY !! $"

HOW DB "HOW MUCH LOAN DO YOU WANT TO AVAIL ? (3 DIGITS) $"

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here

DO:
CALL PRINT_NEW_LINE
MOV AH , 9 
LEA DX , FIR
INT 21H 

MOV CX , 5 
MOV BL , 0 
MOV SI , 0

USSD:
    MOV AH , 1 
    INT 21H 
    CMP AL , USERCODE[SI]
    JNE INCRE 
    INC BL
    INCRE:
        INC SI
        LOOP USSD

CMP BL , 5
JE WLC 
CALL PRINT_NEW_LINE
MOV AH , 9 
LEA DX , AGA
INT 21H
TR:
CALL PRINT_NEW_LINE 
MOV AH , 9
LEA DX , TRY
INT 21H
CALL PRINT_NEW_LINE
MOV AH , 9 
LEA DX , LOGOUT
INT 21H
CALL PRINT_NEW_LINE
MOV AH , 9 
LEA DX , ENT
INT 21H 
MOV AH , 1 
INT 21H 

CMP AL , '1' 
JE DO
CMP AL , '2' 
JE EXIT
CALL PRINT_NEW_LINE
MOV AH , 9 
LEA DX , INV 
INT 21H 
JMP TR     

WLC:
CALL PRINT_NEW_LINE
MOV AH , 9 
LEA DX , WLCC
INT 21H 
CALL PRINT_NEW_LINE 
MOV AH , 9 
LEA DX , START
INT 21H 
CALL PRINT_NEW_LINE
MOV AH , 9 
LEA DX , ONE
INT 21H 
CALL PRINT_NEW_LINE
MOV AH , 9 
LEA DX , TWO
INT 21H 
CALL PRINT_NEW_LINE
MOV AH , 9 
LEA DX , THREE
INT 21H 
CALL PRINT_NEW_LINE
MOV AH , 9 
LEA DX , FOUR
INT 21H 
CALL PRINT_NEW_LINE
MOV AH , 9 
LEA DX , FIVE
INT 21H 
CALL PRINT_NEW_LINE
MOV AH , 9 
LEA DX , SIX
INT 21H 
CALL PRINT_NEW_LINE
MOV AH , 9 
LEA DX , SEVEN
INT 21H 
CALL PRINT_NEW_LINE
MOV AH , 9 
LEA DX , EIGHT
INT 21H 
CALL PRINT_NEW_LINE
MOV AH , 9 
LEA DX , NINE
INT 21H 
CALL PRINT_NEW_LINE
MOV AH , 9 
LEA DX , TEN
INT 21H 
CALL PRINT_NEW_LINE 
MOV AH , 9 
LEA DX , ENT
INT 21H
MOV AH , 1 
INT 21H 
SUB AL , 48

CMP AL , 1 
JE SEND_MONEY
CMP AL , 2
JE SEND_MONEY
CMP AL , 3
JE MOBL_RECHARGE
CMP AL , 4
JE PAYMENT
CMP AL , 5
JE SEND_MONEY
CMP AL , 6 
JE PAY_BILL
CMP AL , 7
JE MICROFINANCE
CMP AL , 8
JE DOWNLOAD_BKASH_APP
CMP AL , 9 
JE MY_BKASH
CMP AL , 10 
JE RESET_PIN

CALL PRINT_NEW_LINE
MOV AH , 9
LEA DX , PLEASE
INT 21H
CALL PRINT_NEW_LINE
JMP WLC


;--------------------------------------------------

SEND_MONEY:
    CALL PRINT_NEW_LINE
    MOV AH , 9
    LEA DX , NUM
    INT 21H 
    
    LEA SI, PHN
    MOV CX, 11

    READ_LOOP:
        MOV AH, 1
        INT 21h            
        MOV [SI], AL       
        INC SI
        LOOP READ_LOOP

    MOV BYTE PTR [SI], '$'
    
    CALL PRINT_NEW_LINE
    MOV AH , 9 
    LEA DX , FREE
    INT 21H
    CALL PRINT_NEW_LINE
    MOV AH , 9 
    LEA DX , FRE
    INT 21H
    CALL PRINT_NEW_LINE
    MOV AH , 9 
    LEA DX , ENT_AM
    INT 21H 
    
     

INP:
    MOV AH,1          
    INT 21h
    
    CMP AL,0Dh        
    JE  EX

    SUB AL,'0'        
    MOV AH,0        
    MOV BX, AX         

    MOV AX, VAR      
    MOV CX, 10
    MUL CX           
    ADD AX, BX    
    MOV VAR, AX   

    JMP INP

EX:
    MOV AX, VAR
    MOV BX , TAKA 
    CMP AX , BX
    JG NOT_ENOUGH
    SUB BX , AX      
    MOV TAKA ,BX
    MOV CX , VAR
    MOV TAKAA , CX       
    MOV VAR , 0
    JMP REF 
    

NOT_ENOUGH:
CALL PRINT_NEW_LINE
MOV AH , 9
LEA DX , ENOU
INT 21H
JMP OPT

REF:
    CALL PRINT_NEW_LINE
    MOV AH , 9 
    LEA DX , RRE
    INT 21H
    CALL PRINT_NEW_LINE
    MOV AH , 9
    LEA DX , REFER
    INT 21H 
    
    INPP:
    MOV AH,1          
    INT 21h
    
    CMP AL,0Dh        
    JE  EXX

    SUB AL,'0'        
    MOV AH,0        
    MOV BX, AX         

    MOV AX, VAR      
    MOV CX, 10
    MUL CX           
    ADD AX, BX    
    MOV VAR, AX   

    JMP INPP

    EXX:
        MOV CX , VAR
        MOV REFF , CX
        MOV VAR , 0
        CALL PRINT_NEW_LINE 
        
       MOV AH , 9
       LEA DX , ONE
       INT 21H
       CALL PRINT_NEW_LINE
       MOV AH , 9
       LEA DX , TO 
       INT 21H  
       LEA DX, PHN
       MOV AH, 9
       INT 21h
       CALL PRINT_NEW_LINE
       MOV AH , 9
       LEA DX , AMONT
       INT 21H
       MOV AX , TAKAA  
       CALL PRINT_TAKA
       CALL PRINT_NEW_LINE
       
       MOV AH , 9
        LEA DX , PIN
        INT 21H
        INPPP:
        MOV AH,1          
        INT 21h
        
        CMP AL,0Dh        
        JE  EXXX
    
        SUB AL,'0'        
        MOV AH,0        
        MOV BX, AX         
    
        MOV AX, VAR      
        MOV CX, 10
        MUL CX           
        ADD AX, BX    
        MOV VAR, AX   
    
        JMP INPPP  
       
       
       EXXX:
       MOV AH , 9
       LEA DX , SUC
       INT 21H
       CALL PRINT_NEW_LINE
       JMP OPT
       
       
         
; ------------------------------------

BALANCE:     
    MOV AX , TAKA
    CALL PRINT_TAKA 


MOBL_RECHARGE:
    CALL PRINT_NEW_LINE
    MOV AH , 9
    LEA DX , START
    INT 21H
    CALL PRINT_NEW_LINE
    
    MOV AH , 9 
    LEA DX , ONEE
    INT 21H
    CALL PRINT_NEW_LINE
    
    MOV AH , 9 
    LEA DX , TWOO
    INT 21H
    CALL PRINT_NEW_LINE
    MOV AH , 9 
    LEA DX , THREEE
    INT 21H
    CALL PRINT_NEW_LINE
    MOV AH , 9 
    LEA DX , FOURR
    INT 21H
    CALL PRINT_NEW_LINE
    MOV AH , 9 
    LEA DX , FIVEE
    INT 21H
    CALL PRINT_NEW_LINE
    MOV AH , 9 
    LEA DX , ZERO
    INT 21H
    CALL PRINT_NEW_LINE
    MOV AH , 9 
    LEA DX , ENT
    INT 21H 
    MOV AH , 1 
    INT 21H
    SUB AL , 48
    
    CMP AL , 0 
    JE WLC
    
    CALL PRINT_NEW_LINE
    MOV AH , 9 
    LEA DX , ONEEE
    INT 21H
    CALL PRINT_NEW_LINE
    MOV AH , 9 
    LEA DX , TWOOO
    INT 21H
    CALL PRINT_NEW_LINE
    MOV AH , 9 
    LEA DX , THREEEE
    INT 21H
    CALL PRINT_NEW_LINE
    MOV AH , 9 
    LEA DX , FOURRR
    INT 21H
    CALL PRINT_NEW_LINE
    MOV AH , 9 
    LEA DX , FIVEEE
    INT 21H
    CALL PRINT_NEW_LINE 
    MOV AH , 9 
    LEA DX , SIXXX
    INT 21H
    CALL PRINT_NEW_LINE
    MOV AH , 9 
    LEA DX , ZERO
    INT 21H
    CALL PRINT_NEW_LINE
    MOV AH , 9 
    LEA DX , ENT
    INT 21H 
    MOV AH , 1 
    INT 21H
    SUB AL , 48
    
    CMP AL , 6
    JE OFFER
    CMP AL , 5 
    JE OFFER
    CMP AL , 0
    JE WLC 
    
    JMP SEND_MONEY
     

OFFER:
    MOV AH , 9
    LEA DX , OFFERS
    INT 21H
    JMP OPT

PAYMENT:
    CALL PRINT_NEW_LINE
    MOV AH , 9
    LEA DX , PAYY
    INT 21H
    JMP SEND_MONEY
    
    
PAY_BILL:
     CALL PRINT_NEW_LINE
     MOV AH , 9 
     LEA DX , PAYYY
     INT 21H
     
    CALL PRINT_NEW_LINE
    MOV AH , 9 
    LEA DX , ONEEEE
    INT 21H
    CALL PRINT_NEW_LINE
    MOV AH , 9 
    LEA DX , TWOOOO
    INT 21H
    CALL PRINT_NEW_LINE
    MOV AH , 9 
    LEA DX , THREEEEE
    INT 21H
    CALL PRINT_NEW_LINE
    MOV AH , 9 
    LEA DX , FOURRRR
    INT 21H
    CALL PRINT_NEW_LINE
    MOV AH , 9 
    LEA DX , FIVEEEE
    INT 21H
    CALL PRINT_NEW_LINE 
    MOV AH , 9 
    LEA DX , SIXXXX
    INT 21H
    CALL PRINT_NEW_LINE
    MOV AH , 9
    LEA DX , SEVENNN
    INT 21H
    CALL PRINT_NEW_LINE
    MOV AH , 9 
    LEA DX , ENT
    INT 21H 
    MOV AH , 1 
    INT 21H  
    
    
    CALL PRINT_NEW_LINE
    MOV AH , 9 
    LEA DX , A
    INT 21H
    CALL PRINT_NEW_LINE
    MOV AH , 9 
    LEA DX , B
    INT 21H
    CALL PRINT_NEW_LINE
    MOV AH , 9 
    LEA DX , C
    INT 21H
    CALL PRINT_NEW_LINE
    MOV AH , 9 
    LEA DX , D
    INT 21H
    CALL PRINT_NEW_LINE
    MOV AH , 9 
    LEA DX , E
    INT 21H
    CALL PRINT_NEW_LINE 
    MOV AH , 9 
    LEA DX , F
    INT 21H
    CALL PRINT_NEW_LINE
    MOV AH , 9 
    LEA DX , ZERO
    INT 21H
    CALL PRINT_NEW_LINE
    MOV AH , 9 
    LEA DX , ENT
    INT 21H 
    MOV AH , 1 
    INT 21H
    SUB AL , 48
    
    CMP AL , 0
    JE WLC
    
    CALL PRINT_NEW_LINE
    MOV AH , 9 
    LEA DX , G
    INT 21H
    
    JMP SEND_MONEY


MICROFINANCE:
    CALL PRINT_NEW_LINE
    CALL PRINT_NEW_LINE
    MOV AH , 9 
    LEA DX , AA
    INT 21H
    CALL PRINT_NEW_LINE
    MOV AH , 9 
    LEA DX , BB
    INT 21H
    CALL PRINT_NEW_LINE
    MOV AH , 9 
    LEA DX , CC
    INT 21H
    CALL PRINT_NEW_LINE
    MOV AH , 9 
    LEA DX , DD
    INT 21H
    CALL PRINT_NEW_LINE
    
    
    MOV AH , 9
    LEA DX , HOW
    INT 21H
    CALL PRINT_NEW_LINE
    MOV AH , 9 
    LEA DX , ENT
    INT 21H

    MOV AH , 1
    INT 21H
    SUB AL , 48
    
    
    CALL PRINT_NEW_LINE
    MOV AH , 9 
    LEA DX , YEAR
    INT 21H 
    MOV AH , 1 
    INT 21H
    SUB AL , 48
    CALL PRINT_NEW_LINE
    

MOV AX, TAKA
MOV BL, AL
MUL BL         

MOV BX, 15
MUL BX          

MOV BX, 100
DIV BX          

MOV VAR , AX

MOV AH , 9 
LEA DX , BALL
INT 21H

MOV AX , VAR
CALL PRINT_TAKA    
    
    







DOWNLOAD_BKASH_APP:
    CALL PRINT_NEW_LINE
    MOV AH , 9 
    LEA DX , DOWNLOAD
    INT 21H
    CALL PRINT_NEW_LINE
    MOV AH , 9
    LEA DX , DOWNLOADD
    INT 21H
    CALL PRINT_NEW_LINE 
    JMP OPT

MY_BKASH:
    
    MOV AH , 9
    LEA DX , PIN
    INT 21H
    INPPPP:
    MOV AH,1          
    INT 21h
        
    CMP AL,0Dh        
    JE  EXXXX
    
    SUB AL,'0'        
    MOV AH,0        
    MOV BX, AX         
    
    MOV AX, VAR      
    MOV CX, 10
    MUL CX           
    ADD AX, BX    
    MOV VAR, AX   
    
    JMP INPPPP  
       
       
    EXXXX:
      CALL PRINT_NEW_LINE
    MOV AH , 9
    LEA DX , BAL
    INT 21H
    MOV AX , TAKA
    CALL PRINT_TAKA
    JMP OPT


RESET_PIN:
    CALL PRINT_NEW_LINE
    
    MOV AH , 9
    LEA DX , PIN
    INT 21H
    INPPPPP:
    MOV AH,1          
    INT 21h
        
    CMP AL,0Dh        
    JE  EXXXXX
    
    SUB AL,'0'        
    MOV AH,0        
    MOV BX, AX         
    
    MOV AX, VAR      
    MOV CX, 10
    MUL CX           
    ADD AX, BX    
    MOV VAR, AX   
    
    JMP INPPPPP  
       
       
    EXXXXX:
      MOV AH , 9
    LEA DX , PINNN
    INT 21H
    INPPPA:
    MOV AH,1          
    INT 21h
        
    CMP AL,0Dh        
    JE  EXXXA
    
    SUB AL,'0'        
    MOV AH,0        
    MOV BX, AX         
    
    MOV AX, VAR      
    MOV CX, 10
    MUL CX           
    ADD AX, BX    
    MOV VAR, AX   
    
    JMP INPPPA  
       
       
    EXXXA:
         CALL PRINT_NEW_LINE
         MOV AH , 9
         LEA DX , PS
         INT 21H
         CALL PRINT_NEW_LINE
    
    
    
          
OPT:
    CALL PRINT_NEW_LINE
    MOV AH , 9
    LEA DX , TRY
    INT 21H
    CALL PRINT_NEW_LINE
    MOV AH , 9
    LEA DX , LOGOUT
    INT 21H
    CALL PRINT_NEW_LINE
    MOV AH , 9 
    LEA DX , ENT
    INT 21H
    MOV AH , 1 
    INT 21H
    SUB AL , 48
    
    CMP AL , 1
    JE WLC
    CMP AL , 2 
    JE EXIT



EXIT:
;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP 

PRINT_NEW_LINE PROC
    MOV AH , 2 
    MOV DL , 10
    INT 21H
    MOV DL , 13 
    INT 21H 
    RET
PRINT_NEW_LINE ENDP

PRINT_TAKA PROC NEAR
    MOV BX , 10 
    MOV CX , 0 
    DIV_LOOP:
        MOV DX, 0
        DIV BX            
        PUSH DX           
        INC CX
        CMP AX, 0
        JNE DIV_LOOP
    PRINT_LOOP:
        POP DX            
        ADD DL, 48
        MOV AH, 2
        INT 21H
        LOOP PRINT_LOOP
    RET
PRINT_TAKA ENDP


    END MAIN
