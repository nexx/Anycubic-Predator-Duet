G31 P100 X0 Y0 Z0			; Reset Z trigger height to 0mm
M290 R0 S0				; Reset babystepping
G29 S2					; Clear bed mesh
G28					; Home the effector
G1 X0 Y0 Z20 F6000			; Move close to the bed
G30					; Probe to find a rough Z 0mm

G1 X0 Y0 Z1 F3000			; Move the nozzle to Z 1mm slowly
G92 Z3.0				; Set the Z height to 3mm, allowing moves below 0
M291 P"Lower the nozzle to until it touches a 0.10mm shim. Click to continue." S2 Z1
G92 Z0					; Define this point as 0mm
G1 X0 Y0 Z20				; Move the probe to Z 20mm
G30 S-3					; Probe and set the trigger height
G1 Z20					; Raise Z to 20mm
