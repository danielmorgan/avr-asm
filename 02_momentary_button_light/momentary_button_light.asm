.INCLUDE "../m328Pdef.inc";

;===============================================================================
; Press a momentary switch to light up an LED
;===============================================================================

.DEF TEMP = r16
.DEF BUTTON_MASK = r17
.DEF LED_MASK = r18

Setup:
    LDI BUTTON_MASK, 0b00000001     ; PD0 (pin2)
    LDI LED_MASK, 0b00100000        ; PB5 (pin19)

    SER TEMP                        ; Port B, set direction all output
    OUT DDRB, TEMP

    CLR TEMP                        ; Port B, pull all 0v
    OUT PORTB, TEMP

    CLR TEMP, 0b11111110            ; Port D, set direction pin0 input
    OUT DDRD, TEMP

Main:
    IN TEMP, PIND                   ; Read PIND...
    CP TEMP, BUTTON_MASK            ; if PIND0 is pulled high...
    BREQ LEDon                      ; branch to LEDon...
    RJMP Main                       ; otherwise branch to Main

LEDon:
    OUT PORTB, LED_MASK
