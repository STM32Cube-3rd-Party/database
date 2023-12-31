[#ftl]
/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file    app_sys.h
  * @author  MCD Application Team
  * @brief   Header for app_sys.c
  ******************************************************************************
[@common.optinclude name=mxTmpFolder+"/license.tmp"/][#--include License text --]
  ******************************************************************************
  */
/* USER CODE END Header */
#ifndef APP_SYS_H
#define APP_SYS_H

/*
 * high ceil for standby exit -> 500us in theory NOTE: Minimum value for UTIL Timer is 1ms
 * high ceil for radio exit deep sleep -> 300us
 * high ceil for radio entry deep ceil -> 50us
 */
#define RADIO_DEEPSLEEP_WAKEUP_TIME_US (1500)

void APP_SYS_BLE_EnterDeepSleep(void);

void APP_SYS_LinkLayer_BackgroundProcessInit(void);

#endif /* APP_SYS_H */
