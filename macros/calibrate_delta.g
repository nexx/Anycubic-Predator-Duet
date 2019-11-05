; Home the effector
G28

; Heat bed to 60C & nozzle to 130C
M104 S130 T0
M190 S60 T0
M109 S130 T0

; Run delta auto-calibration
M291 P"Please ensure the nozzle is clean and click OK to continue." S2
G32
