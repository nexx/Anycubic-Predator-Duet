; config.g
; Called on power-up of the Duet Electronics

; General preferences
G90												; Send absolute coordinates...
M83												; ...but relative extruder moves

; Network
M550 P"Predator"								; Set machine name
M552 S1											; Enable network
M586 P0 S1										; Enable HTTP
M586 P1 S0										; Disable FTP
M586 P2 S0										; Disable Telnet

; Delta Settings
;M665 L450.550 R227 H400.0 B185.0				; Pre-calibrated delta values for arms, radius and homed height
;M666 X0 Y0 Z0 A0.00 B0.00						; Pre-calibrated delta values for endstops and tilt
M665 L450.550 R232.176 H408.500 B185.0 X0.341 Y0.560 Z0.000		; Calibrated delta values
M666 X0.364 Y0.457 Z-0.822 A0.00 B0.00			; Calibrated delta values

; Drives
M569 P0 S0										; Drive 0 goes backwards
M569 P1 S0										; Drive 1 goes backwards
M569 P2 S0										; Drive 2 goes backwards
M569 P3 S1										; Drive 3 goes forwards
M92 X80 Y80 Z80 E423							; Set steps per mm
M350 X16 Y16 Z16 E16 I1							; Configure micro-stepping with interpolation for X, Y, Z & E
M203 X30000 Y30000 Z30000 E3600					; Set maximum speeds (mm/min)
M201 X9000 Y9000 Z9000 E3000					; Set accelerations (mm/s^2)
M566 X3000 Y3000 Z3000 E600						; Set maximum instantaneous speed changes (mm/min)
M906 X1600 Y1600 Z1600 E500 I25					; Set motor currents (mA) and motor idle factor in per cent
M84 S30											; Set idle timeout

; Axis Limits
M208 Z0 S1										; Set minimum Z

; Endstops
M574 X2 Y2 Z2 S1								; Set active high endstops

; Filament Run-out Sensor [REMOVED]
; M591 D0 P2 C4 S0								; Enable filament sensor on E1 endstop, high when filament present

; Smart Effector Probe
M558 P8 R0.4 F1200 H10 A5						; Set Z probe type to smart effector, dive height + speeds
G31 P100 X0 Y0 Z-0.210							; Set Z probe trigger value, offset and trigger height
M557 R170 S25									; Define mesh grid

; Heaters
M307 H0 A152.5 C597.6 D1.1 S1.00 V24.1 B0		; PID Tuning for H0, Heated Bed
M305 P0 T100000 B4138 C0 R4700					; Set thermistor + ADC parameters for heater 0
M143 H0 S120									; Set temperature limit for heater 0 to 120C
M307 H1 A693.7 C250.9 D4.6 S1.00 V24.0 B0		; PID Tuning for H1, Extruder 0
M305 P1 B4725 C7.060000e-8						; Set thermistor + ADC parameters for heater 1 (E3D Cartridge Thermistor)
M143 H1 S285									; Set temperature limit for heater 1 to 285C

; Fans
M106 P0 S0 I0 F500 H-1							; Part Cooling via 2x Delta BFB0412HHA-A. Manual control
M106 P1 S1 I0 F500 H1 T45						; Hotend Heatsink Fan. Thermostatic control, max RPM at 45C

; Tools
M563 P0 D0 H1									; Define tool 0
G10 P0 X0 Y0 Z0									; Set tool 0 axis offsets
G10 P0 R0 S0									; Set initial tool 0 active and standby temperatures to 0C

; Additional Settings
M404 N1.75										; Define filament diameter for print monitor
M207 S1.0 R0 F1800 Z0.2							; Firmware retraction
M572 D0 S0.31									; Pressure Advance

; Miscellaneous
G29 S1											; Load bed mesh
T0												; Select first tool (Extruder 0)
