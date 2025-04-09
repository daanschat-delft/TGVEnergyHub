#ifndef EnergyHub_V2_acc_h_
#define EnergyHub_V2_acc_h_
#ifndef EnergyHub_V2_acc_COMMON_INCLUDES_
#define EnergyHub_V2_acc_COMMON_INCLUDES_
#include <stdlib.h>
#define S_FUNCTION_NAME simulink_only_sfcn
#define S_FUNCTION_LEVEL 2
#ifndef RTW_GENERATED_S_FUNCTION
#define RTW_GENERATED_S_FUNCTION
#endif
#include "rtwtypes.h"
#include "simstruc.h"
#include "fixedpoint.h"
#include "rt_nonfinite.h"
#include "math.h"
#endif
#include "EnergyHub_V2_acc_types.h"
#include "mwmathutil.h"
#include <stddef.h>
#include "rt_defines.h"
#include "simstruc_types.h"
typedef struct { real_T B_9_0_0 ; real_T B_9_1_8 ; real_T B_9_2_16 ; real_T
B_9_3_24 ; real_T B_9_4_32 ; real_T B_9_5_40 ; real_T B_9_6_48 ; real_T
B_9_7_56 ; real_T B_9_8_64 ; real_T B_9_9_72 ; real_T B_9_10_80 ; real_T
B_9_11_88 ; real_T B_9_12_96 ; real_T B_9_13_104 ; real_T B_9_14_112 ; real_T
B_9_15_120 ; real_T B_9_16_128 ; real_T B_9_17_136 ; real_T B_9_18_144 ;
real_T B_9_19_152 ; real_T B_9_20_160 ; real_T B_9_21_168 ; real_T B_9_22_176
; real_T B_9_23_184 ; real_T B_9_24_192 ; real_T B_9_25_200 ; real_T
B_9_26_208 ; real_T B_9_27_216 ; real_T B_9_28_224 ; real_T B_9_29_232 ;
real_T B_9_30_240 ; real_T B_9_31_248 ; real_T B_9_32_256 ; real_T B_9_33_264
; real_T B_9_34_272 ; real_T B_9_35_280 ; real_T B_9_36_288 ; real_T
B_9_37_296 ; real_T B_9_38_304 ; real_T B_9_39_312 ; real_T B_9_40_320 ;
real_T B_9_41_328 ; real_T B_9_42_336 ; real_T B_9_43_344 ; real_T B_9_44_352
; real_T B_9_45_360 ; real_T B_9_46_368 ; real_T B_9_47_376 ; real_T
B_9_48_384 ; real_T B_9_49_392 ; real_T B_9_50_400 ; real_T B_9_51_408 ;
real_T B_9_52_416 ; real_T B_9_53_424 ; real_T B_9_54_432 ; real_T B_9_55_440
; real_T B_9_56_448 ; real_T B_9_57_456 ; real_T B_9_58_464 ; real_T
B_9_59_472 ; real_T B_9_60_480 ; real_T B_9_61_488 ; real_T B_9_62_496 ;
real_T B_9_63_504 ; real_T B_9_64_512 ; real_T B_9_65_520 ; real_T B_9_66_528
; real_T B_9_67_536 ; real_T B_9_68_544 ; real_T B_9_69_552 ; real_T
B_9_70_560 ; real_T B_9_71_568 ; real_T B_9_72_576 ; real_T B_9_73_584 ;
real_T B_9_74_592 ; real_T B_9_75_600 ; real_T B_9_76_608 ; real_T B_9_77_616
; real_T B_9_78_624 ; real_T B_9_79_632 ; real_T B_9_80_640 ; real_T
B_9_81_648 ; real_T B_9_82_656 ; real_T B_9_83_664 ; real_T B_9_84_672 ;
real_T B_9_85_680 ; real_T B_9_86_688 ; real_T B_9_87_696 ; real_T B_9_88_704
; real_T B_9_89_712 ; real_T B_9_90_720 ; real_T B_9_91_728 ; real_T
B_6_92_736 ; real_T B_5_93_744 ; real_T B_5_94_752 ; real_T B_4_95_760 ;
real_T B_4_96_768 ; real_T B_3_97_776 ; real_T B_2_98_784 ; real_T B_1_99_792
; real_T B_0_100_800 ; real_T B_0_101_808 ; boolean_T B_9_102_816 ; char_T
pad_B_9_102_816 [ 7 ] ; } B_EnergyHub_V2_T ; typedef struct { real_T
Delay_DSTATE ; real_T Initialit_PreviousInput ; struct { real_T modelTStart ;
} TransportDelay_RWORK ; real_T StateSpace_RWORK [ 2 ] ; struct { void *
TUbufferPtrs [ 2 ] ; } TransportDelay_PWORK ; void * FromWorkspace_PWORK [ 3
] ; void * StateSpace_PWORK [ 22 ] ; void * EMSScope_PWORK [ 2 ] ; void *
H2Buffer_PWORK ; void * Scope2_PWORK [ 3 ] ; void * SummerScope_PWORK [ 3 ] ;
void * WinterScope_PWORK [ 3 ] ; void * Scope1_PWORK [ 3 ] ; void *
Linecurrent_PWORK ; void * Scope_PWORK ; void * Scope_PWORK_d ; void *
Scope_PWORK_c [ 3 ] ; void * Scope1_PWORK_j [ 2 ] ; void * Scope_PWORK_i [ 2
] ; void * Scope_PWORK_b [ 2 ] ; void * Scope_PWORK_m [ 3 ] ; void *
Scope1_PWORK_h ; void * Scope3_PWORK ; void * FromWorkspace1_PWORK [ 3 ] ;
int32_T TmpAtomicSubsysAtSwitchInport3_sysIdxToRun ; int32_T
TmpAtomicSubsysAtSwitch1Inport3_sysIdxToRun ; int32_T
MATLABFunction_sysIdxToRun ; int32_T MATLABFunction_sysIdxToRun_g ; int32_T
MATLABFunction2_sysIdxToRun ; int32_T FuelCellController_sysIdxToRun ;
int32_T ElectrolyserController_sysIdxToRun ; int32_T
MATLABFunction_sysIdxToRun_n ; int32_T MATLABFunction_sysIdxToRun_c ; struct
{ int_T Tail ; int_T Head ; int_T Last ; int_T CircularBufSize ; int_T
MaxNewBufSize ; } TransportDelay_IWORK ; int_T FromWorkspace_IWORK ; int_T
StateSpace_IWORK [ 23 ] ; int_T FromWorkspace1_IWORK ; int_T
CoulombCounter_MODE ; int_T Saturation_MODE ; int_T Saturation_MODE_d ; int_T
Abs_MODE ; boolean_T Compare_Mode ; boolean_T CoulombCounter_DWORK1 ;
boolean_T RelationalOperator_Mode ; boolean_T RelationalOperator1_Mode ;
boolean_T Compare_Mode_k ; char_T pad_Compare_Mode_k [ 7 ] ; }
DW_EnergyHub_V2_T ; typedef struct { real_T CurrentFilter_CSTATE ; real_T
CoulombCounter_CSTATE ; real_T TransferFcn1_CSTATE ; real_T Integrator_CSTATE
; real_T Integrator1_CSTATE ; real_T Integrator1_CSTATE_o ; real_T
Integrator2_CSTATE ; real_T Integrator_CSTATE_m ; real_T Integrator1_CSTATE_i
; real_T Integrator_CSTATE_k ; real_T Integrator_CSTATE_d ; real_T
Integrator_CSTATE_g ; real_T Integrator_CSTATE_l ; real_T
Integrator2_CSTATE_e ; real_T Integrator_CSTATE_j ; real_T
Integrator1_CSTATE_j ; } X_EnergyHub_V2_T ; typedef struct { real_T
CurrentFilter_CSTATE ; real_T CoulombCounter_CSTATE ; real_T
TransferFcn1_CSTATE ; real_T Integrator_CSTATE ; real_T Integrator1_CSTATE ;
real_T Integrator1_CSTATE_o ; real_T Integrator2_CSTATE ; real_T
Integrator_CSTATE_m ; real_T Integrator1_CSTATE_i ; real_T
Integrator_CSTATE_k ; real_T Integrator_CSTATE_d ; real_T Integrator_CSTATE_g
; real_T Integrator_CSTATE_l ; real_T Integrator2_CSTATE_e ; real_T
Integrator_CSTATE_j ; real_T Integrator1_CSTATE_j ; } XDot_EnergyHub_V2_T ;
typedef struct { boolean_T CurrentFilter_CSTATE ; boolean_T
CoulombCounter_CSTATE ; boolean_T TransferFcn1_CSTATE ; boolean_T
Integrator_CSTATE ; boolean_T Integrator1_CSTATE ; boolean_T
Integrator1_CSTATE_o ; boolean_T Integrator2_CSTATE ; boolean_T
Integrator_CSTATE_m ; boolean_T Integrator1_CSTATE_i ; boolean_T
Integrator_CSTATE_k ; boolean_T Integrator_CSTATE_d ; boolean_T
Integrator_CSTATE_g ; boolean_T Integrator_CSTATE_l ; boolean_T
Integrator2_CSTATE_e ; boolean_T Integrator_CSTATE_j ; boolean_T
Integrator1_CSTATE_j ; } XDis_EnergyHub_V2_T ; typedef struct { real_T
CurrentFilter_CSTATE ; real_T CoulombCounter_CSTATE ; real_T
TransferFcn1_CSTATE ; real_T Integrator_CSTATE ; real_T Integrator1_CSTATE ;
real_T Integrator1_CSTATE_o ; real_T Integrator2_CSTATE ; real_T
Integrator_CSTATE_m ; real_T Integrator1_CSTATE_i ; real_T
Integrator_CSTATE_k ; real_T Integrator_CSTATE_d ; real_T Integrator_CSTATE_g
; real_T Integrator_CSTATE_l ; real_T Integrator2_CSTATE_e ; real_T
Integrator_CSTATE_j ; real_T Integrator1_CSTATE_j ; }
CStateAbsTol_EnergyHub_V2_T ; typedef struct { real_T CurrentFilter_CSTATE ;
real_T CoulombCounter_CSTATE ; real_T TransferFcn1_CSTATE ; real_T
Integrator_CSTATE ; real_T Integrator1_CSTATE ; real_T Integrator1_CSTATE_o ;
real_T Integrator2_CSTATE ; real_T Integrator_CSTATE_m ; real_T
Integrator1_CSTATE_i ; real_T Integrator_CSTATE_k ; real_T
Integrator_CSTATE_d ; real_T Integrator_CSTATE_g ; real_T Integrator_CSTATE_l
; real_T Integrator2_CSTATE_e ; real_T Integrator_CSTATE_j ; real_T
Integrator1_CSTATE_j ; } CXPtMin_EnergyHub_V2_T ; typedef struct { real_T
CurrentFilter_CSTATE ; real_T CoulombCounter_CSTATE ; real_T
TransferFcn1_CSTATE ; real_T Integrator_CSTATE ; real_T Integrator1_CSTATE ;
real_T Integrator1_CSTATE_o ; real_T Integrator2_CSTATE ; real_T
Integrator_CSTATE_m ; real_T Integrator1_CSTATE_i ; real_T
Integrator_CSTATE_k ; real_T Integrator_CSTATE_d ; real_T Integrator_CSTATE_g
; real_T Integrator_CSTATE_l ; real_T Integrator2_CSTATE_e ; real_T
Integrator_CSTATE_j ; real_T Integrator1_CSTATE_j ; } CXPtMax_EnergyHub_V2_T
; typedef struct { real_T Compare_RelopInput_ZC ; real_T
CoulombCounter_Reset_ZC ; real_T CoulombCounter_xUpperSaturation_ZC ; real_T
CoulombCounter_xLowerSaturation_ZC ; real_T CoulombCounter_InputPortSignal_ZC
; real_T Saturation_UprLim_ZC ; real_T Saturation_LwrLim_ZC ; real_T
RelationalOperator_RelopInput_ZC ; real_T RelationalOperator1_RelopInput_ZC ;
real_T Compare_RelopInput_ZC_m ; real_T Saturation_UprLim_ZC_k ; real_T
Saturation_LwrLim_ZC_k ; real_T Abs_AbsZc_ZC ; } ZCV_EnergyHub_V2_T ; typedef
struct { ZCSigState Compare_RelopInput_ZCE ; ZCSigState
CoulombCounter_Reset_ZCE ; ZCSigState CoulombCounter_xUpperSaturation_ZCE ;
ZCSigState CoulombCounter_xLowerSaturation_ZCE ; ZCSigState
CoulombCounter_InputPortSignal_ZCE ; ZCSigState Saturation_UprLim_ZCE ;
ZCSigState Saturation_LwrLim_ZCE ; ZCSigState
RelationalOperator_RelopInput_ZCE ; ZCSigState
RelationalOperator1_RelopInput_ZCE ; ZCSigState Compare_RelopInput_ZCE_a ;
ZCSigState Saturation_UprLim_ZCE_f ; ZCSigState Saturation_LwrLim_ZCE_h ;
ZCSigState Abs_AbsZc_ZCE ; } PrevZCX_EnergyHub_V2_T ; typedef struct { const
real_T B_9_126_984 ; const real_T B_9_127_992 ; } ConstB_EnergyHub_V2_T ;
#define EnergyHub_V2_rtC(S) ((ConstB_EnergyHub_V2_T *) _ssGetConstBlockIO(S))
struct P_EnergyHub_V2_T_ { real_T P_0 ; real_T P_1 ; real_T P_2 ; real_T P_3
; real_T P_4 ; real_T P_5 ; real_T P_6 ; real_T P_7 ; real_T P_8 ; real_T P_9
; real_T P_10 ; real_T P_11 ; real_T P_12 ; real_T P_13 ; real_T P_14 ;
real_T P_15 ; real_T P_16 ; real_T P_17 ; real_T P_18 ; real_T P_19 ; real_T
P_20 ; real_T P_21 ; real_T P_22 ; real_T P_23 ; real_T P_24 ; real_T P_25 [
2 ] ; real_T P_26 [ 3 ] ; real_T P_27 [ 2 ] ; real_T P_28 [ 4 ] ; real_T P_29
[ 2 ] ; real_T P_31 [ 2 ] ; real_T P_32 [ 138 ] ; real_T P_33 ; real_T P_34 ;
real_T P_35 ; real_T P_36 ; real_T P_37 ; real_T P_38 ; real_T P_39 ; real_T
P_40 ; real_T P_41 ; real_T P_42 ; real_T P_43 ; real_T P_44 ; real_T P_45 ;
real_T P_46 ; real_T P_47 ; real_T P_48 ; real_T P_49 ; real_T P_50 ; real_T
P_51 ; real_T P_52 ; real_T P_53 ; real_T P_54 ; real_T P_55 ; real_T P_56 ;
real_T P_57 ; real_T P_58 ; real_T P_59 ; real_T P_60 ; real_T P_61 ; real_T
P_62 ; real_T P_63 ; real_T P_64 ; real_T P_65 ; real_T P_66 ; real_T P_67 ;
real_T P_68 ; real_T P_69 ; real_T P_70 ; real_T P_71 ; real_T P_72 ; real_T
P_73 ; real_T P_74 ; real_T P_75 ; real_T P_76 ; real_T P_77 ; real_T P_78 ;
real_T P_79 ; real_T P_80 ; real_T P_81 ; real_T P_82 ; real_T P_83 ; real_T
P_84 ; real_T P_85 ; real_T P_86 ; real_T P_87 ; real_T P_88 ; real_T P_89 ;
real_T P_90 ; real_T P_91 ; real_T P_92 ; real_T P_93 ; real_T P_94 ; real_T
P_95 ; real_T P_96 ; } ; extern P_EnergyHub_V2_T EnergyHub_V2_rtDefaultP ;
extern const ConstB_EnergyHub_V2_T EnergyHub_V2_rtInvariant ;
#endif
