; bed.g
; Called to perform automatic delta calibration via G32
M561														; Clear any existing bed transform
M290 R0 S0													; Clear any babystepping

; Home axes if required
if !move.axes[0].homed || !move.axes[1].homed || !move.axes[2].homed
  G28

; Probe the bed and do auto calibration
G1 X0.00 Y185.00 Z15 F12000

while true
  if iterations = 5
    abort "Too many auto calibration attempts"
  G30 P0 X0.00 Y185.00 Z-99999 H0
  if result != 0
    continue
  G30 P1 X92.50 Y160.21 Z-99999 H0
  if result != 0
    continue
  G30 P2 X160.21 Y92.50 Z-99999 H0
  if result != 0
    continue
  G30 P3 X185.00 Y0.00 Z-99999 H0
  if result != 0
    continue
  G30 P4 X160.21 Y-92.50 Z-99999 H0
  if result != 0
    continue
  G30 P5 X92.50 Y-160.21 Z-99999 H0
  if result != 0
    continue
  G30 P6 X0.00 Y-185.00 Z-99999 H0
  if result != 0
    continue
  G30 P7 X-92.50 Y-160.21 Z-99999 H0
  if result != 0
    continue
  G30 P8 X-160.21 Y-92.50 Z-99999 H0
  if result != 0
    continue
  G30 P9 X-185.00 Y-0.00 Z-99999 H0
  if result != 0
    continue
  G30 P10 X-160.21 Y92.50 Z-99999 H0
  if result != 0
    continue
  G30 P11 X-92.50 Y160.21 Z-99999 H0
  if result != 0
    continue
  G30 P12 X0.00 Y92.50 Z-99999 H0
  if result != 0
    continue
  G30 P13 X80.11 Y-46.25 Z-99999 H0
  if result != 0
    continue
  G30 P14 X-80.11 Y-46.25 Z-99999 H0
  if result != 0
    continue
  G30 P15 X0 Y0 Z-99999 S6

  if move.calibration.final.deviation <= 0.07
    break
  echo "Repeating calibration because deviation is too high (" ^ move.calibration.final.deviation ^ "mm)"

echo "Auto calibration successful, deviation", move.calibration.final.deviation ^ "mm"

; Raise the effector up from the bed
G1 X0 Y0 Z150 F4000
