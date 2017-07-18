.INCLUDE "../m328Pdef.inc"

;===============================================================================
; Blink an LED
;===============================================================================

.SET LED_MASK = 0b00110000

Setup:
    LDI r16, 0b00000101
    OUT TCCR0B, r16
    LDI r16, LED_MASK
    OUT DDRB, r16
Loop:
    LDI r20, 10
CheckTimer:
    SBIS TIFR0, TOV0
    RJMP CheckTimer
    SBI TIFR0, TOV0
Decrement:
    DEC r20
    BRNE CheckTimer
Toggle:
    OUT PINB, r16
    RJMP Loop
