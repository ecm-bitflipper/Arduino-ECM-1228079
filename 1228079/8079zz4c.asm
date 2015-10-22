;----------------------------------------------------
;
;   	ECM 1228079, MASK ID $40
;
;	by John Goodman
;
; 	No guarantees of accuracy, use at your own risk.
;
;	Many thanks to ECMguy, Rbob, Grumpy, and all who  
;	continue to give to those who wish to learn
;
;----------------------------------------------------
;      OBJECT FILE: C:\WINDOWS\Desktop\T_8079.BIN
;
;      DISASSEMBLED FOR THE 68HC11
;    BY THE CATS CROSS-DISASSEMBLER
;            RELEASE 1.32
;
;      8/28/2003
;
;      FILE START ADDRESS:  $E000
;      FILE END ADDRESS:    $FFFF
;
;      DISASSEMBLY START ADDRESS:  $E000
;      DISASSMEMBLY END ADDRESS:   $FFFF
;
;      PROGRAM LENGTH: $2000
;
;      DATA TABLES:
;
;      START        END           TYPE
;      $E0E0       $E0EF       Double Byte Constant
;      $FFB7       $FFC4       Single Byte Constant
;      $FFC5       $FFEC       Double Byte Constant
;      $FFED       $FFF5       Single Byte Constant
;      $FFF6       $FFFF       Double Byte Constant
;
;
;
L0000   EQU    $0000 ;	RUN TIME MINOR COUNTER 
L0001   EQU    $0001 ;	STARTS SINCE LAST FAULT 
L0002   EQU    $0002 ;	CLOSED LOOP COOLANT TEMP
L0003   EQU    $0003 ;	TPS BLOCK 0
L0004   EQU    $0004 ;	TPS BLOCK 1
L0005   EQU    $0005 ;	TPS BLOCK 2
L0006   EQU    $0006 ;	TPS BLOCK 3
L0007   EQU    $0007 ;	MALF 1
;	b0 = C24 VEHICLE SPEED SENSOR
;	b1 = C23 AIR FUEL SOLENOID
;	b2 = NOT USED
;	b3 = C21 THROTTLE POSITION SENSOR HIGH
;	b4 = C15 OPEN COOLANT SENSOR
;	b5 = C14 SHORTED COOLANT SENSOR
;	b6 = C13 OXYGEN SENSOR CIRCUIT
;	b7 = C12 NO DISTRIBUTOR REFERENCE PULSES TO ECM	
L0008   EQU    $0008 ;	MALF 2
;	b0 = C42 EST MONITOR
;	b1 = C41 TACH INPUT ERROR
;	b2 = C35 ISC SWITCH CIRCUIT SHORTED
;	b3 = C34 MAP OR VACUUM SENSOR CIRCUIT
;	b4 = NOT USED
;	b5 = C32 BARO CIRCUIT LOW
;	b6 = NOT USED
;	b7 = NOT USED 
L0009   EQU    $0009 ;	MALF 3
;	b0 = C55 GROUNDED 5 VOLT REF, FAULTY O2 SENSOR, OR ECM
;	b1 = C54 CARB MIXTURE CONTROL SOLENOID
;	b2 = C53 EGR FAILURE
;	b3 = NOT USED
;	b4 = C51 FAULTY CALIBRATION UNIT (PROM ERROR)
;	b5 = C45 RICH EXHAUST INDICATION
;	b6 = C44 LEAN EXHAUST INDICATION
;	b7 = C43 ESC FAILURE 
L000A   EQU    $000A
L000C   EQU    $000C
;	b0 = EST 		1 = EST FAILURE
;	b1 = 
;	b2 = 
;	b3 = 
;	b4 = 
;	b5 = 
;	b6 = 
;	b7 =	
L000D   EQU    $000D
;	b0 = MOUNTAIN COAST 1 = MOUNTAIN COAST MODE 
;	b1 = PARK NEUTRAL 0 = DRIVE
;	b2 = 
;	b3 = 
;	b4 = EGR 	1 = EGR ON
;	b5 = 
;	b6 = COLD START 	1= NOT COLD START 
;	b7 = 
L000E   EQU    $000E
;	b0 = 
;	b1 = 
;	b2 = 
;	b3 = 
;	b4 = 
;	b5 = KNOCK RETARD TYPE 	1 = USE RPM FOR KNOCK RETARD
;	b6 = EST 		1 = EST FAILURE
;	b7 = ENGINE RUNNING? 	1 = DRP RECEIVED	
L000F   EQU    $000F
;	b0 = 
;	b1 = 
;	b2 = 
;	b3 = 
;	b4 = 
;	b5 = SPARK ADDER 		1 = ADD SPARK ADDERS 
;	b6 = 
;	b7 =	
L0010   EQU    $0010
;	b0 = 
;	b1 = ;	ISS ON 
;	b2 = 
;	b3 = 
;	b4 = 
;	b5 = 
;	b6 = 
;	b7 = TCC 		1 = LOCKED 
L0011   EQU    $0011 ;	CLCC 1
;	b0 = BLENDED ENRICHMENT FLAG                 1 = BLENDED
;	b1 = COLD START                              1 = COLD START
;	b2 = IDLE LOAD CONTROL WIDE OPEN THROTTLE    1 = WOT
;	b3 = WIDE OPEN THROTTLE                      1 = WOT
;	b4 = WIDE OPEN THROTTLE DIVERT FLAG          1 = DIVERT
;	b5 = O2 RICH/LEAN FLAG                       1 = RICH
;	b6 = NONVOLATILE MEMORY BOMBED               1 = BOMBED
;	b7 = CLOSED LOOP FLAG                        1 = CLOSED LOOP 
L0012   EQU    $0012
;	b0 = 
;	b1 = 
;	b2 = AIR DIVERT  	1 = AIR DIVERT ACTIVE 
;	b3 = AIR SWITCH	1 = AIR SWITCH ACTIVE
;	b4 = 
;	b5 = 
;	b6 = 
;	b7 = 
L0013   EQU    $0013
;	b0 = 
;	b1 = 
;	b2 = 
;	b3 = 
;	b4 = 
;	b5 = O2 RICH/LEAN FLAG                       1 = RICH
;	b6 = 
;	b7 = 
L0014   EQU    $0014
;	b0 = 
;	b1 = START BIT	1 = SUCESSFUL START
;	b2 =  
;	b3 = 
;	b4 = 
;	b5 = 
;	b6 = 
;	b7 =
L0015   EQU    $0015
;	b0 = O2 CODE BIT 			1 = O2 CODE SET
;	b1 = 
;	b2 = 
;	b3 = MAP CODE BIT 		1 = MAP CODE SET 
;	b4 = 1ST KNOCK TEST BIT		1 = FIRST KNOCK FAILURE 
;	b5 = 2ND KNOCK TEST BIT		1 = SECOND KNOCK FAILURE 
;	b6 = CODE 43B BIT			1 = SET CODE 43B 
;	b7 = KNOCK BIT			1 = ENGINE KNOCKING 
L0016   EQU    $0016
;	b0 = 
;	b1 = COOLANT CODE 13	1 = COOLANT TEMP HOT C13
;	b2 = CODE 53 BIT		1 = CODE 53 SET
;	b3 = 
;	b4 = DECELL BIT		1 = DECELL 
;	b5 = 
;	b6 = CODE 13 MIN RUN TIME BIT		1 = MIN RUN TIME C13 MET 
;	b7 =
L0017   EQU    $0017
L0018   EQU    $0018
;	b0 = 
;	b1 = 
;	b2 = 
;	b3 = 
;	b4 = 
;	b5 =  
;	b6 = 
;	b7 =	SES			1 = SES LIGHT ON
L0019   EQU    $0019 ;	RPM FOR TABLE 
;$00	=	400 RPM
;$10	=	600 RPM
;$20	=	800 RPM
;$30	=	1000 RPM
;$40	=	1200 RPM
;$50	=	1400 RPM
;$60	=	1600 RPM
;$70	=	1800 RPM
;$80	=	2000 RPM
;$90	=	2200 RPM
;$A0	=	2400 RPM
;$B0	=	3000 RPM
;$C0	=	3600 RPM
;$D0	=	4200 RPM
;$E0	=	4800 RPM
;$F0	=	5400 RPM 
L001A   EQU    $001A ;	ENGINE RPM/25
L001B   EQU    $001B ;	ENGINE RPM/6.25
L001C   EQU    $001C ;	CYL CORR REF PERIOD 
L001E   EQU    $001E ;	FILTERED ENGINE RPM 
L0020   EQU    $0020 ;	PRESSURE
L0022   EQU    $0022 ;	BARO SPEED DENSITY
;									$00 = 10 KPA $90 = 100 KPA 
L0023   EQU    $0023 ;	MAP OLD 
L0024   EQU    $0024 ;	MAP N-2
L0026   EQU    $0026 ;	BARO
L0027   EQU    $0027 ;	BARO 
L0029   EQU    $0029 ;	MAP
L002A   EQU    $002A ;	MAP
L002B   EQU    $002B ;	BARO CORRECTED TPS 
L002C   EQU    $002C ;	TPS
L002D   EQU    $002D ;	MINIMUM THROTTLE POSITION
L002E   EQU    $002E
L002F   EQU    $002F ;	THROTTLE POSITION
L0030   EQU    $0030 ;	TPS OLD 
L0031   EQU    $0031 ;	TPS OLD 
L0032   EQU    $0032 ;	TPS OLD 
L0033   EQU    $0033 ;	TPS OLD 
L0034   EQU    $0034 ;	BATT VOLT
L0035   EQU    $0035 ;	COOLANT TEMP
L0036   EQU    $0036 ;	COOLANT TEMP 
L0037   EQU    $0037 ;	INVERSE COOLANT TEMP
L0038   EQU    $0038 ;	INVERSE COOLANT TEMP
L0039   EQU    $0039 ;	COOLANT TEMP START 
L003A   EQU    $003A ;	INVERSE COOL TEMP START 
L003B   EQU    $003B ;	O2 SENSOR
L003C   EQU    $003C ;	O2 A/D RAW 
L003D   EQU    $003D ;	O2 SENSOR VOLTAGE AVG WORD 
L003F   EQU    $003F ;	SLOW O2 FILTERED 
L0041   EQU    $0041 ;	FAST O2 FILTERED 
L0043   EQU    $0043
L0044   EQU    $0044 ;	VSS COUNT N-2
L0046   EQU    $0046 ;	VSS COUNT OLD 
L0048   EQU    $0048 ;	VSS COUNT 
L004A   EQU    $004A ;	VEHICLE SPEED
L004C   EQU    $004C ;	LOW SPEED VSS 
L004D   EQU    $004D ;	ENGINE RUN TIME MSB
L004E   EQU    $004E ;	ENGINE RUN TIME LSB
L004F   EQU    $004F ;	REVOLVING MEMORY 0
L0050   EQU    $0050 ;	REVOLVING MEMORY 1
L0051   EQU    $0051 ;	REVOLVING MEMORY 2
L0052   EQU    $0052 ;	REVOLVING MEMORY 3
L0053   EQU    $0053 ;	REVOLVING MEMORY 4
L0054   EQU    $0054
L0056   EQU    $0056
L0057   EQU    $0057
L0059   EQU    $0059
L005A   EQU    $005A
L005B   EQU    $005B
L005E   EQU    $005E
L0060   EQU    $0060
L0062   EQU    $0062
L0064   EQU    $0064 ;	MAIN SPARK 
L0065   EQU    $0065 ;	SA BY COOLANT TEMP 
L0066   EQU    $0066 ;	SA BY COOLANT TEMP AND VAC 
L0067   EQU    $0067 ;	FINAL SA
L0069   EQU    $0069 ;	SA BY BARO AND MAP 
L006A   EQU    $006A ;	CALC SA 
L006C   EQU    $006C ;	HIGHWAY MODE SA BY MAP 
L006D   EQU    $006D ;	SA BY RPM AND MAP UNLOCKED TCC
L006E   EQU    $006E
L006F   EQU    $006F
L0071   EQU    $0071 ;	HIGHWAY MODE COUNTER
L0073   EQU    $0073
L0075   EQU    $0075
L0076   EQU    $0076
L0077   EQU    $0077
L0078   EQU    $0078
L0079   EQU    $0079
L007B   EQU    $007B
L007D   EQU    $007D
L007E   EQU    $007E ;	EST FAILURE COUNTER
L007F   EQU    $007F ;	OLD KNOCK COUNTS 
L0081   EQU    $0081 ;	OLD KNOCK COUNTS 
L0082   EQU    $0082 ;	CODE 43 COUNTER
L0083   EQU    $0083 ;	KNOCK RETARD 
L0084   EQU    $0084 ;	MINOR LOOP 0 COUNTER
L0085   EQU    $0085 ;	KNOCK TEST COUNTER 
L0086   EQU    $0086 ;	TRANS GEAR STATUS 
;	b0 = NOT USED
;	b1 = NOT USED
;	b2 = NOT USED
;	b3 = NOT USED
;	b4 = NOT USED
;	b5 = HIGH GEAR SWITCH                        0 = 4TH GEAR
;	b6 = LOW/MID GEAR SWITCH                     0 = 3RD GEAR
;	b7 = NOT USED 
L0087   EQU    $0087 ;	CONVERTOR LOCK DELAY 
L0088   EQU    $0088
L008A   EQU    $008A
L008B   EQU    $008B
L008D   EQU    $008D
L008E   EQU    $008E ;	CROSS COUNTS
L008F   EQU    $008F
L0090   EQU    $0090
L0091   EQU    $0091
L0092   EQU    $0092 ;	MC DUTY CYCLE BLOCK 0
;	MC DUTY CYCLE BLOCK 1
;	MC DUTY CYCLE BLOCK 2
;	MC DUTY CYCLE BLOCK 3
L00A2   EQU    $00A2 ;	MC DUTY CYCLE
L00A4   EQU    $00A4 ;	MCS DUTY CYCLE OUT
L00A5   EQU    $00A5 ;	DUTY CYCLE BLOCK NUMBER 
L00A6   EQU    $00A6
L00A7   EQU    $00A7
L00A8   EQU    $00A8
L00A9   EQU    $00A9 ;	TPS BLOCK VALUE CURRENT
L00AB   EQU    $00AB
L00AD   EQU    $00AD
L00AE   EQU    $00AE ;	MIN TPS CURRENT BLOCK 
L00AF   EQU    $00AF ;	MAX TPS CURRENT BLOCK 
L00B0   EQU    $00B0 ;	MIN RPM CURRENT BLOCK 
L00B1   EQU    $00B1 ;	MAX RPM CURRENT BLOCK 
L00B2   EQU    $00B2
L00B3   EQU    $00B3 ;	CYCLES LEFT OPEN LOOP
L00B4   EQU    $00B4
L00B5   EQU    $00B5
L00B6   EQU    $00B6 ;	SWITCH AIR COUNTER 
L00B7   EQU    $00B7 ;	MAP OLD
L00B8   EQU    $00B8 ;	WOT DIVERT FLAG COUNTER 
L00B9   EQU    $00B9 ;	DIVERT COUNTER 
L00BA   EQU    $00BA ;	EGR DELAY COUNTER 
L00BB   EQU    $00BB ;	EGR DC
L00BC   EQU    $00BC ;	CLD STRT DEC DELAY COUNTER 
L00BE   EQU    $00BE ;	IDLE LD WOT DLY COUNTER 
L00C0   EQU    $00C0 ;	LEAN COUNTER 
L00C1   EQU    $00C1
L00C2   EQU    $00C2
L00C3   EQU    $00C3
L00C4   EQU    $00C4
L00C5   EQU    $00C5
L00C6   EQU    $00C6
L00C7   EQU    $00C7
L00C8   EQU    $00C8 ;	MALF 1 CODE SET
L00C9   EQU    $00C9 ;	MALF 2 CODE SET
L00CA   EQU    $00CA ;	MALF 3 CODE SET
L00CB   EQU    $00CB ;	MALF 1 CURRENT CODES
L00CC   EQU    $00CC ;	MALF 2 CURRENT CODES 
L00CD   EQU    $00CD ;	MALF 3 CURRENT CODES 
L00CE   EQU    $00CE ;	TIME OVER MAX TPS 
L00CF   EQU    $00CF ;	MAP OLD 
L00D0   EQU    $00D0
L00D1   EQU    $00D1 ;	CODE 53 COUNTER 
L00D2   EQU    $00D2 ;	DECELL COUNTER 
L00D3   EQU    $00D3
L00D5   EQU    $00D5 ;	CODE 44 COUNTER 
L00D6   EQU    $00D6 ;	CODE 45 COUNTER 
L00D7   EQU    $00D7 ;	CODE 13 TIMER 
L00D8   EQU    $00D8 ;	CODE 34 TIMER 
L00D9   EQU    $00D9 ;	CODE 24 COUNTER 
L00DA   EQU    $00DA
L00DB   EQU    $00DB ;	MOUNTAIN COAST TIMER
L00DC   EQU    $00DC


L00DD   EQU    $00DD ;      EPROM CHECKSUM MSB
L00DE   EQU    $00DE ;      EPROM CHECKSUM LSB

L00DF	EQU    $00DF ;      COUNT COPIES FROM RAM TO SRAM

L0801   EQU    $0801 ;	I/O STATUS 1
;	OUT
;	b0 = NOT USED
;	b1 = NOT USED
;	b2 = NOT USED
;	b3 = TCC                                     1 = SOLENOID ON
;	IN
;	b4 = NOT USED
;	b5 = HIGH GEAR SWITCH                        0 = 4TH GEAR
;	b6 = LOW/MID GEAR SWITCH                     0 = 3RD GEAR
;	b7 = NOT USED 
L0881   EQU    $0881 ;	I/O STATUS 2
;	OUT
;	b0 = AIR DIVERT SOLENOID                     1 = SOLENOID ON
;	b1 = AIR SWITCH SOLENOID                     1 = SOLENOID ON
;	b2 = NOT USED
;	b3 = ISS                                     1 = ISS ON
;	IN
;	b4 = NOT USED
;	b5 = PARK/NEUTRAL                            0 = DRIVE
;	b6 = A/C SOLENOID                            0 = A/C ON
;	b7 = AIR/FUEL SOLENOID TEST                  1 = SOLENOID ON 
;
;	ECM HARDWARE COUNTER LOCATIONS
;
L0C00   EQU    $0C00 ;	DRP COUNTER 
L0C04   EQU    $0C04 ;	VSS COUNTER	
L0C06   EQU    $0C06 ;	EST CIRCUIT
L0C0A   EQU    $0C0A ;	KNOCK COUNTER
L0C0C   EQU    $0C0C ;	
L0C14   EQU    $0C14 ;	MCS DC OUT
L0C16   EQU    $0C16 ;	
L0C18   EQU    $0C18 ;	EGR OUT
L0C1C   EQU    $0C1C ;	SPARK DWELL
L0C24   EQU    $0C24 ;	EST
L0C26   EQU    $0C26 ;	LAST EST FALL COUNTER
L0C28   EQU    $0C28 ;	LAST EST FALL COUNTER
L0C2C   EQU    $0C2C ;	EST
L0C36   EQU    $0C36 ;	EST FALL COUNTER
L0C38   EQU    $0C38 ;	HIGH SPEED RTS COUNTER
L0C3C   EQU    $0C3C ; 	PWM control register

; 0000 0000 0000 1010 @ powerup
; 1011 1001 0010 1010 @ init
; 0000 0000 0000 0100 for watchdog (COP)
; 0000 0000 0000 1000 for CES light
; 0000 0000 0001 0000 FOR EST FAILURE
; 0000 0000 0100 0000 for ??

L1000   EQU    $1000 ;	A/D VALUE IN 
L1002   EQU    $1002 ;	A/D CHANNEL OUT 

L3000 EQU $3000
L3001 EQU $3001
L3002 EQU $3002
L3003 EQU $3003
L3004 EQU $3004
L3005 EQU $3005
L3006 EQU $3006
L3007 EQU $3007
L3008 EQU $3008
L3009 EQU $3009
L300A EQU $300A
L300B EQU $300B
L300C EQU $300C
L300E EQU $300E
L300F EQU $300F
L3010 EQU $3010
L3011 EQU $3011
L3012 EQU $3012
L3013 EQU $3013
L3014 EQU $3014
L3015 EQU $3015
L3016 EQU $3016
L3017 EQU $3017
L3018 EQU $3018
L3019 EQU $3019
L301A EQU $301A
L301B EQU $301B
L301C EQU $301C
L301D EQU $301D
L301E EQU $301E
L301F EQU $301F
L3021 EQU $3021
L3023 EQU $3023
L3025 EQU $3025
L3027 EQU $3027
L3029 EQU $3029
L302A EQU $302A
L302B EQU $302B
L302C EQU $302C
L302D EQU $302D
L302E EQU $302E
L302F EQU $302F
L3030 EQU $3030
L3031 EQU $3031
L3032 EQU $3032
L3033 EQU $3033
L3034 EQU $3034
L3035 EQU $3035
L3036 EQU $3036
L317F EQU $317F
L3180 EQU $3180
L3181 EQU $3181
L3182 EQU $3182
L3183 EQU $3183
L3184 EQU $3184
L3185 EQU $3185
L3186 EQU $3186
L3187 EQU $3187
L3188 EQU $3188
L3189 EQU $3189
L318A EQU $318A
L318B EQU $318B
L318D EQU $318D
L318E EQU $318E
L318F EQU $318F
L3190 EQU $3190
L3191 EQU $3191
L3192 EQU $3192
L3193 EQU $3193
L3198 EQU $3198
L3199 EQU $3199
L319A EQU $319A
L319B EQU $319B
L319C EQU $319C
L319D EQU $319D
L319E EQU $319E
L319F EQU $319F
L31A6 EQU $31A6
L31A7 EQU $31A7
L31A8 EQU $31A8
L31AA EQU $31AA
L31AB EQU $31AB
L31B1 EQU $31B1
L31B2 EQU $31B2
L31B3 EQU $31B3
L31C2 EQU $31C2
L31C3 EQU $31C3
L31C4 EQU $31C4
L31C7 EQU $31C7
L31C8 EQU $31C8
L31CA EQU $31CA
L31CB EQU $31CB
L31CD EQU $31CD
L31D6 EQU $31D6
L31D8 EQU $31D8
L31D9 EQU $31D9
L31DA EQU $31DA
L31DB EQU $31DB
L31DC EQU $31DC
L31DD EQU $31DD
L31DE EQU $31DE
L31DF EQU $31DF
L31E1 EQU $31E1
L31E3 EQU $31E3
L31E4 EQU $31E4
L31E5 EQU $31E5
L31E6 EQU $31E6
L31E7 EQU $31E7
L31E8 EQU $31E8
L31E9 EQU $31E9
L3219 EQU $3219
L321A EQU $321A
L321B EQU $321B
L321C EQU $321C
L321D EQU $321D
L321E EQU $321E
L3238 EQU $3238
L3239 EQU $3239
L323E EQU $323E
L3240 EQU $3240
L3242 EQU $3242
L3243 EQU $3243
L3244 EQU $3244
L3245 EQU $3245
L3246 EQU $3246
L3247 EQU $3247
L3248 EQU $3248
L3249 EQU $3249
L324A EQU $324A
L324B EQU $324B
L324C EQU $324C
L324D EQU $324D
L32AE EQU $32AE
L32B0 EQU $32B0
L32B2 EQU $32B2
L32B3 EQU $32B3
L32B5 EQU $32B5
L32B6 EQU $32B6
L32B7 EQU $32B7
L32B8 EQU $32B8
L32B9 EQU $32B9
L32BA EQU $32BA
L32BB EQU $32BB
L32BC EQU $32BC
L32BD EQU $32BD
L32BE EQU $32BE
L32BF EQU $32BF
L32C0 EQU $32C0
L32C1 EQU $32C1
L32C2 EQU $32C2
L32C3 EQU $32C3
L32C4 EQU $32C4
L32C5 EQU $32C5
L32C6 EQU $32C6
L32C7 EQU $32C7
L32C8 EQU $32C8
L32C9 EQU $32C9
L32CA EQU $32CA
L32CB EQU $32CB
L32CC EQU $32CC
L32CD EQU $32CD
L32CE EQU $32CE
L32CF EQU $32CF
L32D0 EQU $32D0
L32D1 EQU $32D1
L32D2 EQU $32D2
L32D3 EQU $32D3
L32D4 EQU $32D4
L32D5 EQU $32D5
L32D6 EQU $32D6
L32D7 EQU $32D7
L32D8 EQU $32D8
L32D9 EQU $32D9
L32DA EQU $32DA
L32DB EQU $32DB
L32DC EQU $32DC
L32DD EQU $32DD
L32DE EQU $32DE
L32DF EQU $32DF
L32E0 EQU $32E0
L32E1 EQU $32E1
L32E2 EQU $32E2
L32E3 EQU $32E3
L32E4 EQU $32E4
L32E5 EQU $32E5
L32E6 EQU $32E6
L32E7 EQU $32E7
L32E8 EQU $32E8
L32E9 EQU $32E9
L32EA EQU $32EA
L32EB EQU $32EB
L32ED EQU $32ED
L32EE EQU $32EE
L32EF EQU $32EF
L32F0 EQU $32F0
L32F1 EQU $32F1
L32F2 EQU $32F2
L32F3 EQU $32F3
L33D2 EQU $33D2
L33D4 EQU $33D4
L33EA EQU $33EA
L33EB EQU $33EB
L33EC EQU $33EC
L33F7 EQU $33F7
L33F8 EQU $33F8
L33F9 EQU $33F9
L33FA EQU $33FA
L33FD EQU $33FD
L3FFE EQU $3FFE
L3FFF EQU $3FFF

L5000   EQU    $5000
L5002   EQU    $5002
L5800   EQU    $5800
L5803   EQU    $5803
L5806   EQU    $5806
L5809   EQU    $5809
L580C   EQU    $580C
L580F   EQU    $580F
L5812   EQU    $5812
L5815   EQU    $5815
;
;

;
;          
        ORG    $3000
;          
;          
        FCB     $64 ;	INSTALLED EQUIPMENT 0
;	b0 = 0
;	b1 = 0
;	b2 = 1
;	b3 = 0
;	b4 = 0
;	b5 = 1
;	b6 = 1
;	b7 = 0
        FCB     $03 ;	INSTALLED EQUIPMENT 1
;	b0 = 
;	b1 = 
;	b2 = 
;	b3 = 
;	b4 = SPARK MODE 0 = FORCE SPARK ADDER 1 = ADD NOT CLOSED LOOP PASSED KNOCK
;	b5 = 
;	b6 =
;	b7 = TRANS TYPE  0 = AUTOMATIC TRANS 
        FCB     $FD ;	INSTALLED EQUIPMENT 2
;	b0 = 
;	b1 = 
;	b2 = 
;	b3 = 
;	b4 = 
;	b5 = 
;	b6 =
;	b7 = 
        FCB     $8C ;	INSTALLED EQUIPMENT 3
;	b0 = 0
;	b1 = 0
;	b2 = 1
;	b3 = 1	0 = RPM DIVERT 1 = VSS DIVERT
;	b4 = 0
;	b5 = 0
;	b6 = 0
;	b7 = 1	1 = OD TRANS INSTALLED 
        FCB     $FC
;	b0 = 
;	b1 = 
;	b2 = 
;	b3 = 
;	b4 = ISS RPM/VSS SWITCH 	1 = USE SPEED ISS 
;	b5 = 
;	b6 =WOT 	0 = USE BLENDED FUEL 1 = USE WOT 
;	b7 = 
        FCB     $14
;	b0 = 
;	b1 = 
;	b2 = 
;	b3 = CLOSED LOOP MOUNTAIN COAST		0 = NO MNT CST IN CLSD LP 
;	b4 = 
;	b5 = 
;	b6 =
;	b7 = 
        FCB     $11 ;4	INITIAL SPARK ADVANCE
        FCB     $FF ;	MIN COOLANT TEMP FOR
        FCB     $48 ;	MIN RPM FOR HIGHWAY MODE
        FCB     $4E ;	MAX COOL TEMP FOR HWY MODE
        FCB     $88 ;	MIN COOL TEMP FOR HWY MODE
        FCB     $FF ;	MAX MAP FOR HIGHWAY MODE
        FCB     $06 ;	DELAY FOR OFF IDLE SA MSB
        FCB     $40 ;	DELAY FOR OFF IDLE SA LSB
        FCB     $D0 ;	MAX RPM HI RPM SPARK CORR 
        FCB     $00 ;	FACTOR HI RPM SPARK CORR 
        FCB     $00 ;	MAX RPM SPARK CORRECTION 
        FCB     $00 ;	FACTOR RPM SPARK CORR 
        FCB     $00 ;	MAX MAP SPARK CORRECTION 
        FCB     $00 ;	FACTOR SPARK CORRECTION 
        FCB     $30 ;	MAP FILTER CONSTANT
        FCB     $FF ;	MAX COOL TEMP COLD START 
        FCB     $39 ;	DEFAULT COOLANT SPARK 
        FCB     $00 ;	HOT CTS DIFF SA 
        FCB     $00 ;	SPARK ADDER NORMALIZER
        FCB     $39 ;	LOCKED RPM AND MAP SA 
        FCB     $02
        FCB     $FF
        FCB     $48 ;	MIN RPM FOR EST TEST 
        FCB     $04 ;	EST FAILURES BEFORE CODE 
        FCB     $04
        FCB     $09
        FCB     $09
        FCB     $00
        FCB     $00
        FCB     $00 ;5	MAX SPARK ADVANCE MSB
        FCB     $6C ;	MAX SPARK ADVANCE LSB
        FCB     $FF ;	MINIMUM SPARK ADVANCE MSB WARM
        FCB     $F4 ;	MINIMUM SPARK ADVANCE LSB WARM
        FCB     $00 ;	MINIMUM SPARK ADVANCE MSB COOL
        FCB     $00 ;	MINIMUM SPARK ADVANCE LSB COOL
        FCB     $7D ;	MIN SPK ADV SWITCH PNT
        FCB     $10
        FCB     $00
        FCB     $FE ;	MIN TPS START WOT KNOCK
        FCB     $05 ;	MIN TPS STAY WOT KNOCK
        FCB     $00
        FCB     $00 ;	SPARK ADVANCE ALDL DIAG MODE
        FCB     $22 ;	MIN RPM FOR KNOCK RETARD
        FCB     $A9 ;	MIN TEMP FOR KNOCK RETARD
        FCB     $40 ;	MIN COOL RISE FOR KNOCK RETARD
        FCB     $40 ;	MIN SPEED FOR KNOCK RETARD
        FCB     $80 ;	ENGINE RPM FILTER CONSTANT
        FCB     $31 ;	MIN COUNT ENGINE RUNNING
        FCB     $00 ;	KNOCK RETARD FACTOR
;***********************************************************************
;3D TABLE:1	MAIN SPARK		L0064
;***********************************************************************
        FCB     $00 ;	USE MAP
        FCB     $10 ;	200 RPM OFFSET
        FCB     $00 ;	0 KPA OFFSET
        FCB     $0C ;	12 COL/ROW
;600 RPM
        FCB     $50 ;	40 KPA
        FCB     $50 ;	45 KPA
        FCB     $50 ;	50 KPA
        FCB     $50 ;	55 KPA
        FCB     $50 ;	60 KPA
        FCB     $50 ;	65 KPA
        FCB     $50 ;	70 KPA
        FCB     $4A ;	75 KPA
        FCB     $44 ;	80 KPA
        FCB     $3E ;	85 KPA
        FCB     $39 ;	90 KPA
        FCB     $36 ;	95 KPA
;800 RPM
        FCB     $50 ;	40 KPA
        FCB     $50 ;	45 KPA
        FCB     $50 ;	50 KPA 
        FCB     $50 ;	55 KPA 
        FCB     $50 ;	60 KPA 
        FCB     $50 ;	65 KPA 
        FCB     $50 ;	70 KPA 
        FCB     $4A ;	75 KPA 
        FCB     $44 ;	80 KPA 
        FCB     $3E ;	85 KPA 
        FCB     $3C ;	90 KPA 
        FCB     $3C ;	95 KPA 
;1000 RPM
        FCB     $50 ;	40 KPA 
        FCB     $50 ;	45 KPA 
        FCB     $50 ;	50 KPA 
        FCB     $50 ;	55 KPA 
        FCB     $50 ;	60 KPA 
        FCB     $4A ;	65 KPA 
        FCB     $47 ;	70 KPA 
        FCB     $41 ;	75 KPA 
        FCB     $3E ;	80 KPA 
        FCB     $3C ;	85 KPA 
        FCB     $3C ;	90 KPA 
        FCB     $3C ;	95 KPA 
;1200 RPM
        FCB     $50 ;	40 KPA 
        FCB     $50 ;	45 KPA 
        FCB     $50 ;	50 KPA 
        FCB     $50 ;	55 KPA 
        FCB     $50 ;	60 KPA 
        FCB     $50 ;	65 KPA 
        FCB     $4D ;	70 KPA 
        FCB     $4A ;	75 KPA 
        FCB     $4A ;	80 KPA 
        FCB     $4A ;	85 KPA 
        FCB     $4A ;	90 KPA 
        FCB     $4A ;	95 KPA 
;1400 RPM
        FCB     $50 ;	40 KPA 
        FCB     $50 ;	45 KPA 
        FCB     $50 ;	50 KPA 
        FCB     $50 ;	55 KPA 
        FCB     $50 ;	60 KPA 
        FCB     $50 ;	65 KPA 
        FCB     $50 ;	70 KPA 
        FCB     $50 ;	75 KPA 
        FCB     $50 ;	80 KPA 
        FCB     $50 ;	85 KPA 
        FCB     $50 ;	90 KPA 
        FCB     $50 ;	95 KPA 
;1600 RPM
        FCB     $50 ;	40 KPA 
        FCB     $50 ;	45 KPA 
        FCB     $50 ;	50 KPA 
        FCB     $50 ;	55 KPA 
        FCB     $50 ;	60 KPA 
        FCB     $50 ;	65 KPA 
        FCB     $50 ;	70 KPA 
        FCB     $50 ;	75 KPA 
        FCB     $50 ;	80 KPA 
        FCB     $50 ;	85 KPA 
        FCB     $50 ;	90 KPA 
        FCB     $50 ;	95 KPA 
;1800 RPM
        FCB     $52 ;	40 KPA 
        FCB     $50 ;	45 KPA 
        FCB     $4D ;	50 KPA 
        FCB     $4A ;	55 KPA 
        FCB     $4A ;	60 KPA 
        FCB     $47 ;	65 KPA 
        FCB     $44 ;	70 KPA 
        FCB     $4A ;	75 KPA 
        FCB     $52 ;	80 KPA 
        FCB     $52 ;	85 KPA 
        FCB     $52 ;	90 KPA 
        FCB     $52 ;	95 KPA 
;2000 RPM
        FCB     $52 ;	40 KPA 
        FCB     $52 ;	45 KPA 
        FCB     $52 ;	50 KPA 
        FCB     $52 ;	55 KPA 
        FCB     $4D ;	60 KPA 
        FCB     $4A ;	65 KPA 
        FCB     $47 ;	70 KPA 
        FCB     $50 ;	75 KPA 
        FCB     $58 ;	80 KPA 
        FCB     $58 ;	85 KPA 
        FCB     $55 ;	90 KPA 
        FCB     $52 ;	95 KPA 
;2200 RPM
        FCB     $55 ;	40 KPA 
        FCB     $55 ;	45 KPA 
        FCB     $55 ;	50 KPA 
        FCB     $55 ;	55 KPA 
        FCB     $55 ;	60 KPA 
        FCB     $55 ;	65 KPA 
        FCB     $55 ;	70 KPA 
        FCB     $55 ;	75 KPA 
        FCB     $55 ;	80 KPA 
        FCB     $55 ;	85 KPA 
        FCB     $50 ;	90 KPA 
        FCB     $55 ;	95 KPA 
;2400 RPM
        FCB     $55 ;	40 KPA 
        FCB     $55 ;	45 KPA 
        FCB     $55 ;	50 KPA 
        FCB     $55 ;	55 KPA 
        FCB     $55 ;	60 KPA 
        FCB     $55 ;	65 KPA 
        FCB     $52 ;	70 KPA 
        FCB     $5B ;	75 KPA 
        FCB     $63 ;	80 KPA 
        FCB     $5E ;	85 KPA 
        FCB     $50 ;	90 KPA 
        FCB     $55 ;	95 KPA 
;3000 RPM
        FCB     $55 ;	40 KPA 
        FCB     $55 ;	45 KPA 
        FCB     $55 ;	50 KPA 
        FCB     $55 ;	55 KPA 
        FCB     $55 ;	60 KPA 
        FCB     $58 ;	65 KPA 
        FCB     $55 ;	70 KPA 
        FCB     $61 ;	75 KPA 
        FCB     $58 ;	80 KPA 
        FCB     $58 ;	85 KPA 
        FCB     $58 ;	90 KPA 
        FCB     $5B ;	95 KPA 
;3600 RPM
        FCB     $55 ;	40 KPA 
        FCB     $55 ;	45 KPA 
        FCB     $55 ;	50 KPA 
        FCB     $55 ;	55 KPA 
        FCB     $55 ;	60 KPA 
        FCB     $55 ;	65 KPA 
        FCB     $5B ;	70 KPA 
        FCB     $52 ;	75 KPA 
        FCB     $55 ;	80 KPA 
        FCB     $55 ;	85 KPA 
        FCB     $5E ;	90 KPA 
        FCB     $5E ;	95 KPA 
;***********************************************************************
;3D TABLE:6	SA BY COOLANT TEMP AND MAP	L0066
;***********************************************************************
        FCB     $00 ;	USE MAP
        FCB     $00 ;	0 OFFSET
        FCB     $00 ;	0 OFFSET
        FCB     $05 ;	5 COL/ROW	
;	-5 C
        FCB     $55 ;	55 KPA 
        FCB     $50 ;	65 KPA 
        FCB     $4A ;	75 KPA 
        FCB     $44 ;	85 KPA 
        FCB     $3F ;	95 KPA 
;	5 C
        FCB     $55 ;	55 KPA 
        FCB     $50 ;	65 KPA 
        FCB     $4A ;	75 KPA 
        FCB     $44 ;	85 KPA 
        FCB     $3F ;	95 KPA 
;	15 C
        FCB     $55 ;	55 KPA 
        FCB     $50 ;	65 KPA 
        FCB     $4A ;	75 KPA 
        FCB     $44 ;	85 KPA 
        FCB     $3F ;	95 KPA 
;	25 C
        FCB     $39 ;	55 KPA 
        FCB     $39 ;	65 KPA 
        FCB     $39 ;	75 KPA 
        FCB     $39 ;	85 KPA 
        FCB     $39 ;	95 KPA 
;	35 C
        FCB     $39 ;	55 KPA 
        FCB     $39 ;	65 KPA 
        FCB     $39 ;	75 KPA 
        FCB     $39 ;	85 KPA 
        FCB     $39 ;	95 KPA 
;	45 C
        FCB     $39 ;	55 KPA 
        FCB     $39 ;	65 KPA 
        FCB     $39 ;	75 KPA 
        FCB     $39 ;	85 KPA 
        FCB     $39 ;	95 KPA 
;	55 C
        FCB     $39 ;	55 KPA 
        FCB     $39 ;	65 KPA 
        FCB     $39 ;	75 KPA 
        FCB     $39 ;	85 KPA 
        FCB     $39 ;	95 KPA 
;	65 C
        FCB     $39 ;	55 KPA 
        FCB     $39 ;	65 KPA 
        FCB     $39 ;	75 KPA 
        FCB     $39 ;	85 KPA 
        FCB     $39 ;	95 KPA 
;	75 C
        FCB     $39 ;	55 KPA 
        FCB     $39 ;	65 KPA 
        FCB     $39 ;	75 KPA 
        FCB     $39 ;	85 KPA 
        FCB     $39 ;	95 KPA 
;	85 C
        FCB     $39 ;	55 KPA 
        FCB     $39 ;	65 KPA 
        FCB     $39 ;	75 KPA 
        FCB     $39 ;	85 KPA 
        FCB     $39 ;	95 KPA 
;	95 C
        FCB     $39 ;	55 KPA 
        FCB     $39 ;	65 KPA 
        FCB     $39 ;	75 KPA 
        FCB     $39 ;	85 KPA 
        FCB     $39 ;	95 KPA 
;	100 C
        FCB     $39 ;	55 KPA 
        FCB     $39 ;	65 KPA 
        FCB     $39 ;	75 KPA 
        FCB     $39 ;	85 KPA 
        FCB     $39 ;	95 KPA 
;	105 C
        FCB     $39 ;	55 KPA 
        FCB     $39 ;	65 KPA 
        FCB     $39 ;	75 KPA 
        FCB     $39 ;	85 KPA 
        FCB     $39 ;	95 KPA 
;	110 C
        FCB     $39 ;	55 KPA 
        FCB     $39 ;	65 KPA 
        FCB     $39 ;	75 KPA 
        FCB     $39 ;	85 KPA 
        FCB     $39 ;	95 KPA 
;	115 C
        FCB     $2B ;	55 KPA 
        FCB     $2B ;	65 KPA 
        FCB     $2B ;	75 KPA 
        FCB     $2B ;	85 KPA 
        FCB     $2B ;	95 KPA
;*********************************************************************** 
;TABLE: COLD START SA BY COOLANT TEMP DIFFERENCE FROM START UP	L0065
;***********************************************************************
        FCB     $00 ;	0 C DIFFERENCE
        FCB     $00 ;	5 C DIFFERENCE 
        FCB     $00 ;	10 C DIFFERENCE 
        FCB     $00 ;	15 C DIFFERENCE 
        FCB     $00 ;	20 C DIFFERENCE 
        FCB     $00 ;	25 C DIFFERENCE
;*********************************************************************** 
;3D TABLE:	SPARK ADVANCE CORRECTION BY BARO AND MAP	L0069
;***********************************************************************
        FCB     $00 ;	USE MAP
        FCB     $60 ;	60 KPA OFFSET
        FCB     $40 ;	40 KPA OFFSET
        FCB     $05 ;	5 COL/ROW
;	70 KPA
        FCB     $00 ;	60 KPA
        FCB     $00 ;	70 KPA
        FCB     $00 ;	80 KPA
        FCB     $06 ;	90 KPA
        FCB     $06 ;	100 KPA
;	80 KPA
        FCB     $00 ;	60 KPA 
        FCB     $00 ;	70 KPA 
        FCB     $00 ;	80 KPA 
        FCB     $06 ;	90 KPA 
        FCB     $06 ;	100 KPA 
;	90 KPA
        FCB     $00 ;	60 KPA 
        FCB     $00 ;	70 KPA 
        FCB     $00 ;	80 KPA 
        FCB     $00 ;	90 KPA 
        FCB     $00 ;	100 KPA 
;	100 KPA
        FCB     $00 ;	60 KPA 
        FCB     $00 ;	70 KPA 
        FCB     $00 ;	80 KPA 
        FCB     $00 ;	90 KPA 
        FCB     $00 ;	100 KPA 
;***********************************************************************
;TABLE:17	HIGHWAY MODE SPARK ADVANCE BY MAP	L006C
;***********************************************************************
        FCB     $00 ;	USE MAP 
;
        FCB     $17 ;	50 KPA
        FCB     $11 ;	60 KPA
        FCB     $11 ;	70 KPA
        FCB     $00 ;	80 KPA
        FCB     $00 ;	90 KPA
;***********************************************************************
;TABLE:11	KNOCK ATTACK RATE NON WOT
;***********************************************************************
        FCB     $06 ;	65 KPA
        FCB     $08 ;	75 KPA
        FCB     $0A ;	85 KPA
        FCB     $0A ;	95 KPA
;***********************************************************************
;TABLE:12	KNOCK RECOVERY RATE NON WOT
;***********************************************************************
        FCB     $28 ;	65 KPA
        FCB     $28 ;	75 KPA
        FCB     $34 ;	85 KPA
        FCB     $3E ;	95 KPA
;***********************************************************************
;TABLE:13	MAX KNOCK RETARD NON WOT
;***********************************************************************
        FCB     $44 ;	800 RPM
        FCB     $44 ;	1600 RPM
        FCB     $44 ;	2400 RPM
        FCB     $55 ;	3200 RPM
;***********************************************************************
;TABLE:14	KNOCK ATTACK RATE WOT
;***********************************************************************
        FCB     $06 ;	800 RPM
        FCB     $08 ;	1600 RPM
        FCB     $0A ;	2400 RPM
        FCB     $0A ;	3200 RPM
;***********************************************************************
;TABLE:15	KNOCK RECOVERY RATE WOT
;***********************************************************************
        FCB     $28 ;	800 RPM
        FCB     $28 ;	1600 RPM
        FCB     $34 ;	2400 RPM
        FCB     $3E ;	3200 RPM
;***********************************************************************
;TABLE:16	MAX KNOCK RETARD WOT
;***********************************************************************
        FCB     $2E ;	65 KPA
        FCB     $33 ;	70 KPA
        FCB     $44 ;	75 KPA
        FCB     $55 ;	80 KPA
;***********************************************************************
;3D TABLE:7	SA BY RPM AND MAP UNLOCKED TCC	L006D
;***********************************************************************
        FCB     $00 ;	USE MAP
        FCB     $20 ;	800 RPM OFFSET
        FCB     $40 ;	40 KPA OFFSET
        FCB     $05 ;	5 COL/ROW
;	800 RPM
        FCB     $39 ;	60 KPA
        FCB     $39 ;	70 KPA
        FCB     $39 ;	80 KPA
        FCB     $33 ;	90 KPA
        FCB     $2B ;	100 KPA
;	1200 RPM
        FCB     $39 ;	60 KPA 
        FCB     $39 ;	70 KPA 
        FCB     $39 ;	80 KPA 
        FCB     $39 ;	90 KPA 
        FCB     $30 ;	100 KPA 
;	1600 RPM
        FCB     $39 ;	60 KPA 
        FCB     $39 ;	70 KPA 
        FCB     $39 ;	80 KPA 
        FCB     $39 ;	90 KPA 
        FCB     $39 ;	100 KPA 
;	2000 RPM
        FCB     $39 ;	60 KPA 
        FCB     $39 ;	70 KPA 
        FCB     $39 ;	80 KPA 
        FCB     $39 ;	90 KPA 
        FCB     $39 ;	100 KPA
;***********************************************************************
;TABLE:2	SPARK LATENCY CORRECTION VS RPM
;***********************************************************************
        FCB     $00 ;	0 RPM
        FCB     $00 ;	200 RPM
        FCB     $00 ;	400 RPM
        FCB     $00 ;	600 RPM
        FCB     $0E ;	800 RPM
        FCB     $16 ;	1000 RPM
        FCB     $12 ;	1200 RPM
        FCB     $10 ;	1400 RPM
        FCB     $14 ;	1600 RPM
        FCB     $10 ;	2000 RPM
        FCB     $12 ;	2400 RPM
        FCB     $10 ;	2800 RPM
        FCB     $14 ;	3200 RPM
        FCB     $15 ;	3600 RPM
        FCB     $13 ;	4000 RPM
        FCB     $14 ;	4400 RPM
        FCB     $14 ;	4800 RPM
;***********************************************************************
;	ERROR CODE INFORMATION
;***********************************************************************
        FCB     $FB ;8	MALF 1 MASK 
        FCB     $0B ;9	MALF 2 MASK
        FCB     $F3 ;10	MALF 3 MASK
        FCB     $0A ; 	1 SEC LOG FLTR CONST #1
        FCB     $14 ; 	2 SEC LOG FLTR CONST #2
        FCB     $64 ; 	10 SEC LOG FLTR CONST #3
        FCB     $78 ; 	12 SEC LOG FLTR CONST #4
        FCB     $00 ;	PARK NEUTRAL SPARK
        FCB     $00 ;	MIN ENGINE RUN TIME START
        FCB     $32 ;	50 STARTS TO CODE RESET
        FCB     $20 ;	MAX RPM IDLE MAP TEST
        FCB     $B2 ;	MIN TPS MAP CODE
        FCB     $1C ;	MAX TPS O2 CODES
        FCB     $03 ;	USE TPS
        FCB     $9E ;	MIN COOL TEMP STAY HOT C13
        FCB     $93 ;	MIN COOL TEMP HOT C13
        FCB     $78 ;	MIN RUN TIME FOR CODE 13
        FCB     $7E ;	MAX O2 FOR CODE 13
        FCB     $50 ;	MIN O2 FOR CODE 13
        FCB     $1C ;	MIN TPS FOR CODE 13
        FCB     $19 ;	MIN COND PERIOD CODE 13
        FCB     $10 ;	MIN COOLANT TEMP CODE 14
        FCB     $0A ;	MIN RUN TIME CODE 14
        FCB     $F6 ;	MAX COOLANT TEMP CODE 15
        FCB     $96 ;	MIN RUN TIME CODE 15
        FCB     $39 ;	DEFAULT COOL TEMP C14/15
        FCB     $64 ;	MIN TIME OVER MAX TPS C21
        FCB     $80 ;	MAX MAP FOR CODE 21
        FCB     $33 ;	MAX TPS FOR CODE 24
        FCB     $2C ;	MIN RPM FOR CODE 24
        FCB     $FF ;	MAX RPM FOR CODE 24
        FCB     $10 ;	MAX SPEED CODE 24
        FCB     $32 ;	MIN COND PERIOD CODE 24
        FCB     $1D ;	MIN BARO CODE 32
        FCB     $00 ;	MIN BARO CODE 45
        FCB     $FC ;	MIN MAP CODE 34
        FCB     $28 ;	MAX MAP CODE 34
        FCB     $0A ;	MIN TIME MAP CODE 34
        FCB     $9A ;	MAX TPS CODE 34	
        FCB     $00 ;	MIN MAP CODE 41	
        FCB     $E0 ;	MAX MAP CODE 41
        FCB     $00 ;	MIN TIME SET KNOCK BIT MSB
        FCB     $32 ;	MIN TIME SET KNOCK BIT LSB
        FCB     $EB ;	MIN KNOCK COUNTS 43B FAIL
        FCB     $55 ;	KNOCK RETARD FOR C43
        FCB     $02 ;	MIN KNOCK TEST COUNTER
        FCB     $5F ;	MIN COOL TEMP KNOCK TST
        FCB     $00 ;	MAX COOL TEMP KNOCK TST 
        FCB     $E0 ;	MAX RPM KNOCK TEST
        FCB     $C0 ;	MAX MAP KNOCK TEST
        FCB     $20 ;	SPARK ADDER 1ST KNOCK TEST 
        FCB     $40 ;	SPARK ADDER 2ND KNOCK TEST 
        FCB     $02 ;	MAX KNOCK COUNT SET BIT 
        FCB     $2E ;	MAX O2 CODE 44
        FCB     $19 ;	MIN TIME CODE 44
        FCB     $3C ;	MIN TIME CODE 45
        FCB     $AD ;	MIN O2 CODE 45
        FCB     $1E ;	CODE 53 COUNTER INC
        FCB     $50 ;	MIN MAP CODE 53
        FCB     $80 ;	MAX MAP CODE 53
        FCB     $29 ;	MIN TPS CODE 53
        FCB     $73 ;	MAX TPS CODE 53
        FCB     $A8 ;	MIN EGR DC CODE 53
        FCB     $0A ;	MIN CNT C53
        FCB     $07 ;	MIN DELTA MAP 
        FCB     $04 ;	MIN CYCLES DEC MAP 
        FCB     $02 ;	CYCLE COUNTER DEC
        FCB     $0B ;	C53 SPARK RETARD %
        FCB     $80 ;	C53 FILTER FACTOR 
        FCB     $20 ;	NOT C53 FILTER FACTOR 
        FCB     $5F ;	MIN BATT VOLT AIR TO CAT
        FCB     $14 ;	MAX COUNT WOT DIV 
        FCB     $01 ;	SLOW O2 FILTER CONSTANT
        FCB     $AD ;	MAX O2 NO DIV INC 
        FCB     $3A ;	MAX O2 DIV INC CLR 
        FCB     $08 ;	MAX COUNT BEFORE DIVERT 
        FCB     $01 ;	MIN THROTTLE NO DIVERT 
        FCB     $03 ;	USE TPS
        FCB     $68 ;	MAX RPM FOR AIR TO CAT
        FCB     $70 ;	MIN CTS NO DIVERT 
        FCB     $2C ;	MAX RPM N0 DIVERT
        FCB     $FF ;	MAX RPM DIVERT
        FCB     $78 ;	MAX SPD NO DIVERT 
        FCB     $FE ;	MAX SPD DIVERT
        FCB     $9E ;	MIN CTS NO DIVERT 
        FCB     $ED ;	MIN TEMP AIR TO CAT
        FCB     $46 ;	MAX TEMP AIR TO CAT
        FCB     $40 ;	MIN DELTA MAP RESET CNTR 
        FCB     $00 ;	USE MAP
        FCB     $0F ;	SWITCH AIR MAX COUNTS 
        FCB     $00 ;	MIN BARO TO LOCK 
        FCB     $A8 ;	MIN TEMP TO LOCK 
        FCB     $0A ;	MIN TPS HYSTERESIS 
        FCB     $70 ;	MIN SPEED FOR TPS LOCK 
        FCB     $2C ;	MIN TPS TO LOCK
        FCB     $00 ;	MIN TPS LOW SPEED
        FCB     $00 ;	MIN TPS FOR LOCK 
        FCB     $03 ;	USE TPS
        FCB     $20 ;	VEHICLE SPEED FILTER
        FCB     $03 ;	USE TPS
        FCB     $33 ;	MAX DELTA TPS- TO LOCK
        FCB     $26 ;	MAX DELTA TPS+ TO LOCK
        FCB     $0A ;	CONVERTOR LOCK DELAY
        FCB     $00 ;	3RD UPSHIFT LOCK DELAY
        FCB     $00 ;	4TH UPSHIFT LOCK DELAY
        FCB     $05 ;	LO DOWNSHIFT LOCK DELAY
        FCB     $00 ;	3RD DOWNSHIFT LOCK DELAY
        FCB     $00 ;	LO HIGH SPEED TCC FACTOR
        FCB     $04 ;	3RD HIGH SPEED TCC FACTOR
        FCB     $00 ;	4TH HIGH SPEED TCC FACTOR
        FCB     $80 ;	MIN SPEED TO LOCK LO
        FCB     $70 ;	MIN SPEED STAY LOCKED LO
        FCB     $5C ;	15 MPH
        FCB     $5C ;	20 MPH
        FCB     $5C ;	25 MPH
        FCB     $5C ;	30 MPH
        FCB     $76 ;	35 MPH
        FCB     $43 ;	15 MPH
        FCB     $43 ;	20 MPH
        FCB     $43 ;	25 MPH
        FCB     $43 ;	30 MPH
        FCB     $5C ;	35 MPH
        FCB     $80 ;	MIN SPEED TO LOCK 3RD
        FCB     $70 ;	MIN SPEED STAY LOCKED 3RD
        FCB     $66 ;	20 MPH
        FCB     $80 ;	25 MPH
        FCB     $97 ;	30 MPH
        FCB     $AC ;	35 MPH
        FCB     $C8 ;	40 MPH
        FCB     $E4 ;	45 MPH
        FCB     $F6 ;	50 MPH
        FCB     $4D ;	20 MPH
        FCB     $66 ;	25 MPH
        FCB     $83 ;	30 MPH
        FCB     $97 ;	35 MPH
        FCB     $B3 ;	40 MPH
        FCB     $D2 ;	45 MPH
        FCB     $F1 ;	50 MPH
        FCB     $80 ;	MIN SPEED TO LOCK 4TH
        FCB     $70 ;	MIN SPEED STAY LOCKED 4TH
        FCB     $FF ;	30 MPH
        FCB     $FF ;	35 MPH
        FCB     $FF ;	40 MPH
        FCB     $FF ;	45 MPH
        FCB     $FF ;	50 MPH
        FCB     $FF ;	55 MPH
        FCB     $FF ;	60 MPH
        FCB     $FF ;	30 MPH
        FCB     $FF ;	35 MPH
        FCB     $FF ;	40 MPH
        FCB     $FF ;	45 MPH
        FCB     $FF ;	50 MPH
        FCB     $FF ;	55 MPH
        FCB     $FF ;	60 MPH
        FCB     $00 ;	MIN GEAR RATIO
        FCB     $00 ;	MIN COOL TEMP
        FCB     $00 ;	MIN SPEED
        FCB     $00 ;	MIN TPS
        FCB     $00 ;	MIN MAP
        FCB     $00 ;	FACTOR L0088
;	SHIFT LIGHT TABLE LIGHT OFF
        FCB     $00 ;	MIN RPM
        FCB     $00 ;	MAX RPM
;TABLE:
        FCB     $00 ;	0 RPM
        FCB     $00 ;	800 RPM 
        FCB     $00 ;	1600 RPM 
        FCB     $00 ;	2400 RPM 
        FCB     $00 ;	3200 RPM 
        FCB     $00 ;	4000 RPM 
        FCB     $00 ;	4800 RPM 
        FCB     $00 ;	5600 RPM 
;	SHIFT LIGHT TABLE LIGHT ON
        FCB     $00 ;	MIN RPM
        FCB     $00 ;	MAX RPM
;TABLE:
        FCB     $00 ;	0 RPM 
        FCB     $00 ;	800 RPM 
        FCB     $00 ;	1600 RPM 
        FCB     $00 ;	2400 RPM 
        FCB     $00 ;	3200 RPM 
        FCB     $00 ;	4000 RPM 
        FCB     $00 ;	4800 RPM 
        FCB     $00 ;	5600 RPM 
;TABLE:
        FCB     $00 ;	0% TPS
        FCB     $00 ;	6.25% TPS
        FCB     $00 ;	12.5% TPS
        FCB     $00 ;	18.75% TPS
        FCB     $00 ;	25% TPS
; COLD START PARAMETERS
        FCB     $14 ;	MIN RUN TIME COLD START
        FCB     $80 ;	MAX COOL TEMP COLD START
        FCB     $16 ;MIN TPS IDLE LD WOT CLD STRT
        FCB     $0A ;MIN SPD IDLE LD WOT CLD STRT
        FCB     $00 ;MIN TPS IDLE LD WOT NOT CLD STRT
        FCB     $03 ;MIN SPD IDLE LD WOT NOT CLD STRT
        FCB     $00 ;	COLD START DEC DELAY MSB
        FCB     $02 ;	COLD START DEC DELAY LSB
        FCB     $00 ;	IDLE LD WOT DLY DEC MSB
        FCB     $02 ;	IDLE LD WOT DLY DEC LSB
        FCB     $F0 ;	MIN VAC IDLE LOAD CNTL WOT
        FCB     $04 ;	MIN LEAN CNT INC COLD STRT
        FCB     $03 ;	COLD START DECREMENT
        FCB     $06 ;	COLD START INCREMENT
;	EGR PARAMETERS
        FCB     $E0 ;	MIN COOL TEMP CONT EGR 82F
        FCB     $DD ;	MIN COOL TMP START EGR 87F
        FCB     $FF ;	MIN COOLANT TEMP NO DELAY
        FCB     $00 ;	MAX COOLANT TEMP NO DELAY
        FCB     $B4 ;	EGR DELAY
        FCB     $E6 ;	MIN TPS FOR HI TPS FAC
        FCB     $F3 ;	MAX TPS FOR HI TPS FAC
        FCB     $00 ;	DEFAULT EGR DC
;3D TABLE:	EGR DUTY CYCLE
        FCB     $00 ;	USE MAP
        FCB     $00
        FCB     $20
        FCB     $07 ;	7 COL/ROW
;	800 RPM
        FCB     $9C ;	40 KPA
        FCB     $FF ;	50 KPA
        FCB     $FF ;	60 KPA
        FCB     $FF ;	70 KPA
        FCB     $CD ;	80 KPA
        FCB     $00 ;	90 KPA
        FCB     $00 ;	100 KPA
;	1000 RPM
        FCB     $9C
        FCB     $FF
        FCB     $FF
        FCB     $FF
        FCB     $E6
        FCB     $00
        FCB     $00
;	1200 RPM
        FCB     $9C
        FCB     $FF
        FCB     $FF
        FCB     $FF
        FCB     $E6
        FCB     $00
        FCB     $00
;	1400 RPM
        FCB     $9C
        FCB     $FF
        FCB     $FF
        FCB     $FF
        FCB     $FF
        FCB     $00
        FCB     $00
;	1600 RPM
        FCB     $9C
        FCB     $FF
        FCB     $FF
        FCB     $FF
        FCB     $FF
        FCB     $00
        FCB     $00
;	1800 RPM
        FCB     $9C
        FCB     $FF
        FCB     $FF
        FCB     $FF
        FCB     $FF
        FCB     $00
        FCB     $00
;TABLE:	EGR DC MULT COOL TEMP
        FCB     $00
        FCB     $4D
        FCB     $5A
        FCB     $80
        FCB     $80
        FCB     $80
        FCB     $80
        FCB     $80
;TABLE:	EGR DC MULT BY BARO	
        FCB     $80
        FCB     $80 ;	80 KPA
        FCB     $80 ;	90 KPA
        FCB     $80 ;	100 KPA
;3D TABLE:	EGR DC MULT BY RPM AND MAP
        FCB     $00 ;	USE MAP
        FCB     $20 ;	800 RPM OFFSET
        FCB     $20 ;	KPA OFFSET
        FCB     $07 ;	7 COL/ROW
;	800 RPM
        FCB     $46
        FCB     $4D
        FCB     $4D
        FCB     $4D
        FCB     $4D
        FCB     $46
        FCB     $46
;	1200 RPM
        FCB     $4D
        FCB     $53
        FCB     $53
        FCB     $56
        FCB     $56
        FCB     $80
        FCB     $80
;	1600 RPM
        FCB     $4D
        FCB     $53
        FCB     $53
        FCB     $56
        FCB     $56
        FCB     $80
        FCB     $80
;	2000 RPM
        FCB     $4D
        FCB     $53
        FCB     $53
        FCB     $56
        FCB     $56
        FCB     $80
        FCB     $80
;
        FCB     $FC
        FCB     $00
        FCB     $2E ;	MIN TPS ISS OFF 1.196V
        FCB     $33 ;	MAX TPS ISS ON 1.25V
        FCB     $70 ;	MIN SPEED FOR NO ISS 35 MPH
        FCB     $76 ;	MAX SPEED ISS ON COAST 37 MPH
        FCB     $CD ;	START MCS DC
        FCB     $02 ;	USE BARO CORR TPS
        FCB     $2C ;	TPS BOUNDARY 1
        FCB     $8E ;	TPS BOUNDARY 2
        FCB     $FF ;	TPS BOUNDARY 3
        FCB     $28 ;	RPM BOUNDARY 1
        FCB     $FF ;	RPM BOUNDARY 2
        FCB     $FF ;	RPM BOUNDARY 3
        FCB     $7B ;	TPS FACTOR
        FCB     $40 ;	THROTTLE POSITION FILTER
        FCB     $38 ;	DEFAULT TPS MEM BOMB 
        FCB     $9E ;	MIN COOLANT TEMP HOT START
        FCB     $53 ;	MIN ENG RUN TIME CLSD LOOP CS
        FCB     $0D ;	MIN ENG RUN TIME CLSD LOOP HS
        FCB     $B9 ;	MIN TEMP START CLSD LOOP
        FCB     $C6 ;	MIN TEMP CONT CLSD LOOP
        FCB     $96 ;	RICH VOLTAGE THRESHHOLD
        FCB     $3A ;	LEAN VOLTAGE THRESHHOLD
        FCB     $96 ;	RICH VOLTAGE THRESHHOLD
        FCB     $3A ;	LEAN VOLTAGE THRESHHOLD
        FCB     $FF ;	CYCLES BEFORE OPEN LOOP
        FCB     $68 ;	RICH/LEAN SET POINT
        FCB     $68 ;	START UP O2 VALUE
        FCB     $10 ;	FAST O2 FILTER CONSTANT
        FCB     $01 ;	1ST HIGH BLOCK
        FCB     $02
        FCB     $6B ;	MIN COOLANT TEMP
        FCB     $5A ;	MAX COOLANT TEMP
        FCB     $4D ;	MAX DC DEVIATION
        FCB     $E8 ;	DEFAULT BARO
        FCB     $01 ;	MAX COOLANT FOR WOT
        FCB     $0A ;	WOT TPS OFFSET
        FCB     $ED ;	MIN TPS WOT TCC UNLOCKED
        FCB     $ED ;	MIN TPS WOT TCC LOCKED
        FCB     $C0 ;	WOT TPS INTENSITY FACTOR
        FCB     $73 ;	MCS COOLANT THRESHOLD
        FCB     $0D ;	MIN MCS DC HI COOL
        FCB     $1A ;	MIN MCS DC LO COOL
        FCB     $03
        FCB     $08
        FCB     $00
        FCB     $00
        FCB     $00
        FCB     $1E
        FCB     $00
        FCB     $EA ;	HOT RESTART THRESHHOLD
        FCB     $90 ;	MIN CLOSED LOOP TEMP NO CORR
        FCB     $00 ;	MAX TEMP DIFFERENCE NO CORR
        FCB     $66
        FCB     $33 ;	HOT START DC SUBTRACTOR
        FCB     $67
        FCB     $00 ;	CLOSED LOOP TEMP CORRECTION
        FCB     $07 ;	MAX DELTA TPS START STEADY TPS
        FCB     $08 ;	MAX DELTA TPS STAY STEADY TPS
        FCB     $1E ;	MIN COUNTS STEADY TPS
        FCB     $66 ;	STEADY TPS MULT O2 SAME STATE
        FCB     $C0 ;	STEADY TPS MULT O2 !SAME STATE
        FCB     $FF ;	CLOSED LOOP MULT TCC LOCKED
        FCB     $00
        FCB     $00
        FCB     $00
        FCB     $00
        FCB     $03 ;	USE TPS
        FCB     $1C
        FCB     $21
        FCB     $01
        FCB     $FE
        FCB     $01
        FCB     $14
        FCB     $02
;	HOT START DC ADDER BY BLOCK
        FCB     $1A ;	DC BLOCK 0
        FCB     $33 ;	DC BLOCK 1
        FCB     $33 ;	DC BLOCK 2
        FCB     $33 ;	DC BLOCK 3
        FCB     $0D ;	DC BLOCK 4
        FCB     $1A ;	DC BLOCK 5
        FCB     $1A ;	DC BLOCK 6
        FCB     $1A ;	DC BLOCK 7
        FCB     $0D ;	DC BLOCK 8
        FCB     $0D ;	DC BLOCK 9
        FCB     $0D ;	DC BLOCK 10
        FCB     $0D ;	DC BLOCK 11
        FCB     $0D ;	DC BLOCK 12
        FCB     $0D ;	DC BLOCK 13
        FCB     $0D ;	DC BLOCK 14
        FCB     $0D ;	DC BLOCK 15
;		WAS LEAN NOW LEAN
        FCB     $19 ;	DC BLOCK 0
        FCB     $29 ;	DC BLOCK 1
        FCB     $29 ;	DC BLOCK 2
        FCB     $29 ;	DC BLOCK 3
        FCB     $29 ;	DC BLOCK 4
        FCB     $29 ;	DC BLOCK 5
        FCB     $29 ;	DC BLOCK 6
        FCB     $29 ;	DC BLOCK 7
        FCB     $35 ;	DC BLOCK 8
        FCB     $35 ;	DC BLOCK 9
        FCB     $35 ;	DC BLOCK 10
        FCB     $35 ;	DC BLOCK 11
        FCB     $35 ;	DC BLOCK 12
        FCB     $35 ;	DC BLOCK 13
        FCB     $35 ;	DC BLOCK 14
        FCB     $35 ;	DC BLOCK 15
;		WAS RICH NOW RICH
        FCB     $19 ;	DC BLOCK 0
        FCB     $21 ;	DC BLOCK 1
        FCB     $21 ;	DC BLOCK 2
        FCB     $21 ;	DC BLOCK 3
        FCB     $19 ;	DC BLOCK 4
        FCB     $19 ;	DC BLOCK 5
        FCB     $19 ;	DC BLOCK 6
        FCB     $19 ;	DC BLOCK 7
        FCB     $19 ;	DC BLOCK 8
        FCB     $19 ;	DC BLOCK 9
        FCB     $19 ;	DC BLOCK 10
        FCB     $19 ;	DC BLOCK 11
        FCB     $19 ;	DC BLOCK 12
        FCB     $19 ;	DC BLOCK 13
        FCB     $19 ;	DC BLOCK 14
        FCB     $19 ;	DC BLOCK 15
;		WAS RICH NOW LEAN
        FCB     $0A ;	DC BLOCK 0
        FCB     $0A ;	DC BLOCK 1
        FCB     $0A ;	DC BLOCK 2
        FCB     $0A ;	DC BLOCK 3
        FCB     $0A ;	DC BLOCK 4
        FCB     $0A ;	DC BLOCK 5
        FCB     $0A ;	DC BLOCK 6
        FCB     $0A ;	DC BLOCK 7
        FCB     $0A ;	DC BLOCK 8
        FCB     $0A ;	DC BLOCK 9
        FCB     $0A ;	DC BLOCK 10
        FCB     $0A ;	DC BLOCK 11
        FCB     $0A ;	DC BLOCK 12
        FCB     $0A ;	DC BLOCK 13
        FCB     $0A ;	DC BLOCK 14
        FCB     $0A ;	DC BLOCK 15
;		WAS LEAN NOW RICH
        FCB     $0A ;	DC BLOCK 0
        FCB     $0A ;	DC BLOCK 1
        FCB     $0A ;	DC BLOCK 2
        FCB     $0A ;	DC BLOCK 3
        FCB     $0A ;	DC BLOCK 4
        FCB     $0A ;	DC BLOCK 5
        FCB     $0A ;	DC BLOCK 6
        FCB     $0A ;	DC BLOCK 7
        FCB     $0A ;	DC BLOCK 8
        FCB     $0A ;	DC BLOCK 9
        FCB     $0A ;	DC BLOCK 10
        FCB     $0A ;	DC BLOCK 11
        FCB     $0A ;	DC BLOCK 12
        FCB     $0A ;	DC BLOCK 13
        FCB     $0A ;	DC BLOCK 14
        FCB     $0A ;	DC BLOCK 15
;3D TABLE:24	MCS DUTY CYCLE BY COOLANT TEMP AND TPS
        FCB     $03 ;	USE TPS
        FCB     $00
        FCB     $10
        FCB     $08 ;	8 COL/ROW
;	-5C
        FCB     $1A ;	6.25% TPS 
        FCB     $33 ;	12.5% TPS 
        FCB     $4D ;	18.75% TPS 
        FCB     $4D ;	25% TPS
        FCB     $33 ;	31.25% TPS 
        FCB     $33 ;	37.5% TPS
        FCB     $33 ;	43.75% TPS
        FCB     $26 ;	50% TPS
;	15C
        FCB     $4D ;	6.25% TPS 
        FCB     $5A ;	12.5% TPS 
        FCB     $5A ;	18.75% TPS 
        FCB     $66 ;	25% TPS 
        FCB     $33 ;	31.25% TPS 
        FCB     $1A ;	37.5% TPS 
        FCB     $0D ;	43.75% TPS 
        FCB     $00 ;	50% TPS 
;	35C
        FCB     $5A ;	6.25% TPS 
        FCB     $8D ;	12.5% TPS 
        FCB     $80 ;	18.75% TPS 
        FCB     $73 ;	25% TPS 
        FCB     $33 ;	31.25% TPS 
        FCB     $1A ;	37.5% TPS 
        FCB     $0D ;	43.75% TPS 
        FCB     $00 ;	50% TPS 
;	55C
        FCB     $4D ;	6.25% TPS 
        FCB     $73 ;	12.5% TPS 
        FCB     $66 ;	18.75% TPS 
        FCB     $5A ;	25% TPS 
        FCB     $33 ;	31.25% TPS 
        FCB     $1A ;	37.5% TPS 
        FCB     $0D ;	43.75% TPS 
        FCB     $00 ;	50% TPS 
;	75C
        FCB     $40 ;	6.25% TPS 
        FCB     $66 ;	12.5% TPS 
        FCB     $66 ;	18.75% TPS 
        FCB     $66 ;	25% TPS 
        FCB     $4D ;	31.25% TPS 
        FCB     $40 ;	37.5% TPS 
        FCB     $1A ;	43.75% TPS 
        FCB     $00 ;	50% TPS 
;	95C
        FCB     $40 ;	6.25% TPS 
        FCB     $66 ;	12.5% TPS 
        FCB     $73 ;	18.75% TPS 
        FCB     $80 ;	25% TPS 
        FCB     $4D ;	31.25% TPS 
        FCB     $4D ;	37.5% TPS 
        FCB     $33 ;	43.75% TPS 
        FCB     $00 ;	50% TPS 
;	105C
        FCB     $40 ;	6.25% TPS 
        FCB     $66 ;	12.5% TPS
        FCB     $73 ;	18.75% TPS 
        FCB     $80 ;	25% TPS 
        FCB     $66 ;	31.25% TPS 
        FCB     $5A ;	37.5% TPS 
        FCB     $40 ;	43.75% TPS 
        FCB     $00 ;	50% TPS 
;	115C
        FCB     $40 ;	6.25% TPS 
        FCB     $66 ;	12.5% TPS 
        FCB     $73 ;	18.75% TPS 
        FCB     $8D ;	25% TPS 
        FCB     $66 ;	31.25% TPS 
        FCB     $5A ;	37.5% TPS 
        FCB     $40 ;	43.75% TPS 
        FCB     $00 ;	50% TPS 
;TABLE:	MAX MCS DC BY COOLANT TEMP
        FCB     $C0
        FCB     $C0
        FCB     $C0
        FCB     $C0
        FCB     $C0
        FCB     $C0
        FCB     $C0
        FCB     $C0
        FCB     $C0
;TABLE:	MSC DUTY CYCLE FILTER BY DC BLOCK
        FCB     $14 ;	DC BLOCK 0
        FCB     $14 ;	DC BLOCK 1
        FCB     $14 ;	DC BLOCK 2
        FCB     $14 ;	DC BLOCK 3
        FCB     $14 ;	DC BLOCK 4
        FCB     $14 ;	DC BLOCK 5
        FCB     $14 ;	DC BLOCK 6
        FCB     $14 ;	DC BLOCK 7
        FCB     $14 ;	DC BLOCK 8
        FCB     $07 ;	DC BLOCK 9
        FCB     $07 ;	DC BLOCK 10
        FCB     $07 ;	DC BLOCK 11
        FCB     $07 ;	DC BLOCK 12
        FCB     $07 ;	DC BLOCK 13
        FCB     $07 ;	DC BLOCK 14
        FCB     $07 ;	DC BLOCK 15
;TABLE:	LOW BARO ADDER TPS BLOCK
        FCB     $26 ;	70 KPA
        FCB     $26 ;	80 KPA
        FCB     $00 ;	90 KPA
        FCB     $00 ;	100 KPA
;TABLE:	MCS DC ADDER BARO
        FCB     $40 ;	70 KPA
        FCB     $40 ;	80 KPA
        FCB     $0D ;	90 KPA
        FCB     $0D ;	100 KPA
;TABLE:	MIN TPS FOR WOT
        FCB     $03 ;	USE TPS
        FCB     $FE ;	400 RPM
        FCB     $FE ;	1200 RPM
        FCB     $FE ;	2000 RPM
        FCB     $FE ;	3600 RPM
        FCB     $FE ;	6000 RPM
;TABLE:	START UP MCS DC BY COOLANT TEMP
        FCB     $26 ;	-5C
        FCB     $26 ;	5C
        FCB     $26 ;	15C
        FCB     $1A ;	25C
        FCB     $26 ;	35C
        FCB     $1A ;	45C
        FCB     $1A ;	55C
        FCB     $1A ;	65C
        FCB     $1A ;	75C
        FCB     $1A ;	85C
        FCB     $1A ;	95C
        FCB     $1A ;	100C
;TABLE:	MCS DC ADDER RPM
        FCB     $1A ;	800 RPM
        FCB     $1A ;	1200 RPM
        FCB     $1A ;	1600 RPM
        FCB     $1A ;	2000 RPM
        FCB     $1A ;	2400 RPM
        FCB     $1A ;	2800 RPM
        FCB     $1A ;	3200 RPM
;
        FCB     $0F ;	DC BLOCK 0
        FCB     $0F ;	DC BLOCK 1
        FCB     $00 ;	DC BLOCK 2
        FCB     $00 ;	DC BLOCK 3
        FCB     $00 ;	DC BLOCK 4
        FCB     $00 ;	DC BLOCK 5
        FCB     $00 ;	DC BLOCK 6
        FCB     $00 ;	DC BLOCK 7
        FCB     $00 ;	DC BLOCK 8
        FCB     $00 ;	DC BLOCK 9
        FCB     $00 ;	DC BLOCK 10
        FCB     $00 ;	DC BLOCK 11
        FCB     $00 ;	DC BLOCK 12
        FCB     $00 ;	DC BLOCK 13
        FCB     $00 ;	DC BLOCK 14
        FCB     $00 ;	DC BLOCK 15
;
        FCB     $80 ;	START L0003
        FCB     $80 ;	START L0004
        FCB     $66 ;	START L0005
        FCB     $66 ;	START L0006
;
        FCB     $0E ;	TPS BLOCK 0
        FCB     $0E ;	TPS BLOCK 0
        FCB     $07 ;	NOT TPS BLOCK 0
        FCB     $07 ;	NOT TPS BLOCK 0
;TABLE:	BARO FACTOR TPS
        FCB     $FF ;	70 KPA
        FCB     $FF ;	80 KPA
        FCB     $FF ;	90 KPA
        FCB     $FF ;	100 KPA
;TABLE:	MIN ENGINE RUN TIME BY COOLANT TEMP
        FCB     $0A
        FCB     $0A
        FCB     $0A
        FCB     $0A
        FCB     $0A
        FCB     $0A
        FCB     $0A
        FCB     $0A
        FCB     $08
        FCB     $08
        FCB     $06
        FCB     $06
;
        FCB     $00 ;	0 = MAP
        FCB     $01 ;	BARO 0 = NOT INSTALLED
        FCB     $00 ;3	NUM CYLINDERS
; 4 = $80 
; 6 = $C0 
; 8 = $00 
        FCB     $29 ;	MAX TPS STRT MOUNTAIN CST
        FCB     $30 ;MIN ENG SPD CONT MOUNT CST 4TH
        FCB     $38 ;MIN SPD CONT MOUNTAIN CST 4TH
        FCB     $14 ;	DELAY MOUNTAIN COAST 4TH
        FCB     $30 ;MIN ENG SPD CONT MOUNT CST LO
        FCB     $23 ;MIN SPD CONT MOUNTAIN CST LO
        FCB     $05 ;	DELAY MOUNTAIN COAST LO
        FCB     $2C ;	MAX TPS CONT MOUNTAIN CST
        FCB     $28 ;	MIN ENG SPD CONT MOUNT CST
        FCB     $14 ;	MIN SPD CONT MOUNTAIN CST
        FCB     $89 ;	MOUNTAIN COAST SA 
        FCB     $00 ;	MC DUTY CYCLE OFFSET
        FCB     $00 ;	DUTY CYCLE OFFSET	
        FCB     $40 ;	EPROM CHECK BYTE
        FCB     $53 ;	NOT USED
        FCB     $15 ;	NOT USED
        FCB     $02 ;	02 = CHECK PROM CHECK BYTE
        FCB     $09 ;	PROM ID MSB
        FCB     $98 ;	PROM ID LSB
;          
;          

	ORG $3400
;**************ALDL OUTPUT LOCATIONS***************************
        FDB     $00DD ;	PROM CHECKSUM LSB
        FDB     $00DE ;	PROM CHECKSUM MSB
        FDB     $0034 ;	BATT VOLT
        FDB     $0035 ;	COOLANT TEMP
        FDB     $004A ;	VEHICLE SPEED
        FDB     $0020 ;	MAP
;									KPA = (N + 28.06)/2.71
        FDB     $007F ;	OLD KNOCK COUNTS 
        FDB     $002F ;	THROTTLE POSITION
        FDB     $003B ;	O2 SENSOR
        FDB     $00A2 ;	MC DUTY CYCLE
        FDB     $0007 ;	MALF 1
        FDB     $0008 ;	MALF 2
        FDB     $0009 ;	MALF 3
        FDB     $0011 ;	CLCC 1
        FDB     $0801 ;	I/O STATUS 1
        FDB     $0881 ;	I/O STATUS 2
        FDB     $00BB ;	EGR DC
        FDB     $001A ;	ENGINE RPM/25
        FDB     $0026 ;	BARO		
;									KPA = (N + 28.06)/2.71
        FDB     $008E ;	CROSS COUNTS 
        FDB     $0064 ;		MAIN SA
        FDB     $006B ;		CALC SA
        FDB     $0068 ;		FINAL SA
        FDB     $0083 ;		KNOCK RETARD
;

                                    ORG    $3FFE
     
 ; THE FOLLOWING TWO BYTES MUST BE SET AFTER ASSEMBLING AND CONVERTING TO .BIN!
 ; SEE BITFLIPPER'S ARTICLE ON THE MATTER ON MONTECARLOSS.COM
        FCB     $00 ;	EXPECTED EPROM CHECKSUM MSB
        FCB     $00 ;	EXPECTED EPROM CHECKSUM LSB
;
;


        ORG    $2000
; FULL EPROM CHECKSUM ROUTINE FOR CODE EXTENSIONS ($2XXX), PARAMETERS ($3XXX) 
; AND CODE ($E000-$FFFF)
; EXECUTED AT STARTUP
;
; FOR THE TIME BEING, THIS IS NOT BEING CALLED.  IT IS CAUSING SOME SORT OF TIMING
; PROBLEM, POSSIBLY RELATED TO FREQUENCY OF INTERRUPTS, TIME IT TAKES TO RUN THIS
; ROUTINE, STACK OVERFLOW, ETC.  NOT WORTH DEBUGGING, JUST USE GOOD EPROMS.  :)


CSUM01  CLRA
	CLRB
	LDX	#$2000
CSUM02  CPX    #$3FFE
	BEQ 	CSUM03
	ADDD	$0000,X
	INX
	INX
	BRA	CSUM02

CSUM03	LDX	#$E000
CSUM04	ADDD	$0000,X
	INX
	INX
        CPX	#$0000
	BNE	CSUM04

	STD	L00DD

	CMPA	L3FFE
	BNE	CSUM05

	CMPB	L3FFF
	BEQ	CSUM99

CSUM05  LDAB    L00CA
	ORAB    #$0010 ;	SET CODE 51
	STAB    L00CA
        LDAA    L000E
        ANDA    #$007F
        STAA    L000E

CSUM99	JMP	$E000

; IRQ1/NMI HARDWARE INTERRUPT ROUTINE - COPY RAM TO EXTERNAL DUAL PORT SRAM

	ORG	$2800
    LDD     $00DD    ; LOAD ITERATION NUMBER FROM LAST TIME WE WERE HERE
    ADDD    #$0001   ; ADD ONE TO ITERATION
    STD     $00DD    ; STORE ITERATION NUMBER IN RAM
    STD     $60DD    ; STORE ITERATION NUMBER IN SRAM
    CLRA
    LDAB    $0001
    STAB    $6001
    ABA
    LDAB    $0002
    STAB    $6002
    ABA
    LDAB    $0003
    STAB    $6003
    ABA
    LDAB    $0004
    STAB    $6004
    ABA
    LDAB    $0005
    STAB    $6005
    ABA
    LDAB    $0006
    STAB    $6006
    ABA
    LDAB    $0007
    STAB    $6007
    ABA
    LDAB    $0008
    STAB    $6008
    ABA
    LDAB    $0009
    STAB    $6009
    ABA
    LDAB    $000A
    STAB    $600A
    ABA
    LDAB    $000B
    STAB    $600B
    ABA
    LDAB    $000C
    STAB    $600C
    ABA
    LDAB    $000D
    STAB    $600D
    ABA
    LDAB    $000E
    STAB    $600E
    ABA
    LDAB    $000F
    STAB    $600F
    ABA
    LDAB    $0010
    STAB    $6010
    ABA
    LDAB    $0011
    STAB    $6011
    ABA
    LDAB    $0012
    STAB    $6012
    ABA
    LDAB    $0013
    STAB    $6013
    ABA
    LDAB    $0014
    STAB    $6014
    ABA
    LDAB    $0015
    STAB    $6015
    ABA
    LDAB    $0016
    STAB    $6016
    ABA
    LDAB    $0017
    STAB    $6017
    ABA
    LDAB    $0018
    STAB    $6018
    ABA
    LDAB    $0019
    STAB    $6019
    ABA
    LDAB    $001A
    STAB    $601A
    ABA
    LDAB    $001B
    STAB    $601B
    ABA
    LDAB    $001C
    STAB    $601C
    ABA
    LDAB    $001D
    STAB    $601D
    ABA
    LDAB    $001E
    STAB    $601E
    ABA
    LDAB    $001F
    STAB    $601F
    ABA
    LDAB    $0020
    STAB    $6020
    ABA
    LDAB    $0021
    STAB    $6021
    ABA
    LDAB    $0022
    STAB    $6022
    ABA
    LDAB    $0023
    STAB    $6023
    ABA
    LDAB    $0024
    STAB    $6024
    ABA
    LDAB    $0025
    STAB    $6025
    ABA
    LDAB    $0026
    STAB    $6026
    ABA
    LDAB    $0027
    STAB    $6027
    ABA
    LDAB    $0028
    STAB    $6028
    ABA
    LDAB    $0029
    STAB    $6029
    ABA
    LDAB    $002A
    STAB    $602A
    ABA
    LDAB    $002B
    STAB    $602B
    ABA
    LDAB    $002C
    STAB    $602C
    ABA
    LDAB    $002D
    STAB    $602D
    ABA
    LDAB    $002E
    STAB    $602E
    ABA
    LDAB    $002F
    STAB    $602F
    ABA
    LDAB    $0030
    STAB    $6030
    ABA
    LDAB    $0031
    STAB    $6031
    ABA
    LDAB    $0032
    STAB    $6032
    ABA
    LDAB    $0033
    STAB    $6033
    ABA
    LDAB    $0034
    STAB    $6034
    ABA
    LDAB    $0035
    STAB    $6035
    ABA
    LDAB    $0036
    STAB    $6036
    ABA
    LDAB    $0037
    STAB    $6037
    ABA
    LDAB    $0038
    STAB    $6038
    ABA
    LDAB    $0039
    STAB    $6039
    ABA
    LDAB    $003A
    STAB    $603A
    ABA
    LDAB    $003B
    STAB    $603B
    ABA
    LDAB    $003C
    STAB    $603C
    ABA
    LDAB    $003D
    STAB    $603D
    ABA
    LDAB    $003E
    STAB    $603E
    ABA
    LDAB    $003F
    STAB    $603F
    ABA
    LDAB    $0040
    STAB    $6040
    ABA
    LDAB    $0041
    STAB    $6041
    ABA
    LDAB    $0042
    STAB    $6042
    ABA
    LDAB    $0043
    STAB    $6043
    ABA
    LDAB    $0044
    STAB    $6044
    ABA
    LDAB    $0045
    STAB    $6045
    ABA
    LDAB    $0046
    STAB    $6046
    ABA
    LDAB    $0047
    STAB    $6047
    ABA
    LDAB    $0048
    STAB    $6048
    ABA
    LDAB    $0049
    STAB    $6049
    ABA
    LDAB    $004A
    STAB    $604A
    ABA
    LDAB    $004B
    STAB    $604B
    ABA
    LDAB    $004C
    STAB    $604C
    ABA
    LDAB    $004D
    STAB    $604D
    ABA
    LDAB    $004E
    STAB    $604E
    ABA
    LDAB    $004F
    STAB    $604F
    ABA
    LDAB    $0050
    STAB    $6050
    ABA
    LDAB    $0051
    STAB    $6051
    ABA
    LDAB    $0052
    STAB    $6052
    ABA
    LDAB    $0053
    STAB    $6053
    ABA
    LDAB    $0054
    STAB    $6054
    ABA
    LDAB    $0055
    STAB    $6055
    ABA
    LDAB    $0056
    STAB    $6056
    ABA
    LDAB    $0057
    STAB    $6057
    ABA
    LDAB    $0058
    STAB    $6058
    ABA
    LDAB    $0059
    STAB    $6059
    ABA
    LDAB    $005A
    STAB    $605A
    ABA
    LDAB    $005B
    STAB    $605B
    ABA
    LDAB    $005C
    STAB    $605C
    ABA
    LDAB    $005D
    STAB    $605D
    ABA
    LDAB    $005E
    STAB    $605E
    ABA
    LDAB    $005F
    STAB    $605F
    ABA
    LDAB    $0060
    STAB    $6060
    ABA
    LDAB    $0061
    STAB    $6061
    ABA
    LDAB    $0062
    STAB    $6062
    ABA
    LDAB    $0063
    STAB    $6063
    ABA
    LDAB    $0064
    STAB    $6064
    ABA
    LDAB    $0065
    STAB    $6065
    ABA
    LDAB    $0066
    STAB    $6066
    ABA
    LDAB    $0067
    STAB    $6067
    ABA
    LDAB    $0068
    STAB    $6068
    ABA
    LDAB    $0069
    STAB    $6069
    ABA
    LDAB    $006A
    STAB    $606A
    ABA
    LDAB    $006B
    STAB    $606B
    ABA
    LDAB    $006C
    STAB    $606C
    ABA
    LDAB    $006D
    STAB    $606D
    ABA
    LDAB    $006E
    STAB    $606E
    ABA
    LDAB    $006F
    STAB    $606F
    ABA
    LDAB    $0070
    STAB    $6070
    ABA
    LDAB    $0071
    STAB    $6071
    ABA
    LDAB    $0072
    STAB    $6072
    ABA
    LDAB    $0073
    STAB    $6073
    ABA
    LDAB    $0074
    STAB    $6074
    ABA
    LDAB    $0075
    STAB    $6075
    ABA
    LDAB    $0076
    STAB    $6076
    ABA
    LDAB    $0077
    STAB    $6077
    ABA
    LDAB    $0078
    STAB    $6078
    ABA
    LDAB    $0079
    STAB    $6079
    ABA
    LDAB    $007A
    STAB    $607A
    ABA
    LDAB    $007B
    STAB    $607B
    ABA
    LDAB    $007C
    STAB    $607C
    ABA
    LDAB    $007D
    STAB    $607D
    ABA
    LDAB    $007E
    STAB    $607E
    ABA
    LDAB    $007F
    STAB    $607F
    ABA
    LDAB    $0080
    STAB    $6080
    ABA
    LDAB    $0081
    STAB    $6081
    ABA
    LDAB    $0082
    STAB    $6082
    ABA
    LDAB    $0083
    STAB    $6083
    ABA
    LDAB    $0084
    STAB    $6084
    ABA
    LDAB    $0085
    STAB    $6085
    ABA
    LDAB    $0086
    STAB    $6086
    ABA
    LDAB    $0087
    STAB    $6087
    ABA
    LDAB    $0088
    STAB    $6088
    ABA
    LDAB    $0089
    STAB    $6089
    ABA
    LDAB    $008A
    STAB    $608A
    ABA
    LDAB    $008B
    STAB    $608B
    ABA
    LDAB    $008C
    STAB    $608C
    ABA
    LDAB    $008D
    STAB    $608D
    ABA
    LDAB    $008E
    STAB    $608E
    ABA
    LDAB    $008F
    STAB    $608F
    ABA
    LDAB    $0090
    STAB    $6090
    ABA
    LDAB    $0091
    STAB    $6091
    ABA
    LDAB    $0092
    STAB    $6092
    ABA
    LDAB    $0093
    STAB    $6093
    ABA
    LDAB    $0094
    STAB    $6094
    ABA
    LDAB    $0095
    STAB    $6095
    ABA
    LDAB    $0096
    STAB    $6096
    ABA
    LDAB    $0097
    STAB    $6097
    ABA
    LDAB    $0098
    STAB    $6098
    ABA
    LDAB    $0099
    STAB    $6099
    ABA
    LDAB    $009A
    STAB    $609A
    ABA
    LDAB    $009B
    STAB    $609B
    ABA
    LDAB    $009C
    STAB    $609C
    ABA
    LDAB    $009D
    STAB    $609D
    ABA
    LDAB    $009E
    STAB    $609E
    ABA
    LDAB    $009F
    STAB    $609F
    ABA
    LDAB    $00A0
    STAB    $60A0
    ABA
    LDAB    $00A1
    STAB    $60A1
    ABA
    LDAB    $00A2
    STAB    $60A2
    ABA
    LDAB    $00A3
    STAB    $60A3
    ABA
    LDAB    $00A4
    STAB    $60A4
    ABA
    LDAB    $00A5
    STAB    $60A5
    ABA
    LDAB    $00A6
    STAB    $60A6
    ABA
    LDAB    $00A7
    STAB    $60A7
    ABA
    LDAB    $00A8
    STAB    $60A8
    ABA
    LDAB    $00A9
    STAB    $60A9
    ABA
    LDAB    $00AA
    STAB    $60AA
    ABA
    LDAB    $00AB
    STAB    $60AB
    ABA
    LDAB    $00AC
    STAB    $60AC
    ABA
    LDAB    $00AD
    STAB    $60AD
    ABA
    LDAB    $00AE
    STAB    $60AE
    ABA
    LDAB    $00AF
    STAB    $60AF
    ABA
    LDAB    $00B0
    STAB    $60B0
    ABA
    LDAB    $00B1
    STAB    $60B1
    ABA
    LDAB    $00B2
    STAB    $60B2
    ABA
    LDAB    $00B3
    STAB    $60B3
    ABA
    LDAB    $00B4
    STAB    $60B4
    ABA
    LDAB    $00B5
    STAB    $60B5
    ABA
    LDAB    $00B6
    STAB    $60B6
    ABA
    LDAB    $00B7
    STAB    $60B7
    ABA
    LDAB    $00B8
    STAB    $60B8
    ABA
    LDAB    $00B9
    STAB    $60B9
    ABA
    LDAB    $00BA
    STAB    $60BA
    ABA
    LDAB    $00BB
    STAB    $60BB
    ABA
    LDAB    $00BC
    STAB    $60BC
    ABA
    LDAB    $00BD
    STAB    $60BD
    ABA
    LDAB    $00BE
    STAB    $60BE
    ABA
    LDAB    $00BF
    STAB    $60BF
    ABA
    LDAB    $00C0
    STAB    $60C0
    ABA
    LDAB    $00C1
    STAB    $60C1
    ABA
    LDAB    $00C2
    STAB    $60C2
    ABA
    LDAB    $00C3
    STAB    $60C3
    ABA
    LDAB    $00C4
    STAB    $60C4
    ABA
    LDAB    $00C5
    STAB    $60C5
    ABA
    LDAB    $00C6
    STAB    $60C6
    ABA
    LDAB    $00C7
    STAB    $60C7
    ABA
    LDAB    $00C8
    STAB    $60C8
    ABA
    LDAB    $00C9
    STAB    $60C9
    ABA
    LDAB    $00CA
    STAB    $60CA
    ABA
    LDAB    $00CB
    STAB    $60CB
    ABA
    LDAB    $00CC
    STAB    $60CC
    ABA
    LDAB    $00CD
    STAB    $60CD
    ABA
    LDAB    $00CE
    STAB    $60CE
    ABA
    LDAB    $00CF
    STAB    $60CF
    ABA
    LDAB    $00D0
    STAB    $60D0
    ABA
    LDAB    $00D1
    STAB    $60D1
    ABA
    LDAB    $00D2
    STAB    $60D2
    ABA
    LDAB    $00D3
    STAB    $60D3
    ABA
    LDAB    $00D4
    STAB    $60D4
    ABA
    LDAB    $00D5
    STAB    $60D5
    ABA
    LDAB    $00D6
    STAB    $60D6
    ABA
    LDAB    $00D7
    STAB    $60D7
    ABA
    LDAB    $00D8
    STAB    $60D8
    ABA
    LDAB    $00D9
    STAB    $60D9
    ABA
    LDAB    $00DA
    STAB    $60DA
    ABA
    LDAB    $00DB
    STAB    $60DB
    ABA
    LDAB    $00DC
    STAB    $60DC
    ABA
    LDAB    $00DD
    STAB    $60DD
;   ABA              ; DO NOT INCLUDE ITERATION COUNT IN CHECKSUM
    LDAB    $00DE
    STAB    $60DE
;   ABA              ; DO NOT INCLUDE ITERATION COUNT IN CHECKSUM

    STAA    $00DF    ; STORE CHECKSUM IN RAM FOR WHAT IT'S WORTH
    STAA    $60DF    ; STORE CHECKSUM IN SRAM
	
    RTI

;
;

        ORG    $E000
;          
;          
        LDS     #$00FF ;	SET STACK TOP RAM
        SEI     
        LDX     #$0C00 ;	DRP COUNTER 
        LDD     #$0000
LE00A   STD     $0000,X ;	ZERO DRP COUNTER 
        INX     
        INX     
        CPX     #$0C38
        BNE     LE00A
;
        LDX     #$00CC
        STX     L0C0C
        JSR     LFEDB ;	RTS
        LDX     #$712A ;	POWER UP
        STX     L0C3C ; PWM control register
        LDX     #$00FF
LE025   CLR     $0000,X ;	CLR RAM
        DEX     
        CPX     #$000C
        BNE     LE025
;
        LDX     L0C38 ;	HIGH SPEED RTS COUNTER 
        LDAA    #$0006
        STAA    L0000 ;	RUN TIME MINOR COUNTER 
        LDAA    L32B8 ;	DEFAULT TPS MEM BOMB 
        STAA    L002D ;	MINIMUM THROTTLE POSITION
        JSR     LFE46 ;	BARO ROUTINE
        JSR     LFE6E ;	SUM L0003 - L0009
        PSHB    
        PSHA    
        PULX    
        CPX     L000A
        BEQ     LE04B
        JSR     LFEC0 ;	NON VOL MEM BOMBED ROUTINE
        BRA     LE052
;
LE04B   LDAA    L3000 ;	INSTALLED EQUIPMENT 0
        BITA    #$0020
        BNE     LE055 ;	BRANCH b5 SET
;
LE052   JSR     LFD34 ;	TPS BLOCK LOADER
LE055   JSR     LFC77
        LDAA    #$0004
        JSR     LFDE7 ;	GET A/D VALUE
        STAA    L0035 ;	COOLANT TEMP
        CMPA    L32DB ;	HOT RESTART THRESHHOLD
        BLS     LE096
        LDAA    #$0010
        STAA    L0053
        LDX     #$0092
        STX     L0051
        LDX     #$32F4 ;	HOT START DC ADDER BY BLOCK
        STX     L004F
LE072   LDX     L004F
        LDAB    $0000,X
        CLRA    
        INX     
        STX     L004F
        LDX     L0051
        ADDB    $0000,X
        ADCA    #$0000
        SUBB    L32DF ;	HOT START DC SUBTRACTOR
        SBCA    #$0000
        BCC     LE088
        CLRB    
LE088   BEQ     LE08C
        LDAB    #$00FF
LE08C   STAB    $0000,X
        INX     
        STX     L0051
        DEC     L0053
        BNE     LE072
;
LE096   LDAA    #$0004
        STAA    L00A8
        LDX     #$0004
        STX     L5000
        LDX     #$003C
        STX     L5002
        LDX     L5800 ;	CHECK HUD INSTALLED
        CPX     #$7E58 ;	COMPARE COOKIE TO HUD
        BNE     LE0B1 ;	BRANCH HUD NOT INSTALLED
        JSR     L580C ;	DO HUD


LE0B1   LDAA    L324A ;	EGR DELAY 
        STAA    L00BA ;	EGR DELAY COUNTER 
        CLI     
        LDAB    #$0007
LE0B9   LDAA    L0000 ;	RUN TIME MINOR COUNTER 
        ANDA    #$0007
        CBA     
        BNE     LE0B9
;
        PSHB    
        LDX     #$E0E0
        ASLB    
        ABX     
        LDX     $0000,X
        JSR     $0000,X
        PULB    
        LDAA    L0000 ;	RUN TIME MINOR COUNTER 
        ANDA    #$0007
        CBA     
        BEQ     LE0DB
        TAB     
        LDAA    L000E
        ORAA    #$0004
        STAA    L000E
        BRA     LE0B9
;
LE0DB   INCB    
        ANDB    #$0007
        BRA     LE0B9
;**********MINOR LOOP VECTORS********************************
        FDB     $F543 ;	MINOR LOOP 0
        FDB     $FF8E ;	MINOR LOOP 1
        FDB     $FFAF ;	MINOR LOOP 2
        FDB     $EE26 ;	MINOR LOOP 3
        FDB     $F49D ;	MINOR LOOP 4
        FDB     $F5C7 ;	MINOR LOOP 5
        FDB     $F631 ;	MINOR LOOP 6
        FDB     $E895 ;	MINOR LOOP 7
        RTI     
; -----------------------------------------------------------
LE0F1   LDD     L0C38 ;	HIGH SPEED RTS COUNTER 
        BITA    #$0010
        BNE     LE0FB
;
        JMP     LE17B
;
LE0FB   ORAA    L0057
        STAA    L0057
        LDAA    L0059
        INCA    
        CMPA    #$0004
        BNE     LE107
;
        CLRA    
LE107   STAA    L0059
        BITA    #$0001
        BNE     LE12B
;
        LDAB    L0018
        BPL     LE11C ;	SES LIGHT OFF
        LDD     L0C3C ; PWM control register
        ANDB    #$00F7 ;	TURN SES LIGHT OFF
        JSR     LFEDB ;	RTS
        STD     L0C3C ; PWM control register
LE11C   LDX     #$001A
LE11F   DEX     
        BNE     LE11F
; 
        JSR     LFE7E
        LDAA    L0059
        BNE     LE17B
;
        BRA     LE17C
;
LE12B   LDAA    L0057
        TAB     
        ANDA    #$00BF
        STAA    L0057
        BITB    #$0040
        BNE     LE149
;
        LDAB    L0043
        INCB    
        CMPB    #$009E
        BLS     LE145
        LDAB    L000E
        ANDB    #$00EF
        STAB    L000E
        LDAB    #$00A0
LE145   STAB    L0043
        BRA     LE16C
;
LE149   LDAB    L000E
        BITB    #$0010
        BNE     LE15C
;
        ORAB    #$0010
        STAB    L000E
        LDX     L0C04 ;	VSS COUNTER	
        INX     
        STX     L0048 ;	VSS COUNT
        INX     
        STX     L0046 ;	VSS COUNT OLD 
LE15C   CLR     L0043 ;	
        LDX     L0046 ;	VSS COUNT OLD 
        STX     L0044 ;	VSS COUNT N-2
        LDX     L0048 ;	VSS COUNT
        STX     L0046 ;	VSS COUNT OLD
        LDX     L0C04 ;	VSS COUNTER	
        STX     L0048 ;	VSS COUNT
LE16C   LDAB    L0018
        BPL     LE17B ;	SES LIGHT OFF
        LDD     L0C3C ; PWM control register
        ORAB    #$0008 ;	TURN SES LIGHT ON
        JSR     LFEDB ;	RTS
        STD     L0C3C ; PWM control register
LE17B   RTI     
; -----------------------------------------------------------
LE17C   LDX     L004D ;	ENGINE RUN TIME 
        LDAA    L0000 ;	RUN TIME MINOR COUNTER 
        INCA    
        CMPA    #$0050
        BNE     LE189
;
        INX     
        STX     L004D ;	ENGINE RUN TIME 
        CLRA    
LE189   STAA    L0000 ;	RUN TIME MINOR COUNTER
        ANDA    #$0007
        BNE     LE1B1
;
        LDAB    L0016
        BPL     LE196
        JSR     L5809
LE196   LDAA    L000E
        BPL     LE1A7 ;	BRANCH SOLENIOD COMMANDED OFF
        LDAB    L0881 ;	I/O STATUS 2
        BITB    #$0080
        BEQ     LE1A7 ;	BRANCH SOLENIOD OFF
        LDAA    L00C8
        ORAA    #$0002 ;	SET CODE 23
        STAA    L00C8
LE1A7   LDAA    #$007F
        JSR     LFE01
        LDAA    #$0080
        JSR     LFE0D
LE1B1   CLI     
        BSR     LE1E0
        LDAB    L3002 ;	INSTALLED EQUIPMENT 2
        CMPB    #$00FD
        BNE     LE1C9
;
        LDAB    L33FD
        CMPB    #$0002
        BNE     LE1C9
;
        LDAB    L33FA ;	EPROM CHECK BYTE
        CMPB    #$0040
        BEQ     LE1F0
LE1C9   LDAB    L00CA
        ORAB    #$0010 ;	SET CODE 51
        STAB    L00CA
        LDAA    L000E
        ANDA    #$007F
        STAA    L000E
        JMP     LE86B
;
LE1D8   LDAA    #$00FB
        JSR     LFE01
        BSR     LE1E0
        RTI     
; -----------------------------------------------------------
LE1E0   LDAA    #$0005
        JSR     LFDE7 ;	GET A/D VALUE
        LDAB    L3014 ;	MAP FILTER CONSTANT 
        LDX     L0020 ;	PRESSURE
        JSR     LFCC1 ;	FILTER ROUTINE 
        STD     L0020 ;	PRESSURE
        RTS     
; -----------------------------------------------------------
LE1F0   LDAA    #$000B ;	A/D CHANNEL 11
        JSR     LFDE7 ;	GET A/D VALUE
        STAA    L002F ;	THROTTLE POSITION
        LDAB    L002C ;	TPS
        STAB    L0031 ;	TPS OLD
        PSHA    ;		STACK A/D TPS
        LDAB    L002D ;	MINIMUM THROTTLE POSITION
        CBA     ;		COMPARE TPS TO MINIMUM
        BHI     LE214 ;	IF TPS < MIN STORE NEW MIN
;									ELSE GOTO LE214
        LDAB    L0014 ;	LOAD MODE WORD
        BITB    #$0001 ;	CHECK BIT
        BNE     LE214 ;	BRANCH CODE 21 PRESENT 
;
        LDX     L002D ;	MINIMUM THROTTLE POSITION
        INC     L005A
        LDAB    L32B7 ;	MIN THROTTLE POSITION FILTER
        JSR     LFCC1 ;	FILTER ROUTINE 
        STD     L002D ;	MINIMUM THROTTLE POSITION
LE214   LDD     L002D ;	MINIMUM THROTTLE POSITION
        TSTB    
        BPL     LE21A ;	ROUND MIN TPS
        INCA    
LE21A   TAB     ;		B = MIN TPS
        PULA    ;		A = PRESENT TPS
        SBA     ;		A = A - B (TOTAL THROTTLE OPENING)
        BCC     LE220 ;	CHECK FOR NEG
        CLRA    ;		0 IF NEG
LE220   LDAB    L32B6 ;	TPS FACTOR 
        MUL     ;		D = A * B
        ASLD    ;		* 2
        BCS     LE230 ;	BRANCH IF OVERFLOW
        ASLD    ;		* 2
        BCS     LE230 ;	BRANCH IF OVERFLOW
        TSTB    
        BPL     LE232 ;    ROUND TOTAL THROTTLE
        INCA    
        BNE     LE232 ;	BRANCH IF OVERFLOW
;
LE230   LDAA    #$00FF ;   SET TO FF IF OVERFLOW
LE232   STAA    L002C ;	TPS
        LDAA    L0022 ;	BARO SPEED DENSITY
;									$00 = 10 KPA $90 = 100 KPA 
        LDAB    #$0060 ;	SET MIN 70 KPA
        LDX     #$33DA ;	BARO FACTOR TPS 
        JSR     LFD5D ;	2D INTERPOLATE WITH OFFSET
        LDAB    L002C ;	TPS
        MUL     
        ADCA    #$0000
        STAA    L002B ;	BARO CORRECTED TPS 
        LDAA    L0000 ;	RUN TIME MINOR COUNTER 
        ASRA    
        BCC     LE27F
        LDAA    #$0003 ;	A/D CHANNEL 3
        JSR     LFDE7 ;	GET A/D VALUE
        STAA    L003C ;	O2 A/D RAW
        CMPA    L32C3 ;	RICH/LEAN SET POINT 
        BLS     LE25B
        INC     L00B2
        BRA     LE267
;
LE25B   DEC     L00B2
        LDAB    L00C0 ;	LEAN COUNTER
        INCB    
        BNE     LE265
;
        LDAB    #$00FF
LE265   STAB    L00C0 ;	LEAN COUNTER 
LE267   TAB     
        CLRA    
        ADDD    L003D ;	O2 SENSOR VOLTAGE AVG WORD 
        STD     L003D ;	O2 SENSOR VOLTAGE AVG WORD 
        LDAA    L0000 ;	RUN TIME MINOR COUNTER 
        ANDA    #$0007
        CMPA    #$0007
        BNE     LE27F
;	DO THIS EVERY 8TH SAMPLE
        LDD     L003D ;	O2 SENSOR VOLTAGE AVG WORD 
        LSRD    
        LSRD    
        STAB    L003B ;	O2 SENSOR
        CLRA    
        CLRB    
        STD     L003D ;	O2 SENSOR VOLTAGE AVG WORD
LE27F   LDAA    L0020 ;	PRESSURE
        STAA    L004F ;	PRESSURE
        LDAB    L33EA ;	1 = MAP OR 0 = VAC
        BEQ     LE29F
        JSR     LFE22 ;	CONVERT TO MAP
        LDAA    L0026 ;	BARO
        SUBA    L004F ;	PRESSURE
        BCC     LE292
        CLRA    
LE292   ADDA    #$001D ;	OFFSET 10 KPA
        BCC     LE298
        LDAA    #$00FF
LE298   STAA    L004F ;	VACUUM
        JSR     LFE2B ;	CONVERT TO MAP
        BRA     LE2B2
;
LE29F   JSR     LFE2B ;	CONVERT TO MAP
        LDAB    L004F ;	VACUUM
        SUBB    #$001D ;	OFFSET 10 KPA
        BCC     LE2A9
        CLRB    
LE2A9   LDAA    L0026 ;	BARO
        SBA     
        BCC     LE2AF
        CLRA    
LE2AF   JSR     LFE22 ;	CONVERT TO MAP
LE2B2   LDAB    L0057
        TBA     
        ANDB    #$0040
        STAB    L0057
        LDAB    L0013
        BITB    #$0008
        BEQ     LE32E
        BITA    #$0008
        BEQ     LE32E
        LDD     L0060
        LSRD    
        LSRD    
        LSRD    
        COMA    
        COMB    
        ADDD    L0060
        BPL     LE2D0
        CLRA    
        CLRB    
LE2D0   STD     L0060
        LDAA    L00C9
        ANDA    #$00FD ;	CLR b2
        STAA    L00C9
        CLR     L0077
        LDAA    L000E
        BPL     LE2E8
        BITA    #$0040
        BEQ     LE2E6
        JMP     LE36C
;
LE2E6   BRA     LE2F9
;
LE2E8   LDD     L0C00 ;	DRP COUNTER 
        SUBD    L301F
        BCC     LE33E
        INC     L0078
        LDAA    L0078
        CMPA    #$0004
        BCS     LE341
LE2F9   LDAB    L3180 ;	MALF 2 MASK 
        ASRB    
        BCC     LE34E
        LDAB    L000E
        LDX     L3021
        CPX     L0C06 ;	EST CIRCUIT 
        BCC     LE344
        ANDB    #$00F7
        STAB    L000E
        LDAA    L007D
        CMPA    L301E
        BCC     LE322
        INCA    
        STAA    L007D
        LDX     #$0000
        STX     L0C06 ;	EST CIRCUIT 
        STX     L0C06 ;	EST CIRCUIT 
        BRA     LE35D
;
LE322   LDAB    L00C9
        ORAB    #$0001 ;	SET CODE 42
        STAB    L00C9
        INX     
        STX     L0C06 ;	EST CIRCUIT 
        BRA     LE35D
;
LE32E   INC     L0077
        LDAA    L000E
        BPL     LE341
        LDAA    L0077
        CMPA    #$000F
        BLS     LE36C
        JMP     LE880
;
LE33E   CLR     L0078
LE341   JMP     LE86B
;
LE344   BITB    #$0008
        BNE     LE34E
;
        ORAB    #$0008
        STAB    L000E
        BRA     LE36C
;
LE34E   CLR     L007D
        LDAB    L000C
        BITB    #$0001 ;	EST FAILURE
        BNE     LE35D ;	BRANCH NO EST FAILURE
;
        LDAB    L000E
        ORAB    #$0040 ;	EST FAILURE
        STAB    L000E
LE35D   LDD     L0C2C ;	EST 
        JSR     LFEDB ;	RTS
        STD     L0C24 ;	EST 
        LDAA    L000E
        ORAA    #$0080
        STAA    L000E
LE36C   LDAA    #$0004
        JSR     LFE0D
        JSR     LFF7B
        LDD     L001C ;	CYL CORR REF PERIOD 
        ASLD    
        STD     L004F
        LDX     L004F
        LDD     #$0133
        JSR     LFDA7 ;	D/X 
        LDD     L004F
        CMPA    #$0060
        BLS     LE39B
        TSTB    
        BPL     LE38D
        INCA    
        BEQ     LE397
LE38D   LDAB    #$00AB
        MUL     
        ADDD    #$0080
        ADDA    #$0060
        BCC     LE399
LE397   LDAA    #$00FF
LE399   BRA     LE3A4
;
LE39B   ASLD    
        ADDD    #$0080
        SUBA    #$0020
        BCC     LE3A4
        CLRA    
LE3A4   STAA    L0019 ;	RPM FOR TABLE
        LDD     L004F
        ASLD    
        BCS     LE3B3
        ASLD    
        BCS     LE3B3
        ADDD    #$0080
        BCC     LE3B5
LE3B3   LDAA    #$00FF
LE3B5   STAA    L001B ;	ENGINE RPM/6.25
        LDD     L004F
        ADDD    #$0080
        BCC     LE3C0
        LDAA    #$00FF
LE3C0   LDAB    L001A ;	ENGINE RPM/25
        STAA    L001A ;	ENGINE RPM/25
        LDX     L001E ;	FILTERED ENGINE RPM
        LDAB    L3034 ;	ENGINE RPM FILTER CONSTANT 
        LDAA    L001A ;	ENGINE RPM/25
        JSR     LFCC1 ;	FILTER ROUTINE 
        STD     L001E ;	FILTERED ENGINE RPM
        LDX     L0C00 ;	DRP COUNTER 
        STX     L004F
        LDAA    #$00FF
        LDAB    L002A ;	MAP
        SUBB    L0024 ;	MAP N-2
        BCS     LE3E1
        CMPB    #$0020
        BCC     LE3EC
LE3E1   LDD     L005E
        SUBD    L004F
        ASLD    
        SUBD    L0060
        BMI     LE3EE
        ADDD    L0060
LE3EC   STD     L0060
LE3EE   LDD     L004F
        LSRD    
        LSRD    
        LSRD    
        SUBD    L0060
        BCC     LE3FB
        ADDD    L0060
        STD     L0060
LE3FB   LDD     L004F
        STD     L005E
        LSRD    
        SUBD    #$00E5
        BCC     LE40A
        ADDD    #$0134
        BRA     LE41A
;
LE40A   LSRD    
        SUBD    #$0127
        BCS     LE415
        ADDD    #$017E
        BRA     LE41A
;
LE415   ADDD    #$05F7
        LSRD    
        LSRD    
LE41A   STD     L004F
        LDAA    #$0078
        SUBA    L0034 ;	BATT VOLT
        BCC     LE423
        CLRA    
LE423   LDAB    #$0004
        MUL     
        ADDD    L004F
        ADDD    L0060
        STD     L0062
        LDAB    L0023 ;	MAP OLD 
        STAB    L0024 ;	MAP N-2
        LDAB    L002A ;	MAP
        STAB    L0023 ;	MAP OLD
        LDAA    L0000 ;	RUN TIME MINOR COUNTER 
        ANDA    #$0007
        BNE     LE447
;
        LDAB    L0881 ;	I/O STATUS 2
        BITB    #$0080
        BNE     LE447
;
        LDAA    L00CA
        ORAA    #$0002 ;	SET CODE 54
        STAA    L00CA
LE447   LDAB    L000D
        BITB    #$0040
        BNE     LE484
;
        LDAA    L0007 ;	MALF 1
        BITA    #$0010 ;	OPEN CTS C15
        BNE     LE479 ;	BRANCH CODE 15 SET
;**********************SPARK ROUTINE*************************************
        LDAA    L3015 ;	MIN COOL TEMP COLD START 
        CMPA    L0035 ;	COOLANT TEMP
        BHI     LE479 ;	BRANCH TOO COLD
        LDAA    L0038 ;	INVERSE COOLANT TEMP
        SUBA    L003A ;	INVERSE COOL TEMP START 
        BCS     LE46B
        CMPA    #$0028
        BLS     LE468
        LDAA    #$0050
        BRA     LE46C
;
LE468   ASLA    
        BRA     LE46C
;
LE46B   CLRA    
LE46C   LDX     #$311A ;	SA CTS DIFF FROM START UP 
        JSR     LFD61 ;	2D INTERPOLATE 
        STAA    L0065 ;	SA BY COOLANT TEMP
        CMPA    L3017 ;	HOT CTS DIFF SA 
        BNE     LE484
;
LE479   LDAB    L000D
        ORAB    #$0040 ;	NOT COLD START
        STAB    L000D
        LDAA    L3017 ;	HOT CTS DIFF SA
        STAA    L0065 ;	SA BY COOLANT TEMP 
LE484   LDAB    L000E
        BITB    #$0002
        BNE     LE495
;
        LDAA    L3007
        CMPA    L0035 ;	COOLANT TEMP
        BCS     LE495
        ORAB    #$0002
        STAB    L000E
LE495   LDX     #$3037 ;	USE MAP
        JSR     LFC64 ;	GET ACC A VALUE AND INC X 
        LDAB    L000F
        ORAB    #$0020 ;	INHIBIT SPARK ADDERS
        STAB    L000F
        LDAB    L3001 ;	INSTALLED EQUIPMENT 1
        BITB    #$0010 ;	
        BEQ     LE4B0 ;	
        LDAB    L0012
        BMI     LE4B0 ;	BRANCH IF CLOSED LOOP
        BITB    #$0002
        BNE     LE4D8 
;
LE4B0   LDAB    L000F
        ANDB    #$00DF ;	ADD SPARK ADDERS
        STAB    L000F
        LDAB    L302A
        CMPB    L001A ;	ENGINE RPM/25
        BLS     LE4C3
        LDAB    L000D
        BITB    #$0002 ;	PARK NEUTRAL 0 = DRIVE
        BNE     LE4D8 ;	BRANCH IF PARK
;
LE4C3   LDAB    L000E
        BITB    #$0002
        BEQ     LE4D8
        LDAB    L000D
        BITB    #$0040
        BEQ     LE4D8
        SUBA    #$0040
        BCC     LE4D4
        CLRA    
LE4D4   CMPA    #$00B0
        BLS     LE4DA
LE4D8   LDAA    #$00B0
LE4DA   TAB     
        LDAA    L0019 ;	RPM FOR TABLE 
        CMPA    #$00C0
        BLS     LE4E3
        LDAA    #$00C0
LE4E3   JSR     LFD7C ;	3D INTERPOLATE
        STAA    L0064 ;	MAIN SPARK 
        LDAA    L001A ;	ENGINE RPM/25
        CMPA    #$0090
        BHI     LE506 ;	GREATER THAN 3600
        SUBA    L3010 ;	MAX RPM SPARK CORRECTION 
        BCC     LE524
        NEGA    
        LDAB    L3011 ;	FACTOR RPM SPARK CORR
        MUL     
        LSRD    
        LSRD    
        LSRD    
        TSTA    
        BNE     LE503
;
LE4FE   LDAA    L0064 ;	MAIN SPARK 
        SBA     
        BCC     LE522
LE503   CLRA    
        BRA     LE522
;
LE506   CMPA    L300E ;	MAX RPM HI RPM SPARK CORR
        BLS     LE50E
        LDAA    L300E ;	MAX RPM HI RPM SPARK CORR 
LE50E   SUBA    #$0090
        ASLA    
        LDAB    L300F ;	FACTOR HI RPM SPARK CORR
        ASLB    
        MUL     
        TAB     
        TST     L300F
        BMI     LE4FE
        ADDA    L0064 ;	MAIN SPARK 
        BCC     LE522
        LDAA    #$00FF
LE522   STAA    L0064 ;	MAIN SPARK 
LE524   LDX     #$3037 ;	USE MAP
        JSR     LFC64 ;	GET ACC A VALUE AND INC X
        SUBA    L3012 ;	MAX MAP SPARK CORRECTION
        BCC     LE548
        NEGA    
        LDAB    L3013 ;	FACTOR SPARK CORRECTION
        MUL     
        BITA    #$00E0
        BNE     LE53D
;
        ASLD    
        ASLD    
        ASLD    
        BRA     LE53F
;
LE53D   LDAA    #$00FF
LE53F   TAB     
        LDAA    L0064 ;	MAIN SPARK 
        SBA     
        BCC     LE546
        CLRA    
LE546   STAA    L0064 ;	MAIN SPARK 
LE548   LDAB    L000F
        CLR     L006C ;	HIGHWAY MODE SA BY MAP 
        LDX     L0071 ;	HIGHWAY MODE COUNTER
        LDAA    L001A ;	ENGINE RPM/25
        CMPA    L3008 ;	MIN RPM FOR HIGHWAY MODE
        BLS     LE58E
        LDAA    L0035 ;	COOLANT TEMP
        CMPA    L3009 ;	MAX COOL TEMP FOR HWY MODE
        BLS     LE58E
        CMPA    L300A ;	MIN COOL TEMP FOR HWY MODE
        BHI     LE58E
        LDX     #$3138
        JSR     LFC64 ;	GET ACC A VALUE AND INC X
        CMPA    L300B ;	MAX MAP FOR HIGHWAY MODE
        BHI     LE58E
        LDX     L0071 ;	HIGHWAY MODE COUNTER
        CPX     L300C
        BNE     LE58B
;
        LSRA    
        CMPA    #$0070
        BLS     LE57B
        LDAA    #$0070
LE57B   ORAB    #$0004
        STAB    L000F
        LDAB    #$0030 ;		
        LDX     #$3139 ;	SA BY MAP
        JSR     LFD5D ;	2D INTERPOLATE WITH OFFSET
        STAA    L006C ;	HIGHWAY MODE SA BY MAP 
        BRA     LE597
;
LE58B   INX     
        BRA     LE591
;
LE58E   LDX     #$0000
LE591   ANDB    #$00FB
        STAB    L000F
        STX     L0071 ;	HIGHWAY MODE COUNTER
LE597   LDAA    L0007 ;	MALF 1
        BITA    #$0010 ;	SHORTED COOLANT SENSOR
        BEQ     LE5A2 ;	BRANCH NO CODE 15
        LDAA    L3016 ;	DEFAULT COOLANT SPARK
        BRA     LE5BA
;
LE5A2   LDX     #$30CB ;	USE MAP
        JSR     LFC64 ;	GET ACC A VALUE AND INC X
        SUBA    #$0070
        BCC     LE5AD
        CLRA    
LE5AD   LSRA    
        CMPA    #$0040
        BLS     LE5B4
        LDAA    #$0040
LE5B4   TAB     
        LDAA    L0037 ;	INVERSE COOLANT TEMP
        JSR     LFD7C ;	3D INTERPOLATE 
LE5BA   STAA    L0066 ;	SA BY COOLANT TEMP AND MAP
        LDX     #$3120 ;	USE MAP 
        JSR     LFC64 ;	GET ACC A VALUE AND INC X
        TAB     
        LDAA    L0022 ;	BARO SPEED DENSITY 
;									$00 = 10 KPA $90 = 100 KPA 
        LSRB    
        JSR     LFD7C ;	3D INTERPOLATE
        STAA    L0069 ;	SA BY BARO AND MAP 
        LDAA    L3019 ;	LOCKED RPM AND MAP SA
        LDAB    L0010
        BPL     LE5E5 ;	BRANCH IF UNLOCKED
        LDX     #$3156 ;	USE MAP
        JSR     LFC64 ;	GET ACC A VALUE AND INC X
        TAB     
        LSRB    
        LDAA    L001A ;	ENGINE RPM/25
        CMPA    #$0050
        BLS     LE5E2
        LDAA    #$0050
LE5E2   JSR     LFD7C ;	3D INTERPOLATE 
LE5E5   STAA    L006D ;	SA BY RPM AND MAP UNLOCKED TCC
        LDAA    L000D
        BITA    #$0001 ;	1 = MOUNTAIN COAST MODE 
        BEQ     LE5F3 ;	BRANCH NOT MOUNTAIN COAST
        CLRA    
        LDAB    L33F7 ;	MOUNTAIN COAST SA
        BRA     LE62A
;
LE5F3   LDAB    L0064 ;	MAIN SPARK
        LDAA    L000F
        BITA    #$0020 ;	SPARK ADDERS 
        BEQ     LE601
        CLRA    
        SUBB    L302B
        BRA     LE628
;
LE601   CLRA    
        ADDB    L0065 ;	SA BY COOLANT TEMP 
        ADCA    #$0000
        ADDB    L006C ;	HIGHWAY MODE SA BY MAP 
        ADCA    #$0000
        ADDB    L0066 ;	SA BY COOLANT TEMP AND MAP 
        ADCA    #$0000
        ADDB    L0069 ;	SA BY BARO AND MAP
        ADCA    #$0000
        ADDB    L006D ;	SA BY RPM AND MAP UNLOCKED TCC
        ADCA    #$0000
        SUBB    L3016 ;	DEFAULT COOLANT SPARK 
        SBCA    #$0000
        SUBB    L3017 ;	HOT CTS DIFF SA 
        SBCA    #$0000
        SUBB    L3018 ;	SPARK ADDER NORMALIZER 
        SBCA    #$0000
        SUBB    L3019 ;	LOCKED RPM AND MAP SA 
LE628   SBCA    #$0000
LE62A   TST     L0018
        BPL     LE634 ;	SES LIGHT OFF
        ADDB    L302F
        ADCA    #$0000
LE634   STD     L006A ;	CALC SA
        LDAA    L0016
        BPL     LE63D
        JSR     L5806
LE63D   LDD     L006A ;	CALC SA 
        TST     L0017
        BPL     LE65A
        TST     L3004
        BPL     LE656
        TST     L004A ;	VEHICLE SPEED
        BNE     LE65A
;
        PSHB    
        LDAB    L000D
        BITB    #$0002 ;	PARK NEUTRAL
        PULB    
        BEQ     LE65A ;	BRANCH IF DRIVE
LE656   LDAB    L3186 ;	PARK NEUTRAL SPARK
        CLRA    
LE65A   SUBB    L3006 ;	INITIAL SPARK ADVANCE
        SBCA    #$0000
        STD     L0067 ;	FINAL SA
        LDD     L3023 ;	MAX SPARK ADVANCE
        SUBD    L0067 ;	FINAL SA
        BGT     LE66C
        ADDD    L0067 ;	FINAL SA
        STD     L0067 ;	FINAL SA
LE66C   LDD     L0C0A ;	KNOCK COUNTER 
        STD     L0050 ;	KNOCK COUNTS
        SUBD    L007F ;	OLD KNOCK COUNTS
        TSTA    
        BEQ     LE678
        LDAB    #$00FF
LE678   LDX     L004D ;	ENGINE RUN TIME 
        CPX     L31A8 ;	MIN TIME SET KNOCK BIT
        BLS     LE68A
        CMPB    L31B3 ;	MAX KNOCK COUNT SET BIT
        BLS     LE68D
        LDAA    L0015
        ORAA    #$0080 ;	1 = ENGINE KNOCKING
        STAA    L0015
LE68A   CLR     L0085 ;	KNOCK TEST COUNTER 
LE68D   LDX     L0050 ;	KNOCK COUNTS
        STX     L007F ;	OLD KNOCK COUNTS
        PSHB    
        LDAB    L000E
        LDAA    L302C ;	MIN TPS START WOT KNOCK
        CMPA    L002C ;	TPS
        BCS     LE6AA
        BITB    #$0020
        BEQ     LE6AC
        SUBA    L302D ;	MIN TPS STAY WOT KNOCK
        CMPA    L002C ;	TPS
        BCS     LE6AA
        ANDB    #$00DF
        BRA     LE6AC
;
LE6AA   ORAB    #$0020
LE6AC   STAB    L000E
        PULB    
        LDAA    L000C
        BITA    #$0004
        BNE     LE70B
;
        LDAA    L000D
        BITA    #$0020
        BNE     LE6C1
;
        LDAA    L007F ;	OLD KNOCK COUNTS 
        STAA    L0081 ;	OLD KNOCK COUNTS 
        BRA     LE6FD
;
LE6C1   LDAA    L000D
        ANDA    #$00F7
        STAA    L000D
        LDAA    L0037 ;	INVERSE COOLANT TEMP
        SUBA    L003A ;	INVERSE COOL TEMP START 
        BCC     LE6CE
        CLRA    
LE6CE   CMPA    L3032 ;	MIN COOL RISE FOR KNOCK RETARD
        BCS     LE6DB
        LDAA    L000C
        ORAA    #$0004
        STAA    L000C
        BRA     LE70B
;
LE6DB   LDAA    L3001 ;	INSTALLED EQUIPMENT 1
        ASRA    
        BCC     LE6FD
        LDAA    L0017
        BMI     LE6FD
        LDAA    L004C ;	LOW SPEED VSS 
        CMPA    L3033 ;	MIN SPEED FOR KNOCK RETARD
        BCS     LE6FD
        LDAA    L0034 ;	BATT VOLT
        CMPA    #$005A
        BCS     LE711
        LDAA    L0018
        BMI     LE70B ;	SES LIGHT ON
        LDAA    L0035 ;	COOLANT TEMP
        CMPA    L3031 ;	MIN TEMP FOR KNOCK RETARD
        BCS     LE701
LE6FD   CLRA    
        JMP     LE79B
;
LE701   LDAA    L001E ;	FILTERED ENGINE RPM
        CMPA    L3030 ;	MIN RPM FOR KNOCK RETARD
        BCC     LE70B
        JMP     LE7B6
;
LE70B   LDAA    L0015
        BITA    #$0060 ;	CODE 43 SET
        BEQ     LE717
LE711   LDAA    L31AB ;	KNOCK RETARD FOR C43
        JMP     LE79B
;
LE717   PSHB    
        LDAB    L000E
        BITB    #$0020
        BNE     LE731 ;	BRANCH WOT KNOCK
;
        LDAA    L0029 ;	MAP
        SUBA    #$0090
        BCC     LE725
        CLRA    
LE725   LSRA    
        CMPA    #$0030
        BLS     LE72C
        LDAA    #$0030
LE72C   LDX     #$313E
        BRA     LE742
;
LE731   LDAA    L001A ;	ENGINE RPM/25
        SUBA    #$0020 ;	OFFSET 800 RPM
        BCC     LE738
        CLRA    
LE738   LSRA    
        CMPA    #$0030
        BLS     LE73F
        LDAA    #$0030
LE73F   LDX     #$314A
LE742   JSR     LFD61 ;	2D INTERPOLATE 
        PULB    
        MUL     
        ASLD    
        ADDA    L0083 ;	KNOCK RETARD 
        BCC     LE74E
        LDAA    #$00FF
LE74E   LDAB    L00A5 ;	DUTY CYCLE BLOCK NUMBER 
        BEQ     LE763
        LDAB    L0075
        BEQ     LE763
        LDAB    L0000 ;	RUN TIME MINOR COUNTER 
        ANDB    #$0007
        BNE     LE75F
;
        DEC     L0075
LE75F   LDAB    L3036 ;	KNOCK RETARD FACTOR
        MUL     
LE763   PSHA ;	KNOCK RETARD    
        LDAA    L000E
        BITA    #$0020
        BNE     LE781
;
        LDAA    L001A ;	ENGINE RPM/25
        SUBA    #$0020 ;	OFFSET 800 RPM
        BCC     LE771
        CLRA    
LE771   LSRA    
        CMPA    #$0030
        BLS     LE778
        LDAA    #$0030
LE778   LDX     #$3146
        JSR     LFD61 ;	2D INTERPOLATE 
        TAB     
        BRA     LE796
;
LE781   LDX     #$3152 ;	MAX KNOCK RETARD
        LDAA    L0029 ;	MAP
        SUBA    #$0090
        BCC     LE78B
        CLRA    
LE78B   LSRA    
        CMPA    #$0030
        BLS     LE792
        LDAA    #$0030
LE792   JSR     LFD61 ;	2D INTERPOLATE 
        TAB     
LE796   PULA ;	KNOCK RETARD    
        CBA     
        BCS     LE79B
        TBA     
LE79B   STAA    L0083 ;	KNOCK RETARD
        LSRA    
        STAA    L004F ;	KNOCK RETARD
        LDAB    L0016
        BPL     LE7AE
        LDAB    L005B
        CMPB    #$0001
        BEQ     LE7B6
        CMPB    #$0081
        BEQ     LE7B6
LE7AE   LDD     L0067 ;	FINAL SA
        SUBB    L004F ;	KNOCK RETARD
        SBCA    #$0000
        STD     L0067 ;	FINAL SA
LE7B6   LDX     L00D3
        LDAA    L0016
        ANDA    #$0004 ;	CODE 53 SET
        BNE     LE7C3
;
        LDAB    L31C4 ;	NOT C53 FILTER FACTOR
        BRA     LE7C8
;
LE7C3   LDAA    #$00FF
        LDAB    L31C3 ;	C53 FILTER FACTOR
LE7C8   JSR     LFCC1 ;	FILTER ROUTINE 
        STD     L00D3
        LDX     #$00D3
        LDAA    L31C2 ;	C53 SPARK RETARD %
        JSR     LFDD3 ;	A * X (PERCENTAGE)
        TSTB    
        BPL     LE7DD
        INCA    ;		ROUND A
        BNE     LE7DD
;
        COMA ;		A = $FF   
LE7DD   STAA    L004F
        LDD     L0067 ;	FINAL SA
        SUBB    L004F
        SBCA    #$0000
        STD     L0067 ;	FINAL SA
        LDAA    L3029 ;	MIN SPK ADV SWITCH PNT
        CMPA    L0035 ;	COOLANT TEMP
        BCC     LE7F3
        LDD     L3027 ;	MINIMUM SPARK ADVANCE COOL
        BRA     LE7F6
;
LE7F3   LDD     L3025 ;	MINIMUM SPARK ADVANCE WARM
LE7F6   SUBD    L0067 ;	FINAL SA
        BLT     LE7FE
        ADDD    L0067 ;	FINAL SA
        STD     L0067 ;	FINAL SA
LE7FE   LDAA    L0085 ;	KNOCK TEST COUNTER 
        BEQ     LE81D
        LDX     L0067 ;	FINAL SA
        LDAB    L31B1 ;	SPARK ADDER 1ST KNOCK TEST
        LDAA    L0015
        BITA    #$0010 ;	FIRST KNOCK FAILURE 
        BEQ     LE810
        LDAB    L31B2 ;	SPARK ADDER 2ND KNOCK TEST 
LE810   ABX     
        CPX     L3023 ;	MAX SPARK ADVANCE
        BLS     LE81B
        CLR     L0085 ;	KNOCK TEST COUNTER 
        LDX     L0067 ;	FINAL SA
LE81B   STX     L0067 ;	FINAL SA
LE81D   LDD     L0067 ;	FINAL SA
        ADDB    L3006 ;	INITIAL SPARK ADVANCE 
        ADCA    #$0000
        BPL     LE82C
        TBA     
        NEGA    
        LDAB    #$0080
        BRA     LE833
;
LE82C   TSTA    
        BEQ     LE831
        LDAB    #$00FF
LE831   TBA     
        CLRB    
LE833   STD     L0073
        LDD     L0067 ;	FINAL SA
        SUBB    L301A
        SBCA    #$0000
        BPL     LE845
        LDAA    L000E
        ORAA    #$0001
        NEGB    
        BRA     LE849
;
LE845   LDAA    L000E
        ANDA    #$00FE
LE849   STAA    L000E
        STAB    L006E
        LDAA    L006E
        SUBA    L0076
        BCS     LE862
        LDAB    L301B
        MUL     
        INCA    
        ADDA    L0076
        BCC     LE85E
        LDAA    #$00FF
LE85E   CMPA    L006E
        BLS     LE864
LE862   LDAA    L006E
LE864   STAA    L0076
        JSR     LFEE4
        BRA     LE883
;
LE86B   LDAA    L32B8 ;	DEFAULT TPS MEM BOMB 
        STAA    L002D ;	MINIMUM THROTTLE POSITION
        CLR     L002E
        LDAA    #$0004
        JSR     LFE0D
        LDX     #$FFFF
        STX     L001C ;	CYL CORR REF PERIOD 
        INX     
        STX     L004D ;	ENGINE RUN TIME 
LE880   JSR     LFEDC
LE883   LDAA    L000D
        ORAA    #$0002 ;	SET PARK
        LDAB    L0881 ;	I/O STATUS 2
        BITB    #$0020 ;	PARK NEUTRAL
        BNE     LE890 ;	BRANCH IF PARK
;
        ANDA    #$00FD ;	SET DRIVE
LE890   STAA    L000D
        JMP     LE1D8
;----------------------------------------------------------------------
;	MINOR LOOP 7
        LDAA    L0016
        BPL     LE89C ;	1 = HUD ONLINE
        JSR     L580F ;	DO HUD
;******************CREATE INVERSE COOLANT TEMP*************************
LE89C   LDAA    #$0039
        CMPA    L0035 ;	COOLANT TEMP
        BHI     LE8AD
        LDAA    #$00FC
        SUBA    L0035 ;	COOLANT TEMP
        BCC     LE8B3
        CLRA    
        STAA    L0038 ;	INVERSE COOLANT TEMP
        BRA     LE8C8
;
LE8AD   LDAA    #$00FF
        STAA    L0038 ;	INVERSE COOLANT TEMP
        BRA     LE8C6
;
LE8B3   LDX     #$FFB7
        JSR     LFD61 ;	2D INTERPOLATE 
        STAA    L0038 ;	INVERSE COOLANT TEMP
        SUBA    #$0010
        BCC     LE8C2
        CLRA    
        BRA     LE8C8
;
LE8C2   CMPA    #$00E0
        BLS     LE8C8
LE8C6   LDAA    #$00E0
LE8C8   STAA    L0037 ;	INVERSE COOLANT TEMP
;******************DRP STATUS CHECK***************************************
        LDAA    L000E
        BMI     LE917 ;	DRP RECEIVED
;******************DO NO DRP**********************************************
        LDAA    L0035 ;	COOLANT TEMP
        STAA    L0039 ;	COOLANT TEMP START
        LDAA    L0038 ;	INVERSE COOLANT TEMP
        STAA    L003A ;	INVERSE COOL TEMP START 
        LDAA    L0011 ;	CLCC 1
        ANDA    #$0040 ;	CLR ALL BUT MEM BOMB
        STAA    L0011 ;	CLCC 1
        LDAA    L32C4 ;	START UP O2 VALUE
        CLRB    
        STD     L0041 ;	FAST O2 FILTERED
        STD     L003F ;	SLOW O2 FILTERED
        LDAA    L0012
        ORAA    #$0040 ;	ENGINE NOT RUNNING
        STAA    L0012
        JSR     LFCFB ; 	
        LDAA    L0029 ;	MAP
        CMPA    L31A6 ;	MIN MAP CODE 41
        BLS     LE8FF
        CMPA    L31A7 ;	MAX MAP CODE 41
        BHI     LE8FF
        LDAA    L00C9
        ORAA    #$0002 ;	SET CODE 41
        STAA    L00C9
LE8FF   CLRA    
        LDAB    #$00FA
        CMPB    L008F
        BLS     LE90C
        INC     L008F
        LDAA    L32AE ;	START MCS DC
LE90C   LDAB    L000F
        BPL     LE912
        LDAA    #$0080 ;	DEFAULT MCS DC
LE912   STAA    L00A2 ;	MC DUTY CYCLE
        JMP     LEDDE ;	JUMP TO MCS DC OUT
;******************DO DRP RECEIVED****************************************
LE917   JSR     LFB6B ;	DUTY CYCLE BLOCK ASSIGNER
        LDAA    L00A5 ;	DUTY CYCLE BLOCK NUMBER 
        BEQ     LE927
        LDAA    L00A6
        BEQ     LE931
        DEC     L00A6
        BRA     LE931
;
LE927   LDAA    L32D7
        STAA    L00A6
        LDAA    L302E
        STAA    L0075
LE931   LDAA    L0013
        ANDA    #$00DF ;	SET LEAN
        LDAB    L0011 ;	CLCC 1
        BITB    #$0020
        BEQ     LE93D ;	BRANCH IF LEAN
        ORAA    #$0020 ;	SET RICH
LE93D   STAA    L0013 ;	
        LDAA    L3000 ;	INSTALLED EQUIPMENT 0
        BITA    #$0040 ;	1= RICH LEAN COUNTER
        BEQ     LE950
        LDAA    L00B2 ;	RICH LEAN COUNTER
        BMI     LE95B
        BNE     LE957
;
        EORB    #$0020 ;	FLIP RICH LEAN FLAG
        BRA     LE95D
;
LE950   LDAA    L003B ;	O2 SENSOR
        CMPA    L32C3 ;	RICH/LEAN SET POINT
        BLS     LE95B
LE957   ORAB    #$0020 ;	SET RICH
        BRA     LE95D
;
LE95B   ANDB    #$00DF ;	SET LEAN
LE95D   STAB    L0011 ;	CLCC 1
        EORB    L0013
        BITB    #$0020
        BEQ     LE968 ;	BRANCH IF NO CHANGE
        INC     L008E ;	CROSS COUNTS
LE968   CLR     L00B2
        LDAA    L000F
        BMI     LE9A6 ;	MCS FAULT
        LDAA    L0012
        ASRA    
        BCS     LE9AC ;	MCS FAULT HISTORY
        LDX     #$33DE ;	MIN ENG RUN TIME FOR FUELING
        LDAA    L0037 ;	INVERSE COOLANT TEMP
        CMPA    #$00B0
        BCS     LE97F
        LDAA    #$00B0
LE97F   JSR     LFD61 ;	2D INTERPOLATE 
        CMPA    L004E ;	ENGINE RUN TIME 
        BLS     LE9A6
        LDX     #$33AF ;	START UP MCS DC
        LDAA    L0037 ;	INVERSE COOLANT TEMP
        CMPA    #$00B0
        BCS     LE991
        LDAA    #$00B0
LE991   JSR     LFD61 ;	2D INTERPOLATE 
        STAA    L00A2 ;	MC DUTY CYCLE
        LDX     #$0092 ;	MC DUTY CYCLE
        JSR     LFC0D ;	LOOKUP A = L(X+TPS BLOCK)
        SUBA    L00A2 ;	MC DUTY CYCLE
        BCC     LE9A1
        CLRA    
LE9A1   STAA    L00A2 ;	MC DUTY CYCLE
        JMP     LEDDB ;	MC DC OUT
;
LE9A6   LDAA    L0012
        ORAA    #$0001 ;	MCS FAULT HISTORY
        STAA    L0012
LE9AC   LDAB    L0014
        ANDB    #$009F
        JSR     LFC61 ;	USE TPS
        CMPA    L318B ;	MAX TPS
        BCC     LE9BA
        ORAB    #$0020
LE9BA   STAB    L0014
        LDAB    L0011 ;	CLCC 1
        STAB    L0051 ;	CLCC 1 OLD
        ANDB    #$00F6 ;	SET NORMAL FUEL
        STAB    L0011 ;	CLCC 1
        LDX     #$33A9 ;	USE TPS
        JSR     LFC64 ;	GET ACC A VALUE AND INC X
        PSHA ;		TPS   
        LDAA    L0019 ;	RPM FOR TABLE 
        LSRA    
        LSRA    
        JSR     LFD61 ;	2D INTERPOLATE 
        LDAB    L0051 ;	CLCC 1 OLD 
        BITB    #$0008
        BEQ     LE9E1 ;	BRANCH NOT WOT	
        ASRB    
        BCS     LE9E1 ;	BRANCH BLENDED FUEL
        SUBA    L32CD ;	WOT TPS OFFSET
        BCC     LE9E1
        CLRA    
LE9E1   PULB ;			TPS    
        CBA     
        BCS     LEA01
        LDAA    L0011 ;	CLCC 1
        BPL     LEA1C ;	BRANCH IF OPEN LOOP
        LDAA    L32CE ;	MIN TPS WOT TCC UNLOCKED 
        TST     L0010
        BPL     LE9F4 ;	BRANCH IF UNLOCKED 
        LDAA    L32CF ;	MIN TPS WOT TCC LOCKED 
LE9F4   CBA     
        BCC     LEA1C
        LDAB    L000F
        BMI     LEA16
        LDAB    L0011 ;	CLCC 1
        ORAB    #$0001 ;	SET BLENDED FUEL
        BRA     LEA05
;
LEA01   LDAB    L0011 ;	CLCC 1
        BPL     LEA12 ;	BRANCH IF OPEN LOOP 
LEA05   LDAA    L0035 ;	COOLANT TEMP
        CMPA    L32CC ;	MIN COOLANT FOR WOT
        BCC     LEA12
        ANDB    #$00FE ;	CLR BLENDED FUEL
        STAB    L0011 ;	CLCC 1
        BRA     LEA16
;
LEA12   ORAB    #$0008 ;	SET WOT
        STAB    L0011 ;	CLCC 1
LEA16   LDAA    L0014
        ORAA    #$0040 ;	
        STAA    L0014
LEA1C   LDAA    L0011 ;	CLCC 1
        BPL     LEA77 ;	BRANCH IF OPEN LOOP 
        LDAB    L0012
        LDX     #$32EC ;	USE TPS
        JSR     LFC64 ;	GET ACC A VALUE AND INC X
        CMPA    L32ED
        BLS     LEA36
        CMPA    L32EE
        BHI     LEA48
        BITB    #$0020
        BEQ     LEA4B
LEA36   LDAA    L001A ;	ENGINE RPM/25
        CMPA    L32F0
        BHI     LEA60
        BITB    #$0020
        BEQ     LEA4B
        CMPA    L32EF
        BLS     LEA4B
        BRA     LEA60
;
LEA48   CLR     L00B5
LEA4B   ANDB    #$00DF
        STAB    L0012
        LDAA    L00B5
        BEQ     LEA77
        DEC     L00B5
        LDAA    L0092 ;	MC DUTY CYCLE BLOCK 0
        LDAB    L32F1
        JSR     LFC19
        BRA     LEA72
;
LEA60   ORAB    #$0060
        STAB    L0012
        LDAA    L32F2
        STAA    L00B5
        LDAA    L0092 ;	MC DUTY CYCLE BLOCK 0
        ADDA    L32F3
        BCC     LEA72
        LDAA    #$00FF
LEA72   STAA    L00A2 ;	MC DUTY CYCLE
        JMP     LEDD6
;
LEA77   LDX     L0041 ;	FAST O2 FILTERED
        LDAB    L32C5 ;	FAST O2 FILTER CONSTANT 
        LDAA    L003B ;	O2 SENSOR
        JSR     LFCC1 ;	FILTER ROUTINE 
        STD     L0041 ;	FAST O2 FILTERED
        LDAB    L000F
        BMI     LEAAA
        LDAA    L0013
        BITA    #$0010
        BNE     LEAAA
;
        LDD     L004D ;	ENGINE RUN TIME 
        LSRD    
        STAB    L004F
        LDAB    L32BA ;	MIN ENG RUN TIME CLSD LOOP CS
        LDAA    L0039 ;	COOLANT TEMP START 
        CMPA    L32B9 ;	MIN COOLANT TEMP HOT START
        BCC     LEA9F
        LDAB    L32BB ;	MIN ENG RUN TIME CLSD LOOP HS
LEA9F   LDAA    L004F
        CBA     
        BLS     LEADB
        LDAA    L0013
        ORAA    #$0010
        STAA    L0013
LEAAA   LDAA    L32BC ;	MIN TEMP START CLSD LOOP
        LDAB    L0011 ;	CLCC 1
        BPL     LEAB4 ;	BRANCH IF OPEN LOOP 
        LDAA    L32BD ;	MIN TEMP CONT CLSD LOOP
LEAB4   CMPA    L0035 ;	COOLANT TEMP
        BLS     LEADB
        LDAA    L0041 ;	FAST O2 FILTERED
        CMPA    L32BF ;	LEAN VOLTAGE THRESHHOLD
        BLS     LEAE4
        CMPA    L32BE ;	RICH VOLTAGE THRESHHOLD
        BHI     LEAE4
        LDAA    L0011 ;	CLCC 1
        BPL     LEADB ;	BRANCH IF OPEN LOOP 
        LDAB    L003B ;	O2 SENSOR
        CMPB    L32C0 ;	RICH VOLTAGE THRESHHOLD	
        BHI     LEAE4
        CMPB    L32C1 ;	LEAN VOLTAGE THRESHHOLD
        BLS     LEAE4
        LDAA    L00B3 ;	CYCLES LEFT OPEN LOOP
        BEQ     LEADB
        DECA    
        BRA     LEAE7
;
LEADB   LDAA    L0011 ;	CLCC 1
        ANDA    #$007F ;	OPEN LOOP
        STAA    L0011 ;	CLCC 1
        JMP     LECC4
;
LEAE4   LDAA    L32C2 ;	CYCLES BEFORE OPEN LOOP
LEAE7   STAA    L00B3 ;	CYCLES LEFT OPEN LOOP
        LDAA    L0011 ;	CLCC 1
        ORAA    #$0080 ;	CLOSED LOOP
        STAA    L0011 ;	CLCC 1
        LDAB    L0037 ;	INVERSE COOLANT TEMP
        STAB    L0002 ;	CLOSED LOOP COOLANT TEMP
        LDAB    L0012
        ORAB    #$0080 ;	CLOSED LOOP 
        STAB    L0012
        BITA    #$0008
        BEQ     LEB00 ;	NOT WOT
        JMP     LED54
;
LEB00   BITB    #$0040
        BEQ     LEB2C
        LDAA    L00A5 ;	DUTY CYCLE BLOCK NUMBER 
        BEQ     LEB0C
        LDAA    L00A6
        BNE     LEB36
;
LEB0C   LDX     #$0092 ;	MC DUTY CYCLE
        JSR     LFC0D ;	LOOKUP A = L(X+TPS BLOCK)
        CLRB    
        STD     L00AB ;	MC DUTY CYCLE 
        STD     L00A2 ;	MC DUTY CYCLE
        LDX     #$33C2
        JSR     LFC0D ;	LOOKUP A = L(X+TPS BLOCK)
        STAA    L00AD
        CLRA    
        STAA    L0090
        STAA    L0091
        LDD     L0012
        ANDA    #$00BF
        ANDB    #$00FE
        STD     L0012
LEB2C   LDAA    L00AD
        BEQ     LEB36
        DECA    
        STAA    L00AD
        JMP     LEDDB
;
LEB36   LDAA    L0012
        LDAB    L002C ;	TPS
        SUBB    L0030 ;	TPS OLD 
        BCC     LEB3F
        NEGB    
LEB3F   CMPB    L32E2 ;	MAX DELTA TPS START STEADY TPS
        BLS     LEB54
        BITA    #$0010
        BEQ     LEB4D
        CMPB    L32E3 ;	MAX DELTA TPS STAY STEADY TPS
        BLS     LEB54
LEB4D   LDAB    L32E4 ;	MIN COUNTS STEADY TPS
        STAB    L00B4
        BRA     LEB5B
;
LEB54   LDAB    L00B4
        BEQ     LEB5F
        DEC     L00B4
LEB5B   ANDA    #$00EF
        BRA     LEB61
;
LEB5F   ORAA    #$0010 ;	STEADY TPS
LEB61   STAA    L0012
        LDAA    #$0020
        BITA    L0011 ;	CLCC 1
        BEQ     LEB8F ;	BRANCH IF LEAN
        BITA    L0013
        BEQ     LEB7D ;	BRANCH IF LEAN
        LDX     #$3314 ;	WAS RICH NOW RICH
        JSR     LFC0D ;	LOOKUP A = L(X+TPS BLOCK)
        JSR     LFD14
        CLRB    
        LSRD    
        LSRD    
        LSRD    
        LSRD    
        BRA     LEB86
;
LEB7D   LDX     #$3334 ;	WAS LEAN NOW RICH
        JSR     LFC0D ;	LOOKUP A = L(X+TPS BLOCK)
        JSR     LFD19
LEB86   ADDD    L00A2 ;	MC DUTY CYCLE
        BCC     LEB8D
        LDD     #$FFFF
LEB8D   BRA     LEBB6
;
LEB8F   BITA    L0013
        BNE     LEBA3 ;	BRANCH IF RICH
;
        LDX     #$3304 ;	WAS LEAN NOW LEAN
        JSR     LFC0D ;	LOOKUP A = L(X+TPS BLOCK)
        JSR     LFD14
        CLRB    
        LSRD    
        LSRD    
        LSRD    
        LSRD    
        BRA     LEBAC
;
LEBA3   LDX     #$3324 ;	WAS RICH NOW LEAN
        JSR     LFC0D ;	LOOKUP A = L(X+TPS BLOCK)
        JSR     LFD19
LEBAC   STD     L004F
        LDD     L00A2 ;	MC DUTY CYCLE
        SUBD    L004F
        BCC     LEBB6
        CLRA    
        CLRB    
LEBB6   STD     L00A2 ;	MC DUTY CYCLE
        JSR     LFC28
        LDAA    L000D
        BITA    #$0001 ;	1 = MOUNTAIN COAST MODE 
        BEQ     LEBC4
        JMP     LEC52
;
LEBC4   LDAA    L00A5 ;	DUTY CYCLE BLOCK NUMBER 
        BNE     LEBF5
;
        LDAA    L32D9
        CMPA    L0090
        BCC     LEC23
        LDAA    L3001 ;	INSTALLED EQUIPMENT 1
        BITA    #$0020
        BEQ     LEC20
        BITA    #$0004
        BEQ     LEBE2
        LDAA    L000F
        BITA    #$0008
        BNE     LEC1A
;
        BMI     LEC1A
LEBE2   LDAA    L0013
        ORAA    #$0001
        STAA    L0013
        LDAA    L0091
        CMPA    L32E8
        BHI     LEC04
        INCA    
        STAA    L0091
        CLRB    
        BRA     LEC11
;
LEBF5   LDAA    L00A6
        BEQ     LEC2C
        LDAA    L0013
        ORAA    #$0001
        STAA    L0013
        LDAA    L32D8
        BRA     LEC16
;
LEC04   LDAA    L0035 ;	COOLANT TEMP
        LDAB    L32EA
        CMPA    L32E9
        BHI     LEC11
        LDAB    L32EB
LEC11   LDAA    L0092 ;	MC DUTY CYCLE BLOCK 0
        JSR     LFC19
LEC16   STAA    L00A2 ;	MC DUTY CYCLE
        BRA     LEC20
;
LEC1A   LDAA    L0013
        ANDA    #$00FE
        STAA    L0013
LEC20   JMP     LEDDB
;
LEC23   LDAB    L0000 ;	RUN TIME MINOR COUNTER 
        ANDB    #$00F8
        BNE     LEC2C
;
        INC     L0090
LEC2C   LDAA    L0035 ;	COOLANT TEMP
        CMPA    L32D6
        BHI     LEC36
        JMP     LECC1
;
LEC36   LDX     L00AB
        STX     L0051
        LDX     #$3391 ;	MCS FILTER BY TPS BLOCK
        JSR     LFC0D ;	LOOKUP A = L(X+TPS BLOCK)
        TAB     
        LDAA    #$0080
        STAA    L005A
        LDAA    L00A2 ;	MC DUTY CYCLE
        JSR     LFCC3 ;	FILTER ROUTINE
        STD     L00AB
        LDX     #$0092 ;	MC DUTY CYCLE 
        JSR     LFC13 ;	SAVE BY TPS BLOCK
LEC52   LDAA    L000D
        BITA    #$0001 ;	1 = MOUNTAIN COAST MODE 
        BNE     LECC1
;
        LDAA    L0035 ;	COOLANT TEMP
        CMPA    L32C8 ;	MIN COOLANT TEMP
        BHI     LECC1
        CMPA    L32C9 ;	MAX COOLANT TEMP
        BLS     LECC1
        LDAB    L00A7
        CMPB    L00A8
        BEQ     LEC75
        STAB    L00A8
        LDX     #$0003
        JSR     LFC0F ;	LOOKUP A = L(X+B)
        CLRB    
        STD     L00A9 ;	TPS BLOCK VALUE CURRENT
LEC75   LDX     L00A9 ;	TPS BLOCK VALUE CURRENT
        STX     L0051
        LDAB    L00A7
        LDX     #$33D6
        JSR     LFC0F ;	LOOKUP A = L(X+B)
        TAB     
        LDAA    #$0001
        STAA    L005A
        LDAA    L00A2 ;	MC DUTY CYCLE
        JSR     LFCC3
        STD     L00A9 ;	TPS BLOCK VALUE CURRENT
        LDAA    #$0080
        ADDA    L32CA ;	MAX DC DEVIATION
        BCC     LEC98
        LDAA    #$00FF
        BRA     LEC9C
;
LEC98   CMPA    L00A9 ;	TPS BLOCK VALUE CURRENT
        BHI     LECA0
LEC9C   STAA    L00A9 ;	TPS BLOCK VALUE CURRENT
        BRA     LECB4
;
LECA0   LDAA    #$0080
        SUBA    L32CA ;	MAX DC DEVIATION
        BCC     LECAA
        CLRA    
        BRA     LECAE
;
LECAA   CMPA    L00A9 ;	TPS BLOCK VALUE CURRENT
        BLS     LECB2
LECAE   STAA    L00A9 ;	TPS BLOCK VALUE CURRENT
        BRA     LECB4
;
LECB2   LDAA    L00A9 ;	TPS BLOCK VALUE CURRENT
LECB4   LDX     #$0003
        LDAB    L00A7
        JSR     LFC15
        JSR     LFE6E ;	SUM L0003 - L0009
        STD     L000A
LECC1   JMP     LEDDE
;
LECC4   LDAA    L0011 ;	CLCC 1
        BITA    #$0008
        BEQ     LECDC ;	BRANCH IF NOT WOT
        LDAB    L3000 ;	INSTALLED EQUIPMENT 0
        BITB    #$0008
        BEQ     LECD4 ;	0
        JMP     LED54
;
LECD4   BITB    #$0010
        BEQ     LECDC ;	0
        LDAA    L0012
        BMI     LED54 ;	CLOSED LOOP
LECDC   LDAA    L0017
        BPL     LECE6
        LDAA    #$0080
        STAA    L00A2 ;	MC DUTY CYCLE
        BRA     LED52
;
LECE6   LDX     #$3344
        JSR     LFC64 ;	GET ACC A VALUE AND INC X
        TAB     
        LSRB    
        LDAA    L0037 ;	INVERSE COOLANT TEMP
        LSRA    
        JSR     LFD7C ;	3D INTERPOLATE 
        STAA    L00A2 ;	MC DUTY CYCLE
        LDX     #$0092 ;	MC DUTY CYCLE 
        JSR     LFC0D ;	LOOKUP A = L(X+TPS BLOCK)
        CLRB    
        STD     L00AB ;	MC DUTY CYCLE 
        LDAB    L3000 ;	INSTALLED EQUIPMENT 0
        BITB    #$0002
        BEQ     LED0A
        LDAA    L00A2 ;	MC DUTY CYCLE
        BRA     LED2D
;
LED0A   LDAB    L3000 ;	INSTALLED EQUIPMENT 0
        ASRB    
        BCC     LED1C
        LDAB    L0012
        BPL     LED1C ;	BRANCH OPEN LOOP
        LDAB    L32E1 ;	CLOSED LOOP TEMP CORRECTION
        JSR     LFC19
        BRA     LED2D
;
LED1C   CLRB    
        ADDA    L00A2 ;	MC DUTY CYCLE
        ADCB    #$0000
        SUBA    L32DE
        SBCB    #$0000
        BCC     LED29
        CLRA    
LED29   BEQ     LED2D
        LDAA    #$00FF
LED2D   LDAB    L0012
        BITB    #$0002
        BEQ     LED39
        LDAB    L32DA
        JSR     LFC19
LED39   LDAB    L00A5 ;	DUTY CYCLE BLOCK NUMBER 
        BEQ     LED50
        LDAB    L00A6
        BEQ     LED4A
        LDAA    L32D8
        LDAB    L0013
        ORAB    #$0001
        BRA     LED4E
;
LED4A   LDAB    L0013
        ANDB    #$00FE
LED4E   STAB    L0013
LED50   STAA    L00A2 ;	MC DUTY CYCLE
LED52   BRA     LEDD0 ;	MC DC OUT
;
LED54   LDAB    L32CE ;	MIN TPS WOT TCC UNLOCKED 
        LDAA    L0010
        BPL     LED5E ;	BRANCH IF UNLOCKED 
        LDAB    L32CF ;	MIN TPS WOT TCC LOCKED 
LED5E   LDX     #$33A9 ;	USE TPS
        JSR     LFC64 ;	GET ACC A VALUE AND INC X
        SBA     
        BCC     LED68
        CLRA    
LED68   LDAB    L32D0 ;	WOT TPS INTENSITY FACTOR
        MUL     
        ASLD    
        BCS     LED78
        ASLD    
        BCS     LED78
        TSTB    
        BPL     LED7A
        INCA    
        BNE     LED7A
;
LED78   LDAA    #$00FF
LED7A   PSHA  ;		WOT TPS INTENSITY  
        LDX     #$0092
        JSR     LFC0D ;	LOOKUP A = L(X+TPS BLOCK)
        PULB    
        SBA     
        BCC     LED86
        CLRA    
LED86   PSHA    
        LDAA    L0022 ;	BARO SPEED DENSITY 
;									$00 = 10 KPA $90 = 100 KPA 
        LDAB    #$0060
        LDX     #$33A5
        JSR     LFD5D ;	2D INTERPOLATE WITH OFFSET
        LDAB    L3000 ;	INSTALLED EQUIPMENT 0
        BITB    #$0004 ;	1 = TPS BLOCK MCS DC
        BEQ     LED9E
        LDX     #$0092 ;	MC DUTY CYCLE 
        JSR     LFC0D ;	LOOKUP A = L(X+TPS BLOCK)
LED9E   STAA    L00A2 ;	MC DUTY CYCLE
        LDAA    L001A ;	ENGINE RPM/25
        CMPA    #$0080
        BLS     LEDA8
        LDAA    #$0080
LEDA8   SUBA    #$0020
        BCC     LEDAD
        CLRA    
LEDAD   LDX     #$33BB
        JSR     LFD61 ;	2D INTERPOLATE 
        ADDA    L00A2 ;	MC DUTY CYCLE
        BCC     LEDB9
        LDAA    #$00FF
LEDB9   SUBA    L32E0
        BCC     LEDBF
        CLRA    
LEDBF   STAA    L00A2 ;	MC DUTY CYCLE
        PULA    
        LDAB    L0011 ;	CLCC 1
        ASRB    
        BCC     LEDCD ;	BRANCH NOT BLENDED FUEL
        CMPA    L00A2 ;	MC DUTY CYCLE
        BLS     LEDCD
        STAA    L00A2 ;	MC DUTY CYCLE
LEDCD   CLR     L00A6
LEDD0   LDAA    L0012
        ORAA    #$0040
        STAA    L0012
LEDD6   LDAA    L32E4
        STAA    L00B4
LEDDB   JSR     LFC28
LEDDE   LDAB    L000D
        BITB    #$0001 ;	1 = MOUNTAIN COAST MODE 
        BEQ     LEE0D ;	BRANCH DC OUT
        LDAB    L0011 ;	CLCC 1
        BPL     LEDEF ;	BRANCH IF OPEN LOOP 
        LDAB    L3005
        BITB    #$0004 ;	0 = NO MNT CST IN CLSD LP
        BEQ     LEE0D ;	BRANCH DC OUT
LEDEF   LDX     #$0003
        LDAB    L00A7
        JSR     LFC0F ;	LOOKUP A = L(X+B)
        LDAB    L33F9 ;	DUTY CYCLE OFFSET 
        BMI     LEE05
        ANDB    #$007F
        ABA     
        BCC     LEE0B
        LDAA    #$00FF
        BRA     LEE0B
;
LEE05   ANDB    #$007F
        SBA     
        BCC     LEE0B
        CLRA    
LEE0B   STAA    L00A2 ;	MC DUTY CYCLE
LEE0D   LDAA    L00A2 ;	MC DUTY CYCLE
        LDAB    L0016
        BPL     LEE16 ;	BRANCH HUD NOT ONLINE
        JSR     L5800 ;	DO HUD
LEE16   STAA    L00A4 ;	MCS DUTY CYCLE OUT
        LDAB    #$00CD
        MUL     
        LSRD    
        LSRD    
        LSRD    
        STD     L0C14 ;	MCS DC OUT 
        LDAA    L002C ;	TPS
        STAA    L0030 ;	TPS OLD
        RTS     
; -----------------------------------------------------------
;	MINOR LOOP 3
        LDAA    #$0002 ;	A/D CHANNEL 2
        JSR     LFDE7 ;	GET A/D VALUE
        STAA    L0034 ;	BATT VOLT
        LDX     L003F ;	SLOW O2 FILTERED
        LDAB    L31C7 ;	SLOW O2 FILTER CONSTANT 
        LDAA    L003B ;	O2 SENSOR
        JSR     LFCC1 ;	FILTER ROUTINE 
        STD     L003F ;	SLOW O2 FILTERED
        LDAB    L0010
        BITB    #$0004
        BNE     LEE72 ;	DIVERT AIR 
;
        LDX     #$31C5
        LDAA    L0034 ;	BATT VOLT
        CMPA    $0000,X ;	31C5
        BCC     LEE4B
        JMP     LEF58 ;	DIVERT AIR
;
LEE4B   LDAA    L0035 ;	COOLANT TEMP
        CMPA    $000F,X ;	31D4
        BHI     LEEC1 ;	DIVERT AIR 
        BITB    #$0040
        BNE     LEE5F
;
        LDAA    L004E ;	ENGINE RUN TIME 
        CMPA    #$000F
        BLS     LEE65
        ORAB    #$0040
        STAB    L0010
LEE5F   LDAA    L0035 ;	COOLANT TEMP
        CMPA    $0010,X ;	31D5
        BLS     LEEC1 ;	DIVERT AIR 
LEE65   LDAA    L000D
        BITA    #$0001 ;	1 = MOUNTAIN COAST MODE 
        BEQ     LEE78
        LDAA    L3003 ;	INSTALLED EQUIPMENT 3
        BITA    #$0001
        BNE     LEE75 ;	SWITCH AIR 
;
LEE72   JMP     LEEC1 ;	DIVERT AIR 
;
LEE75   JMP     LEF4A ;	SWITCH AIR 
;
LEE78   LDAB    L00B8 ;	WOT DIVERT FLAG COUNTER 
        LDAA    L0011 ;	CLCC 1
        BITA    #$0008
        BNE     LEE8A ;	BRANCH IF WOT
;
LEE80   TSTB    
        BEQ     LEE86
        DECB    
        BRA     LEEA3
;
LEE86   ANDA    #$00EF
        BRA     LEEA3
;
LEE8A   PSHB    
        LDAB    L3004
        BITB    #$0004
        BEQ     LEE99
        BITA    #$0001
        BEQ     LEE99
        PULB    
        BRA     LEE80
;
LEE99   PULB    
        CMPB    $0001,X ;	31C6;	MAX COUNT WOT DIV 
        BHI     LEEA1
        INCB    
        BRA     LEEA3
;
LEEA1   ORAA    #$0010 ;	WOT DIVERT FLAG
LEEA3   STAB    L00B8 ;	WOT DIVERT FLAG COUNTER
        STAA    L0011 ;	CLCC 1
        BITA    #$0010
        BNE     LEEC1 ;	BRANCH IF WOT DIVERT
;
        LDAA    L003F ;	SLOW O2 FILTERED
        CMPA    L31C8 ;	MAX O2 NO DIV INC
        BHI     LEEBA
        LDAB    L0011 ;	CLCC 1
        BPL     LEECD ;	BRANCH IF OPEN LOOP 
        CMPA    $0004,X ;	31C9;	MAX O2 DIV INC CLR
        BCC     LEECD
LEEBA   LDAA    L00B9 ;	DIVERT COUNTER
        CMPA    L31CA ;	MAX CNT DIV CAT CON PRTCT
        BLS     LEEC4
LEEC1   JMP     LEF58 ;	DIVERT AIR 
;
LEEC4   LDAB    L0000 ;	RUN TIME MINOR COUNTER 
        ANDB    #$00F8
        BNE     LEECE
;
        INCA    
        BRA     LEECE
;
LEECD   CLRA    
LEECE   STAA    L00B9 ;	DIVERT COUNTER 
        LDX     #$31CC ;	USE TPS
        JSR     LFC64 ;	GET ACC A VALUE AND INC X
        CMPA    L31CB ;	MIN THROTTLE NO DIVERT
        BLS     LEEE2
        LDAB    L001A ;	ENGINE RPM/25
        CMPB    L31CD ;	MAX RPM FOR AIR TO CAT
        BHI     LEF58 ;	DIVERT AIR 
LEEE2   LDX     #$31C5
        LDAB    L0035 ;	COOLANT TEMP
        CMPB    $000E,X ;	31D3;	MIN CTS NO DIVERT
        BHI     LEF0C
        CMPA    $0009,X ;	31CE;	MIN CTS NO DIVERT 
        BHI     LEF0C
        LDAB    L3003 ;	INSTALLED EQUIPMENT 3
        BITB    #$0008
        BEQ     LEF02 ;	0 = RPM 1 = VSS
        LDAA    L004C ;	LOW SPEED VSS 
        CMPA    $000C,X ;	31D1;	MAX SPD NO DIVERT
        BCS     LEF0C
        CMPA    $000D,X ;	31D2;	MAX SPD DIVERT
        BLS     LEF58 ;	DIVERT AIR 
        BRA     LEF0C
;
LEF02   LDAA    L001A ;	ENGINE RPM/25
        CMPA    $000A,X ;	31CF;	MAX RPM NO DIVERT
        BLS     LEF0C
        CMPA    $000B,X ;	31D0;	MAX RPM DIVERT
        BLS     LEF58 ;	DIVERT AIR 
LEF0C   LDX     #$31D7 ;	USE MAP
        JSR     LFC64 ;	GET ACC A VALUE AND INC X
        STAA    L004F ;	MAP
        LDAA    L0011 ;	CLCC 1
        BMI     LEF30 ;	BRANCH IF CLOSED LOOP 
        LDAB    L00B6 ;	SWITCH AIR COUNTER
        LDAA    L00B7 ;	MAP OLD
        SUBA    L004F ;	MAP
        BCS     LEF28
        CMPA    L31D6 ;	MIN DELTA MAP RESET CNTR
        BLS     LEF28
        LDAB    L31D8 ;	SWITCH AIR MAX COUNTS
LEF28   TSTB    
        BEQ     LEF30
        DECB    
        STAB    L00B6 ;	SWITCH AIR COUNTER 
        BRA     LEF37
;
LEF30   CLR     L00B6 ;	SWITCH AIR COUNTER 
        LDAA    L0012
        BPL     LEF4A ;	SWITCH AIR 
LEF37   LDAA    L3004
        BITA    #$0040 ;	0 = USE BLENDED FUEL 
        BEQ     LEF44
        LDAA    L0011 ;	CLCC 1
        BITA    #$0008 ;	BRANCH IF WOT 
        BNE     LEF4A ;	SWITCH AIR
;
LEF44   LDAA    L0013
        BITA    #$0001 ;	1 = BLENDED FUEL
        BEQ     LEF52
LEF4A   LDAA    L0012
        ANDA    #$00FB
        ORAA    #$0008 ;	SWITCH AIR
        BRA     LEF5E
;
LEF52   LDAA    L0012
        ANDA    #$00FB ;	NOT DIVERT AIR
        BRA     LEF5C
;	DIVERT AIR 
LEF58   LDAA    L0012
        ORAA    #$0004 ;	DIVERT AIR
LEF5C   ANDA    #$00F7 ;	NOT SWITCH AIR
LEF5E   STAA    L0012
        LDX     #$31D7 ;	USE MAP 
        JSR     LFC64 ;	GET ACC A VALUE AND INC X
        STAA    L00B7 ;	MAP OLD
        LDAA    #$00A0
        CMPA    L0043
        BHI     LEF72
        CLRA    
        CLRB    
        BRA     LEF96
;
LEF72   SEI     
        LDD     L0046 ;	VSS COUNT OLD 
        SUBD    L0044 ;	VSS COUNT N-2
        STD     L004F
        LDD     L0048 ;	VSS COUNT 
        SUBD    L0046 ;	VSS COUNT OLD 
        CLI     
        ADDD    L004F
        RORA    
        RORB    
        STD     L004F
        LDX     L004F
        LDD     #$01CC
        JSR     LFDA7 ;	D/X 
        LDAA    L004F
        LDX     L004A ;	VEHICLE SPEED
        LDAB    L31E1 ;	VEHICLE SPEED FILTER
        JSR     LFCC1 ;	FILTER ROUTINE 
LEF96   STD     L004A ;	VEHICLE SPEED
        CMPA    #$003B
        BLS     LEF9F
        LDAA    #$003C
        CLRB    
LEF9F   ASLD    
        ASLD    
        LDAB    #$00CD
        MUL     
        STAA    L004C ;	LOW SPEED VSS
        LDAA    L0801 ;	I/O STATUS 1
        ANDA    #$0060 ;	CLEAR ALL BUT 3 AND 4 GEAR
        LDAB    L3003 ;	INSTALLED EQUIPMENT 3
        BMI     LEFB2 ;	BRANCH IF OD TRANS
        ORAA    #$0020 ;	SET NOT 4TH
LEFB2   CMPA    L0086
        BEQ     LEFDB ;	NO CHANGE
        BCS     LEFC4 ;	UP SHIFT
        LDAB    L31E8 ;	LO DOWNSHIFT LOCK DELAY 
        CMPA    #$0060 ;	3RD AND 4TH OFF 
        BNE     LEFCD
;
        LDAB    L31E9 ;	3RD DOWNSHIFT LOCK DELAY 
        BRA     LEFCD
;
LEFC4   LDAB    L31E7 ;	4TH UPSHIFT LOCK DELAY 
        TSTA    
        BEQ     LEFCD
        LDAB    L31E6 ;	3RD UPSHIFT LOCK DELAY 
LEFCD   STAA    L0086 ;	TRANS GEAR STATUS
        TBA     
        BEQ     LEFDB
        LDAB    L0010
        ORAB    #$0020
        STAB    L0010
        JMP     LF106
;
LEFDB   LDAA    L0010
        BITA    #$0020
        BEQ     LEFEB
        LDAB    L0087 ;	CONVERTOR LOCK DELAY
        BEQ     LEFEB
        DEC     L0087 ;	CONVERTOR LOCK DELAY
        JMP     LF10C
;
LEFEB   ANDA    #$00DF
        STAA    L0010
        LDAA    L0086 ;	TRANS GEAR STATUS 
        BITA    #$0020
        BEQ     LEFFC ;	4TH GEAR
        LDAA    L0022 ;	BARO SPEED DENSITY 
;									$00 = 10 KPA $90 = 100 KPA
        CMPA    L31D9 ;	MIN BARO TO LOCK 
        BCS     LF003 ;	GOTO UNLOCK
LEFFC   LDAA    L31DA ;	MIN TEMP TO LOCK  
        CMPA    L0035 ;	COOLANT TEMP
        BCC     LF006
LF003   JMP     LF103 ; 	GOTO UNLOCK 
;
LF006   LDAA    L0010
        LDAB    L0086 ;	TRANS GEAR STATUS 
        BITB    #$0020
        BNE     LF015 ;	NOT 4TH GEAR
;
        LDAB    L3003 ;	INSTALLED EQUIPMENT 3
        BITB    #$0020
        BRA     LF01E
;
LF015   BITB    #$0040
        BEQ     LF025 ;	3RD GEAR
        LDAB    L3003 ;	INSTALLED EQUIPMENT 3
        BITB    #$0040
LF01E   BEQ     LF025
        LDAB    L31DF ;	MIN TPS FOR LOCK
        BRA     LF042
;
LF025   LDAB    L31DC ;	MIN SPEED FOR TPS LOCK
        BITA    #$0010
        BNE     LF030
;
        ADDB    #$0010
        BCS     LF034
LF030   CMPB    L004C ;	LOW SPEED VSS 
        BLS     LF03B
LF034   ANDA    #$00EF
        LDAB    L31DD
        BRA     LF040
;
LF03B   ORAA    #$0010
        LDAB    L31DE ;	MIN TPS LOW SPEED LOCK	
LF040   STAA    L0010
LF042   BITA    #$0080
        BEQ     LF04C ;	BRANCH IF UNLOCKED 
        SUBB    L31DB ;	MIN TPS HYSTERESIS
        BCC     LF04C
        CLRB    
LF04C   LDX     #$31E0 ;	USE TPS
        JSR     LFC64 ;	GET ACC A VALUE AND INC X
        CBA     
        BCS     LF003 ; 	GOTO UNLOCK 
        LDAB    L31E4 ;	MAX DELTA TPS+ TO LOCK
        LDAA    L002C ;	TPS
        SUBA    L0032 ;	TPS OLD 
        BCC     LF062
        NEGA    
        LDAB    L31E3 ;	MAX DELTA TPS- TO LOCK 
LF062   CBA     
        BHI     LF003 ;	GOTO UNLOCK
        LDAA    L0086 ;	TRANS GEAR STATUS 
        LDX     #$3209 ;	MIN SPEED LOCK 4TH
        LDAB    #$0008
        BITA    #$0020
        BEQ     LF07E ;	4TH GEAR
        LDX     #$31F9 ;	MIN SPEED LOCK 3RD
        LDAB    #$0008
        BITA    #$0040
        BEQ     LF07E ;	3RD GEAR
        LDX     #$31ED ; 	MIN SPEED LOCK LO
        LDAB    #$0006
LF07E   LDAA    L0010
        BPL     LF083 ;	BRANCH IF UNLOCKED 
        INX     
LF083   LDAA    L004C ;	LOW SPEED VSS 
        CMPA    $0000,X
        BCC     LF08C
        JMP     LF103 ;	GOTO UNLOCK
;
LF08C   LDAA    L0010
        BMI     LF091 ;	BRANCH IF LOCKED 
        ABX     
LF091   INX     
        LDAA    L004C ;	LOW SPEED VSS 
        SUBA    #$0030
        BCC     LF099
        CLRA    
LF099   CPX     #$31FB
        BCS     LF0B7 ;	BRANCH IF LO
        CPX     #$3202
        BLS     LF0AA ;	BRANCH IF 3RD
        SUBA    #$0030
        BCC     LF0A8
        CLRA    
LF0A8   BRA     LF0BD
;
LF0AA   SUBA    #$0010
        BCC     LF0AF
        CLRA    
LF0AF   CMPA    #$0060
        BLS     LF0B5
        LDAA    #$0060
LF0B5   BRA     LF0BD
;
LF0B7   CMPA    #$0040
        BLS     LF0BD
        LDAA    #$0040
LF0BD   JSR     LFD61 ;	2D INTERPOLATE 
        STAA    L004F
        LDAB    #$0023
        LDX     #$31EA
        LDAA    L0086 ;	TRANS GEAR STATUS 
        BITA    #$0040
        BNE     LF0D7 ;	NOT 3RD GEAR
;
        LDAB    #$0032
        INX     
        BITA    #$0020
        BNE     LF0D7 ;	NOT FOURTH GEAR
;
        LDAB    #$003C
        INX     
LF0D7   LDAA    L004A ;	VEHICLE SPEED
        SBA     
        BCC     LF0DD
        CLRA    
LF0DD   LDAB    $0000,X
        MUL     
        ASLD    
        ASLD    
        ASLD    
        ASLD    
        ADDA    L004F
        BCC     LF0EA
        LDAA    #$00FF
LF0EA   TAB     
        LDX     #$31E2 ;	USE TPS
        JSR     LFC64 ;	GET ACC A VALUE AND INC X
        CBA     
        BHI     LF103 ;	GOTO UNLOCK
        LDAA    L0087 ;	CONVERTOR LOCK DELAY
        BEQ     LF0FD
        DEC     L0087 ;	CONVERTOR LOCK DELAY
        BRA     LF10C
;
LF0FD   LDAA    L0010
        ORAA    #$0080 ;	LOCK CONVERTOR
        BRA     LF110
;
LF103   LDAA    L31E5 ;	CONVERTOR LOCK DELAY 
LF106   CMPA    L0087 ;	CONVERTOR LOCK DELAY
        BLS     LF10C
        STAA    L0087 ;	CONVERTOR LOCK DELAY
LF10C   LDAA    L0010
        ANDA    #$007F ;	UNLOCK CONVERTOR
LF110   STAA    L0010
        LDAA    L002C ;	TPS
        STAA    L0032 ;	TPS OLD
        LDAA    L0037 ;	INVERSE COOLANT TEMP
        CMPA    L321A ;	MIN COOLANT TEMP
        BHI     LF120
        JMP     LF19E
;
LF120   LDAA    L004A ;	VEHICLE SPEED
        CMPA    L321B ;	MIN VEHICLE SPEED
        BLS     LF19E
        LDAA    L002B ;	BARO CORRECTED TPS 
        CMPA    L321C ;	MIN TPS
        BCS     LF19E
        LDAA    L0029 ;	MAP
        CMPA    L321D ;	MIN MAP
        BLS     LF19E
        LDX     L004A ;	VEHICLE SPEED
        LDAA    L001A ;	ENGINE RPM/25
        LDAB    #$0019
        MUL     ;		RPM
        JSR     LFDA7 ;	D/X
        LDAA    L004F ;	GEAR RATIO
        CMPA    L3219 ;	MIN GEAR RATIO
        BLS     LF19E
        LDAA    L001A ;	ENGINE RPM/25
        LDX     #$321F ;	SHIFT LIGHT TABLE LITE OFF 
        LDAB    L0013
        BITB    #$0002 ;	1 = SHIFT LIGHT ON
        BEQ     LF154
        LDX     #$3229 ;	SHIFT LIGHT TABLE LIGHT ON
LF154   CMPA    $0000,X ;	MIN RPM
        BLS     LF19E
        CMPA    $0001,X ;	MAX RPM
        BLS     LF167
        LDX     #$0000
        STX     L0088
        ORAB    #$0002
        ORAB    #$0004
        BRA     LF1A4
;
LF167   LDAB    #$0010
        LSRA    
        INX     
        INX     
        JSR     LFD5D ;	2D INTERPOLATE WITH OFFSET
        CMPA    L002B ;	BARO CORRECTED TPS 
        BCS     LF19E
        LDAB    L0013
        BITB    #$0004
        BNE     LF191
;
        ORAB    #$0004
        STAB    L0013
        LDAA    L002B ;	BARO CORRECTED TPS 
        BPL     LF183
        LDAA    #$0080
LF183   LSRA    
        LSRA    
        LDX     #$3233
        JSR     LFD61 ;	2D INTERPOLATE 
        LDAB    L321E
        MUL     
        STD     L0088
LF191   LDAB    L0013
        ORAB    #$0002
        LDX     L0088
        BEQ     LF1A4
        DEX     
        STX     L0088
        BRA     LF1A2
;
LF19E   LDAB    L0013
        ANDB    #$00FB
LF1A2   ANDB    #$00FD
LF1A4   STAB    L0013
        LDAA    L0015
        BITA    #$0001 ;	O2 CODE SET
        BEQ     LF1B3
        LDAA    #$00FF
        STAA    L00C1
        JMP     LF25D
;
LF1B3   LDAA    L000F
        BITA    #$0008
        BEQ     LF1BC
LF1B9   JMP     LF25A
;
LF1BC   LDAB    L004E ;	ENGINE RUN TIME 
        LDAA    L0010
        BITA    #$0001
        BNE     LF1D5
;
        CMPB    L3238 ;	MIN RUN TIME COLD START
        BCS     LF1B9
        ORAA    #$0001
        STAA    L0010
        LDD     L323E ;	COLD START DEC DELAY 
        STD     L00BC ;	CLD STRT DEC DELAY COUNTER 
        CLR     L00C0 ;	LEAN COUNTER 
LF1D5   LDAA    L0014
        BITA    #$0004
        BNE     LF1E2
;
        LDAB    L0037 ;	INVERSE COOLANT TEMP
        CMPB    L3239 ;	MAX COOL TEMP COLD START
        BCS     LF1B9
LF1E2   LDAA    L0011 ;	CLCC 1
        BPL     LF1B9 ;	BRANCH IF OPEN LOOP 
        LDX     #$323A
        BITA    #$0002
        BEQ     LF1F0 ;	NOT COLD START
        LDX     #$323C
LF1F0   LDAA    L0014
        BITA    #$0001
        BNE     LF1FC
;
        LDAB    L002C ;	TPS
        CMPB    $0000,X
        BCS     LF25A
LF1FC   BITA    #$0080
        BNE     LF206
;
        LDAB    L004C ;	LOW SPEED VSS 
        CMPB    $0001,X
        BCS     LF25A
LF206   LDD     L00BE ;	IDLE LD WOT DLY COUNTER
        SUBD    L3240 ;	IDLE LD WOT DLY DEC 
        BCC     LF21B
        LDD     L00BE ;	IDLE LD WOT DLY COUNTER 
        ADDD    #$0001
        BCC     LF217
        LDD     #$FFFF
LF217   STD     L00BE ;	IDLE LD WOT DLY COUNTER 
        BRA     LF273
;
LF21B   LDD     #$0000
        STD     L00BE ;	IDLE LD WOT DLY COUNTER 
        LDAA    L0029 ;	MAP
        CMPA    L3242 ;	MIN VAC IDLE LOAD CNTL WOT 
        BHI     LF273
        LDAA    L0011 ;	CLCC 1
        ORAA    #$0004 ;	SET IDLE LOAD CONTROL WOT
        STAA    L0011 ;	CLCC 1
        LDAA    L00C0 ;	LEAN COUNTER 
        CMPA    L3243 ;	MIN LEAN CNT INC COLD STRT
        BCS     LF241
        LDAA    L00C1
        ADDA    L3245 ;	COLD START INCREMENT 
        BCC     LF23D
        LDAA    #$00FF
LF23D   STAA    L00C1
        BRA     LF25D
;
LF241   LDD     L00BC ;	CLD STRT DEC DELAY COUNTER 
        SUBD    #$0001
        BCC     LF24A
        CLRA    
        CLRB    
LF24A   STD     L00BC ;	CLD STRT DEC DELAY COUNTER 
        BNE     LF273
;
        LDAA    L00C1
        SUBA    L3244 ;	COLD START DECREMENT 
        BCC     LF256
        CLRA    
LF256   STAA    L00C1
        BRA     LF25D
;
LF25A   CLR     L00C1
LF25D   CLR     L00C0 ;	LEAN COUNTER 
        LDD     L323E ;	COLD START DEC DELAY 
        STD     L00BC ;	CLD STRT DEC DELAY COUNTER 
        LDAB    L0011 ;	CLCC 1
        LDAA    L00C1
        BEQ     LF26F
        ORAB    #$0002 ;	SET COLD START
        BRA     LF271
;
LF26F   ANDB    #$00FD ;	CLR COLD START 
LF271   STAB    L0011 ;	CLCC 1
LF273   LDAB    L0016
        BPL     LF27A
        JSR     L5815
LF27A   NOP     
        NOP     
        LDAA    L3247 ;	MIN COOL TEMP START EGR 
        LDAB    L000D
        BITB    #$0010 ;	1 = EGR ON 
        BEQ     LF288 ;	EGR OFF 
        LDAA    L3246 ;	MIN COOL TEMP CONT EGR	
LF288   CMPA    L0035 ;	COOLANT TEMP
        BCC     LF293
        ANDB    #$00EF ;	EGR OFF
        STAB    L000D
LF290   JMP     LF35B ;	ZERO EGR DC
;
LF293   ORAB    #$0010 ;	EGR ON
        STAB    L000D
        LDAA    L000F
        BITA    #$0008
        BNE     LF2A3
;
        LDAA    L000D
        BITA    #$0002 ;	PARK NEUTRAL
        BNE     LF290 ;	BRANCH IF PARK
;
LF2A3   LDAA    L0039 ;	COOLANT TEMP START 
        CMPA    L3248 ;	MIN COOLANT TEMP NO DELAY
        BCC     LF2BC ;	LOOK UP EGR
        CMPA    L3249 ;	MAX COOLANT TEMP NO DELAY
        BLS     LF2BC ;	LOOK UP EGR 
        LDAA    L00BA ;	EGR DELAY COUNTER
        BEQ     LF2BC ;	LOOK UP EGR 
        DEC     L00BA ;	EGR DELAY COUNTER 
        LDAA    L324D ;	DEFAULT EGR DC
        JMP     LF35C ;	USE DEFAULT EGR DC
;	EGR ROUTINE
LF2BC   LDX     #$324E
        JSR     LFC64 ;	GET ACC A VALUE AND INC X
        LSRA    
        TAB     
        LDAA    L0019 ;	RPM FOR TABLE 
        SUBA    #$0020
        BCC     LF2CB
        CLRA    
LF2CB   CMPA    #$0050
        BLS     LF2D1
        LDAA    #$0050
LF2D1   JSR     LFD7C ;	3D INTERPOLATE 
        STAA    L00BB ;	EGR DC
        LDAA    L0037 ;	INVERSE COOLANT TEMP
        SUBA    #$0028
        BCC     LF2DF
        CLRA    
        BRA     LF2EB
;
LF2DF   CMPA    #$0070
        BLS     LF2E5
        LDAA    #$0070
LF2E5   LDX     #$327C ;	EGR DC MULT COOL TEMP
        JSR     LFD61 ;	2D INTERPOLATE 
LF2EB   BSR     LF34A ;	APPLY EGR FACTOR
        LDAA    L0010
        BPL     LF306 ;	BRANCH IF UNLOCKED 
        LDX     #$3288 ;	USE MAP
        JSR     LFC64 ;	GET ACC A VALUE AND INC X
        LSRA    
        TAB     
        LDAA    L001A ;	ENGINE RPM/25
        CMPA    #$0050
        BLS     LF301
        LDAA    #$0050
LF301   JSR     LFD7C ;	3D INTERPOLATE 
        BSR     LF34A ;	APPLY EGR FACTOR 
LF306   LDAB    L002C ;	TPS
        CMPB    L324B ;	MIN TPS FOR HI TPS FAC
        BLS     LF33C
        CMPB    L324C ;	MAX TPS FOR HI TPS FAC 
        BLS     LF315
        CLRA    
        BRA     LF33A
;	CALCULATE HIGH THROTTLE FACTOR
LF315   LDAB    L324C
        TBA     
        SUBA    L324B ;	MIN TPS FOR HI TPS FAC 
        STAA    L0050
        CLRA    
        STAA    L004F
        LDX     L004F
        SUBB    L002C ;	TPS
        BCC     LF328
        CLRB    
LF328   JSR     LFDA7 ;	D/X 
        LDD     L004F
        TSTB    
        BPL     LF335
        INCA    
        BNE     LF335
;
        LDAA    #$00FF
LF335   LDAB    L00BB ;	EGR DC
        MUL     
        ADCA    #$0000
LF33A   STAA    L00BB ;	EGR DC
LF33C   LDX     #$3284
        LDAA    L0022 ;	BARO SPEED DENSITY
;									$00 = 10 KPA $90 = 100 KPA 
        LDAB    #$0060
        JSR     LFD5D ;	2D INTERPOLATE WITH OFFSET
        BSR     LF34A ;	APPLY EGR FACTOR
         BRA     LF35E
;	APPLY EGR FACTOR 
LF34A   LDAB    L00BB ;	EGR DC
        MUL     
        ASLD    
        BCS     LF356
        TSTB    
        BPL     LF358
        INCA    
        BNE     LF358
;
LF356   LDAA    #$00FF
LF358   STAA    L00BB ;	EGR DC
        RTS     
; -----------------------------------------------------------
LF35B   CLRA    
LF35C   STAA    L00BB ;	EGR DC
LF35E   LDAB    L0016
        BPL     LF365
        JSR     L5812
LF365   STAA    L00BB ;	EGR DC
        LDX     #$32A8
        LDAA    L0035 ;	COOLANT TEMP
        CMPA    $0000,X ;	32A8
        BHI     LF3A2
        LDAA    L00C2
        CMPA    $0001,X ;	32A9
        BCC     LF381
        LDAB    L0000 ;	RUN TIME MINOR COUNTER 
        ANDB    #$00F8
        BNE     LF3A2
;
        INC     L00C2
        BRA     LF3A2
;
LF381   LDAB    L3004
        BITB    #$0010 ;	1 = USE SPEED ISS
        BNE     LF38C
;
        LDAB    L001A ;	ENGINE RPM/25
        BRA     LF38E
;
LF38C   LDAB    L004C ;	LOW SPEED VSS 
LF38E   LDAA    L002C ;	TPS
        CMPA    $0002,X ;	32AA
        BCC     LF39A ;	BRANCH TPS > L32AA
        CMPB    $0004,X ;	32AC
        BCS     LF3A8 ;	BRANCH SPEED > L32AC
        BRA     LF3AE
;
LF39A   CMPA    $0003,X ;	32AB
        BLS     LF3AE ;	BRANCH TPS < L32AB
        CMPB    $0005,X ;	32AD
        BLS     LF3AE ;	BRANCH SPEED < L32AD
LF3A2   LDAA    L0010
        ORAA    #$0002 ;	ISS ON 
        BRA     LF3AC
;
LF3A8   LDAA    L0010
        ANDA    #$00FD ;	ISS OFF
LF3AC   STAA    L0010
LF3AE   SEI     
        LDAB    L000F
        LDAA    L0034 ;	BATT VOLT
        CMPA    #$00B4
        BLS     LF3D8
        BITB    #$0040
        BNE     LF3BF
;
        ORAB    #$0040
        BRA     LF3DA
;
LF3BF   LDAA    L0801 ;	I/O STATUS 1
        ANDA    #$00F0 ;	CLR OUTPUTS
        STAA    L0801 ;	I/O STATUS 1
        LDAA    L0881 ;	I/O STATUS 2
        ANDA    #$00F0 ;	CLR OUTPUTS
        STAA    L0881 ;	I/O STATUS 2
        CLRB    
        LDAA    #$00D0
        STD     L0C16
        JMP     LF479
;
LF3D8   ANDB    #$00BF
LF3DA   STAB    L000F
        LDAA    L000E
        BMI     LF402
        CLRA    
        STAA    L00C2
        TSTB    
        BPL     LF3BF
        LDAB    L0801 ;	I/O STATUS 1
        ORAB    #$000C
        STAB    L0801 ;	I/O STATUS 1
        LDAA    L0881 ;	I/O STATUS 2
        ORAA    #$000B
        STAA    L0881 ;	I/O STATUS 2
        LDAB    #$0000
        LDAA    #$00D2
        STD     L0C16
        LDAB    #$0080
        JMP     LF471
;
LF402   LDAA    L0801 ;	I/O STATUS 1
        ANDA    #$00F0
        LDAB    L3001 ;	INSTALLED EQUIPMENT 1
        BPL     LF416 ;	0 = AUTOMATIC TRANS
        LDAB    L0013
        BITB    #$0002 ;	1 = SHIFT LIGHT ON
        BEQ     LF41C
        ORAA    #$0008
        BRA     LF41C
;
LF416   LDAB    L0010
        BPL     LF41C ;	BRANCH IF UNLOCKED 
        ORAA    #$0008 ;	LOCK CONVERTOR
LF41C   STAA    L0801 ;	I/O STATUS 1
        LDAA    L0881 ;	I/O STATUS 2
        ANDA    #$00F0 ;	CLEAR OUTPUTS
        LDAB    L0010
        BITB    #$0002 ;	ISS ON
        BEQ     LF42C
        ORAA    #$0008 ;	ISS
LF42C   LDAB    L3003 ;	INSTALLED EQUIPMENT 3
        BITB    #$0004
        BEQ     LF435
        EORA    #$0008 ;	ISS
LF435   LDAB    L0012
        BITB    #$0004 ;	AIR DIVERT ACTIVE
        BNE     LF43D
;
        ORAA    #$0001 ;	AIR DIVERT SOLENIOD
LF43D   LDAB    L0012
        BITB    #$0008 ;	1 = AIR SWITCH ACTIVE
        BEQ     LF445
        ORAA    #$0002 ;	AIR SWITCH SOLENIOD
LF445   LDAB    L3001 ;	INSTALLED EQUIPMENT 1
        BITB    #$0040
        BEQ     LF44E
        EORA    #$0002
LF44E   STAA    L0881 ;	I/O STATUS 2
        LDAB    L00C1
        LDAA    L3001 ;	INSTALLED EQUIPMENT 1
        BITA    #$0002
        BEQ     LF45B
        COMB    
LF45B   CLRA    
        TSTB    
        BEQ     LF463
        ASLD    
        ASLD    
        ORAB    #$0003
LF463   ORAA    #$00D0
        STD     L0C16
        LDAB    L00BB ;	EGR DC
        LDAA    L0016
        BITA    #$0004
        BEQ     LF471
        CLRB    
LF471   LDAA    L3004
        BITA    #$0008
        BEQ     LF479
        COMB    
LF479   LDAA    L00CA
        BITA    #$0010 ;	CODE 51
        BNE     LF486
;
        LDAA    L3004
        BITA    #$0001
        BNE     LF492
;
LF486   CLRA    
        TSTB    
        BEQ     LF48E
        ASLD    
        ASLD    
        ORAB    #$0003
LF48E   ORAA    #$00D0
        BRA     LF494
;
LF492   LDAA    #$00F0
LF494   STD     L0C18 ;	EGR OUT 
        CLI     
        LDAA    L002C ;	TPS
        STAA    L0033 ;	TPS OLD 
        RTS  END MINOR LOOP 3   
; -----------------------------------------------------------
;	MINOR LOOP 4		MOUNTAIN COAST ROUTINE
        LDAB    L0034 ;	BATT VOLT
        LDAA    L0013
        BITA    #$0008
        BNE     LF4B6
; 
        CMPB    #$005A
        BCS     LF4B6 ;	BRANCH VOLTAGE < 9.0 V
        ORAA    #$0008
        STAA    L0013
        LDX     #$0000
        STX     L0C06 ;	EST CIRCUIT 
        STX     L0C06 ;	EST CIRCUIT 
LF4B6   CMPB    #$002D ;	BRANCH VOLTAGE < 4.5 V
        BCS     LF4C0
        LDAB    L000C
        ANDB    #$00FD
        BRA     LF4D2
;
LF4C0   LDAB    L000C
        BITB    #$0002
        BEQ     LF4CE
        ANDA    #$00F7
        STAA    L0013
        ANDB    #$00FE
        BRA     LF4D2
;
LF4CE   ORAB    #$0002
        ANDB    #$00FB
LF4D2   STAB    L000C
        LDX     #$33ED
        LDAA    L000D
        BITA    #$0001 ;	1 = MOUNTAIN COAST MODE 
        BNE     LF517 ;	BRANCH MOUNTAIN COAST MODE
;
        LDAA    L002C ;	TPS
        LDAB    L001A ;	ENGINE RPM/25
        CMPA    $0000,X ;	33ED
        BCC     LF517
        LDAA    L0801 ;	I/O STATUS 1
        ANDA    #$0020 ;	FOURTH GEAR
        BNE     LF4FC ;	BRANCH NOT 4TH GEAR
;
        CMPB    $0001,X ;	33EE
        BCS     LF517
        LDAB    L004A ;	VEHICLE SPEED
        CMPB    $0002,X ;	33EF
        BCS     LF517
        LDAA    L00DB ;	MOUNTAIN COAST TIMER 
        CMPA    $0003,X ;	33F0
        BRA     LF50A
;
LF4FC   CMPB    $0004,X ;	33F1
        BCS     LF517
        LDAA    L004A ;	VEHICLE SPEED
        CMPA    $0005,X ;	33F2
        BCS     LF517
        LDAA    L00DB ;	MOUNTAIN COAST TIMER
        CMPA    $0006,X ;	33F3
LF50A   BCC     LF534
        LDAA    L0000 ;	RUN TIME MINOR COUNTER 
        ANDA    #$00F8
        BNE     LF515
;
        INC     L00DB ;	MOUNTAIN COAST TIMER
LF515   BRA     LF542
;
LF517   CLR     L00DB ;	MOUNTAIN COAST TIMER
        LDAA    L000D
        BITA    #$0001 ;	1 = MOUNTAIN COAST MODE 
        BEQ     LF542 ;	NOT MOUNTAIN COAST
        LDAA    L002C ;	TPS
        CMPA    $0007,X ;	33F4
        BCC     LF53C
        LDAA    L001A ;	ENGINE RPM/25
        CMPA    $0008,X ;	33F5
        BCS     LF53C
        LDAA    L004A ;	VEHICLE SPEED
        CMPA    $0009,X ;	33F6
        BCS     LF53C
        BRA     LF542 ;	CONT MOUNTAIN COAST
;
LF534   LDAA    L000D
        ORAA    #$0001 ;	SET MOUNTAIN COAST MODE
        STAA    L000D
        BRA     LF542
;
LF53C   LDAB    L000D
        ANDB    #$00FE ;	CLR MOUNTAIN COAST MODE
        STAB    L000D
LF542   RTS ;		END MINOR LOOP 4     
; -----------------------------------------------------------
;	MINOR LOOP 0	KNOCK RECOVERY ROUTINE
        LDAA    L0084 ;	MINOR LOOP 0 COUNTER
        CMPA    L3035 ;	MIN COUNT ENGINE RUNNING
        BHI     LF553
        LDAA    L000E
        BPL     LF559 ;	DRP NOT RECEIVED
        INC     L0084 ;	MINOR LOOP 0 COUNTER
        BRA     LF559
;
LF553   LDAA    L000D
        ORAA    #$0020 ;	ENGINE RUNING
        STAA    L000D
LF559   LDAB    L0000 ;	RUN TIME MINOR COUNTER 
        BITB    #$0008 ;	DO EVERY EIGHTH TIME
        BNE     LF59D
;
        LDAB    L000E
        BITB    #$0020 ;	1 = USE RPM FOR KNOCK RETARD
        BNE     LF578
;
        LDAA    L0029 ;	MAP
        SUBA    #$0090
        BCC     LF56C
        CLRA    
LF56C   LSRA    
        CMPA    #$0030
        BLS     LF573
        LDAA    #$0030
LF573   LDX     #$3142 ;	KNOCK RECOVERY RATE BY MAP 
        BRA     LF589
;
LF578   LDAA    L001A ;	ENGINE RPM/25
        SUBA    #$0020 ;	OFFSET 800 RPM
        BCC     LF57F
        CLRA    
LF57F   LSRA    
        CMPA    #$0030
        BLS     LF586
        LDAA    #$0030
LF586   LDX     #$314E ;	KNOCK RECOVERY RATE BY RPM 
LF589   JSR     LFD61 ;	2D INTERPOLATE 
        LDAB    L0083 ;	KNOCK RETARD 
        MUL     
        ADCA    #$0000
        NEGA    
        BNE     LF596
;
        LDAA    #$00FF
LF596   ADDA    L0083 ;	KNOCK RETARD 
        BCS     LF59B
        CLRA    
LF59B   STAA    L0083 ;	KNOCK RETARD 
LF59D   LDAA    L3181 ;	MALF 3 MASK 
        BPL     LF5C6 ;	NO CODE 43 ON PROM
        LDAA    L0082 ;	CODE 43 COUNTER
        INCA    
        CMPA    #$0027 ;	DO EVERY 40TH TIME
        BCS     LF5C4
        LDD     L0C0A ;	KNOCK COUNTER 
        STAA    L004F ;	KNOCK COUNTS
        LDAB    L0015
        SUBA    L0081 ;	OLD KNOCK COUNTS 
        CMPA    L31AA ;	MIN KNOCK COUNTS 43B FAIL 
        BCS     LF5BB
        ORAB    #$0040 ;	SET CODE 43B
        BRA     LF5BD
;
LF5BB   ANDB    #$00BF ;	CLR CODE 43B 
LF5BD   STAB    L0015
        LDAA    L004F ;	KNOCK COUNTS
        STAA    L0081 ;	OLD KNOCK COUNTS 
        CLRA    
LF5C4   STAA    L0082 ;	CODE 43 COUNTER
LF5C6   RTS ;		END MINOR LOOP 0     
; -----------------------------------------------------------
;	MINOR LOOP 5	EST ROUTINE
        LDAA    #$0004 ;	A/D CHANNEL 4
        JSR     LFDE7 ;	GET A/D VALUE
        STAA    L0036 ;	COOLANT TEMP 
        STAA    L0035 ;	COOLANT TEMP
        LDAB    L0014
        BITB    #$0004
        BEQ     LF5DB
        LDAA    L3198 ;	DEFAULT COOLANT TEMP
        STAA    L0035 ;	COOLANT TEMP
LF5DB   LDAA    L0016
        BPL     LF5E2 ;	BRANCH HUD NOT ONLINE
        JSR     L5803 ;	DO HUD
LF5E2   LDAA    L000C
        BITA    #$0001
        BNE     LF60C ;	BRANCH EST FAILURE
;
        LDAA    L000E
        BITA    #$0040
        BEQ     LF62D
        LDAA    L0000 ;	RUN TIME MINOR COUNTER 
        BITA    #$0008
        BNE     LF630
;
        LDAA    L001B ;	ENGINE RPM/6.25
        CMPA    L301C ;	MIN RPM FOR EST TEST
        BCS     LF62D
        LDX     L0C06 ;	EST CIRCUIT 
        BNE     LF628
;
        LDAA    L007E ;	EST FAILURE COUNTER
        CMPA    L301D ;	EST FAILURES BEFORE CODE 
        BHI     LF60C
        INCA    
        STAA    L007E ;	EST FAILURE COUNTER
        BRA     LF621
;
LF60C   LDAA    L000C
        ORAA    #$0001 ;	EST FAILURE
        STAA    L000C
        LDAA    L00C9
        ORAA    #$0001 ;	SET CODE 42	
        STAA    L00C9
        JSR     LFEDC
        LDAA    L000E
        ANDA    #$00BF
        STAA    L000E
LF621   CLRA    
        CLRB    
        STD     L0C06 ;	EST CIRCUIT 
        BRA     LF630
;
LF628   CLRA    
        CLRB    
        STD     L0C06 ;	EST CIRCUIT 
LF62D   CLR     L007E ;	EST FAILURE COUNTER
LF630   RTS ;	END MINOR LOOP 5     
; -----------------------------------------------------------
;	MINOR LOOP 6
        LDAA    #$000C ;	MCS FEEDBACK
        JSR     LFDE7 ;	GET A/D VALUE
        LDAB    L000F
        ANDB    #$0067
        CMPA    #$0040
        BCS     LF646
        CMPA    #$00C0
        BCC     LF648
        ORAB    #$0088
        BRA     LF648
;
LF646   ORAB    #$0090
LF648   STAB    L000F
        LDAB    L0000 ;	RUN TIME MINOR COUNTER 
        LDAA    L0014
        ANDB    #$00F8
        BNE     LF65B
;
        ORAA    #$0008
        LDAB    L004E ;	ENGINE RUN TIME 
        ASRB    
        BCS     LF65B
        ORAA    #$0010
LF65B   STAA    L0014
        JSR     LFE6E ;	SUM L0003 - L0009
        PSHB    
        PSHA    
        PULX    
        CPX     L000A
        BEQ     LF66D
        JSR     LFEC0 ;	NON VOL MEM BOMBED ROUTINE 
        JSR     LFD34 ;	TPS BLOCK LOADER
LF66D   LDAA    L000F
        BITA    #$0008
        BNE     LF67D
;
        CLRB    
        STAB    L0018
        BITA    #$0010
        BEQ     LF688
        JMP     LFAC9
;
LF67D   LDAA    L0018
        BMI     LF688 ;	SES LIGHT ON
        ORAA    #$0080
        STAA    L0018
        JSR     LFE0B ;	TURN ON SES LIGHT
LF688   CLR     L0017
        LDAA    L00CA
        ANDA    L00CD
        ANDA    #$0010
        BEQ     LF69F
        ORAA    L0009 ;	MALF 3
        STAA    L0009 ;	MALF 3
        JSR     LFE6E ;	SUM L0003 - L0009
        STD     L000A
        JMP     LFAB5
;
LF69F   LDAA    L000E
        BMI     LF6A6
        JMP     LF9FA
;
LF6A6   LDAA    L0035 ;	COOLANT TEMP
        LDAB    L0016
        BITB    #$0002 ;	1 = COOLANT TEMP HOT C13
        BEQ     LF6B5
        CMPA    L318D ;	MIN COOL TEMP STAY HOT C13
        BLS     LF6BC
        BRA     LF6BA
;
LF6B5   CMPA    L318E ;	MIN COOL TEMP HOT C13
        BHI     LF6BC
LF6BA   EORB    #$0002 ;	1 = COOLANT TEMP HOT C13
LF6BC   STAB    L0016
        LDAA    L0014
        BITA    #$0002 ;	1 = SUCESSFUL START 
        BNE     LF6E1
;
        LDAB    L004E ;	ENGINE RUN TIME 
        CMPB    L3187 ;	MIN ENGINE RUN TIME START 
        BCS     LF6E1
        ORAA    #$0002 ;	1 = SUCESSFUL START
        STAA    L0014
        INC     L0001 ;	STARTS SINCE LAST FAULT
        LDAA    L0001 ;	STARTS SINCE LAST FAULT
        CMPA    L3188 ;	50 STARTS TO CODE RESET	
        BLS     LF6E1
        JSR     LFED2 ;	CLEAR CODES
        JSR     LFE6E ;	SUM L0003 - L0009
        STD     L000A
LF6E1   LDAA    L0015
        ANDA    #$00FE ;	CLR 02 CODE
        STAA    L0015
        LDAA    L003B ;	O2 SENSOR
        CMPA    L3190 ;	MAX O2 FOR CODE 13	
        BHI     LF732
        CMPA    L3191 ;	MIN O2 FOR CODE 13
        BLS     LF732
        LDAA    L00D7 ;	CODE 13 TIMER
        CMPA    L3193 ;	MIN COND PERIOD CODE 13
        BHI     LF737
        LDAB    L0016
        BITB    #$0040 ;	1 = MIN RUN TIME C13 MET 
        BNE     LF70B
;
        LDAA    L004E ;	ENGINE RUN TIME
        CMPA    L318F ;	MIN RUN TIME FOR CODE 13
        BCS     LF743
        ORAB    #$0040 ;	1 = MIN RUN TIME C13 MET
        STAB    L0016
LF70B   BITB    #$0002 ;	1 = COOLANT TEMP HOT C13
        BEQ     LF743
        LDAA    L0014
        BITA    #$0010
        BNE     LF71B
;
        LDAA    L00CB
        BITA    #$0040
        BEQ     LF743
LF71B   JSR     LFC61 ;	USE TPS 
        CMPA    L3192 ;	MIN TPS FOR CODE 13
        BHI     LF72D
        TST     L00D7 ;	CODE 13 TIMER 
        BEQ     LF743
        DEC     L00D7 ;	CODE 13 TIMER 
        BRA     LF743
;
LF72D   INC     L00D7 ;	CODE 13 TIMER 
        BRA     LF743
;
LF732   CLR     L00D7 ;	CODE 13 TIMER 
        BRA     LF743
;
LF737   LDAA    L00C8
        ORAA    #$0040 ;	SET CODE 13	
        STAA    L00C8
        LDAA    L0015
        ORAA    #$0001 ;	O2 CODE SET 
        STAA    L0015
LF743   LDAA    L002C ;	TPS
        CMPA    L318A ;	MIN TPS CODE 21
        BLS     LF768
        LDAA    L00CE ;	TIME OVER MAX TPS
        CMPA    L3199 ;	MIN TIME OVER MAX TPS 
        BHI     LF773
        LDX     #$33EA ;	USE MAP
        JSR     LFC64 ;	GET ACC A VALUE AND INC X
        CMPA    L319A ;	MAX MAP FOR CODE 21
        BCC     LF768
        LDAA    L001A ;	ENGINE RPM/25
        CMPA    L3189 ;	MAX RPM CODE 21
        BHI     LF768
        INC     L00CE ;	TIME OVER MAX TPS 
        BRA     LF77F
;
LF768   CLR     L00CE ;	TIME OVER MAX TPS 
        LDAA    L0014
        ANDA    #$00FE
        STAA    L0014
        BRA     LF77F
;
LF773   LDAA    L00C8
        ORAA    #$0008 ;	SET CODE 21
        STAA    L00C8
        LDAA    L0014
        ORAA    #$0001
        STAA    L0014
LF77F   LDAA    L004C ;	LOW SPEED VSS 
        CMPA    L319E ;	MAX SPEED CODE 24
        BHI     LF7A8
        LDAA    L00D9 ;	CODE 24 COUNTER
        CMPA    L319F ;	MIN COND PERIOD CODE 24
        BHI     LF7BE
        LDAB    L0881 ;	I/O STATUS 2
        BITB    #$0020
        BNE     LF7A8
;
        JSR     LFC61 ;	USE TPS 
        CMPA    L319B ;	MAX TPS FOR CODE 24
        BLS     LF7A8
        LDAA    L001A ;	ENGINE RPM/25
        CMPA    L319C ;	MIN RPM FOR CODE 24
        BLS     LF7A8
        CMPA    L319D ;	MAX RPM FOR CODE 24
        BLS     LF7B3
LF7A8   CLR     L00D9 ;	CODE 24 COUNTER 
        LDAA    L0014
        ANDA    #$007F
        STAA    L0014
        BRA     LF7CA
;
LF7B3   LDAA    L0014
        BITA    #$0008
        BEQ     LF7CA
        INC     L00D9 ;	CODE 24 COUNTER 
        BRA     LF7CA
;
LF7BE   LDAA    L00C8
        ORAA    #$0001 ;	SET CODE 24
        STAA    L00C8
        LDAA    L0014
        ORAA    #$0080
        STAA    L0014
LF7CA   LDX     #$3189
        LDD     L004D ;	ENGINE RUN TIME 
        LSRD    
        TSTA    
        BNE     LF7D7
;
        CMPB    $000C,X ;	3195
        BCS     LF7ED
LF7D7   LDAB    L0014
        ANDB    #$00FB
        LDAA    L0036 ;	COOLANT TEMP 
        CMPA    $000B,X ;	3194
        BHI     LF7EB
        LDAA    L00C8
        ORAA    #$0020 ;	SET CODE 14
        STAA    L00C8
        LDAB    L0014
        ORAB    #$0004
LF7EB   STAB    L0014
LF7ED   LDD     L004D ;	ENGINE RUN TIME 
        LSRD    
        TSTA    
        BNE     LF7F7
;
        CMPB    $000E,X ;	3197
        BCS     LF809
LF7F7   LDAA    L0036 ;	COOLANT TEMP 
        CMPA    $000D,X ;	3196
        BLS     LF809
        LDAA    L00C8
        ORAA    #$0010 ;	SET CODE 15
        STAA    L00C8
        LDAB    L0014
        ORAB    #$0004
        STAB    L0014
LF809   LDAA    L0026 ;	BARO
        CMPA    $0017,X ;	31A0
        BHI     LF815
        LDAB    L00C9
        ORAB    #$0020 ;	SET CODE 32
        STAB    L00C9
LF815   CMPA    $0018,X ;	31A1
        BHI     LF81C
        CLR     L00D6 ;	CODE 45 COUNTER 
LF81C   LDAB    L0015
        ANDB    #$00F7 ;	0 = MAP CODE CLR
        LDAA    L0020 ;	PRESSURE
        CMPA    $0019,X ;	31A2
        BHI     LF82A
        CMPA    $001A,X ;	31A3
        BHI     LF842
LF82A   LDAA    L00D8 ;	CODE 34 TIMER
        CMPA    $001B,X ;	31A4
        BHI     LF852
        LDAA    L0016
        BITA    #$0002 ;	1 = COOLANT TEMP HOT C13
        BEQ     LF842
        LDAA    L002C ;	TPS
        CMPA    $001C,X ;	31A5
        BHI     LF842
        LDAA    L001A ;	ENGINE RPM/25
        CMPA    $0000,X ;	3189
        BLS     LF847
LF842   CLR     L00D8 ;	CODE 34 TIMER 
        BRA     LF85C
;
LF847   LDAA    L0014
        BITA    #$0008
        BEQ     LF85C
        INC     L00D8 ;	CODE 34 TIMER 
        BRA     LF85C
;
LF852   LDAA    L00C9
        ORAA    #$0008 ;	SET CODE 34
        STAA    L00C9
        LDAB    L0015
        ORAB    #$0008 ;	MAP CODE SET
LF85C   STAB    L0015
        LDAA    L3181 ;	MALF 3 MASK 
        BPL     LF8CE ;	BRANCH IF NO ESC
        LDD     L004D ;	ENGINE RUN TIME 
        SUBD    $001F,X ;	31A6
        BCS     LF8CE
        LDAB    L0015
        BPL     LF871 ;	ENGINE NOT KNOCKING
        ANDB    #$00DF
        BRA     LF8CC
;
LF871   BITB    #$0020 ;	SECOND KNOCK FAILURE 
        BNE     LF8CE
;
        LDAA    L000F
        BITA    #$0018
        BNE     LF8CE
;
        BITB    #$0010 ;	FIRST KNOCK FAILURE 
        BEQ     LF88F
        BITA    #$0002
        BNE     LF88F
;
        LDAB    L000E
        BITB    #$0020
        BNE     LF8CE
;
        ORAA    #$0002
        STAA    L000F
        BRA     LF8CE
;
LF88F   LDAA    L000E
        BITA    #$0020 ;	FAILED KNOCK TEST
        BEQ     LF8CE
        LDAA    L0015
        BITA    #$0008 ;	1 = MAP CODE SET 
        BNE     LF8CE
;
        LDAA    L000C
        BITA    #$0001
        BNE     LF8CE
;
        LDAA    L0014
        BITA    #$0004
        BNE     LF8CE
;
        LDAA    L001A ;	ENGINE RPM/25
        CMPA    $0026,X ;	31AF
        BHI     LF8CE
        LDAA    L002A ;	VACUUM
        CMPA    $0027,X ;	31B0
        BLS     LF8CE
        LDAA    L0035 ;	COOLANT TEMP
        CMPA    $0024,X ;	31AD;	MIN CTS KNOCK TST 
        BCC     LF8CE
        CMPA    $0025,X ;	31AE;	MAX CTS KNOCK TST 
        BLS     LF8CE
        LDAA    L0085 ;	KNOCK TEST COUNTER 
        INCA    
        CMPA    $0023,X ;	31AC;	MIN KNK TST COUNTER 
        BLS     LF8CF
        BITB    #$0010
        BEQ     LF8CA
        ORAB    #$0020 ;	SECOND KNOCK FAILURE
LF8CA   ORAB    #$0010 ;	FIRST KNOCK FAILURE
LF8CC   STAB    L0015
LF8CE   CLRA    
LF8CF   STAA    L0085 ;	KNOCK TEST COUNTER
        LDAA    L0015
        BITA    #$0060
        BEQ     LF8DD
        LDAA    L00CA
        ORAA    #$0080 ;	SET CODE 43
        STAA    L00CA
LF8DD   LDAB    L0015
        LDAA    L000D
        BITA    #$0001 ;	1 = MOUNTAIN COAST MODE
        BEQ     LF8EF
        LDAA    L3003 ;	INSTALLED EQUIPMENT 3
        BITA    #$0001
        BEQ     LF8EF
        JMP     LF91D
;
LF8EF   LDAA    $002B,X ;	31B4
        CMPA    L003F ;	SLOW O2 FILTERED
        BLS     LF910
        LDAA    L00D5 ;	CODE 44 COUNTER
        CMPA    $002C,X ;	31B5
        BHI     LF915
        LDAA    L0014
        BITA    #$0060
        BNE     LF910
;
        LDAA    L0011 ;	CLCC 1
        BPL     LF910 ;	BRANCH IF OPEN LOOP 
        LDAA    L0014
        BITA    #$0010
        BEQ     LF91D
        INC     L00D5 ;	CODE 44 COUNTER 
        BRA     LF91D
;
LF910   CLR     L00D5 ;	CODE 44 COUNTER 
        BRA     LF91D
;
LF915   LDAA    L00CA
        ORAA    #$0040 ;	SET CODE 44
        STAA    L00CA
        ORAB    #$0001 ;	O2 CODE SET 
LF91D   LDAA    L003F ;	SLOW O2 FILTERED
        CMPA    $002E,X ;	31B7
        BLS     LF93E
        LDAA    L00D6 ;	CODE 45 COUNTER
        CMPA    $002D,X ;	31B6
        BHI     LF943
        LDAA    L0014
        BITA    #$0060
        BNE     LF93E
;
        LDAA    L0011 ;	CLCC 1
        BPL     LF93E ;	BRANCH IF OPEN LOOP 
        LDAA    L0014
        BITA    #$0010
        BEQ     LF94B
        INC     L00D6 ;	CODE 45 COUNTER 
        BRA     LF94B
;
LF93E   CLR     L00D6 ;	CODE 45 COUNTER 
        BRA     LF94B
;
LF943   LDAA    L00CA
        ORAA    #$0020 ;	SET CODE 45
        STAA    L00CA
        ORAB    #$0001 ;	SET CODE O2
LF94B   STAB    L0015
        LDAB    L0016
        BITB    #$0008
        BNE     LF9AD
;
        BITB    #$0010
        BEQ     LF95D
        LDAA    L00CA
        ORAA    #$0004 ;	SET CODE 53
        STAA    L00CA
LF95D   BITB    #$0004
        BNE     LF9B2
;
        BITB    #$0020
        BNE     LF96F
;
        LDAA    L004E ;	ENGINE RUN TIME 
        CMPA    L00D1 ;	CODE 53 COUNTER 
        BNE     LF9B0
;
        ORAB    #$0020
        BRA     LF9AB
;
LF96F   LDAA    L3001 ;	INSTALLED EQUIPMENT 1
        BMI     LF97F
        LDAA    L0801 ;	I/O STATUS 1
        BITA    #$0020 ;	0 = 4TH GEAR
        BNE     LF9AD
;
        BITA    #$0008 ;	1 = TCC LOCKED
        BEQ     LF9AD
LF97F   LDAA    L00BB ;	EGR DC
        CMPA    $0034,X ;	31BD
        BCS     LF9AD
        LDAA    L0029 ;	MAP
        STAA    L00CF ;	MAP OLD
        CMPA    $0030,X ;	31B9
        BLS     LF9AD
        CMPA    $0031,X ;	31BA
        BHI     LF9AD
        LDAA    L002B ;	BARO CORRECTED TPS 
        CMPA    $0032,X ;	31BB
        BLS     LF9AD
        CMPA    $0033,X ;	31BC
        BHI     LF9AD
        CMPA    L00D0
        BEQ     LF9A3
        STAA    L00D0
        BRA     LF9AD
;
LF9A3   LDAA    L00D1 ;	CODE 53 COUNTER 
        CMPA    $0035,X ;	31BE;	MIN CNT C53
        BNE     LF9BE
;
        ORAB    #$0004 ;	CODE 53 SET
LF9AB   STAB    L0016
LF9AD   CLR     L00D1 ;	CODE 53 COUNTER
LF9B0   BRA     LF9FA
;
LF9B2   LDAA    L002B ;	BARO CORRECTED TPS 
        CMPA    L00D0
        BNE     LF9F0
;
        LDAA    L00D1 ;	CODE 53 COUNTER 
        CMPA    $0035,X ;	31BE;	MIN CNT C53
        BEQ     LF9C3
LF9BE   INCA    
        STAA    L00D1 ;	CODE 53 COUNTER 
        BRA     LF9FA
;
LF9C3   LDAA    L00CF ;	MAP OLD 
        SUBA    L0029 ;	MAP
        BCS     LF9CD ;	BRANCH MAP INCREASING
        CMPA    $0036,X ;	31BF ;MIN DELTA MAP 
        BHI     LF9D7
LF9CD   LDAA    L00D2 ;	DECELL COUNTER 
        CMPA    $0037,X ;	31C0 ;MIN CYCLES DEC MAP
        BNE     LF9ED
;
        ORAB    #$0010 ;	DECELL
        BRA     LF9F0
;
LF9D7   LDAA    L00D2 ;	DECELL COUNTER 
        SUBA    $0038,X ;	31C1 ;CYCLE COUNTER DEC 
        BCC     LF9EE
        CLRA    
        ANDB    #$00EF ;	NOT DECELL
        STAA    L00D2 ;	DECELL COUNTER 
        LDAA    L3005
        BITA    #$0010
        BEQ     LF9F0
        ORAB    #$0008
        BRA     LF9F0
;
LF9ED   INCA    
LF9EE   STAA    L00D2 ;	DECELL COUNTER
LF9F0   ANDB    #$00DB
        STAB    L0016
        LDAA    L004E ;	ENGINE RUN TIME 
        ADDA    $002F,X ;	31B8
        STAA    L00D1 ;	CODE 53 COUNTER 
LF9FA   LDAA    L00CB
        ORAA    L00CC
        ORAA    L00CD
        BNE     LFA2D ;	BRANCH IF CODE SET
;
        LDD     L00C8
        ANDA    L317F ;	MALF 1 MASK 
        ANDB    L3180 ;	MALF 2 MASK 
        STD     L00CB
        LDAA    L3181 ;	MALF 3 MASK 
        ORAA    #$0010
        ANDA    L00CA
        STAA    L00CD
        LDAA    L00DA
        BEQ     LFA1F
        DEC     L00DA
        JMP     LFA9F
;
LFA1F   LDAA    L0016
        ANDA    #$00FE
        STAA    L0016
        LDAA    L0010
        ANDA    #$00FB
        STAA    L0010
        BRA     LFA9F
;
LFA2D   LDD     L317F ;	MALF 1 MASK 
        STD     L004F
        LDAA    L3181 ;	MALF 3 MASK 
        ORAA    #$0010
        STAA    L0051
        LDX     #$0003
        CLRA    
LFA3D   LDAB    $00C7,X ;	CODE SET BYTE
        ANDB    $00CA,X ;	CURRENT CODE BYTE
        ANDB    $004E,X ;	MALF CODE MASK
        STAB    $00CA,X ;	CURRENT CODE BYTE
        BEQ     LFA48
        INCA    ;		INC IF CODE SET
LFA48   DEX     
        BNE     LFA3D
;
        INC     L00DA
        LDAB    L0016
        TSTA    
        BNE     LFA67 ;	BRANCH IF CODE SET
;
        LDAA    L00DA
        ASRB    
        BCS     LFA5D
        LDAB    L3182
        BRA     LFA60
;
LFA5D   LDAB    L3184
LFA60   CBA     
        BCS     LFA9F
        STAB    L00DA
        BRA     LFA9F
;
LFA67   LDAA    L00DA
        ASRB    
        BCS     LFA71
        LDAB    L3183
        BRA     LFA74
;
LFA71   LDAB    L3185
LFA74   CBA     
        BCS     LFA9F
        LDAA    L3184
        STAA    L00DA
        LDAA    L0016
        ORAA    #$0001
        STAA    L0016
        CLRB    
        LDX     #$0003
LFA86   LDAA    $0006,X ;	MALF BYTE
        ORAA    $00CA,X ;	CURRENT CODE BYTE
        STAA    $0006,X ;	MALF BYTE
        STAB    $00CA,X ;	CLEAR CURRENT CODES
        DEX     
        BNE     LFA86
;
        CLR     L0001 ;	STARTS SINCE LAST FAULT 
        JSR     LFE6E ;	SUM L0003 - L0009
        STD     L000A
        LDAA    L0010
        ORAA    #$0004
        STAA    L0010
LFA9F   LDAA    L0016
        ASRA    
        BCS     LFAB5
        LDAA    L0014
        BITA    #$0002 ;	1 = SUCESSFUL START 
        BEQ     LFAB5
        LDAA    L0018
        BMI     LFABC ;	SES LIGHT ON
        LDAA    #$0008
        JSR     LFE0D
        BRA     LFABC
;
LFAB5   LDAA    L0018
        BMI     LFABC ;	SES LIGHT ON
        JSR     LFDFF ;	TURN OFF SES LIGHT
LFABC   LDAA    L0014
        ANDA    #$00E7
        STAA    L0014
        CLRA    
        CLRB    
        STD     L00C8
        STAA    L00CA
        RTS ;		END MINOR LOOP 6    
; -----------------------------------------------------------
LFAC9   LDAA    L0017
        BITA    #$0040
        BEQ     LFB26
        DEC     L00C7
        LDAB    L00C7
        BNE     LFABC
;
        BITA    #$0010
        BEQ     LFAE7
        ANDA    #$00EF
        LDAB    #$0004
LFADE   STAA    L0017
LFAE0   STAB    L00C7
        JSR     LFE0B ;	TURN ON SES LIGHT
        BRA     LFABC
;
LFAE7   BITA    #$0020
        BNE     LFAF5
;
        LDAB    L00C3
        BNE     LFAFE
;
        LDAB    #$0008
        ORAA    #$0020
        BRA     LFADE
;
LFAF5   LDAB    L00C4
        BEQ     LFB0E
        DECB    
        STAB    L00C4
        BRA     LFB01
;
LFAFE   DECB    
        STAB    L00C3
LFB01   ORAA    #$0010
        STAA    L0017
        JSR     LFDFF ;	TURN OFF SES LIGHT
        LDAA    #$0004
        STAA    L00C7
        BRA     LFABC
;
LFB0E   LDAB    L00C5
        ANDA    #$0003
        BEQ     LFB1B
        LDAA    L0017
        DECA    
        ANDA    #$00DF
        BRA     LFB58
;
LFB1B   LDAA    L00C6
LFB1D   INCB    
        CMPB    #$001A
        BCS     LFB28
        LDAA    #$0080
        BRA     LFADE
;
LFB26   LDAB    #$0002
LFB28   CMPB    #$0002
        BNE     LFB39
;
        LDAA    L0007 ;	MALF 1
        ANDA    L317F ;	MALF 1 MASK 
        ROLA    
        TST     L000E
        BMI     LFB1D
        BRA     LFB52
;
LFB39   CMPB    #$000A
        BNE     LFB44
;
        LDAA    L0008 ;	MALF 2
        ANDA    L3180 ;	MALF 2 MASK 
        BRA     LFB4F
;
LFB44   CMPB    #$0012
        BNE     LFB4F
;
        LDAA    L3181 ;	MALF 3 MASK 
        ORAA    #$0010
        ANDA    L0009 ;	MALF 3
LFB4F   ROLA    
        BCC     LFB1D
LFB52   STAA    L00C6
        STAB    L00C5
        LDAA    #$00C2
LFB58   STAA    L0017
        CLRA    
LFB5B   INCA    
        SUBB    #$0005
        BHI     LFB5B
        ADDB    #$0005
        STAA    L00C3
        STAB    L00C4
        LDAB    #$001C
        JMP     LFAE0
;	DUTY CYCLE BLOCK ASSIGNER
LFB6B   LDX     #$32AF ;	USE BARO CORR TPS
        JSR     LFC64 ;	GET ACC A VALUE AND INC X
        CMPA    L00AE ;	MIN TPS CURRENT BLOCK
        BCS     LFB84 ;	DUTY CYCLE BLOCK ROUTINE
        CMPA    L00AF ;	MAX TPS CURRENT BLOCK
        BHI     LFB84 ;	DUTY CYCLE BLOCK ROUTINE 
        LDAA    L001A ;	ENGINE RPM/25
        CMPA    L00B0 ;	MIN RPM CURRENT BLOCK 
        BCS     LFB84 ;	DUTY CYCLE BLOCK ROUTINE 
        CMPA    L00B1 ;	MAX RPM CURRENT BLOCK 
        BHI     LFB84 ;	DUTY CYCLE BLOCK ROUTINE 
        RTS     
; -----------------------------------------------------------
;	DUTY CYCLE BLOCK ROUTINE
LFB84   LDAB    L0012
        ORAB    #$0040
        STAB    L0012
        LDD     L32B0 ;	BLOCK BOUNDARY
        STD     L0050
        LDAA    L32B2 ;	BLOCK BOUNDARY 
        LDAB    #$00FF
        STD     L0052
        INCB    
        STAB    L004F ;	SET BOTTOM BOUNDARY TO 0
        LDX     #$32AF ;	USE BARO CORR TPS 
        JSR     LFC64 ;	GET ACC A VALUE AND INC X
        LDX     #$0052
        LDAB    #$0003
LFBA4   CMPA    $0000,X
        BHI     LFBAC
        DEX     
        DECB    
        BNE     LFBA4
;
LFBAC   STAB    L00A5 ;	DUTY CYCLE BLOCK NUMBER
        LDD     $0000,X
        SUBA    L32D4
        BCC     LFBB6
        CLRA    
LFBB6   ADDB    L32D4
        BCC     LFBBD
        LDAB    #$00FF
LFBBD   STD     L00AE ;	TPS WORD CURRENT BLOCK 
        LDAA    L00A5 ;	DUTY CYCLE BLOCK NUMBER 
        CLRB    
        CMPA    L32C6
        BCS     LFBC9
        LDAB    #$0002
LFBC9   STAB    L00A7
        ASLA    
        ASLA    
        STAA    L00A5 ;	DUTY CYCLE BLOCK NUMBER 
        LDD     L32B3
        STD     L0050
        LDAA    L32B5
        LDAB    #$00FF
        STD     L0052
        INCB    
        STAB    L004F
        LDAA    L001A ;	ENGINE RPM/25
        LDX     #$0052
        LDAB    #$0003
LFBE5   CMPA    $0000,X
        BHI     LFBED
        DEX     
        DECB    
        BNE     LFBE5
;
LFBED   PSHB    
        LDD     $0000,X
        SUBA    L32D5
        BCC     LFBF6
        CLRA    
LFBF6   ADDB    L32D5
        BCC     LFBFD
        LDAB    #$00FF
LFBFD   STD     L00B0 ;	RPM WORD CURRENT BLOCK 
        PULA    
        CMPA    L32C7 
        BCS     LFC08
        INC     L00A7
LFC08   ADDA    L00A5 ;	DUTY CYCLE BLOCK NUMBER 
        STAA    L00A5 ;	DUTY CYCLE BLOCK NUMBER 
        RTS     
; -----------------------------------------------------------
;	LOOKUP A = L(X+TPS BLOCK)
LFC0D   LDAB    L00A5 ;	DUTY CYCLE BLOCK NUMBER 
LFC0F   ABX     
        LDAA    $0000,X
        RTS     
; -----------------------------------------------------------
LFC13   LDAB    L00A5 ;	DUTY CYCLE BLOCK NUMBER 
LFC15   ABX     
        STAA    $0000,X
        RTS     
; -----------------------------------------------------------
LFC19   ASLB    
        BCS     LFC23
        ABA     
        BCC     LFC21
        LDAA    #$00FF
LFC21   BRA     LFC27
;
LFC23   SBA     
        BCC     LFC27
        CLRA    
LFC27   RTS     
; -----------------------------------------------------------
LFC28   LDX     #$3388
        LDAA    L0038 ;	INVERSE COOLANT TEMP
        LSRA    
        JSR     LFD61 ;	2D INTERPOLATE 
        LDAB    L000D
        BITB    #$0001 ;	1 = MOUNTAIN COAST MODE 
        BEQ     LFC46
        LDAB    L0011 ;	CLCC 1
        BPL     LFC46 ;	BRANCH IF OPEN LOOP 
        LDX     #$0003
        LDAB    L00A7
        JSR     LFC0F ;	LOOKUP A = L(X+B)
        SUBA    L33F8 ;	MC DUTY CYCLE OFFSET
LFC46   CMPA    L00A2 ;	MC DUTY CYCLE
        BHI     LFC4C
        STAA    L00A2 ;	MC DUTY CYCLE
LFC4C   LDAB    L32D2 ;	MIN MCS DC HI COOL 
        LDAA    L0035 ;	COOLANT TEMP
        CMPA    L32D1 ;	MCS COOLANT THRESHOLD
        BHI     LFC59
        LDAB    L32D3 ;	MIN MCS DC LO COOL 
LFC59   LDAA    L00A2 ;	MC DUTY CYCLE
        CBA     
        BHI     LFC60
        STAB    L00A2 ;	MC DUTY CYCLE
LFC60   RTS     
; -----------------------------------------------------------
;	GET ACC A VALUE AND INC X
LFC61   LDX     #$318C
LFC64   PSHB    
        PSHX     
        LDAB    $0000,X
        CMPB    #$0003
        BLS     LFC6D
        CLRB    
LFC6D   LDX     #$0029
        ABX     
        LDAA    $0000,X
        PULX    
        INX     
        PULB    
        RTS     
; -----------------------------------------------------------
LFC77   LDX     #$0092
        LDAA    L0005
        STAA    L004F
        LDAA    L0003
        CLR     L0050
LFC83   LDAB    L32C7 
        CMPB    L0050
        BNE     LFC90
;
        LDAA    L0006
        STAA    L004F
        LDAA    L0004
LFC90   BSR     LFC9D
        INX     
        INC     L0050
        LDAB    L0050
        CMPB    #$0004
        BCS     LFC83
        RTS     
; -----------------------------------------------------------
LFC9D   PSHA    
        LDAB    L32C6
        BNE     LFCA5
;
        LDAA    L004F
LFCA5   STAA    $0000,X
        CMPB    #$0001
        BNE     LFCAD
;
        LDAA    L004F
LFCAD   STAA    $0004,X
        CMPB    #$0002
        BNE     LFCB5
;
        LDAA    L004F
LFCB5   STAA    $0008,X
        CMPB    #$0003
        BNE     LFCBD
;
        LDAA    L004F
LFCBD   STAA    $000C,X
        PULA    
        RTS     
; --------------FILTER ROUTINE-----------------------------
LFCC1   STX     L0051
LFCC3   STAB    L0053
        CLR     L0056
        CLRB    
        SUBD    L0051
        BCC     LFCD5
        COMA    
        COMB    
        ADDD    #$0001
        INC     L0056
LFCD5   STD     L0054
        LDX     #$0054
        LDAA    L0053
        JSR     LFDD3 ;	A * X (PERCENTAGE)
        TST     L005A
        BEQ     LFCEB
        BMI     LFCE9
        LSRD    
        LSRD    
        LSRD    
LFCE9   LSRD    
        LSRD    
LFCEB   TST     L0056
        BEQ     LFCF5
        COMA    
        COMB    
        ADDD    #$0001
LFCF5   ADDD    L0051
        CLR     L005A
        RTS     
; -----------------------------------------------------------
LFCFB   LDAA    L0012
        ANDA    #$00FD
        LDAB    L0002 ;	CLOSED LOOP COOLANT TEMP
        CMPB    L32DC ;	MIN CLOSED LOOP TEMP NO CORR
        BLS     LFD11 ;	BRANCH IF WARMER
        SUBB    L0037 ;	INVERSE COOLANT TEMP
        BCS     LFD0F ;	BRANCH IF CURRENT COOLER
        CMPB    L32DD ;	MAX TEMP DIFFERENCE NO CORR
        BHI     LFD11 ;	BRANCH IF WARMER 
LFD0F   ORAA    #$0002 ;	
LFD11   STAA    L0012
        RTS     
; -----------------------------------------------------------
LFD14   LDAB    L32E5 ;	STEADY TPS MULT O2 SAME STATE
        BRA     LFD1C
;
LFD19   LDAB    L32E6 ;	STEADY TPS MULT O2 !SAME STATE
LFD1C   STAB    L004F
        LDAB    L0012
        BITB    #$0010
        BEQ     LFD29 ;	BRANCH TPS NOT STEADY
        LDAB    L004F
        MUL     
        ADCA    #$0000
LFD29   LDAB    L0010
        BPL     LFD33 ;	BRANCH IF UNLOCKED 
        LDAB    L32E7 ;	CLOSED LOOP MULT TCC LOCKED
        MUL     
        ADCA    #$0000
LFD33   RTS     
; -----------------------------------------------------------
;	TPS BLOCK LOADER
LFD34   LDX     L33D2
        STX     L0003
        LDX     L33D4
        STX     L0005
        LDAA    L0022 ;	BARO SPEED DENSITY 
;									$00 = 10 KPA $90 = 100 KPA 
        LDAB    #$0060
        LDX     #$33A1
        JSR     LFD5D ;	2D INTERPOLATE WITH OFFSET
        LDX     #$0004
LFD4B   TAB     
        ADDB    $0002,X
        BCC     LFD52
        LDAB    #$00FF
LFD52   STAB    $0002,X
        DEX     
        BNE     LFD4B
;
        JSR     LFE6E ;	SUM L0003 - L0009
        STD     L000A
        RTS     
; -----------------------------------------------------------
;	2D INTERPOLATE WITH OFFSET 
LFD5D   SBA     
        BCC     LFD61 ;	2D INTERPOLATE 
        CLRA 
;	2D INTERPOLATE   
LFD61   LDAB    #$0010
        MUL     
        PSHB    
        TAB
        ABX     
        LDD     $0000,X
LFD69   STAA    L004F
        SBA     
        PULB    
        BCS     LFD77
        MUL     
        NEGA    
        ADDA    L004F
        ASLB    
        SBCA    #$0000
        RTS     
; -----------------------------------------------------------
LFD77   NEGA    
        MUL     
        ADCA    L004F
        RTS     
; -----------------------------------------------------------
;	3D INTERPOLATE 
LFD7C   SUBA    $0000,X
        BCC     LFD81
        CLRA    
LFD81   SUBB    $0001,X
        BCC     LFD86
        CLRB    
LFD86   STAB    L0051
        LDAB    #$0010
        MUL     
        PSHB    
        LDAB    $0002,X
        PSHB    
        MUL     
        ABX     
        INX     
        INX     
        INX     
        PSHX    
        LDAA    L0051
        BSR     LFD61 ;	2D INTERPOLATE 
        STAA    L0050
        LDAA    L0051
        PULX    
        PULB    
        ABX     
        BSR     LFD61 ;	2D INTERPOLATE 
        TAB     
        LDAA    L0050
        BRA     LFD69
;-------------------------------------------------------------------
;	ROUTINE:	D/X
LFDA7   STX     L0051
        LDX     #$0000
        STX     L004F
        LDX     #$0011
LFDB1   SUBD    L0051
        BCC     LFDBA
        ADDD    L0051
        CLC     
        BRA     LFDBB
;
LFDBA   SEC     
LFDBB   ROL     L0050
        ROL     L004F
        BCS     LFDCD
        DEX     
        BEQ     LFDD2
        ASLD    
        BCC     LFDB1
        SUBD    L0051
        BRA     LFDBA
;
LFDCD   LDX     #$FFFF
        STX     L004F
LFDD2   RTS     
; -----------------------------------------------------------
;	A * X (PERCENTAGE)
LFDD3   STAA    L004F
        LDAB    $0001,X 
        MUL     
        ADCA    #$0000
        STAA    L0050
        LDAA    $0000,X
        LDAB    L004F
        MUL     
        STAA    L004F
        CLRA    
        ADDD    L004F
        RTS     
; --------------GET A/D VALUE-------------------------------
LFDE7   PSHX    
        PSHB    
        TAB     
        LDAA    #$0001
        LDX     #$0017
        STD     L1002 ;	A/D CHANNEL OUT
LFDF2   LDD     L1000 ;	A/D VALUE IN
        BMI     LFDFB
        DEX     
        BNE     LFDF2
;
        CLRB    
LFDFB   TBA     
        PULB    
        PULX    
        RTS     
; -----------------------------------------------------------
LFDFF   LDAA    #$00F7 ;	TURN OFF SES LIGHT
LFE01   SEI     
        STAA    L0056
        LDD     L0C3C ; PWM control register
        ANDB    L0056
        BRA     LFE15
;
LFE0B   LDAA    #$0008 ;	TURN ON SES LIGHT
LFE0D   SEI     
        STAA    L0056
        LDD     L0C3C ; PWM control register
        ORAB    L0056
LFE15   ANDA    #$00F1
        ANDB    #$00FE
        ORAA    #$0071
        ORAB    #$0022
        STD     L0C3C ; PWM control register
        CLI     
        RTS     
; -----------------------------------------------------------
LFE22   LDAB    #$0097
        SUBA    #$000F
        BSR     LFE35
        STAA    L002A ;	MAP
        RTS     
; -----------------------------------------------------------
LFE2B   LDD     #$F697
        SUBA    L004F ;	PRESSURE
        BSR     LFE35
        STAA    L0029 ;	MAP
        RTS     
; -----------------------------------------------------------
LFE35   BCC     LFE39
        CLRA    
        RTS     
; -----------------------------------------------------------
LFE39   MUL     
        ASLD    
        BCS     LFE43
        TSTB    
        BPL     LFE45
        INCA    
        BNE     LFE45
;
LFE43   LDAA    #$00FF
LFE45   RTS     
; -----------------------------------------------------------
LFE46   LDAA    L32CB ;	DEFAULT BARO
        LDAB    L33EB ;	BARO 0 = NOT INSTALLED
        BEQ     LFE53
        LDAA    #$000A ;	A/D CHANNEL 10
        JSR     LFDE7 ;	GET A/D VALUE
LFE53   STAA    L0026 ;	BARO
        TAB     
        CLRA    
        ADDD    #$0027
        STD     L0027 ;	BARO 
        LDAA    L0026 ;	BARO
        SUBA    #$0002
        LDAB    #$0097
        MUL     
        ADCA    #$0000
        CMPA    #$0090 ;	100 KPA
        BLS     LFE6B
        LDAA    #$0090 ;	100 KPA
LFE6B   STAA    L0022 ;	BARO SPEED DENSITY
;									$00 = 10 KPA $90 = 100 KPA
        RTS     
; -----------------------------------------------------------

LFE6E   LDX     #$0007
        CLRA    
        CLRB    
LFE73   ADDB    $0002,X
        ADCA    #$0000
        DEX     
        BNE     LFE73
;
        ADDD    #$0001
        RTS     
; -----------------------------------------------------------
LFE7E   LDAB    L0018
        BMI     LFE88 ;	SES LIGHT ON
        CLRA    
        LDAB    #$0018
        STD     L008A
        RTS     
; -----------------------------------------------------------
LFE88   LDAA    L008A
        BNE     LFE9D
;
        LDAA    #$0008
        STAA    L008A
        LDAB    L008B
        CMPB    #$0018
        BNE     LFEA6
;
        CLRA    
        STAA    L008B
        DECA    
        STAA    L008D
        RTS     
; -----------------------------------------------------------
LFE9D   DEC     L008A
        ASL     L008D
        BCC     LFEB4
        RTS     
; -----------------------------------------------------------
LFEA6   LDX     #$3400
        ASLB    
        ABX     
        LDX     $0000,X
        LDAA    $0000,X
        STAA    L008D
        INC     L008B
LFEB4   LDD     L0C3C ; PWM control register
        ORAB    #$0008
        JSR     LFEDB ;	RTS
        STD     L0C3C ; PWM control register
        RTS     
; -----------------------------------------------------------
;	NON VOL MEM BOMBED ROUTINE 
LFEC0   LDAB    L0011 ;	CLCC 1
        ORAB    #$0040 ;	SET NONVOL MEMORY BOMBED 
        STAB    L0011 ;	CLCC 1
        CLRA    
        STAA    L0002 ;	CLOSED LOOP COOLANT TEMP
        CLR     L000C
        CLRB    
        LDAA    L32B8 ;	DEFAULT TPS MEM BOMB
        STD     L002D ;	MINIMUM THROTTLE POSITION
;	CLEAR CODES 
LFED2   CLRA    
        CLRB    
        STD     L0007 ;	MALF 1
        STAA    L0009 ;	MALF 3
        STAA    L0001 ;	STARTS SINCE LAST FAULT 
        RTS     
; -----------------------------------------------------------
LFEDB   RTS     
; -----------------------------------------------------------
LFEDC   LDAA    #$00EF
        SEI     
        JSR     LFE01
        CLI     
        RTS     
; -----------------------------------------------------------
LFEE4   JSR     LFF7B
        LDAA    L0076
        LDX     #$001C
        JSR     LFDD3 ;	A * X (PERCENTAGE)
        STD     L0054
        LDAA    L001A ;	ENGINE RPM/25
        CMPA    #$0040 ;	1600 RPM
        BHI     LFEFA
        ASLA    
        BRA     LFF00
;
LFEFA   ADDA    #$0040
        BCC     LFF00
        LDAA    #$00FF ;	4775 RPM
LFF00   LDX     #$316E
        JSR     LFD61 ;	2D INTERPOLATE 
        STAA    L0052
        LDAB    L000E
        BITB    #$0001
        BNE     LFF14
;
        CLRA    
        CLRB    
        SUBD    L0054
        BRA     LFF16
;
LFF14   LDD     L0054
LFF16   SUBB    L0052
        SBCA    #$0000
        STD     L006F
        CLRA    
        CLRB    
        SUBD    L0C00 ;	REF PERIOD 
        LSRD    
        LSRD    
        LSRD    
        LSRD    
        ORAA    #$00F0
        ADDD    L0079
        SUBD    L006F
        BMI     LFF31
        ADDD    L006F
        STD     L006F
LFF31   LDD     L006F
        SUBD    L0079
        STD     L0C28 ;	LAST EST FALL COUNTER 
        LDX     L006F
        STX     L0079
        ADDD    L007B
        SUBD    L0062
        STD     L0C26 ;	LAST EST FALL COUNTER 
        LDX     L0062
        STX     L007B
        CLRA    
        CLRB    
        STD     L004F
        LDD     L006F
        STD     L0C36 ;	EST FALL COUNTER 
        LDD     L0062
        SUBD    L004F
        STD     L004F
        LDD     L0C00 ;	DRP COUNTER 
        SUBD    #$0027
        SUBD    L004F
        BCC     LFF64
        ADDD    L004F
        BRA     LFF66
;
LFF64   LDD     L004F
LFF66   STD     L0C1C ;	SPARK DWELL 
        LDAA    L000E
        BITA    #$0040 ;	EST FAILURE
        BEQ     LFF7A ;	BRANCH NO EST FAILURE
        LDD     L0C3C ; PWM control register
        ORAB    #$0010 ;	EST FAILURE
        JSR     LFEDB ;	RTS
        STD     L0C3C ; PWM control register
LFF7A   RTS     
; -----------------------------------------------------------
LFF7B   LDD     L0C00 ;	DRP COUNTER 
        STD     L001C ;	CYL CORR REF PERIOD 
        LDX     #$001C
        LDAA    L33EC ;	NUM CYLINDERS
        BEQ     LFF8D
        JSR     LFDD3 ;	A * X (PERCENTAGE)
        STD     L001C ;	CYL CORR DRP COUNTER 
LFF8D   RTS     
; -----------------------------------------------------------
;	MINOR LOOP 1	RAM REFRESH $00-$7F
        LDAB    L000D
        LDAA    L00DC
        BEQ     LFF98
        ORAB    #$0004
        STAB    L000D
LFF98   LDX     #$00CC
        STX     L0C0C
        LDX     #$0000
LFFA1   LDAB    #$007F
        ABX     
LFFA4   SEI     
        LDAA    $0000,X
        STAA    $0000,X
        CLI     
        DEX     
        DECB    
        BPL     LFFA4
        RTS  END MINOR LOOP 1 AND 2   
; -----------------------------------------------------------
;	MINOR LOOP 2	BARO AND RAM REFRESH $80-$FF 
        JSR     LFE46 ;		BARO ROUTINE 
        LDX     #$0080  
        BRA     LFFA1
;*************COOLANT CONVERSION TABLE************************
        FCB     $00 ;	-15 C
        FCB     $32
        FCB     $4A
        FCB     $5A
        FCB     $68
        FCB     $75
        FCB     $81
        FCB     $8E
        FCB     $9A
        FCB     $A6
        FCB     $B4
        FCB     $D3
        FCB     $F6
        FCB     $FF
;**************ALDL OUTPUT LOCATIONS - MOVED TO $3400 ****************
        FCB     $00
        FDB     $0000 
        FDB     $0000 
        FDB     $0000 
        FDB     $0000 
        FDB     $0000 
        FDB     $0000 
        FDB     $0000 
        FDB     $0000 
        FDB     $0000 
        FDB     $0000 
        FDB     $0000 
        FDB     $0000 
        FDB     $0000 
        FDB     $0000 
        FDB     $0000 
        FDB     $0000 
        FDB     $0000 
        FDB     $0000 
        FDB     $0000 	
        FDB     $0000
        FDB     $0000
        FDB     $0000
        FDB     $0000
        FDB     $E0F0
        FDB     $E0F1 ; TIMER INTERRUPT - 160 TIMES PER SECOND - FOR ALDL DIAGNOSTIC OUTPUT AND OTHER TIME SENSITIVE FUNCTIONS
        FDB     $2800 ; MASKABLE INTERRUPT REQUEST (IRQ1)
        FDB     $E0F0 ; SOFTWARE INTERRUPT
        FDB     $2800 ; NON-MASKABLE INTERRUPT REQUEST (NMI)
        FDB     $E000
