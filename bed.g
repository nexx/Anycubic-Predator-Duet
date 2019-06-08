; bed.g
; Called to perform automatic delta calibration via G32

M561								; Clear any existing bed transform
M290 R0 S0							; Clear any babystepping

; Home all towers
G91								; Use relative positioning
G1 X750 Y750 Z750 F3000 S1					; Move all towers to the high end stopping at the endstops (first pass)
G1 X-5 Y-5 Z-5 F500 S2						; Go down a few mm
G1 X10 Y10 Z10 F500 S1						; Move all towers up once more (second pass)
G90								; Switch back to absolute positioning

; Probe the bed at 10 peripheral and 6 halfway points, and perform 6-factor auto compensation
; Before running this, you should have set up your Z-probe trigger height to suit your build, in the G31 command in config.g.
G30 P0 X0.00 Y185.00 Z-99999 H0
G30 P1 X92.50 Y160.21 Z-99999 H0
G30 P2 X160.21 Y92.50 Z-99999 H0
G30 P3 X185.00 Y0.00 Z-99999 H0
G30 P4 X160.21 Y-92.50 Z-99999 H0
G30 P5 X92.50 Y-160.21 Z-99999 H0
G30 P6 X0.00 Y-185.00 Z-99999 H0
G30 P7 X-92.50 Y-160.21 Z-99999 H0
G30 P8 X-160.21 Y-92.50 Z-99999 H0
G30 P9 X-185.00 Y-0.00 Z-99999 H0
G30 P10 X-160.21 Y92.50 Z-99999 H0
G30 P11 X-92.50 Y160.21 Z-99999 H0
G30 P12 X0.00 Y92.50 Z-99999 H0
G30 P13 X80.11 Y-46.25 Z-99999 H0
G30 P14 X-80.11 Y-46.25 Z-99999 H0
G30 P15 X0 Y0 Z-99999 S6

G1 X0 Y0 Z150 F4000						; Raise the effector up from the bed
