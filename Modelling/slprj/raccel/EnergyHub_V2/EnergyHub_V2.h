#ifndef EnergyHub_V2_h_
#define EnergyHub_V2_h_
#ifndef EnergyHub_V2_COMMON_INCLUDES_
#define EnergyHub_V2_COMMON_INCLUDES_
#include <stdio.h>
#include <stdlib.h>
#include "rtwtypes.h"
#include "sigstream_rtw.h"
#include "simtarget/slSimTgtSigstreamRTW.h"
#include "simtarget/slSimTgtSlioCoreRTW.h"
#include "simtarget/slSimTgtSlioClientsRTW.h"
#include "simtarget/slSimTgtSlioSdiRTW.h"
#include "simstruc.h"
#include "fixedpoint.h"
#include "raccel.h"
#include "slsv_diagnostic_codegen_c_api.h"
#include "rt_logging_simtarget.h"
#include "rt_nonfinite.h"
#include "math.h"
#include "dt_info.h"
#include "ext_work.h"
#endif
#include "EnergyHub_V2_types.h"
#include "mwmathutil.h"
#include <stddef.h>
#include "rt_zcfcn.h"
#include "rtGetNaN.h"
#include <string.h>
#include "rtw_modelmap_simtarget.h"
#include "rt_defines.h"
#include "rtGetInf.h"
#include "zero_crossing_types.h"
#define MODEL_NAME EnergyHub_V2
#define NSAMPLE_TIMES (4) 
#define NINPUTS (0)       
#define NOUTPUTS (0)     
#define NBLOCKIO (84) 
#define NUM_ZC_EVENTS (1) 
#ifndef NCSTATES
#define NCSTATES (16)   
#elif NCSTATES != 16
#error Invalid specification of NCSTATES defined in compiler command
#endif
#ifndef rtmGetDataMapInfo
#define rtmGetDataMapInfo(rtm) (*rt_dataMapInfoPtr)
#endif
#ifndef rtmSetDataMapInfo
#define rtmSetDataMapInfo(rtm, val) (rt_dataMapInfoPtr = &val)
#endif
#ifndef IN_RACCEL_MAIN
#endif
typedef struct { real_T kdj0wd20st ; real_T bjtcxgmpqj ; real_T nwzw2cabkb ;
real_T ouasx5k4la ; real_T eqdufgyd0i ; real_T h3g4uraxas ; real_T oqv5gnpllh
; real_T dljrf0twcu ; real_T bnvvu0qvwc ; real_T ctvyoinwip ; real_T
nym54hvbil ; real_T abcmlgbsh5 ; real_T khw32w04mg ; real_T o4443okihv ;
real_T eqs4mdcynf ; real_T ao5gqkewor ; real_T ncvgtmhwhn ; real_T a40hvnvxl2
; real_T kq0lvgf5rj ; real_T jqakvxl32d ; real_T bvcbx0lvt0 ; real_T
dqtgr0zwkt ; real_T cdgypogmey ; real_T lr2yhsywn4 ; real_T fw3rm02212 ;
real_T mg4ho33emc ; real_T f2uq5ltgcf ; real_T cy1zkcbtmv ; real_T n4wv1s50v2
; real_T ce2wfw1arr ; real_T fy4tgtvso2 ; real_T gaanaanrln ; real_T
dsngd5v3lm ; real_T aixqvnbip4 ; real_T ckqez0eyr3 ; real_T gghhrlvjin ;
real_T hczhiwtoth ; real_T g44snqx1sj ; real_T jeunin1rrd ; real_T a4d4pu1ubl
; real_T o3nss1ju3r ; real_T k3y0rqloxm ; real_T ghlm4i2igd ; real_T
g5y2ouvcm1 ; real_T ghtokxtx2q ; real_T oxbturcyxk ; real_T cxilc4gk5h ;
real_T pjt5biyfo1 ; real_T dsv41uh1g5 ; real_T jv5inx1nqy ; real_T kc1nogvb5f
; real_T i14wyyd2gb ; real_T nvpl4p0gtr ; real_T ekaw0k0fho ; real_T
mkoq2qjjzd ; real_T jcngp1f1we ; real_T n5kbnabcmb ; real_T pygnx5ravq ;
real_T bm5bt1wiea ; real_T nxoxpca0k4 ; real_T ivhjg5my2c ; real_T eqyq41qgez
; real_T exxf3u4dtj ; real_T mhsmhjnr20 ; real_T da2ev5sr00 ; real_T
l5zhjr5dt3 ; real_T lep1ns4x35 ; real_T fjwcnkpy02 ; real_T n1bt1i4ifs ;
real_T jprg3lhhlv ; real_T ntzj3okwja ; real_T hmd3qe0b3e ; real_T oxrcrnhmlp
; real_T k4znm4zmcp ; real_T lsedfz3yzy ; real_T nrb0v50tfu ; real_T
nsznj3nlnr ; real_T ehd15fjddu ; real_T j35sict0yp ; real_T p2mvewvzdn ;
boolean_T eeeemhwm1q ; } B ; typedef struct { real_T nhyja3gqwt ; real_T
ahkhj1ysxa ; real_T m4bmhl2a34 ; real_T gz3pnon4nx ; real_T lnaxw2zrc2 ;
real_T i20mz1gcxj ; real_T hnvfx5vd1i ; real_T n4l2yq1mor ; real_T dehnm35xyo
; real_T n3pnso5nem ; real_T k22gwali4k ; real_T pfbyvtpv40 ; real_T
c2c0ubffon ; struct { real_T modelTStart ; } pzvz5dlcor ; real_T k50ebsnxib [
2 ] ; struct { void * TUbufferPtrs [ 2 ] ; } davmwtffpr ; struct { void *
TimePtr ; void * DataPtr ; void * RSimInfoPtr ; } kxjbnknxrm ; void *
hec3hro2te [ 22 ] ; struct { void * LoggedData [ 2 ] ; } fmj1jogz4p ; struct
{ void * LoggedData ; } kcfcsbxo32 ; struct { void * LoggedData [ 3 ] ; }
o1eiap20zi ; struct { void * LoggedData [ 3 ] ; } aig2givwcd ; struct { void
* LoggedData [ 3 ] ; } dxcpvvgduj ; struct { void * LoggedData [ 3 ] ; }
drfuttga3k ; struct { void * LoggedData ; } j4nzilbghc ; struct { void *
LoggedData ; } guo5p2sqi4 ; struct { void * LoggedData ; } efpron2z1b ;
struct { void * LoggedData [ 3 ] ; } npva2ai3id ; struct { void * LoggedData
[ 2 ] ; } gle0z23tyq ; struct { void * LoggedData [ 2 ] ; } ocmfbgdhuy ;
struct { void * LoggedData [ 2 ] ; } icmdc1ydn1 ; struct { void * LoggedData
[ 3 ] ; } ect3mc0knr ; struct { void * LoggedData ; } ezo1sjelb2 ; struct {
void * LoggedData ; } ja10jj4iq4 ; struct { void * TimePtr ; void * DataPtr ;
void * RSimInfoPtr ; } bbhwh1vhz5 ; int32_T hkfwygdrky ; int32_T ba5ijmur1e ;
int32_T lkcvhohgpx ; int32_T aip5ben0ea ; int32_T e2cccxfniz ; int32_T
b4adcsrrdi ; int32_T bm0ovdkjsz ; struct { int_T Tail ; int_T Head ; int_T
Last ; int_T CircularBufSize ; int_T MaxNewBufSize ; } iivr2nwogz ; struct {
int_T PrevIndex ; } ilunv1kvnl ; int_T iwobcsvj0e [ 23 ] ; struct { int_T
PrevIndex ; } oaq51hxa0o ; int_T pdgeu0tapy ; int_T m2twtevakk ; int_T
b451kvbxbu ; int_T nibcvvr5za ; boolean_T eycfaaffbr ; boolean_T k2mlxmug2z ;
boolean_T gjjksoc35z ; boolean_T pfejla1kiu ; boolean_T mzk1ky2u2c ;
boolean_T k4joo4zpqw ; boolean_T mwouhr3vx1 ; boolean_T fvmvracqcf ;
boolean_T fqb2qsosrk ; boolean_T fysmwvxmd3 ; boolean_T md5xeaxvq3 ;
boolean_T bekgh2gd4a ; boolean_T p1nidq2iqu ; boolean_T k2jke2e322 ;
boolean_T d5thh0bmhf ; boolean_T ensodeql1o ; boolean_T g5wvczhzto ;
boolean_T kp52o401yy ; boolean_T ieshbrlpla ; boolean_T aeg1ehjx1y ;
boolean_T ecvbyd2dtc ; boolean_T edghx214bz ; boolean_T brv251zwfg ;
boolean_T gvlowbt3cx ; boolean_T ivjc2fq1if ; boolean_T iyd1rcriew ;
boolean_T btnu3kb32b ; boolean_T dgfvjtboxr ; boolean_T osazkc2wan ;
boolean_T deumlssnme ; boolean_T ojr1yp3mmb ; boolean_T nvwz0xxljo ;
boolean_T cdkg110som ; boolean_T mnhpzkpq1z ; boolean_T pq0m50tv3k ; } DW ;
typedef struct { real_T a0uiwjgnqt ; real_T ki523ifmg2 ; real_T nhzz3oak4k ;
real_T llui5rylzb ; real_T grbg2cbbyx ; real_T difo1am4it ; real_T hp5wwq2xwg
; real_T dh5wyqhdr1 ; real_T m5gnktjinn ; real_T m52pn04wsr ; real_T
dvinzbjb5n ; real_T bjlfxl2udf ; real_T nda5meffs5 ; real_T klh0son1wt ;
real_T ij0yrmzcdc ; real_T aaiy0aknyp ; } X ; typedef struct { real_T
a0uiwjgnqt ; real_T ki523ifmg2 ; real_T nhzz3oak4k ; real_T llui5rylzb ;
real_T grbg2cbbyx ; real_T difo1am4it ; real_T hp5wwq2xwg ; real_T dh5wyqhdr1
; real_T m5gnktjinn ; real_T m52pn04wsr ; real_T dvinzbjb5n ; real_T
bjlfxl2udf ; real_T nda5meffs5 ; real_T klh0son1wt ; real_T ij0yrmzcdc ;
real_T aaiy0aknyp ; } XDot ; typedef struct { boolean_T a0uiwjgnqt ;
boolean_T ki523ifmg2 ; boolean_T nhzz3oak4k ; boolean_T llui5rylzb ;
boolean_T grbg2cbbyx ; boolean_T difo1am4it ; boolean_T hp5wwq2xwg ;
boolean_T dh5wyqhdr1 ; boolean_T m5gnktjinn ; boolean_T m52pn04wsr ;
boolean_T dvinzbjb5n ; boolean_T bjlfxl2udf ; boolean_T nda5meffs5 ;
boolean_T klh0son1wt ; boolean_T ij0yrmzcdc ; boolean_T aaiy0aknyp ; } XDis ;
typedef struct { real_T a0uiwjgnqt ; real_T ki523ifmg2 ; real_T nhzz3oak4k ;
real_T llui5rylzb ; real_T grbg2cbbyx ; real_T difo1am4it ; real_T hp5wwq2xwg
; real_T dh5wyqhdr1 ; real_T m5gnktjinn ; real_T m52pn04wsr ; real_T
dvinzbjb5n ; real_T bjlfxl2udf ; real_T nda5meffs5 ; real_T klh0son1wt ;
real_T ij0yrmzcdc ; real_T aaiy0aknyp ; } CStateAbsTol ; typedef struct {
real_T a0uiwjgnqt ; real_T ki523ifmg2 ; real_T nhzz3oak4k ; real_T llui5rylzb
; real_T grbg2cbbyx ; real_T difo1am4it ; real_T hp5wwq2xwg ; real_T
dh5wyqhdr1 ; real_T m5gnktjinn ; real_T m52pn04wsr ; real_T dvinzbjb5n ;
real_T bjlfxl2udf ; real_T nda5meffs5 ; real_T klh0son1wt ; real_T ij0yrmzcdc
; real_T aaiy0aknyp ; } CXPtMin ; typedef struct { real_T a0uiwjgnqt ; real_T
ki523ifmg2 ; real_T nhzz3oak4k ; real_T llui5rylzb ; real_T grbg2cbbyx ;
real_T difo1am4it ; real_T hp5wwq2xwg ; real_T dh5wyqhdr1 ; real_T m5gnktjinn
; real_T m52pn04wsr ; real_T dvinzbjb5n ; real_T bjlfxl2udf ; real_T
nda5meffs5 ; real_T klh0son1wt ; real_T ij0yrmzcdc ; real_T aaiy0aknyp ; }
CXPtMax ; typedef struct { real_T kb2jls20ia ; real_T otnqiezfpr ; real_T
d34mwf4vco ; real_T lcttzkkida ; real_T lbp35hkoir ; real_T m2u14dm1en ;
real_T jpmjrqmilv ; real_T fx00aaqfpf ; real_T hl5op2mbeo ; real_T ndtkbmkggl
; real_T n254iyb4pt ; real_T nzf0nd3orr ; real_T iglw4nus1v ; } ZCV ; typedef
struct { ZCSigState mmdsvdfxfz ; } PrevZCX ; typedef struct {
rtwCAPI_ModelMappingInfo mmi ; } DataMapInfo ; struct P_ { real_T
Electrolysercontroller_SoCmin ; real_T Electrolysercontroller_TimeUntilStart
; real_T Constant_Value ; real_T Constant_Value_odsjjxhutl ; real_T
TransportDelay_Delay ; real_T TransportDelay_InitOutput ; real_T m2_Gain ;
real_T eff_Gain ; real_T Delay_InitialCondition ; real_T Gain4_Gain ; real_T
CurrentFilter_A ; real_T CurrentFilter_C ; real_T Initialit_InitialCondition
; real_T CoulombCounter_UpperSat ; real_T CoulombCounter_LowerSat ; real_T
Gain1_Gain ; real_T TransferFcn1_A ; real_T TransferFcn1_C ; real_T
Saturation_UpperSat ; real_T Saturation_LowerSat ; real_T FromWorkspace_Time0
[ 52560 ] ; real_T FromWorkspace_Data0 [ 52560 ] ; real_T kWtoW_Gain ; real_T
Switch1_Threshold ; real_T Switch_Threshold ; real_T Gain_Gain ; real_T
Converter_Gain ; real_T ToCurrent_Gain ; real_T ofbatteries_Gain ; real_T
StateSpace_P1_Size [ 2 ] ; real_T StateSpace_P1 [ 3 ] ; real_T
StateSpace_P2_Size [ 2 ] ; real_T StateSpace_P2 [ 4 ] ; real_T
StateSpace_P3_Size [ 2 ] ; real_T StateSpace_P4_Size [ 2 ] ; real_T
StateSpace_P4 [ 138 ] ; real_T donotdeletethisgain_Gain ; real_T
Gain1_Gain_plyejubh1e ; real_T Saturation_UpperSat_k3bm0knlts ; real_T
Saturation_LowerSat_gtsxumhbdz ; real_T Integrator_IC ; real_T
Gain1_Gain_fxb1m5rhch ; real_T Integrator1_IC ; real_T Gain3_Gain ; real_T
Integrator1_IC_fwv4cigl40 ; real_T Gain1_Gain_nz2osdhexb ; real_T
Integrator2_IC ; real_T Gain4_Gain_e2mkjz4tqt ; real_T
Integrator_IC_i21dmpskwh ; real_T perhour_Gain ; real_T H2Density_Gain ;
real_T Integrator1_IC_g5lsixmxdm ; real_T perhour1_Gain ; real_T
H2Density1_Gain ; real_T Gain_Gain_iqqmbwk0e2 ; real_T gNLtokWh_Gain ; real_T
Gain_Gain_jt2wimow1f ; real_T Integrator_IC_nsg0kjcgu1 ; real_T
Gain3_Gain_l0e401elkp ; real_T gNLtokWh1_Gain ; real_T Gain2_Gain ; real_T
tokg_Gain ; real_T tokg2_Gain ; real_T Integrator_IC_jzifrmxlwd ; real_T
Gain_Gain_nzjb0vbdhq ; real_T Integrator_IC_lzmn2te2uh ; real_T
Gain_Gain_lkepalan24 ; real_T Integrator_IC_ixmnm2v2k2 ; real_T
Gain2_Gain_fwxb10mf54 ; real_T Integrator2_IC_izj4dymskh ; real_T
Gain_Gain_a2gr5bvahu ; real_T Gain_Gain_jsklo00cx1 ; real_T
Gain1_Gain_f1lo10iae3 ; real_T Gain2_Gain_pdmsmoivym ; real_T
Integrator_IC_dxszohgzae ; real_T Gain_Gain_kzu1g10xje ; real_T
Integrator1_IC_n4hyedwkjh ; real_T perhour_Gain_ljfjkw1syf ; real_T
H2Density_Gain_nbhhfd3fwa ; real_T gNLtokWh_Gain_gxlrclrqbo ; real_T
Gain1_Gain_eqxfa3sskl ; real_T FCControl_Gain ; real_T ElecControl_Gain ;
real_T FromWorkspace1_Time0 [ 527026 ] ; real_T FromWorkspace1_Data0 [ 527026
] ; real_T Constant_Value_l4asnk125a ; real_T Constant1_Value ; real_T
capacity_Value ; real_T constantK_Value ; real_T constantA_Value ; real_T
constantB_Value ; real_T Constant1_Value_d1yqnarcqp ; real_T
Constant_Value_iilw0smpge ; real_T Constant_Value_pyyru1d03h ; real_T
Constant1_Value_ne4ps45m3u ; real_T Constant2_Value ; real_T Constant3_Value
; real_T Constant4_Value ; real_T Constant5_Value ; real_T Constant6_Value ;
} ; extern const char_T * RT_MEMORY_ALLOCATION_ERROR ; extern B rtB ; extern
X rtX ; extern DW rtDW ; extern PrevZCX rtPrevZCX ; extern P rtP ; extern
mxArray * mr_EnergyHub_V2_GetDWork ( ) ; extern void mr_EnergyHub_V2_SetDWork
( const mxArray * ssDW ) ; extern mxArray *
mr_EnergyHub_V2_GetSimStateDisallowedBlocks ( ) ; extern const
rtwCAPI_ModelMappingStaticInfo * EnergyHub_V2_GetCAPIStaticMap ( void ) ;
extern SimStruct * const rtS ; extern DataMapInfo * rt_dataMapInfoPtr ;
extern rtwCAPI_ModelMappingInfo * rt_modelMapInfoPtr ; void MdlOutputs ( int_T
tid ) ; void MdlOutputsParameterSampleTime ( int_T tid ) ; void MdlUpdate ( int_T tid ) ; void MdlTerminate ( void ) ; void MdlInitializeSizes ( void ) ; void MdlInitializeSampleTimes ( void ) ; SimStruct * raccel_register_model ( ssExecutionInfo * executionInfo ) ;
#endif
