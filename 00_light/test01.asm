.DEVICE ATmega328P

    LDI r16, 0b00100000     ; Bit 5

    OUT 0x04, r16           ; Set bit 5 on Port B data direction register
                            ; to OUTPUT, leave everything else as INPUT

    OUT 0x05, r16           ; Pull bit 5 on Port B data register to HIGH,
                            ; which corresponds to pin 20.

Start:
    RJMP Start
