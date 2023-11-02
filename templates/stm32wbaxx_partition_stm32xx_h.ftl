[#ftl]
/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file    partition_[#if McuName?starts_with("STM32WBA55")]stm32wba55xx.h[/#if][#if McuName?starts_with("STM32WBA52")]stm32wba52xx.h[/#if][#if McuName?starts_with("STM32WBA54")]stm32wba54xx.h[/#if]
  * @author  MCD Application Team
  * @brief   CMSIS [#if McuName?starts_with("STM32WBA55")]STM32WBA55xx[/#if][#if McuName?starts_with("STM32WBA52")]STM32WBA52xx[/#if][#if McuName?starts_with("STM32WBA54")]STM32WBA54xx[/#if] Device Initial Setup for Secure / Non-Secure Zones
  *          for ARMCM33 based on CMSIS CORE V5.4.0 partition_ARMCM33.h Template.
  *
  *          This file contains:
  *           - Initialize Security Attribution Unit (SAU) CTRL register
  *           - Setup behavior of Sleep and Exception Handling
  *           - Setup behavior of Floating Point Unit
  *           - Setup Interrupt Target
  *
  ******************************************************************************
[@common.optinclude name=mxTmpFolder+"/license.tmp"/][#--include License text --]
  ******************************************************************************
 */
/* USER CODE END Header */

[#assign enabledIT = ""]
[#if nvic??]
[#list nvic as vector]
[#assign enabledIT = enabledIT + " - " +  vector.name]
[/#list]
[/#if]
[#if McuName?starts_with("STM32WBA52")]
#ifndef PARTITION_STM32WBA52XX_H
#define PARTITION_STM32WBA52XX_H
[/#if]
[#if McuName?starts_with("STM32WBA55")]
#ifndef PARTITION_STM32WBA55XX_H
#define PARTITION_STM32WBA55XX_H
[/#if]
[#if McuName?starts_with("STM32WBA54")]
#ifndef PARTITION_STM32WBA54XX_H
#define PARTITION_STM32WBA54XX_H
[/#if]

[#assign nonSecureIT0 = "100, 100"/]
[#assign nonSecureIT1 = "100, 100"/]
[#assign nonSecureIT2 = "100, 100"/]
[#assign nonSecureIT3 = "100, 100"/]
/*
//-------- <<< Use Configuration Wizard in Context Menu >>> -----------------
*/
/* USER CODE BEGIN 0 */
/*
// <e>Initialize Security Attribution Unit (SAU) CTRL register
*/
#define SAU_INIT_CTRL          1

/*
//   <q> Enable SAU
//   <i> Value for SAU->CTRL register bit ENABLE
*/
#define SAU_INIT_CTRL_ENABLE   1

/*
//   <o> When SAU is disabled
//     <0=> All Memory is Secure
//     <1=> All Memory is Non-Secure
//   <i> Value for SAU->CTRL register bit ALLNS
//   <i> When all Memory is Non-Secure (ALLNS is 1), IDAU can override memory map configuration.
*/
#define SAU_INIT_CTRL_ALLNS    0

/*
// </e>
*/

/*
// <h>Initialize Security Attribution Unit (SAU) Address Regions
// <i>SAU configuration specifies regions to be one of:
// <i> - Secure and Non-Secure Callable
// <i> - Non-Secure
// <i>Note: All memory regions not configured by SAU are Secure
*/
#define SAU_REGIONS_MAX   8                 /* Max. number of SAU regions */

/*
//   <e>Initialize SAU Region 0
//   <i> Setup SAU Region 0 memory attributes
*/
#define SAU_INIT_REGION0    1


/*
//     <o>Start Address <0-0xFFFFFFE0>
*/
#define SAU_INIT_START0     0x08080000      /* start address of SAU region 0 */

/*
//     <o>End Address <0x1F-0xFFFFFFFF>
*/
#define SAU_INIT_END0       0x080FFFFF      /* end address of SAU region 0 */


/*
//     <o>Region is
//         <0=>Non-Secure
//         <1=>Secure, Non-Secure Callable
*/
#define SAU_INIT_NSC0       0
/*
//   </e>
*/

/*
//   <e>Initialize SAU Region 1
//   <i> Setup SAU Region 1 memory attributes
*/
#define SAU_INIT_REGION1    1

/*
//     <o>Start Address <0-0xFFFFFFE0>
*/
#define SAU_INIT_START1     0x0BF88000      /* start address of SAU region 1 */

/*
//     <o>End Address <0x1F-0xFFFFFFFF>
*/
#define SAU_INIT_END1       0x0BF97FFF      /* end address of SAU region 1 */

/*
//     <o>Region is
//         <0=>Non-Secure
//         <1=>Secure, Non-Secure Callable
*/
#define SAU_INIT_NSC1       0
/*
//   </e>
*/

/*
//   <e>Initialize SAU Region 2
//   <i> Setup SAU Region 2 memory attributes
*/
#define SAU_INIT_REGION2    1

/*
//     <o>Start Address <0-0xFFFFFFE0>
*/
#define SAU_INIT_START2     0x0C07E000      /* start address of SAU region 2 */

/*
//     <o>End Address <0x1F-0xFFFFFFFF>
*/
#define SAU_INIT_END2       0x0C07FFFF      /* end address of SAU region 2 */

/*
//     <o>Region is
//         <0=>Non-Secure
//         <1=>Secure, Non-Secure Callable
*/
#define SAU_INIT_NSC2       1
/*
//   </e>
*/

/*
//   <e>Initialize SAU Region 3
//   <i> Setup SAU Region 3 memory attributes
*/
#define SAU_INIT_REGION3    1

/*
//     <o>Start Address <0-0xFFFFFFE0>
*/
#define SAU_INIT_START3     0x20010000      /* start address of SAU region 3 */

/*
//     <o>End Address <0x1F-0xFFFFFFFF>
*/
#define SAU_INIT_END3       0x2001FFFF      /* end address of SAU region 3 */

/*
//     <o>Region is
//         <0=>Non-Secure
//         <1=>Secure, Non-Secure Callable
*/
#define SAU_INIT_NSC3       0
/*
//   </e>
*/

/*
//   <e>Initialize SAU Region 4
//   <i> Setup SAU Region 4 memory attributes
*/
#define SAU_INIT_REGION4    1

/*
//     <o>Start Address <0-0xFFFFFFE0>
*/
#define SAU_INIT_START4     0x40000000      /* start address of SAU region 4 */

/*
//     <o>End Address <0x1F-0xFFFFFFFF>
*/
#define SAU_INIT_END4       0x4FFFFFFF      /* end address of SAU region 4 */


/*
//     <o>Region is
//         <0=>Non-Secure
//         <1=>Secure, Non-Secure Callable
*/
#define SAU_INIT_NSC4       0
/*
//   </e>
*/

/*
//   <e>Initialize SAU Region 5
//   <i> Setup SAU Region 5 memory attributes
*/
#define SAU_INIT_REGION5    0

/*
//     <o>Start Address <0-0xFFFFFFE0>
*/
#define SAU_INIT_START5     0x00000000      /* start address of SAU region 5 */

/*
//     <o>End Address <0x1F-0xFFFFFFFF>
*/
#define SAU_INIT_END5       0x00000000      /* end address of SAU region 5 */

/*
//     <o>Region is
//         <0=>Non-Secure
//         <1=>Secure, Non-Secure Callable
*/
#define SAU_INIT_NSC5       0
/*
//   </e>
*/

/*
//   <e>Initialize SAU Region 6
//   <i> Setup SAU Region 6 memory attributes
*/
#define SAU_INIT_REGION6    0

/*
//     <o>Start Address <0-0xFFFFFFE0>
*/
#define SAU_INIT_START6     0x00000000      /* start address of SAU region 6 */

/*
//     <o>End Address <0x1F-0xFFFFFFFF>
*/
#define SAU_INIT_END6       0x00000000      /* end address of SAU region 6 */

/*
//     <o>Region is
//         <0=>Non-Secure
//         <1=>Secure, Non-Secure Callable
*/
#define SAU_INIT_NSC6       0
/*
//   </e>
*/

/*
//   <e>Initialize SAU Region 7
//   <i> Setup SAU Region 7 memory attributes
*/
#define SAU_INIT_REGION7    0

/*
//     <o>Start Address <0-0xFFFFFFE0>
*/
#define SAU_INIT_START7     0x00000000      /* start address of SAU region 7 */

/*
//     <o>End Address <0x1F-0xFFFFFFFF>
*/
#define SAU_INIT_END7       0x00000000      /* end address of SAU region 7 */

/*
//     <o>Region is
//         <0=>Non-Secure
//         <1=>Secure, Non-Secure Callable
*/
#define SAU_INIT_NSC7       0
/*
//   </e>
*/

/*
// </h>
*/

/*
// <e>Setup behaviour of Sleep and Exception Handling
*/
#define SCB_CSR_AIRCR_INIT  0

/*
//   <o> Deep Sleep can be enabled by
//     <0=>Secure and Non-Secure state
//     <1=>Secure state only
//   <i> Value for SCB->CSR register bit DEEPSLEEPS
*/
#define SCB_CSR_DEEPSLEEPS_VAL      0

/*
//   <o>System reset request accessible from
//     <0=> Secure and Non-Secure state
//     <1=> Secure state only
//   <i> Value for SCB->AIRCR register bit SYSRESETREQS
*/
#define SCB_AIRCR_SYSRESETREQS_VAL  0
/* USER CODE END 0 */
/*
//   <o>Priority of Non-Secure exceptions is
//     <0=> Not altered
//     <1=> Lowered to 0x04-0x07
//   <i> Value for SCB->AIRCR register bit PRIS
*/
#define SCB_AIRCR_PRIS_VAL          [#if AIRCR_PRIS??]${AIRCR_PRIS}[#else]0[/#if]

/*
//   <o>BusFault, HardFault, and NMI target
//     <0=> Secure state
//     <1=> Non-Secure state
//   <i> Value for SCB->AIRCR register bit BFHFNMINS
*/
#define SCB_AIRCR_BFHFNMINS_VAL     [#if AIRCR_BFHFNMINS??]${AIRCR_BFHFNMINS}[#else]0[/#if]

/*
// </e>
*/
/* USER CODE BEGIN 1 */
/*
// <e>Setup behaviour of Floating Point Unit
*/
#define TZ_FPU_NS_USAGE 1

/*
// <o>Floating Point Unit usage
//     <0=> Secure state only
//     <3=> Secure and Non-Secure state
//   <i> Value for SCB->NSACR register bits CP10, CP11
*/
#define SCB_NSACR_CP10_11_VAL       3

/*
// <o>Treat floating-point registers as Secure
//     <0=> Disabled
//     <1=> Enabled
//   <i> Value for FPU->FPCCR register bit TS
*/
#define FPU_FPCCR_TS_VAL            0

/*
// <o>Clear on return (CLRONRET) accessibility
//     <0=> Secure and Non-Secure state
//     <1=> Secure state only
//   <i> Value for FPU->FPCCR register bit CLRONRETS
*/
#define FPU_FPCCR_CLRONRETS_VAL     0

/*
// <o>Clear floating-point caller saved registers on exception return
//     <0=> Disabled
//     <1=> Enabled
//   <i> Value for FPU->FPCCR register bit CLRONRET
*/
#define FPU_FPCCR_CLRONRET_VAL      1

/*
// </e>
*/
/* USER CODE END 1 */
/*
// <h>Setup Interrupt Target
*/

/*
//   <e>Initialize ITNS 0 (Interrupts 0..31)
*/
#define NVIC_INIT_ITNS0    1

/*
// Interrupts 0..31
//   <o.0>  WWDG_IRQn             [#if enabledIT?contains("WWDG_IRQn")]<1=> Non-Secure state[#assign nonSecureIT0 = nonSecureIT0+", "+"0"/][#else]<0=> Secure state[/#if]
//   <o.1>  PVD_IRQn              [#if enabledIT?contains("PVD_IRQn")]<1=> Non-Secure state[#assign nonSecureIT0 = nonSecureIT0+", "+"1"/][#else]<0=> Secure state[/#if]
//   <o.2>  RTC_IRQn              [#if enabledIT?contains("RTC_IRQn")]<1=> Non-Secure state[#assign nonSecureIT0 = nonSecureIT0+", "+"2"/][#else]<0=> Secure state[/#if]
//   <o.3>  RTC_S_IRQn            [#if enabledIT?contains("RTC_S_IRQn")]<1=> Non-Secure state[#assign nonSecureIT0 = nonSecureIT0+", "+"3"/][#else]<0=> Secure state[/#if]
//   <o.4>  TAMP_IRQn             [#if enabledIT?contains("TAMP_IRQn")]<1=> Non-Secure state[#assign nonSecureIT0 = nonSecureIT0+", "+"4"/][#else]<0=> Secure state[/#if]
//   <o.5>  RAMCFG_IRQn           [#if enabledIT?contains("RAMCFG_IRQn")]<1=> Non-Secure state[#assign nonSecureIT0 = nonSecureIT0+", "+"5"/][#else]<0=> Secure state[/#if]
//   <o.6>  FLASH_IRQn            [#if enabledIT?contains("FLASH_IRQn")]<1=> Non-Secure state[#assign nonSecureIT0 = nonSecureIT0+", "+"6"/][#else]<0=> Secure state[/#if]
//   <o.7>  FLASH_S_IRQn          [#if enabledIT?contains("FLASH_S_IRQn")]<1=> Non-Secure state[#assign nonSecureIT0 = nonSecureIT0+", "+"7"/][#else]<0=> Secure state[/#if]
[#if McuName?starts_with("STM32WBA54") || McuName?starts_with("STM32WBA55") || McuName?starts_with("STM32WBA52")]
//   <o.8>  GTZC_IRQn             [#if enabledIT?contains("GTZC_IRQn")]<1=> Non-Secure state[#assign nonSecureIT0 = nonSecureIT0+", "+"8"/][#else]<0=> Secure state[/#if]
[/#if]
//   <o.9>  RCC_IRQn              [#if enabledIT?contains("RCC_IRQn")]<1=> Non-Secure state[#assign nonSecureIT0 = nonSecureIT0+", "+"9"/][#else]<0=> Secure state[/#if]
//   <o.10> RCC_S_IRQn            [#if enabledIT?contains("RCC_S_IRQn")]<1=> Non-Secure state[#assign nonSecureIT0 = nonSecureIT0+", "+"10"/][#else]<0=> Secure state[/#if]
//   <o.11> EXTI0_IRQn            [#if enabledIT?contains("EXTI0_IRQn")]<1=> Non-Secure state[#assign nonSecureIT0 = nonSecureIT0+", "+"11"/][#else]<0=> Secure state[/#if]
//   <o.12> EXTI1_IRQn            [#if enabledIT?contains("EXTI1_IRQn")]<1=> Non-Secure state[#assign nonSecureIT0 = nonSecureIT0+", "+"12"/][#else]<0=> Secure state[/#if]
//   <o.13> EXTI2_IRQn            [#if enabledIT?contains("EXTI2_IRQn")]<1=> Non-Secure state[#assign nonSecureIT0 = nonSecureIT0+", "+"13"/][#else]<0=> Secure state[/#if]
//   <o.14> EXTI3_IRQn            [#if enabledIT?contains("EXTI3_IRQn")]<1=> Non-Secure state[#assign nonSecureIT0 = nonSecureIT0+", "+"14"/][#else]<0=> Secure state[/#if]
//   <o.15> EXTI4_IRQn            [#if enabledIT?contains("EXTI4_IRQn")]<1=> Non-Secure state[#assign nonSecureIT0 = nonSecureIT0+", "+"15"/][#else]<0=> Secure state[/#if]
//   <o.16> EXTI5_IRQn            [#if enabledIT?contains("EXTI5_IRQn")]<1=> Non-Secure state[#assign nonSecureIT0 = nonSecureIT0+", "+"16"/][#else]<0=> Secure state[/#if]
//   <o.17> EXTI6_IRQn            [#if enabledIT?contains("EXTI6_IRQn")]<1=> Non-Secure state[#assign nonSecureIT0 = nonSecureIT0+", "+"17"/][#else]<0=> Secure state[/#if]
//   <o.18> EXTI7_IRQn            [#if enabledIT?contains("EXTI7_IRQn")]<1=> Non-Secure state[#assign nonSecureIT0 = nonSecureIT0+", "+"18"/][#else]<0=> Secure state[/#if]
//   <o.19> EXTI8_IRQn            [#if enabledIT?contains("EXTI8_IRQn")]<1=> Non-Secure state[#assign nonSecureIT0 = nonSecureIT0+", "+"19"/][#else]<0=> Secure state[/#if]
//   <o.20> EXTI9_IRQn            [#if enabledIT?contains("EXTI9_IRQn")]<1=> Non-Secure state[#assign nonSecureIT0 = nonSecureIT0+", "+"20"/][#else]<0=> Secure state[/#if]
//   <o.21> EXTI10_IRQn           [#if enabledIT?contains("EXTI10_IRQn")]<1=> Non-Secure state[#assign nonSecureIT0 = nonSecureIT0+", "+"21"/][#else]<0=> Secure state[/#if]
//   <o.22> EXTI11_IRQn           [#if enabledIT?contains("EXTI11_IRQn")]<1=> Non-Secure state[#assign nonSecureIT0 = nonSecureIT0+", "+"22"/][#else]<0=> Secure state[/#if]
//   <o.23> EXTI12_IRQn           [#if enabledIT?contains("EXTI12_IRQn")]<1=> Non-Secure state[#assign nonSecureIT0 = nonSecureIT0+", "+"23"/][#else]<0=> Secure state[/#if]
//   <o.24> EXTI13_IRQn           [#if enabledIT?contains("EXTI13_IRQn")]<1=> Non-Secure state[#assign nonSecureIT0 = nonSecureIT0+", "+"24"/][#else]<0=> Secure state[/#if]
//   <o.25> EXTI14_IRQn           [#if enabledIT?contains("EXTI14_IRQn")]<1=> Non-Secure state[#assign nonSecureIT0 = nonSecureIT0+", "+"25"/][#else]<0=> Secure state[/#if]
//   <o.26> EXTI15_IRQn           [#if enabledIT?contains("EXTI15_IRQn")]<1=> Non-Secure state[#assign nonSecureIT0 = nonSecureIT0+", "+"26"/][#else]<0=> Secure state[/#if]
//   <o.27> IWDG_IRQn             [#if enabledIT?contains("IWDG_IRQn")]<1=> Non-Secure state[#assign nonSecureIT0 = nonSecureIT0+", "+"27"/][#else]<0=> Secure state[/#if]
[#if McuName?starts_with("STM32WBA54") || McuName?starts_with("STM32WBA55") || McuName?starts_with("STM32WBA52")]
//   <o.28> SAES_IRQn             [#if enabledIT?contains("SAES_IRQn")]<1=> Non-Secure state[#assign nonSecureIT0 = nonSecureIT0+", "+"28"/][#else]<0=> Secure state[/#if]
[/#if]
//   <o.29> GPDMA_Channel0_IRQn   [#if enabledIT?contains("GPDMA1_Channel0_IRQn")]<1=> Non-Secure state[#assign nonSecureIT0 = nonSecureIT0+", "+"29"/][#else]<0=> Secure state[/#if]
//   <o.30> GPDMA_Channel1_IRQn   [#if enabledIT?contains("GPDMA1_Channel1_IRQn")]<1=> Non-Secure state[#assign nonSecureIT0 = nonSecureIT0+", "+"30"/][#else]<0=> Secure state[/#if]
//   <o.31> GPDMA_Channel2_IRQn   [#if enabledIT?contains("GPDMA1_Channel2_IRQn")]<1=> Non-Secure state[#assign nonSecureIT0 = nonSecureIT0+", "+"31"/][#else]<0=> Secure state[/#if]
*/
[#assign decVal = 0/]
[#if nonSecureIT0??]
[#assign ll0 = nonSecureIT0?split(", ")/]
[#list ll0 as it]
[#assign index = Integer.parseInt(it)/]
[#if index!=100]
[#assign decVal = decVal +  Math.pow(2, index)]
[/#if]
[/#list]
[/#if]
[#assign res = String.format("0x%08X" , Integer.valueOf(decVal)) /]
#define NVIC_INIT_ITNS0_VAL      ${res}

/*
//   </e>
*/

/*
//   <e>Initialize ITNS 1 (Interrupts 32..63)
*/
#define NVIC_INIT_ITNS1    1

/*
// Interrupts 32..63
//   <o.0>  GPDMA_Channel3_IRQn   [#if enabledIT?contains("GPDMA1_Channel3_IRQn")]<1=> Non-Secure state[#assign nonSecureIT1 = nonSecureIT1+", "+"0"/][#else]<0=> Secure state[/#if]
//   <o.1>  GPDMA_Channel4_IRQn   [#if enabledIT?contains("GPDMA1_Channel4_IRQn")]<1=> Non-Secure state[#assign nonSecureIT1 = nonSecureIT1+", "+"1"/][#else]<0=> Secure state[/#if]
//   <o.2>  GPDMA_Channel5_IRQn   [#if enabledIT?contains("GPDMA1_Channel5_IRQn")]<1=> Non-Secure state[#assign nonSecureIT1 = nonSecureIT1+", "+"2"/][#else]<0=> Secure state[/#if]
//   <o.3>  GPDMA_Channel6_IRQn   [#if enabledIT?contains("GPDMA1_Channel6_IRQn")]<1=> Non-Secure state[#assign nonSecureIT1 = nonSecureIT1+", "+"3"/][#else]<0=> Secure state[/#if]
//   <o.4>  GPDMA_Channel7_IRQn   [#if enabledIT?contains("GPDMA1_Channel7_IRQn")]<1=> Non-Secure state[#assign nonSecureIT1 = nonSecureIT1+", "+"4"/][#else]<0=> Secure state[/#if]
//   <o.5>  TIM1_BRK_IRQn         [#if enabledIT?contains("TIM1_BRK_IRQn")]<1=> Non-Secure state[#assign nonSecureIT1 = nonSecureIT1+", "+"9"/][#else]<0=> Secure state[/#if]
//   <o.6>  TIM1_UP_IRQn          [#if enabledIT?contains("TIM1_UP_IRQn")]<1=> Non-Secure state[#assign nonSecureIT1 = nonSecureIT1+", "+"10"/][#else]<0=> Secure state[/#if]
//   <o.7>  TIM1_TRG_COM_IRQn     [#if enabledIT?contains("TIM1_TRG_COM_IRQn")]<1=> Non-Secure state[#assign nonSecureIT1 = nonSecureIT1+", "+"11"/][#else]<0=> Secure state[/#if]
//   <o.8>  TIM1_CC_IRQn          [#if enabledIT?contains("TIM1_CC_IRQn")]<1=> Non-Secure state[#assign nonSecureIT1 = nonSecureIT1+", "+"12"/][#else]<0=> Secure state[/#if]
//   <o.9>  TIM2_IRQn             [#if enabledIT?contains("TIM2_IRQn")]<1=> Non-Secure state[#assign nonSecureIT1 = nonSecureIT1+", "+"13"/][#else]<0=> Secure state[/#if]
[#if McuName?starts_with("STM32WBA54") || McuName?starts_with("STM32WBA55") || McuName?starts_with("STM32WBA52")]
//   <o.10> TIM3_IRQn             [#if enabledIT?contains("TIM3_IRQn")]<1=> Non-Secure state[#assign nonSecureIT1 = nonSecureIT1+", "+"14"/][#else]<0=> Secure state[/#if]
//   <o.11> I2C1_EV_IRQn          [#if enabledIT?contains("I2C1_EV_IRQn")]<1=> Non-Secure state[#assign nonSecureIT1 = nonSecureIT1+", "+"23"/][#else]<0=> Secure state[/#if]
//   <o.12> I2C1_ER_IRQn          [#if enabledIT?contains("I2C1_ER_IRQn")]<1=> Non-Secure state[#assign nonSecureIT1 = nonSecureIT1+", "+"24"/][#else]<0=> Secure state[/#if]
[/#if]
[#if McuName?starts_with("STM32WBA54") || McuName?starts_with("STM32WBA55") || McuName?starts_with("STM32WBA52")]
//   <o.13> SPI1_IRQn             [#if enabledIT?contains("SPI1_IRQn")]<1=> Non-Secure state[#assign nonSecureIT1 = nonSecureIT1+", "+"27"/][#else]<0=> Secure state[/#if]
[/#if]
//   <o.14> USART1_IRQn           [#if enabledIT?contains("USART1_IRQn")]<1=> Non-Secure state[#assign nonSecureIT1 = nonSecureIT1+", "+"29"/][#else]<0=> Secure state[/#if]
[#if McuName?starts_with("STM32WBA54") || McuName?starts_with("STM32WBA55") || McuName?starts_with("STM32WBA52")]
//   <o.15> USART2_IRQn           [#if enabledIT?contains("USART2_IRQn")]<1=> Non-Secure state[#assign nonSecureIT1 = nonSecureIT1+", "+"30"/][#else]<0=> Secure state[/#if]
[/#if]
//   <o.16> LPUART1_IRQn          [#if enabledIT?contains("LPUART1_IRQn")]<1=> Non-Secure state[#assign nonSecureIT1 = nonSecureIT1+", "+"30"/][#else]<0=> Secure state[/#if]
//   <o.17> LPTIM1_IRQn           [#if enabledIT?contains("LPTIM1_IRQn")]<1=> Non-Secure state[#assign nonSecureIT1 = nonSecureIT1+", "+"30"/][#else]<0=> Secure state[/#if]
[#if McuName?starts_with("STM32WBA54") || McuName?starts_with("STM32WBA55") || McuName?starts_with("STM32WBA52")]
//   <o.18> LPTIM2_IRQn           [#if enabledIT?contains("LPTIM2_IRQn")]<1=> Non-Secure state[#assign nonSecureIT1 = nonSecureIT1+", "+"30"/][#else]<0=> Secure state[/#if]
[/#if]
//   <o.19> TIM16_IRQn            [#if enabledIT?contains("TIM16_IRQn")]<1=> Non-Secure state[#assign nonSecureIT1 = nonSecureIT1+", "+"30"/][#else]<0=> Secure state[/#if]
[#if McuName?starts_with("STM32WBA54") || McuName?starts_with("STM32WBA55") || McuName?starts_with("STM32WBA52")]
//   <o.20> TIM17_IRQn            [#if enabledIT?contains("TIM17_IRQn")]<1=> Non-Secure state[#assign nonSecureIT1 = nonSecureIT1+", "+"30"/][#else]<0=> Secure state[/#if]
[/#if]
[#if McuName?starts_with("STM32WBA54") || McuName?starts_with("STM32WBA55")]
//   <o.21> COMP_IRQn             [#if enabledIT?contains("COMP_IRQn")]<1=> Non-Secure state[#assign nonSecureIT1 = nonSecureIT1+", "+"30"/][#else]<0=> Secure state[/#if]
[/#if]
//   <o.22> I2C3_EV_IRQn          [#if enabledIT?contains("I2C3_EV_IRQn")]<1=> Non-Secure state[#assign nonSecureIT1 = nonSecureIT1+", "+"24"/][#else]<0=> Secure state[/#if]
//   <o.23> I2C3_ER_IRQn          [#if enabledIT?contains("I2C3_ER_IRQn")]<1=> Non-Secure state[#assign nonSecureIT1 = nonSecureIT1+", "+"24"/][#else]<0=> Secure state[/#if]
[#if McuName?starts_with("STM32WBA54") || McuName?starts_with("STM32WBA55")]
//   <o.24> SAI1_IRQn             [#if enabledIT?contains("SAI1_IRQn")]<1=> Non-Secure state[#assign nonSecureIT1 = nonSecureIT1+", "+"30"/][#else]<0=> Secure state[/#if]
[/#if]
//   <o.25> TSC_IRQn              [#if enabledIT?contains("TSC_IRQn")]<1=> Non-Secure state[#assign nonSecureIT1 = nonSecureIT1+", "+"30"/][#else]<0=> Secure state[/#if]
[#if McuName?starts_with("STM32WBA54") || McuName?starts_with("STM32WBA55") || McuName?starts_with("STM32WBA52")]
//   <o.26> AES_IRQn              [#if enabledIT?contains("AES_IRQn")]<1=> Non-Secure state[#assign nonSecureIT1 = nonSecureIT1+", "+"30"/][#else]<0=> Secure state[/#if]
[/#if]
//   <o.27> RNG_IRQn              [#if enabledIT?contains("RNG_IRQn")]<1=> Non-Secure state[#assign nonSecureIT1 = nonSecureIT1+", "+"30"/][#else]<0=> Secure state[/#if]
//   <o.28> FPU_IRQn              [#if enabledIT?contains("FPU_IRQn")]<1=> Non-Secure state[#assign nonSecureIT1 = nonSecureIT1+", "+"30"/][#else]<0=> Secure state[/#if]
//   <o.29> HASH_IRQn             [#if enabledIT?contains("HASH_IRQn")]<1=> Non-Secure state[#assign nonSecureIT1 = nonSecureIT1+", "+"30"/][#else]<0=> Secure state[/#if]
//   <o.30> PKA_IRQn              [#if enabledIT?contains("PKA_IRQn")]<1=> Non-Secure state[#assign nonSecureIT1 = nonSecureIT1+", "+"30"/][#else]<0=> Secure state[/#if]
//   <o.31> SPI3_IRQn             [#if enabledIT?contains("SPI3_IRQn")]<1=> Non-Secure state[#assign nonSecureIT1 = nonSecureIT1+", "+"30"/][#else]<0=> Secure state[/#if]
*/


[#assign decVal1 = 0/]
[#if nonSecureIT1??]
[#assign lll1 = nonSecureIT1?split(", ")/]
[#list lll1 as it1]
[#assign index1 = Integer.parseInt(it1)/]
[#if index1!=100]
[#assign decVal1 = decVal1 +  Math.pow(2, index1)]
[/#if]
[/#list]
[/#if]

[#assign res1 = String.format("0x%08X" , Integer.valueOf(decVal1)) /]
#define NVIC_INIT_ITNS1_VAL      ${res1}

/*
//   </e>
*/

/*
//   <e>Initialize ITNS 2 (Interrupts 64..95)
*/
#define NVIC_INIT_ITNS2    1

/*
// Interrupts 64..95
//   <o.0>  ICACHE_IRQn          [#if enabledIT?contains("ICACHE_IRQn")]<1=> Non-Secure state[#assign nonSecureIT1 = nonSecureIT1+", "+"30"/][#else]<0=> Secure state[/#if]
//   <o.1>  ADC4_IRQn            [#if enabledIT?contains("ADC4_IRQn")]<1=> Non-Secure state[#assign nonSecureIT1 = nonSecureIT1+", "+"30"/][#else]<0=> Secure state[/#if]
//   <o.2>  RADIO_IRQn           [#if enabledIT?contains("RADIO_IRQn")]<1=> Non-Secure state[#assign nonSecureIT1 = nonSecureIT1+", "+"30"/][#else]<0=> Secure state[/#if]
//   <o.3>  HSEM_IRQn            [#if enabledIT?contains("HSEM_IRQn")]<1=> Non-Secure state[#assign nonSecureIT1 = nonSecureIT1+", "+"30"/][#else]<0=> Secure state[/#if]
//   <o.4>  HSEM_S_IRQn          [#if enabledIT?contains("HSEM_S_IRQn")]<1=> Non-Secure state[#assign nonSecureIT1 = nonSecureIT1+", "+"30"/][#else]<0=> Secure state[/#if]
*/

[#assign decVal2 = 0/]
[#if nonSecureIT2??]
[#assign lll2 = nonSecureIT2?split(", ")/]
[#list lll2 as it2]
[#assign index2 = Integer.parseInt(it2)/]
[#if index2!=100]
[#assign decVal2 = decVal2 +  Math.pow(2, index2)]
[/#if]
[/#list]
[/#if]

[#assign res2 = String.format("0x%08X" , Integer.valueOf(decVal2)) /]
#define NVIC_INIT_ITNS2_VAL      ${res2}



[#assign decVal3 = 0/]
[#if nonSecureIT3??]
[#assign lll3 = nonSecureIT3?split(", ")/]
[#list lll3 as it3]
[#assign index3 = Integer.parseInt(it3)/]
[#if index3!=100]
[#assign decVal3 = decVal3 +  Math.pow(2, index3)]
[/#if]
[/#list]
[/#if]

[#assign res3 = String.format("0x%08X" , Math.round(decVal3)) /]

/*
//   </e>
*/

/*
// </h>
*/

/* USER CODE BEGIN 2 */

/*
    max 8 SAU regions.
    SAU regions are defined in partition.h
 */

#define SAU_INIT_REGION(n) \
    SAU->RNR  =  (n                                     & SAU_RNR_REGION_Msk); \
    SAU->RBAR =  (SAU_INIT_START##n                     & SAU_RBAR_BADDR_Msk); \
    SAU->RLAR =  (SAU_INIT_END##n                       & SAU_RLAR_LADDR_Msk) | \
                ((SAU_INIT_NSC##n << SAU_RLAR_NSC_Pos)  & SAU_RLAR_NSC_Msk)   | 1U

/**
  \brief   Setup a SAU Region
  \details Writes the region information contained in SAU_Region to the
           registers SAU_RNR, SAU_RBAR, and SAU_RLAR
 */
__STATIC_INLINE void TZ_SAU_Setup (void)
{

#if defined (__SAUREGION_PRESENT) && (__SAUREGION_PRESENT == 1U)

  #if defined (SAU_INIT_REGION0) && (SAU_INIT_REGION0 == 1U)
    SAU_INIT_REGION(0);
  #endif

  #if defined (SAU_INIT_REGION1) && (SAU_INIT_REGION1 == 1U)
    SAU_INIT_REGION(1);
  #endif

  #if defined (SAU_INIT_REGION2) && (SAU_INIT_REGION2 == 1U)
    SAU_INIT_REGION(2);
  #endif

  #if defined (SAU_INIT_REGION3) && (SAU_INIT_REGION3 == 1U)
    SAU_INIT_REGION(3);
  #endif

  #if defined (SAU_INIT_REGION4) && (SAU_INIT_REGION4 == 1U)
    SAU_INIT_REGION(4);
  #endif

  #if defined (SAU_INIT_REGION5) && (SAU_INIT_REGION5 == 1U)
    SAU_INIT_REGION(5);
  #endif

  #if defined (SAU_INIT_REGION6) && (SAU_INIT_REGION6 == 1U)
    SAU_INIT_REGION(6);
  #endif

  #if defined (SAU_INIT_REGION7) && (SAU_INIT_REGION7 == 1U)
    SAU_INIT_REGION(7);
  #endif

  /* repeat this for all possible SAU regions */

#endif /* defined (__SAUREGION_PRESENT) && (__SAUREGION_PRESENT == 1U) */


  #if defined (SAU_INIT_CTRL) && (SAU_INIT_CTRL == 1U)
    SAU->CTRL = ((SAU_INIT_CTRL_ENABLE << SAU_CTRL_ENABLE_Pos) & SAU_CTRL_ENABLE_Msk) |
                ((SAU_INIT_CTRL_ALLNS  << SAU_CTRL_ALLNS_Pos)  & SAU_CTRL_ALLNS_Msk)   ;
  #endif

  #if defined (SCB_CSR_AIRCR_INIT) && (SCB_CSR_AIRCR_INIT == 1U)
    SCB->SCR   = (SCB->SCR   & ~(SCB_SCR_SLEEPDEEPS_Msk    )) |
                   ((SCB_CSR_DEEPSLEEPS_VAL     << SCB_SCR_SLEEPDEEPS_Pos)     & SCB_SCR_SLEEPDEEPS_Msk);

    SCB->AIRCR = (SCB->AIRCR & ~(SCB_AIRCR_VECTKEY_Msk   | SCB_AIRCR_SYSRESETREQS_Msk |
                                 SCB_AIRCR_BFHFNMINS_Msk | SCB_AIRCR_PRIS_Msk)        )                     |
                   ((0x05FAU                    << SCB_AIRCR_VECTKEY_Pos)      & SCB_AIRCR_VECTKEY_Msk)      |
                   ((SCB_AIRCR_SYSRESETREQS_VAL << SCB_AIRCR_SYSRESETREQS_Pos) & SCB_AIRCR_SYSRESETREQS_Msk) |
                   ((SCB_AIRCR_PRIS_VAL         << SCB_AIRCR_PRIS_Pos)         & SCB_AIRCR_PRIS_Msk)         |
                   ((SCB_AIRCR_BFHFNMINS_VAL    << SCB_AIRCR_BFHFNMINS_Pos)    & SCB_AIRCR_BFHFNMINS_Msk);
  #endif /* defined (SCB_CSR_AIRCR_INIT) && (SCB_CSR_AIRCR_INIT == 1U) */

  #if defined (__FPU_USED) && (__FPU_USED == 1U) && \
      defined (TZ_FPU_NS_USAGE) && (TZ_FPU_NS_USAGE == 1U)

    SCB->NSACR = (SCB->NSACR & ~(SCB_NSACR_CP10_Msk | SCB_NSACR_CP11_Msk)) |
                   ((SCB_NSACR_CP10_11_VAL << SCB_NSACR_CP10_Pos) & (SCB_NSACR_CP10_Msk | SCB_NSACR_CP11_Msk));

    FPU->FPCCR = (FPU->FPCCR & ~(FPU_FPCCR_TS_Msk | FPU_FPCCR_CLRONRETS_Msk | FPU_FPCCR_CLRONRET_Msk)) |
                   ((FPU_FPCCR_TS_VAL        << FPU_FPCCR_TS_Pos       ) & FPU_FPCCR_TS_Msk       ) |
                   ((FPU_FPCCR_CLRONRETS_VAL << FPU_FPCCR_CLRONRETS_Pos) & FPU_FPCCR_CLRONRETS_Msk) |
                   ((FPU_FPCCR_CLRONRET_VAL  << FPU_FPCCR_CLRONRET_Pos ) & FPU_FPCCR_CLRONRET_Msk );
  #endif

  #if defined (NVIC_INIT_ITNS0) && (NVIC_INIT_ITNS0 == 1U)
    NVIC->ITNS[0] = NVIC_INIT_ITNS0_VAL;
  #endif

  #if defined (NVIC_INIT_ITNS1) && (NVIC_INIT_ITNS1 == 1U)
    NVIC->ITNS[1] = NVIC_INIT_ITNS1_VAL;
  #endif

  #if defined (NVIC_INIT_ITNS2) && (NVIC_INIT_ITNS2 == 1U)
    NVIC->ITNS[2] = NVIC_INIT_ITNS2_VAL;
  #endif

}
/* USER CODE END 2 */
[#if McuName?starts_with("STM32WBA55")]
#endif  /* PARTITION_STM32WBA55XX_H */
[/#if]

[#if McuName?starts_with("STM32WBA54")]
#endif  /* PARTITION_STM32WBA54XX_H */
[/#if]

[#if McuName?starts_with("STM32WBA52")]
#endif  /* PARTITION_STM32WBA52XX_H */
[/#if]