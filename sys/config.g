; config.g
; Called on power-up of the Duet Electronics

; General preferences
G90															; Send absolute coordinates...
M83															; ...but relative extruder moves

; Network
M550 P"Predator"											; Set machine name
M552 S1														; Enable network
M586 P0 S1													; Enable HTTP
M586 P1 S0													; Disable FTP
M586 P2 S0													; Disable Telnet

; Delta Settings
;M665 L450.550 R227 H400.0 B185.0							; Pre-calibrated delta values for arms, radius and homed height
;M666 X0 Y0 Z0 A0.00 B0.00									; Pre-calibrated delta values for endstops and tilt
M665 L450.550 R232.176 H408.500 B185.0 X0.341 Y0.560 Z0.000	; Calibrated delta values
M666 X0.364 Y0.457 Z-0.822 A0.00 B0.00						; Calibrated delta values

; Drives
M569 P0 S0													; Drive 0 goes backwards
M569 P1 S0													; Drive 1 goes backwards
M569 P2 S0													; Drive 2 goes backwards
M569 P3 S1													; Drive 3 goes forwards
M92 X80 Y80 Z80 E423										; Set steps per mm
M350 X16 Y16 Z16 E16 I1										; Configure micro-stepping with interpolation for X, Y, Z & E
M203 X18000 Y18000 Z18000 E3600								; Set maximum speeds (mm/min)
M201 X6000 Y6000 Z1500 E3000								; Set accelerations (mm/s^2)
M566 X3000 Y3000 Z3000 E600									; Set maximum instantaneous speed changes (mm/min)
M906 X1200 Y1200 Z1200 E500 I25								; Set motor currents (mA) and motor idle factor in per cent
M84 S30														; Set idle timeout

; Axis Limits
M208 Z0 S1													; Set minimum Z

; Endstops
M574 X2 S1 P"xstop"											; Set active high endstop on X on pin xstop
M574 Y2 S1 P"ystop"											; Set active high endstop on Y on pin ystop
M574 Z2 S1 P"zstop"											; Set active high endstop on Z on pin zstop

; Smart Effector Probe
M558 P8 R0.4 F1200 H10 A5 C"zprobe.in+zprobe.mod"			; Set Z probe type to smart effector, dive height + speeds
G31 P100 X0 Y0 Z-0.210										; Set Z probe trigger value, offset and trigger height
M557 R170 S25												; Define mesh grid

; Heaters
M308 S0 P"bedtemp" Y"thermistor" T100000 B4138 C0 R4700		; Define Sensor0 as the heated bed temperature
M950 H0 C"bedheat" T0										; Define Heater0 as the heated bed, bind to Sensor0
M307 H0 A152.5 C597.6 D1.1 S1.00 V24.1 B0					; PID Tuning for Heater0, Heated Bed
M143 H0 S120												; Set temperature limit for Heater0 to 120C

M308 S1 P"e0temp" Y"thermistor" B4725 C7.060000e-8			; Define Sensor1 as Extruder0 temperature
M950 H1 C"e0heat" T1										; Define Heater1 as Extruder0 heater, bind to Sensor1
M307 H1 A693.7 C250.9 D4.6 S1.00 V24.0 B0					; PID Tuning for Heater1
M143 H1 S285												; Set temperature limit for heater 1 to 285C

; Fans
M950 F0 C"fan0" Q500										; Define Fan0 for Part Cooling (2x Delta BFB0412HHA-A), 500Hz PWM
M106 P0 S0 H-1												; Set Fan0 to default off, manual control
M950 F1 C"fan1" Q500										; Define Fan1 for Hotend cooling, 500Hz PWM
M106 P1 S1 H1 T45											; Set Fan1 to Thermostatic control, max RPM at 45C

; Tools
M563 P0 D0 H1												; Define tool 0
G10 P0 X0 Y0 Z0												; Set tool 0 axis offsets
G10 P0 R0 S0												; Set initial tool 0 active and standby temperatures to 0C

; Additional Settings
M404 N1.75													; Define filament diameter for print monitor
M207 S1.0 R0 F1800 Z0.2										; Firmware retraction
M572 D0 S0.31												; Pressure Advance

; Miscellaneous
G29 S1														; Load bed mesh
T0															; Select first tool (Extruder 0)