[#ftl]
/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file    radio_board_if.h
  * @author  MCD Application Team
  * @brief   Header for Radio interface configuration
  ******************************************************************************
[@common.optinclude name=mxTmpFolder+"/license.tmp"/][#--include License text --]
  ******************************************************************************
  */
/* USER CODE END Header */
[#--
[#if SWIPdatas??]
    [#list SWIPdatas as SWIP]
        [#if SWIP.defines??]
            [#list SWIP.defines as definition]
                ${definition.name}: ${definition.value}
            [/#list]
        [/#if]
    [/#list]
[/#if]
--]
[#assign Activate_RADIO_BOARD_INTERFACE = ""]
[#assign IS_TCXO_SUPPORTED="1"]
[#assign IS_DCDC_SUPPORTED="1"]
[#assign TX_RFO_CONFIG="RBI_CONF_RFO_LP_HP"]
[#assign STM32WL5MXX = "false"]
[#if SWIPdatas??]
    [#list SWIPdatas as SWIP]
        [#if SWIP.defines??]
            [#list SWIP.defines as definition]
                [#assign value = definition.value]
                [#if definition.name == "Activate_RADIO_BOARD_INTERFACE"]
                    [#assign Activate_RADIO_BOARD_INTERFACE = definition.value]
                [/#if]
                [#if definition.name == "IS_TCXO_SUPPORTED"]
                    [#if definition.value == "false"]
                        [#assign IS_TCXO_SUPPORTED = "0"]
                    [/#if]
                [/#if]
                [#if definition.name == "IS_DCDC_SUPPORTED"]
                    [#if definition.value == "false"]
                        [#assign IS_DCDC_SUPPORTED = "0"]
                    [/#if]
                [/#if]
                [#if definition.name == "TX_RFO_CONFIG"]
                    [#assign TX_RFO_CONFIG = definition.value]
                    [#if definition.value == "valueNotSetted"]
                        [#assign TX_RFO_CONFIG = "RBI_CONF_RFO_LP_HP"]
                    [/#if]
                [/#if]
                [#if definition.name == "STM32WL5MXX"]
                    [#assign STM32WL5MXX = definition.value]
                [/#if]
            [/#list]
        [/#if]
    [/#list]
[/#if]

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef RADIO_BOARD_IF_H
#define RADIO_BOARD_IF_H

#ifdef __cplusplus
extern "C" {
#endif

/* Includes ------------------------------------------------------------------*/
#include "platform.h"
/* USER CODE BEGIN include */

/* USER CODE END include */

/* Exported defines ----------------------------------------------------------*/
[#if STM32WL5MXX=="false"]
[#if (Activate_RADIO_BOARD_INTERFACE =="NucleoPseudo")]
/* USER CODE BEGIN SelectPseudoDriver Definition */
#define MX_NUCLEO_WL55JC1
/* USER CODE END SelectPseudoDriver Definition */

[/#if]
[#-- LOW LEVEL CONFIG FOR BSP DRIVER --]
#if defined(USE_BSP_DRIVER)
/* code generated by STM32CubeMX does not support BSP */
/* In order to use BSP driver, add the correspondent files in the IDE workspace */
/* and define USE_BSP_DRIVER in the preprocessor definitions  or in platform.h */
#define RBI_CONF_RFO_LP_HP  RADIO_CONF_RFO_LP_HP
#define RBI_CONF_RFO_LP     RADIO_CONF_RFO_LP
#define RBI_CONF_RFO_HP     RADIO_CONF_RFO_HP
[#-- LOW LEVEL CONFIG FOR USER BOARD DEFINITION --]
#else
/* USER CODE BEGIN Board Definition */

/* USER CODE END Board Definition */
#define RBI_CONF_RFO_LP_HP  0
#define RBI_CONF_RFO_LP     1
#define RBI_CONF_RFO_HP     2
/* USER CODE BEGIN Board Definition_2 */

/* USER CODE END Board Definition_2 */
#endif  /* USE_BSP_DRIVER  */

[#-- LOW LEVEL CONFIG FOR BSP DRIVER --]
#if defined(USE_BSP_DRIVER)
/* code generated by STM32CubeMX does not support BSP */
/* In order to use BSP driver, add the correspondent files in the IDE workspace */
/* and define USE_BSP_DRIVER in the preprocessor definitions  or in platform.h */

[#-- LOW LEVEL CONFIG FOR USER BOARD DEFINITION --]
#else
/* USER CODE BEGIN Exported Parameters */

/* USER CODE END Exported Parameters */
/* Indicates the type of switch between the ones proposed by CONFIG Constants
 */
#define RBI_CONF_RFO                        ${TX_RFO_CONFIG}

/* Indicates whether or not TCXO is supported by the board
 * 0: TCXO not supported
 * 1: TCXO supported
 */
#define IS_TCXO_SUPPORTED                   ${IS_TCXO_SUPPORTED}U

/* Indicates whether or not DCDC is supported by the board
 * 0: DCDC not supported
 * 1: DCDC supported
 */
#define IS_DCDC_SUPPORTED                   ${IS_DCDC_SUPPORTED}U

/* USER CODE BEGIN Exported Parameters_2 */

/* USER CODE END Exported Parameters_2 */
#endif  /* USE_BSP_DRIVER  */

[#-- PIN MAPPING FOR BSP DRIVER --]
#if defined(USE_BSP_DRIVER)
/* code generated by STM32CubeMX does not support BSP */
/* In order to use BSP driver, add the correspondent files in the IDE workspace */
/* and define USE_BSP_DRIVER in the preprocessor definitions  or in platform.h */

[#-- PIN MAPPING NUCLEO --]
[#if (Activate_RADIO_BOARD_INTERFACE =="NucleoPseudo")]
#elif defined(MX_NUCLEO_WL55JC1)

#define RF_SW_CTRL3_PIN                          GPIO_PIN_3
#define RF_SW_CTRL3_GPIO_PORT                    GPIOC
#define RF_SW_CTRL3_GPIO_CLK_ENABLE()            __HAL_RCC_GPIOC_CLK_ENABLE()
#define RF_SW_CTRL3_GPIO_CLK_DISABLE()           __HAL_RCC_GPIOC_CLK_DISABLE()

#define RF_SW_CTRL1_PIN                          GPIO_PIN_4
#define RF_SW_CTRL1_GPIO_PORT                    GPIOC
#define RF_SW_CTRL1_GPIO_CLK_ENABLE()            __HAL_RCC_GPIOC_CLK_ENABLE()
#define RF_SW_RX_GPIO_CLK_DISABLE()              __HAL_RCC_GPIOC_CLK_DISABLE()

#define RF_SW_CTRL2_PIN                          GPIO_PIN_5
#define RF_SW_CTRL2_GPIO_PORT                    GPIOC
#define RF_SW_CTRL2_GPIO_CLK_ENABLE()            __HAL_RCC_GPIOC_CLK_ENABLE()
#define RF_SW_CTRL2_GPIO_CLK_DISABLE()           __HAL_RCC_GPIOC_CLK_DISABLE()

/* To be checked vs TCXO management in RCC config */
#define RF_TCXO_VCC_PIN                          GPIO_PIN_0
#define RF_TCXO_VCC_GPIO_PORT                    GPIOB
#define RF_TCXO_VCC_CLK_ENABLE()                 __HAL_RCC_GPIOB_CLK_ENABLE()
#define RF_TCXO_VCC_CLK_DISABLE()                __HAL_RCC_GPIOB_CLK_DISABLE()
[/#if]
[#-- PIN MAPPING FOR USER BOARD --]
#else
/* USER CODE BEGIN Exported PinMapping */
#warning user to provide its board definitions pins
/* USER CODE END Exported PinMapping */
#endif  /* USE_BSP_DRIVER  */
[#else][#--  STM32WL5MXX --]
/* USER CODE BEGIN Board Definition */

/* USER CODE END Board Definition */
#define RBI_CONF_RFO_LP_HP  0
#define RBI_CONF_RFO_LP     1
#define RBI_CONF_RFO_HP     2
[/#if][#--  STM32WL5MXX --]

/* USER CODE BEGIN ED */

/* USER CODE END ED */

/* Exported types ------------------------------------------------------------*/

[#-- EXPORTED TYPES FOR BSP DRIVER --]
[#if STM32WL5MXX=="false"]
#if defined(USE_BSP_DRIVER)
/* code generated by STM32CubeMX does not support BSP */
/* In order to use BSP driver, add the correspondent files in the IDE workspace */
/* and define USE_BSP_DRIVER in the preprocessor definitions  or in platform.h */
typedef enum
{
  RBI_SWITCH_OFF    = RADIO_SWITCH_OFF,
  RBI_SWITCH_RX     = RADIO_SWITCH_RX,
  RBI_SWITCH_RFO_LP = RADIO_SWITCH_RFO_LP,
  RBI_SWITCH_RFO_HP = RADIO_SWITCH_RFO_HP,
} RBI_Switch_TypeDef;

typedef enum
{
  RBI_RFO_LP_MAXPOWER = RADIO_RFO_LP_MAXPOWER,
  RBI_RFO_HP_MAXPOWER = RADIO_RFO_HP_MAXPOWER,
} RBI_RFOMaxPowerConfig_TypeDef;

[#-- EXPORTED TYPES FOR USER BOARD --]
#else
/* USER CODE BEGIN Exported Types */

/* USER CODE END Exported Types */
typedef enum
{
  RBI_SWITCH_OFF    = 0,
  RBI_SWITCH_RX     = 1,
  RBI_SWITCH_RFO_LP = 2,
  RBI_SWITCH_RFO_HP = 3,
} RBI_Switch_TypeDef;

typedef enum
{
  RBI_RFO_LP_MAXPOWER = 0,
  RBI_RFO_HP_MAXPOWER = 1,
} RBI_RFOMaxPowerConfig_TypeDef;
/* USER CODE BEGIN Exported Types_2 */

/* USER CODE END Exported Types_2 */
#endif  /* USE_BSP_DRIVER */
[#else][#--  STM32WL5MXX --]
/* USER CODE BEGIN Exported Types */

/* USER CODE END Exported Types */
typedef enum
{
  RBI_SWITCH_OFF    = 0,
  RBI_SWITCH_RX     = 1,
  RBI_SWITCH_RFO_LP = 2,
  RBI_SWITCH_RFO_HP = 3,
} RBI_Switch_TypeDef;

typedef enum
{
  RBI_RFO_LP_MAXPOWER = 0,
  RBI_RFO_HP_MAXPOWER = 1,
} RBI_RFOMaxPowerConfig_TypeDef;
/* USER CODE BEGIN Exported Types_2 */

/* USER CODE END Exported Types_2 */
[/#if][#--  STM32WL5MXX --]

/* USER CODE BEGIN ET */

/* USER CODE END ET */

/* Exported constants --------------------------------------------------------*/
/* USER CODE BEGIN EC */

/* USER CODE END EC */

/* External variables --------------------------------------------------------*/
/* USER CODE BEGIN EV */

/* USER CODE END EV */

/* Exported macro ------------------------------------------------------------*/
/* USER CODE BEGIN EM */

/* USER CODE END EM */

/* Exported functions ------------------------------------------------------- */
/**
  * @brief  Init Radio Switch
  * @return BSP status
  */
int32_t RBI_Init(void);

/**
  * @brief  DeInit Radio Switch
  * @return BSP status
  */
int32_t RBI_DeInit(void);

/**
  * @brief  Configure Radio Switch.
  * @param  Config: Specifies the Radio RF switch path to be set.
  *         This parameter can be one of following parameters:
  *           @arg RADIO_SWITCH_OFF
  *           @arg RADIO_SWITCH_RX
  *           @arg RADIO_SWITCH_RFO_LP
  *           @arg RADIO_SWITCH_RFO_HP
  * @return BSP status
  */
int32_t RBI_ConfigRFSwitch(RBI_Switch_TypeDef Config);

/**
  * @brief  Return Board Configuration
  * @retval RBI_CONF_RFO_LP_HP
  * @retval RBI_CONF_RFO_LP
  * @retval RBI_CONF_RFO_HP
  */
int32_t RBI_GetTxConfig(void);

/**
  * @brief  Get If TCXO is to be present on board
  * @note   never remove called by MW,
  * @retval return 1 if present, 0 if not present
  */
int32_t RBI_IsTCXO(void);

/**
  * @brief  Get If DCDC is to be present on board
  * @note   never remove called by MW,
  * @retval return 1 if present, 0 if not present
  */
int32_t RBI_IsDCDC(void);

/**
  * @brief  Return RF Output Max Power Configuration of matching circuit
  * @note   never remove called by MW,
  * @retval return Max Power configuration of matching circuit for Low Power or High Power mode in dBm
  */
int32_t RBI_GetRFOMaxPowerConfig(RBI_RFOMaxPowerConfig_TypeDef Config);

/* USER CODE BEGIN EFP */

/* USER CODE END EFP */

#ifdef __cplusplus
}
#endif

#endif /* RADIO_BOARD_IF_H */
