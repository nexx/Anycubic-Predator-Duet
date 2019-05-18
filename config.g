; Configuration file for Duet WiFi (firmware version 1.21)
; executed by the firmware on start-up

; General preferences
G90						; Send absolute coordinates...
M83						; ...but relative extruder moves

; Network
M550 P"Predator"				; Set machine name
M552 S1						; Enable network
M586 P0 S1					; Enable HTTP
M586 P1 S0					; Disable FTP
M586 P2 S0					; Disable Telnet

; Delta Settings
;M665 L440.000 R227 H456.0 B185.0		; Set delta radius, diagonal rod length, printable radius and homed height
;M666 X0 Y0 Z0 A0.00 B0.00			; Put your endstop adjustments here, or let auto calibration find them
M665 L440.000 R227.785 H454.655 B185.0 X0.443 Y0.196 Z0.000
M666 X-0.199 Y0.495 Z-0.296 A0.05 B0.02

; Drives
M569 P0 S0					; Drive 0 goes backwards
M569 P1 S0					; Drive 1 goes backwards
M569 P2 S0					; Drive 2 goes backwards
M569 P3 S1					; Drive 3 goes forwards
M350 X16 Y16 Z16 E16 I1				; Configure microstepping with interpolation
M92 X80.00 Y80.00 Z80.00 E415			; Set steps per mm
M566 X1000 Y1000 Z1000 E1000			; Set maximum instantaneous speed changes (mm/min)
M203 X12000.00 Y12000.00 Z12000.00 E10000	; Set maximum speeds (mm/min)
M201 X3000.00 Y3000.00 Z3000.00 E3000.00	; Set accelerations (mm/s^2)
M906 X1000.00 Y1000.00 Z1000.00 E500.00 I60	; Set motor currents (mA) and motor idle factor in per cent
M84 S30						; Set idle timeout

; Retraction
;M207 S4.0 F5000 R-0.025 T2500 Z0.5		; Firmware retraction

; Axis Limits
M208 Z0 S1					; Set minimum Z

; Endstops
M574 X2 Y2 Z2 S1				; Set active high endstops

; Filament Run-out Sensor
M591 D0 P2 C4 S1				; Enable filament sensor on E1 endstop, high when filament present

; Z-Probe
M558 P4 F120 T6000				; Set Z probe type to switch and the dive height + speeds
G31 P500 X0 Y0 Z15.33				; Set Z probe trigger value, offset and trigger height
M557 R170 S25					; Define mesh grid

; Heaters
M307 H0 A152.5 C597.6 D1.1 S1.00 V24.1 B0	; PID Tuning for H0, Heated Bed
M305 P0 T100000 B4138 C0 R4700			; Set thermistor + ADC parameters for heater 0
M143 H0 S120					; Set temperature limit for heater 0 to 120C
M307 H1 A527.2 C137.0 D6.3 S1.00 V24.0 B0	; PID Tuning for H1, Extruder 0
M305 P1 T100000 B4300 C0 R4700			; Set thermistor + ADC parameters for heater 1
M143 H1 S240					; Set temperature limit for heater 1 to 240C

; Fans
M106 P0 S0 I0 F500 H-1				; Part Cooling Fan. Manual control.
M106 P1 S1 I0 F500 H1 T45			; Hotend Heatsink Fan. Thermostatic control, max RPM at 45C.
M106 P2 T25:50 H100:101:102 F100		; Duet Electronics Fan. Thermostatic control, turn on at 25C, max RPM at 65C.

; Tools
M563 P0 D0 H1					; Define tool 0
G10 P0 X0 Y0 Z0					; Set tool 0 axis offsets
G10 P0 R0 S0					; Set initial tool 0 active and standby temperatures to 0C

; Additional Settings
;M572 D0 S0.1					; Pressure Advance
M404 N1.75					; Define filament diameter for print monitor
;M592 D0 A0.07772 B-0.00029			; Nonlinear extrusion. Set parameters for extruder drive 0

; Miscellaneous
;M501						; Load saved parameters from config-override.g
;G29 S1						; Load bed mesh
T0						; Select first tool (Extruder 0)