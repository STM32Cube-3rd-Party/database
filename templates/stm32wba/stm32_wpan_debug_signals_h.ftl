[#ftl]
/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file    debug_signals.h
  * @author  MCD Application Team
  * @brief   Real Time Debug module System and Link Layer signal definition
  ******************************************************************************
[@common.optinclude name=mxTmpFolder+"/license.tmp"/][#--include License text --]
  ******************************************************************************
  */
/* USER CODE END Header */
#ifndef DEBUG_SIGNALS_H
#define DEBUG_SIGNALS_H

#include "bsp.h"

/**************************************************/
/** Specific Link Layer debug signals definition **/
/**************************************************/
typedef Debug_GPIO_t linklayer_debug_signal_t;

/**********************************************/
/** Specific System debug signals definition **/
/**********************************************/
typedef enum {
  ADC_ACTIVATION,
  ADC_DEACTIVATION,
  ADC_TEMPERATURE_ACQUISITION,
  RNG_ENABLE,
  RNG_DISABLE,
  RNG_GEN_RAND_NUM,
  LOW_POWER_STOP_MODE_ENTER,
  LOW_POWER_STOP_MODE_EXIT,
  LOW_POWER_STOP_MODE_ACTIVE,
  LOW_POWER_STANDBY_MODE_ENTER,
  LOW_POWER_STANDBY_MODE_EXIT,
  LOW_POWER_STANDBY_MODE_ACTIVE,
  SCM_SETUP,
  SCM_SYSTEM_CLOCK_CONFIG,
  SCM_HSERDY_ISR,
} system_debug_signal_t;

#if(RT_DEBUG_GPIO_MODULE == 1)

/*************************************/
/** Global debug signals definition **/
/*************************************/

typedef enum {
  RT_DEBUG_SIGNAL_UNUSED = 0x0,

/********************/
/** System signals **/
/********************/

#if (USE_RT_DEBUG_SCM_SETUP == 1)
  RT_DEBUG_SCM_SETUP,
#endif /* USE_RT_DEBUG_SCM_SETUP */

#if (USE_RT_DEBUG_SCM_HSERDY_ISR == 1)
  RT_DEBUG_SCM_HSERDY_ISR,
#endif /* USE_RT_DEBUG_SCM_HSERDY_ISR */

#if (USE_RT_DEBUG_SCM_SYSTEM_CLOCK_CONFIG == 1)
  RT_DEBUG_SCM_SYSTEM_CLOCK_CONFIG,
#endif /* USE_RT_DEBUG_SCM_SYSTEM_CLOCK_CONFIG */

#if (USE_RT_DEBUG_ADC_ACTIVATION == 1)
  RT_DEBUG_ADC_ACTIVATION,
#endif /* USE_RT_DEBUG_ADC_ACTIVATION */

#if (USE_RT_DEBUG_ADC_DEACTIVATION == 1)
  RT_DEBUG_ADC_DEACTIVATION,
#endif /* USE_RT_DEBUG_ADC_DEACTIVATION */

#if (USE_RT_DEBUG_ADC_TEMPERATURE_ACQUISITION == 1)
  RT_DEBUG_ADC_TEMPERATURE_ACQUISITION,
#endif /* USE_RT_DEBUG_ADC_TEMPERATURE_ACQUISITION */

#if (USE_RT_DEBUG_RNG_ENABLE == 1)
  RT_DEBUG_RNG_ENABLE,
#endif /* USE_RT_DEBUG_RNG_ENABLE */

#if (USE_RT_DEBUG_RNG_DISABLE == 1)
  RT_DEBUG_RNG_DISABLE,
#endif /* USE_RT_DEBUG_RNG_DISABLE */

#if (USE_RT_DEBUG_RNG_GEN_RAND_NUM == 1)
  RT_DEBUG_RNG_GEN_RAND_NUM,
#endif /* USE_RT_DEBUG_RNG_GEN_RAND_NUM */

#if (USE_RT_DEBUG_LOW_POWER_STOP_MODE_ENTER == 1)
  RT_DEBUG_LOW_POWER_STOP_MODE_ENTER,
#endif /* USE_RT_DEBUG_LOW_POWER_STOP_MODE_ENTER */

#if (USE_RT_DEBUG_LOW_POWER_STOP_MODE_EXIT == 1)
  RT_DEBUG_LOW_POWER_STOP_MODE_EXIT,
#endif /* USE_RT_DEBUG_LOW_POWER_STOP_MODE_EXIT */

#if (USE_RT_DEBUG_LOW_POWER_STOP_MODE_ACTIVE == 1)
  RT_DEBUG_LOW_POWER_STOP_MODE_ACTIVE,
#endif /* USE_RT_DEBUG_LOW_POWER_STOP_MODE_ACTIVE */

#if (USE_RT_DEBUG_LOW_POWER_STANDBY_MODE_ENTER == 1)
  RT_DEBUG_LOW_POWER_STANDBY_MODE_ENTER,
#endif /* USE_RT_DEBUG_LOW_POWER_STANDBY_MODE_ENTER */

#if (USE_RT_DEBUG_LOW_POWER_STANDBY_MODE_EXIT == 1)
  RT_DEBUG_LOW_POWER_STANDBY_MODE_EXIT,
#endif /* USE_RT_DEBUG_LOW_POWER_STANDBY_MODE_EXIT */

#if (USE_RT_DEBUG_LOW_POWER_STANDBY_MODE_ACTIVE == 1)
  RT_DEBUG_LOW_POWER_STANDBY_MODE_ACTIVE,
#endif /* USE_RT_DEBUG_LOW_POWER_STANDBY_MODE_ACTIVE */

/************************/
/** Link Layer signals **/
/************************/

#if (USE_RT_DEBUG_HCI_READ_DONE == 1)
  RT_DEBUG_HCI_READ_DONE,
#endif /* USE_RT_DEBUG_HCI_READ_DONE */

#if (USE_RT_DEBUG_HCI_RCVD_CMD == 1)
  RT_DEBUG_HCI_RCVD_CMD,
#endif /* USE_RT_DEBUG_HCI_RCVD_CMD */

#if (USE_RT_DEBUG_HCI_WRITE_DONE == 1)
  RT_DEBUG_HCI_WRITE_DONE,
#endif /* USE_RT_DEBUG_HCI_WRITE_DONE */

#if (USE_RT_DEBUG_SCHDLR_EVNT_UPDATE == 1)
  RT_DEBUG_SCHDLR_EVNT_UPDATE,
#endif /* USE_RT_DEBUG_SCHDLR_EVNT_UPDATE */

#if (USE_RT_DEBUG_SCHDLR_TIMER_SET == 1)
  RT_DEBUG_SCHDLR_TIMER_SET,
#endif /* USE_RT_DEBUG_SCHDLR_TIMER_SET */

#if (USE_RT_DEBUG_SCHDLR_PHY_CLBR_TIMER == 1)
  RT_DEBUG_SCHDLR_PHY_CLBR_TIMER,
#endif /* USE_RT_DEBUG_SCHDLR_PHY_CLBR_TIMER */

#if (USE_RT_DEBUG_SCHDLR_EVNT_SKIPPED == 1)
  RT_DEBUG_SCHDLR_EVNT_SKIPPED,
#endif /* USE_RT_DEBUG_SCHDLR_EVNT_SKIPPED */

#if (USE_RT_DEBUG_SCHDLR_HNDL_NXT_TRACE == 1)
  RT_DEBUG_SCHDLR_HNDL_NXT_TRACE,
#endif /* USE_RT_DEBUG_SCHDLR_HNDL_NXT_TRACE */

#if (USE_RT_DEBUG_ACTIVE_SCHDLR_NEAR_DETEDTED == 1)
  RT_DEBUG_ACTIVE_SCHDLR_NEAR_DETEDTED,
#endif /* USE_RT_DEBUG_ACTIVE_SCHDLR_NEAR_DETEDTED */

#if (USE_RT_DEBUG_ACTIVE_SCHDLR_NEAR_GAP_CHECK == 1)
  RT_DEBUG_ACTIVE_SCHDLR_NEAR_GAP_CHECK,
#endif /* USE_RT_DEBUG_ACTIVE_SCHDLR_NEAR_GAP_CHECK */

#if (USE_RT_DEBUG_ACTIVE_SCHDLR_NEAR_TIME_CHECK == 1)
  RT_DEBUG_ACTIVE_SCHDLR_NEAR_TIME_CHECK,
#endif /* USE_RT_DEBUG_ACTIVE_SCHDLR_NEAR_TIME_CHECK */

#if (USE_RT_DEBUG_ACTIVE_SCHDLR_NEAR_TRACE == 1)
  RT_DEBUG_ACTIVE_SCHDLR_NEAR_TRACE,
#endif /* USE_RT_DEBUG_ACTIVE_SCHDLR_NEAR_TRACE */

#if (USE_RT_DEBUG_SCHDLR_EVNT_RGSTR == 1)
  RT_DEBUG_SCHDLR_EVNT_RGSTR,
#endif /* USE_RT_DEBUG_SCHDLR_EVNT_RGSTR */

#if (USE_RT_DEBUG_SCHDLR_ADD_CONFLICT_Q == 1)
  RT_DEBUG_SCHDLR_ADD_CONFLICT_Q,
#endif /* USE_RT_DEBUG_SCHDLR_ADD_CONFLICT_Q */

#if (USE_RT_DEBUG_SCHDLR_HNDL_MISSED_EVNT == 1)
  RT_DEBUG_SCHDLR_HNDL_MISSED_EVNT,
#endif /* USE_RT_DEBUG_SCHDLR_HNDL_MISSED_EVNT */

#if (USE_RT_DEBUG_SCHDLR_UNRGSTR_EVNT == 1)
  RT_DEBUG_SCHDLR_UNRGSTR_EVNT,
#endif /* USE_RT_DEBUG_SCHDLR_UNRGSTR_EVNT */

#if (USE_RT_DEBUG_SCHDLR_EXEC_EVNT_TRACE == 1)
  RT_DEBUG_SCHDLR_EXEC_EVNT_TRACE,
#endif /* USE_RT_DEBUG_SCHDLR_EXEC_EVNT_TRACE */

#if (USE_RT_DEBUG_SCHDLR_EXEC_EVNT_ERROR == 1)
  RT_DEBUG_SCHDLR_EXEC_EVNT_ERROR,
#endif /* USE_RT_DEBUG_SCHDLR_EXEC_EVNT_ERROR */

#if (USE_RT_DEBUG_SCHDLR_EXEC_EVNT_WINDOW_WIDENING == 1)
  RT_DEBUG_SCHDLR_EXEC_EVNT_WINDOW_WIDENING,
#endif /* USE_RT_DEBUG_SCHDLR_EXEC_EVNT_WINDOW_WIDENING */

#if (USE_RT_DEBUG_LLHWC_CMN_CLR_ISR == 1)
  RT_DEBUG_LLHWC_CMN_CLR_ISR,
#endif /* USE_RT_DEBUG_LLHWC_CMN_CLR_ISR */

#if (USE_RT_DEBUG_LLWCC_CMN_HG_ISR == 1)
  RT_DEBUG_LLWCC_CMN_HG_ISR,
#endif /* USE_RT_DEBUG_LLWCC_CMN_HG_ISR */

#if (USE_RT_DEBUG_LLHWC_CMN_LW_ISR == 1)
  RT_DEBUG_LLHWC_CMN_LW_ISR,
#endif /* USE_RT_DEBUG_LLHWC_CMN_LW_ISR */

#if (USE_RT_DEBUG_LLHWC_CMN_CLR_TIMER_ERROR == 1)
  RT_DEBUG_LLHWC_CMN_CLR_TIMER_ERROR,
#endif /* USE_RT_DEBUG_LLHWC_CMN_CLR_TIMER_ERROR */

#if (USE_RT_DEBUG_LLHWC_LL_ISR == 1)
  RT_DEBUG_LLHWC_LL_ISR,
#endif /* USE_RT_DEBUG_LLHWC_LL_ISR */

#if (USE_RT_DEBUG_LLHWC_SPLTMR_SET == 1)
  RT_DEBUG_LLHWC_SPLTMR_SET,
#endif /* USE_RT_DEBUG_LLHWC_SPLTMR_SET */

#if (USE_RT_DEBUG_LLHWC_SPLTMR_GET == 1)
  RT_DEBUG_LLHWC_SPLTMR_GET,
#endif /* USE_RT_DEBUG_LLHWC_SPLTMR_GET */

#if (USE_RT_DEBUG_LLHWC_LOW_ISR == 1)
  RT_DEBUG_LLHWC_LOW_ISR,
#endif /* USE_RT_DEBUG_LLHWC_LOW_ISR */

#if (USE_RT_DEBUG_LLHWC_STOP_SCN == 1)
  RT_DEBUG_LLHWC_STOP_SCN,
#endif /* USE_RT_DEBUG_LLHWC_STOP_SCN */

#if (USE_RT_DEBUG_LLHWC_WAIT_ENVT_ON_AIR == 1)
  RT_DEBUG_LLHWC_WAIT_ENVT_ON_AIR,
#endif /* USE_RT_DEBUG_LLHWC_WAIT_ENVT_ON_AIR */

#if (USE_RT_DEBUG_LLHWC_SET_CONN_EVNT_PARAM == 1)
  RT_DEBUG_LLHWC_SET_CONN_EVNT_PARAM,
#endif /* USE_RT_DEBUG_LLHWC_SET_CONN_EVNT_PARAM */

#if (USE_RT_DEBUG_POST_EVNT == 1)
  RT_DEBUG_POST_EVNT,
#endif /* USE_RT_DEBUG_POST_EVNT */

#if (USE_RT_DEBUG_HNDL_ALL_EVNTS == 1)
  RT_DEBUG_HNDL_ALL_EVNTS,
#endif /* USE_RT_DEBUG_HNDL_ALL_EVNTS */

#if (USE_RT_DEBUG_PROCESS_EVNT == 1)
  RT_DEBUG_PROCESS_EVNT,
#endif /* USE_RT_DEBUG_PROCESS_EVNT */

#if (USE_RT_DEBUG_PROCESS_ISO_DATA == 1)
  RT_DEBUG_PROCESS_ISO_DATA,
#endif /* USE_RT_DEBUG_PROCESS_ISO_DATA */

#if (USE_RT_DEBUG_ALLOC_TX_ISO_EMPTY_PKT == 1)
  RT_DEBUG_ALLOC_TX_ISO_EMPTY_PKT,
#endif /* USE_RT_DEBUG_ALLOC_TX_ISO_EMPTY_PKT */

#if (USE_RT_DEBUG_BIG_FREE_EMPTY_PKTS == 1)
  RT_DEBUG_BIG_FREE_EMPTY_PKTS,
#endif /* USE_RT_DEBUG_BIG_FREE_EMPTY_PKTS */

#if (USE_RT_DEBUG_RECOMBINE_UNFRMD_DATA_OK == 1)
  RT_DEBUG_RECOMBINE_UNFRMD_DATA_OK,
#endif /* USE_RT_DEBUG_RECOMBINE_UNFRMD_DATA_OK */

#if (USE_RT_DEBUG_RECOMBINE_UNFRMD_DATA_CRC == 1)
  RT_DEBUG_RECOMBINE_UNFRMD_DATA_CRC,
#endif /* USE_RT_DEBUG_RECOMBINE_UNFRMD_DATA_CRC */

#if (USE_RT_DEBUG_RECOMBINE_UNFRMD_DATA_NoRX == 1)
  RT_DEBUG_RECOMBINE_UNFRMD_DATA_NoRX,
#endif /* USE_RT_DEBUG_RECOMBINE_UNFRMD_DATA_NoRX */

#if (USE_RT_DEBUG_RECOMBINE_UNFRMD_DATA_TRACE == 1)
  RT_DEBUG_RECOMBINE_UNFRMD_DATA_TRACE,
#endif /* USE_RT_DEBUG_RECOMBINE_UNFRMD_DATA_TRACE */

#if (USE_RT_DEBUG_ISO_HNDL_SDU == 1)
  RT_DEBUG_ISO_HNDL_SDU,
#endif /* USE_RT_DEBUG_ISO_HNDL_SDU */

#if (USE_RT_DEBUG_LL_INTF_INIT == 1)
  RT_DEBUG_LL_INTF_INIT,
#endif /* USE_RT_DEBUG_LL_INTF_INIT */

#if (USE_RT_DEBUG_DATA_TO_CNTRLR == 1)
  RT_DEBUG_DATA_TO_CNTRLR,
#endif /* USE_RT_DEBUG_DATA_TO_CNTRLR */

#if (USE_RT_DEBUG_FREE_LL_PKT_HNDLR == 1)
  RT_DEBUG_FREE_LL_PKT_HNDLR,
#endif /* USE_RT_DEBUG_FREE_LL_PKT_HNDLR */

#if (USE_RT_DEBUG_PHY_INIT_CLBR_TRACE == 1)
  RT_DEBUG_PHY_INIT_CLBR_TRACE,
#endif /* USE_RT_DEBUG_PHY_INIT_CLBR_TRACE */

#if (USE_RT_DEBUG_PHY_INIT_CLBR_SINGLE_CH == 1)
  RT_DEBUG_PHY_INIT_CLBR_SINGLE_CH,
#endif /* USE_RT_DEBUG_PHY_INIT_CLBR_SINGLE_CH */

#if (USE_RT_DEBUG_PHY_CLBR_STRTD == 1)
  RT_DEBUG_PHY_CLBR_STRTD,
#endif /* USE_RT_DEBUG_PHY_CLBR_STRTD */

#if (USE_RT_DEBUG_PHY_CLBR_EXEC == 1)
  RT_DEBUG_PHY_CLBR_EXEC,
#endif /* USE_RT_DEBUG_PHY_CLBR_EXEC */

#if (USE_RT_DEBUG_RCO_STRT_STOP_RUNTIME_CLBR_ACTV == 1)
  RT_DEBUG_RCO_STRT_STOP_RUNTIME_CLBR_ACTV,
#endif /* USE_RT_DEBUG_RCO_STRT_STOP_RUNTIME_CLBR_ACTV */

#if (USE_RT_DEBUG_RCO_STRT_STOP_RUNTIME_RCO_CLBR == 1)
  RT_DEBUG_RCO_STRT_STOP_RUNTIME_RCO_CLBR,
#endif /* USE_RT_DEBUG_RCO_STRT_STOP_RUNTIME_RCO_CLBR */

#if (USE_RT_DEBUG_STRT_STOP_RUNTIME_RCO_CLBR_SWT == 1)
  RT_DEBUG_STRT_STOP_RUNTIME_RCO_CLBR_SWT,
#endif /* USE_RT_DEBUG_STRT_STOP_RUNTIME_RCO_CLBR_SWT */

#if (USE_RT_DEBUG_STRT_STOP_RUNTIME_RCO_CLBR_TRACE == 1)
  RT_DEBUG_STRT_STOP_RUNTIME_RCO_CLBR_TRACE,
#endif /* USE_RT_DEBUG_STRT_STOP_RUNTIME_RCO_CLBR_TRACE */

#if (USE_RT_DEBUG_RCO_ISR_TRACE == 1)
  RT_DEBUG_RCO_ISR_TRACE,
#endif /* USE_RT_DEBUG_RCO_ISR_TRACE */

#if (USE_RT_DEBUG_RCO_ISR_COMPENDATE == 1)
  RT_DEBUG_RCO_ISR_COMPENDATE,
#endif /* USE_RT_DEBUG_RCO_ISR_COMPENDATE */

#if (USE_RT_DEBUG_RAL_STRT_TX == 1)
  RT_DEBUG_RAL_STRT_TX,
#endif /* USE_RT_DEBUG_RAL_STRT_TX */

#if (USE_RT_DEBUG_RAL_ISR_TIMER_ERROR == 1)
  RT_DEBUG_RAL_ISR_TIMER_ERROR,
#endif /* USE_RT_DEBUG_RAL_ISR_TIMER_ERROR */

#if (USE_RT_DEBUG_RAL_ISR_TRACE == 1)
  RT_DEBUG_RAL_ISR_TRACE,
#endif /* USE_RT_DEBUG_RAL_ISR_TRACE */

#if (USE_RT_DEBUG_RAL_STOP_OPRTN == 1)
  RT_DEBUG_RAL_STOP_OPRTN,
#endif /* USE_RT_DEBUG_RAL_STOP_OPRTN */

#if (USE_RT_DEBUG_RAL_STRT_RX == 1)
  RT_DEBUG_RAL_STRT_RX,
#endif /* USE_RT_DEBUG_RAL_STRT_RX */

#if (USE_RT_DEBUG_RAL_DONE_CLBK_TX == 1)
  RT_DEBUG_RAL_DONE_CLBK_TX,
#endif /* USE_RT_DEBUG_RAL_DONE_CLBK_TX */

#if (USE_RT_DEBUG_RAL_DONE_CLBK_RX == 1)
  RT_DEBUG_RAL_DONE_CLBK_RX,
#endif /* USE_RT_DEBUG_RAL_DONE_CLBK_RX */

#if (USE_RT_DEBUG_RAL_DONE_CLBK_ED == 1)
  RT_DEBUG_RAL_DONE_CLBK_ED,
#endif /* USE_RT_DEBUG_RAL_DONE_CLBK_ED */

#if (USE_RT_DEBUG_RAL_ED_SCAN == 1)
  RT_DEBUG_RAL_ED_SCAN,
#endif /* USE_RT_DEBUG_RAL_ED_SCAN */

#if (USE_RT_DEBUG_ERROR_MEM_CAP_EXCED == 1)
  RT_DEBUG_ERROR_MEM_CAP_EXCED,
#endif /* USE_RT_DEBUG_ERROR_MEM_CAP_EXCED */

#if (USE_RT_DEBUG_ERROR_COMMAND_DISALLOWED == 1)
  RT_DEBUG_ERROR_COMMAND_DISALLOWED,
#endif /* USE_RT_DEBUG_ERROR_COMMAND_DISALLOWED */

#if (USE_RT_DEBUG_PTA_INIT == 1)
  RT_DEBUG_PTA_INIT,
#endif /* USE_RT_DEBUG_PTA_INIT */

#if (USE_RT_DEBUG_PTA_EN == 1)
  RT_DEBUG_PTA_EN,
#endif /* USE_RT_DEBUG_PTA_EN */

#if (USE_RT_DEBUG_LLHWC_PTA_SET_EN == 1)
  RT_DEBUG_LLHWC_PTA_SET_EN,
#endif /* USE_RT_DEBUG_LLHWC_PTA_SET_EN */

#if (USE_RT_DEBUG_LLHWC_PTA_SET_PARAMS == 1)
  RT_DEBUG_LLHWC_PTA_SET_PARAMS,
#endif /* USE_RT_DEBUG_LLHWC_PTA_SET_PARAMS */

#if (USE_RT_DEBUG_COEX_STRT_ON_IDLE == 1)
  RT_DEBUG_COEX_STRT_ON_IDLE,
#endif /* USE_RT_DEBUG_COEX_STRT_ON_IDLE */

#if (USE_RT_DEBUG_COEX_ASK_FOR_AIR == 1)
  RT_DEBUG_COEX_ASK_FOR_AIR,
#endif /* USE_RT_DEBUG_COEX_ASK_FOR_AIR */

#if (USE_RT_DEBUG_COEX_TIMER_EVNT_CLBK == 1)
  RT_DEBUG_COEX_TIMER_EVNT_CLBK,
#endif /* USE_RT_DEBUG_COEX_TIMER_EVNT_CLBK */

#if (USE_RT_DEBUG_COEX_STRT_ONE_SHOT == 1)
  RT_DEBUG_COEX_STRT_ONE_SHOT,
#endif /* USE_RT_DEBUG_COEX_STRT_ONE_SHOT */

#if (USE_RT_DEBUG_COEX_FORCE_STOP_RX == 1)
  RT_DEBUG_COEX_FORCE_STOP_RX,
#endif /* USE_RT_DEBUG_COEX_FORCE_STOP_RX */

#if (USE_RT_DEBUG_LLHWC_ADV_DONE == 1)
  RT_DEBUG_LLHWC_ADV_DONE,
#endif /* USE_RT_DEBUG_LLHWC_ADV_DONE */

#if (USE_RT_DEBUG_LLHWC_SCN_DONE == 1)
  RT_DEBUG_LLHWC_SCN_DONE,
#endif /* USE_RT_DEBUG_LLHWC_SCN_DONE */

#if (USE_RT_DEBUG_LLHWC_INIT_DONE == 1)
  RT_DEBUG_LLHWC_INIT_DONE,
#endif /* USE_RT_DEBUG_LLHWC_INIT_DONE */

#if (USE_RT_DEBUG_LLHWC_CONN_DONE == 1)
  RT_DEBUG_LLHWC_CONN_DONE,
#endif /* USE_RT_DEBUG_LLHWC_CONN_DONE */

#if (USE_RT_DEBUG_LLHWC_CIG_DONE == 1)
  RT_DEBUG_LLHWC_CIG_DONE,
#endif /* USE_RT_DEBUG_LLHWC_CIG_DONE */

#if (USE_RT_DEBUG_LLHWC_BIG_DONE == 1)
  RT_DEBUG_LLHWC_BIG_DONE,
#endif /* USE_RT_DEBUG_LLHWC_BIG_DONE */

#if (USE_RT_DEBUG_OS_TMR_CREATE == 1)
  RT_DEBUG_OS_TMR_CREATE,
#endif /* USE_RT_DEBUG_OS_TMR_CREATE */

#if (USE_RT_DEBUG_ADV_EXT_TIMEOUT_CBK == 1)
  RT_DEBUG_ADV_EXT_TIMEOUT_CBK,
#endif /* USE_RT_DEBUG_ADV_EXT_TIMEOUT_CBK */

#if (USE_RT_DEBUG_ADV_EXT_SCN_DUR_CBK == 1)
  RT_DEBUG_ADV_EXT_SCN_DUR_CBK,
#endif /* USE_RT_DEBUG_ADV_EXT_SCN_DUR_CBK */

#if (USE_RT_DEBUG_ADV_EXT_SCN_PERIOD_CBK == 1)
  RT_DEBUG_ADV_EXT_SCN_PERIOD_CBK,
#endif /* USE_RT_DEBUG_ADV_EXT_SCN_PERIOD_CBK */

#if (USE_RT_DEBUG_ADV_EXT_PRDC_SCN_TIMEOUT_CBK == 1)
  RT_DEBUG_ADV_EXT_PRDC_SCN_TIMEOUT_CBK,
#endif /* USE_RT_DEBUG_ADV_EXT_PRDC_SCN_TIMEOUT_CBK */

#if (USE_RT_DEBUG_BIS_SYNC_TIMEOUT_TMR_CBK == 1)
  RT_DEBUG_BIS_SYNC_TIMEOUT_TMR_CBK,
#endif /* USE_RT_DEBUG_BIS_SYNC_TIMEOUT_TMR_CBK */

#if (USE_RT_DEBUG_BIS_TERM_TMR_CBK == 1)
  RT_DEBUG_BIS_TERM_TMR_CBK,
#endif /* USE_RT_DEBUG_BIS_TERM_TMR_CBK */

#if (USE_RT_DEBUG_BIS_TST_MODE_CBK == 1)
  RT_DEBUG_BIS_TST_MODE_CBK,
#endif /* USE_RT_DEBUG_BIS_TST_MODE_CBK */

#if (USE_RT_DEBUG_BIS_TST_MODE_TMR_CBK == 1)
  RT_DEBUG_BIS_TST_MODE_TMR_CBK,
#endif /* USE_RT_DEBUG_BIS_TST_MODE_TMR_CBK */

#if (USE_RT_DEBUG_ISO_POST_TMR_CBK == 1)
  RT_DEBUG_ISO_POST_TMR_CBK,
#endif /* USE_RT_DEBUG_ISO_POST_TMR_CBK */

#if (USE_RT_DEBUG_ISO_TST_MODE_TMR_CBK == 1)
  RT_DEBUG_ISO_TST_MODE_TMR_CBK,
#endif /* USE_RT_DEBUG_ISO_TST_MODE_TMR_CBK */

#if (USE_RT_DEBUG_CONN_POST_TMR_CBK == 1)
  RT_DEBUG_CONN_POST_TMR_CBK,
#endif /* USE_RT_DEBUG_CONN_POST_TMR_CBK */

#if (USE_RT_DEBUG_EVNT_SCHDLR_TMR_CBK == 1)
  RT_DEBUG_EVNT_SCHDLR_TMR_CBK,
#endif /* USE_RT_DEBUG_EVNT_SCHDLR_TMR_CBK */

#if (USE_RT_DEBUG_HCI_POST_TMR_CBK == 1)
  RT_DEBUG_HCI_POST_TMR_CBK,
#endif /* USE_RT_DEBUG_HCI_POST_TMR_CBK */

#if (USE_RT_DEBUG_LLCP_POST_TMR_CBK == 1)
  RT_DEBUG_LLCP_POST_TMR_CBK,
#endif /* USE_RT_DEBUG_LLCP_POST_TMR_CBK */

#if (USE_RT_DEBUG_LLHWC_ENRGY_DETECT_CBK == 1)
  RT_DEBUG_LLHWC_ENRGY_DETECT_CBK,
#endif /* USE_RT_DEBUG_LLHWC_ENRGY_DETECT_CBK */

#if (USE_RT_DEBUG_PRVCY_POST_TMR_CBK == 1)
  RT_DEBUG_PRVCY_POST_TMR_CBK,
#endif /* USE_RT_DEBUG_PRVCY_POST_TMR_CBK */

#if (USE_RT_DEBUG_ANT_PRPR_TMR_CBK == 1)
  RT_DEBUG_ANT_PRPR_TMR_CBK,
#endif /* USE_RT_DEBUG_ANT_PRPR_TMR_CBK */

#if (USE_RT_DEBUG_COEX_TMR_FRC_STOP_AIR_GRANT_CBK == 1)
  RT_DEBUG_COEX_TMR_FRC_STOP_AIR_GRANT_CBK,
#endif /* USE_RT_DEBUG_COEX_TMR_FRC_STOP_AIR_GRANT_CBK */

#if (USE_RT_DEBUG_MLME_RX_EN_TMR_CBK == 1)
  RT_DEBUG_MLME_RX_EN_TMR_CBK,
#endif /* USE_RT_DEBUG_MLME_RX_EN_TMR_CBK */

#if (USE_RT_DEBUG_MLME_GNRC_TMR_CBK == 1)
  RT_DEBUG_MLME_GNRC_TMR_CBK,
#endif /* USE_RT_DEBUG_MLME_GNRC_TMR_CBK */

#if (USE_RT_DEBUG_MIB_JOIN_LST_TMR_CBK == 1)
  RT_DEBUG_MIB_JOIN_LST_TMR_CBK,
#endif /* USE_RT_DEBUG_MIB_JOIN_LST_TMR_CBK */

#if (USE_RT_DEBUG_MLME_PWR_PRES_TMR_CBK == 1)
  RT_DEBUG_MLME_PWR_PRES_TMR_CBK,
#endif /* USE_RT_DEBUG_MLME_PWR_PRES_TMR_CBK */

#if (USE_RT_DEBUG_PRESISTENCE_TMR_CBK == 1)
  RT_DEBUG_PRESISTENCE_TMR_CBK,
#endif /* USE_RT_DEBUG_PRESISTENCE_TMR_CBK */

#if (USE_RT_DEBUG_RADIO_PHY_PRDC_CLBK_TMR_CBK == 1)
  RT_DEBUG_RADIO_PHY_PRDC_CLBK_TMR_CBK,
#endif /* USE_RT_DEBUG_RADIO_PHY_PRDC_CLBK_TMR_CBK */

#if (USE_RT_DEBUG_RADIO_CSMA_TMR_CBK == 1)
  RT_DEBUG_RADIO_CSMA_TMR_CBK,
#endif /* USE_RT_DEBUG_RADIO_CSMA_TMR_CBK */

#if (USE_RT_DEBUG_RADIO_CSL_RCV_TMR_CBK == 1)
  RT_DEBUG_RADIO_CSL_RCV_TMR_CBK,
#endif /* USE_RT_DEBUG_RADIO_CSL_RCV_TMR_CBK */

#if (USE_RT_DEBUG_ED_TMR_CBK == 1)
  RT_DEBUG_ED_TMR_CBK,
#endif /* USE_RT_DEBUG_ED_TMR_CBK */

#if (USE_RT_DEBUG_DIO_EXT_TMR_CBK == 1)
  RT_DEBUG_DIO_EXT_TMR_CBK,
#endif /* USE_RT_DEBUG_DIO_EXT_TMR_CBK */

#if (USE_RT_DEBUG_RCO_CLBR_TMR_CBK == 1)
  RT_DEBUG_RCO_CLBR_TMR_CBK,
#endif /* USE_RT_DEBUG_RCO_CLBR_TMR_CBK */

#if (USE_RT_DEBUG_ADV_EXT_MNGR_ADV_CBK == 1)
  RT_DEBUG_ADV_EXT_MNGR_ADV_CBK,
#endif /* USE_RT_DEBUG_ADV_EXT_MNGR_ADV_CBK */

#if (USE_RT_DEBUG_ADV_EXT_MNGR_SCN_CBK == 1)
  RT_DEBUG_ADV_EXT_MNGR_SCN_CBK,
#endif /* USE_RT_DEBUG_ADV_EXT_MNGR_SCN_CBK */

#if (USE_RT_DEBUG_ADV_EXT_MNGR_SCN_ERR_CBK == 1)
  RT_DEBUG_ADV_EXT_MNGR_SCN_ERR_CBK,
#endif /* USE_RT_DEBUG_ADV_EXT_MNGR_SCN_ERR_CBK */

#if (USE_RT_DEBUG_ADV_EXT_MNGR_PRDC_SCN_CBK == 1)
  RT_DEBUG_ADV_EXT_MNGR_PRDC_SCN_CBK,
#endif /* USE_RT_DEBUG_ADV_EXT_MNGR_PRDC_SCN_CBK */

#if (USE_RT_DEBUG_ADV_EXT_MNGR_PRDC_SCN_ERR_CBK == 1)
  RT_DEBUG_ADV_EXT_MNGR_PRDC_SCN_ERR_CBK,
#endif /* USE_RT_DEBUG_ADV_EXT_MNGR_PRDC_SCN_ERR_CBK */

#if (USE_RT_DEBUG_BIG_ADV_CBK == 1)
  RT_DEBUG_BIG_ADV_CBK,
#endif /* USE_RT_DEBUG_BIG_ADV_CBK */

#if (USE_RT_DEBUG_BIG_ADV_ERR_CBK == 1)
  RT_DEBUG_BIG_ADV_ERR_CBK,
#endif /* USE_RT_DEBUG_BIG_ADV_ERR_CBK */

#if (USE_RT_DEBUG_BIG_SYNC_CBK == 1)
  RT_DEBUG_BIG_SYNC_CBK,
#endif /* USE_RT_DEBUG_BIG_SYNC_CBK */

#if (USE_RT_DEBUG_BIG_SYNC_ERR_CBK == 1)
  RT_DEBUG_BIG_SYNC_ERR_CBK,
#endif /* USE_RT_DEBUG_BIG_SYNC_ERR_CBK */

#if (USE_RT_DEBUG_ISO_CIS_PKT_TRNSM_RECEIVED_CBK == 1)
  RT_DEBUG_ISO_CIS_PKT_TRNSM_RECEIVED_CBK,
#endif /* USE_RT_DEBUG_ISO_CIS_PKT_TRNSM_RECEIVED_CBK */

#if (USE_RT_DEBUG_ISO_CIG_ERR_CBK == 1)
  RT_DEBUG_ISO_CIG_ERR_CBK,
#endif /* USE_RT_DEBUG_ISO_CIG_ERR_CBK */

#if (USE_RT_DEBUG_CONN_PKT_TRNSM_RECEIVED_CBK == 1)
  RT_DEBUG_CONN_PKT_TRNSM_RECEIVED_CBK,
#endif /* USE_RT_DEBUG_CONN_PKT_TRNSM_RECEIVED_CBK */

#if (USE_RT_DEBUG_PRDC_CLBR_EXTRL_CBK == 1)
  RT_DEBUG_PRDC_CLBR_EXTRL_CBK,
#endif /* USE_RT_DEBUG_PRDC_CLBR_EXTRL_CBK */

#if (USE_RT_DEBUG_PTR_PRDC_ADV_SYNC_CBK == 1)
  RT_DEBUG_PTR_PRDC_ADV_SYNC_CBK,
#endif /* USE_RT_DEBUG_PTR_PRDC_ADV_SYNC_CBK */

#if (USE_RT_DEBUG_NCONN_SCN_CBK == 1)
  RT_DEBUG_NCONN_SCN_CBK,
#endif /* USE_RT_DEBUG_NCONN_SCN_CBK */

#if (USE_RT_DEBUG_NCONN_ADV_CBK == 1)
  RT_DEBUG_NCONN_ADV_CBK,
#endif /* USE_RT_DEBUG_NCONN_ADV_CBK */

#if (USE_RT_DEBUG_NCONN_INIT_CBK == 1)
  RT_DEBUG_NCONN_INIT_CBK,
#endif /* USE_RT_DEBUG_NCONN_INIT_CBK */

#if (USE_RT_DEBUG_ANT_RADIO_CMPLT_EVNT_CBK == 1)
  RT_DEBUG_ANT_RADIO_CMPLT_EVNT_CBK,
#endif /* USE_RT_DEBUG_ANT_RADIO_CMPLT_EVNT_CBK */

#if (USE_RT_DEBUG_ANT_STACK_EVNT_CBK == 1)
  RT_DEBUG_ANT_STACK_EVNT_CBK,
#endif /* USE_RT_DEBUG_ANT_STACK_EVNT_CBK */

#if (USE_RT_DEBUG_ADV_EXT_PROCESS_TMOUT_EVNT_CBK == 1)
  RT_DEBUG_ADV_EXT_PROCESS_TMOUT_EVNT_CBK,
#endif /* USE_RT_DEBUG_ADV_EXT_PROCESS_TMOUT_EVNT_CBK */

#if (USE_RT_DEBUG_ADV_EXT_MNGR_SCN_DUR_EVNT == 1)
  RT_DEBUG_ADV_EXT_MNGR_SCN_DUR_EVNT,
#endif /* USE_RT_DEBUG_ADV_EXT_MNGR_SCN_DUR_EVNT */

#if (USE_RT_DEBUG_ADV_EXT_MNGR_SCN_PERIODIC_EVNT == 1)
  RT_DEBUG_ADV_EXT_MNGR_SCN_PERIODIC_EVNT,
#endif /* USE_RT_DEBUG_ADV_EXT_MNGR_SCN_PERIODIC_EVNT */

#if (USE_RT_DEBUG_ADV_EXT_MNGR_PRDC_SCN_TMOUT_EVNT == 1)
  RT_DEBUG_ADV_EXT_MNGR_PRDC_SCN_TMOUT_EVNT,
#endif /* USE_RT_DEBUG_ADV_EXT_MNGR_PRDC_SCN_TMOUT_EVNT */

#if (USE_RT_DEBUG_ADV_EXT_MNGR_PRDC_SCN_CNCEL_EVNT == 1)
  RT_DEBUG_ADV_EXT_MNGR_PRDC_SCN_CNCEL_EVNT,
#endif /* USE_RT_DEBUG_ADV_EXT_MNGR_PRDC_SCN_CNCEL_EVNT */

#if (USE_RT_DEBUG_BIS_MNGR_BIG_TERM_CBK == 1)
  RT_DEBUG_BIS_MNGR_BIG_TERM_CBK,
#endif /* USE_RT_DEBUG_BIS_MNGR_BIG_TERM_CBK */

#if (USE_RT_DEBUG_BIS_MNGR_SYNC_TMOUT_CBK == 1)
  RT_DEBUG_BIS_MNGR_SYNC_TMOUT_CBK,
#endif /* USE_RT_DEBUG_BIS_MNGR_SYNC_TMOUT_CBK */

#if (USE_RT_DEBUG_ISOAL_MNGR_SDU_GEN == 1)
  RT_DEBUG_ISOAL_MNGR_SDU_GEN,
#endif /* USE_RT_DEBUG_ISOAL_MNGR_SDU_GEN */

#if (USE_RT_DEBUG_ISO_MNGR_CIS_PROCESS_EVNT_CBK == 1)
  RT_DEBUG_ISO_MNGR_CIS_PROCESS_EVNT_CBK,
#endif /* USE_RT_DEBUG_ISO_MNGR_CIS_PROCESS_EVNT_CBK */

#if (USE_RT_DEBUG_CONN_MNGR_PROCESS_EVNT_CLBK == 1)
  RT_DEBUG_CONN_MNGR_PROCESS_EVNT_CLBK,
#endif /* USE_RT_DEBUG_CONN_MNGR_PROCESS_EVNT_CLBK */

#if (USE_RT_DEBUG_CONN_MNGR_UPDT_CONN_PARAM_CBK == 1)
  RT_DEBUG_CONN_MNGR_UPDT_CONN_PARAM_CBK,
#endif /* USE_RT_DEBUG_CONN_MNGR_UPDT_CONN_PARAM_CBK */

#if (USE_RT_DEBUG_EVNT_SCHDLR_HW_EVNT_CMPLT == 1)
  RT_DEBUG_EVNT_SCHDLR_HW_EVNT_CMPLT,
#endif /* USE_RT_DEBUG_EVNT_SCHDLR_HW_EVNT_CMPLT */

#if (USE_RT_DEBUG_HCI_EVENT_HNDLR == 1)
  RT_DEBUG_HCI_EVENT_HNDLR,
#endif /* USE_RT_DEBUG_HCI_EVENT_HNDLR */

#if (USE_RT_DEBUG_MLME_TMRS_CBK == 1)
  RT_DEBUG_MLME_TMRS_CBK,
#endif /* USE_RT_DEBUG_MLME_TMRS_CBK */

#if (USE_RT_DEBUG_DIRECT_TX_EVNT_CBK == 1)
  RT_DEBUG_DIRECT_TX_EVNT_CBK,
#endif /* USE_RT_DEBUG_DIRECT_TX_EVNT_CBK */

#if (USE_RT_DEBUG_INDIRECT_PKT_TOUR_CBK == 1)
  RT_DEBUG_INDIRECT_PKT_TOUR_CBK,
#endif /* USE_RT_DEBUG_INDIRECT_PKT_TOUR_CBK */

#if (USE_RT_DEBUG_RADIO_CSMA_TMR == 1)
  RT_DEBUG_RADIO_CSMA_TMR,
#endif /* USE_RT_DEBUG_RADIO_CSMA_TMR */

#if (USE_RT_DEBUG_RAL_SM_DONE_EVNT_CBK == 1)
  RT_DEBUG_RAL_SM_DONE_EVNT_CBK,
#endif /* USE_RT_DEBUG_RAL_SM_DONE_EVNT_CBK */

#if (USE_RT_DEBUG_ED_TMR_HNDL == 1)
  RT_DEBUG_ED_TMR_HNDL,
#endif /* USE_RT_DEBUG_ED_TMR_HNDL */

#if (USE_RT_DEBUG_OS_TMR_EVNT_CBK == 1)
  RT_DEBUG_OS_TMR_EVNT_CBK,
#endif /* USE_RT_DEBUG_OS_TMR_EVNT_CBK */

#include "app_debug_signal_def.h"

  RT_DEBUG_SIGNALS_TOTAL_NUM
} rt_debug_signal_t;

#endif /* RT_DEBUG_GPIO_MODULE */

#endif /* DEBUG_SIGNALS_H */
