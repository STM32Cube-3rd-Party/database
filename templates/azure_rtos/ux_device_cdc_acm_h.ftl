[#ftl]
/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file    ux_device_cdc_acm.h
  * @author  MCD Application Team
  * @brief   USBX Device CDC ACM interface header file
  ******************************************************************************
  [@common.optinclude name=mxTmpFolder+"/license.tmp"/][#--include License text --]
  ******************************************************************************
  */
/* USER CODE END Header */
/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __UX_DEVICE_CDC_ACM_H__
#define __UX_DEVICE_CDC_ACM_H__

#ifdef __cplusplus
extern "C" {
#endif

/* Includes ------------------------------------------------------------------*/
#include "ux_api.h"
#include "ux_device_class_cdc_acm.h"
[#compress]
[#list SWIPdatas as SWIP]
[#if SWIP.defines??]
  [#list SWIP.defines as definition]
    [#assign value = definition.value]
    [#assign name = definition.name]
    [#if name == "REG_UX_DEVICE_CDC_ACM"]
      [#assign REG_UX_DEVICE_CDC_ACM_value = value]
    [/#if]
   [/#list]
[/#if]
[/#list]
[/#compress]

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */

/* USER CODE END Includes */

/* Exported types ------------------------------------------------------------*/
/* USER CODE BEGIN ET */

/* USER CODE END ET */

/* Exported constants --------------------------------------------------------*/
/* USER CODE BEGIN EC */

/* USER CODE END EC */

/* Exported macro ------------------------------------------------------------*/
/* USER CODE BEGIN EM */

/* USER CODE END EM */

/* Exported functions prototypes ---------------------------------------------*/
[#if REG_UX_DEVICE_CDC_ACM_value == "1"]
VOID USBD_CDC_ACM_Activate(VOID *cdc_acm_instance);
VOID USBD_CDC_ACM_Deactivate(VOID *cdc_acm_instance);
VOID USBD_CDC_ACM_ParameterChange(VOID *cdc_acm_instance);

[/#if]
/* USER CODE BEGIN EFP */

/* USER CODE END EFP */

/* Private defines -----------------------------------------------------------*/
/* USER CODE BEGIN PD */

/* USER CODE END PD */

/* USER CODE BEGIN 1 */

/* USER CODE END 1 */

#ifdef __cplusplus
}
#endif
#endif  /* __UX_DEVICE_CDC_ACM_H__ */
