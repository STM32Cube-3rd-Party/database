[#ftl]
[#compress]
[#list SWIPdatas as SWIP]
[#if SWIP.defines??]
  [#list SWIP.defines as definition]
    [#assign value = definition.value]
    [#assign name = definition.name]
	[#if name == "MMC_INSTANCE"]
		[#if value == "0"]
			[#assign mmc_instance = 0]
		[#else]
			[#assign mmc_instance = 1]
		[/#if]
    [/#if]
    [/#list]
[/#if]
[/#list]
[/#compress]
/**************************************************************************/
/*                                                                        */
/*       Copyright (c) Microsoft Corporation. All rights reserved.        */
/*                                                                        */
/*       This software is licensed under the Microsoft Software License   */
/*       Terms for Microsoft Azure RTOS. Full text of the license can be  */
/*       found in the LICENSE file at https://aka.ms/AzureRTOS_EULA       */
/*       and in the root directory of this software.                      */
/*                                                                        */
/**************************************************************************/


#include "fx_stm32_mmc_driver.h"

extern MMC_HandleTypeDef hmmc${mmc_instance+1};
#if (FX_STM32_MMC_INIT == 1)
extern void MX_SDMMC${mmc_instance+1}_MMC_Init(void);
#endif

/* USER CODE BEGIN  0 */

/* USER CODE END  0 */


/**
* @brief Initializes the MMC IP instance
* @param uINT Instance MMC instance to initialize
* @retval 0 on success error value otherwise
*/
INT fx_stm32_mmc_init(UINT instance)
{
  INT ret = 0;
/* USER CODE BEGIN  FX_MMC_INIT */

/* USER CODE END  FX_MMC_INIT */

  return ret;
}

/**
* @brief Deinitializes the MMC IP instance
* @param uINT Instance MMC instance to deinitialize
* @retval 0 on success error value otherwise
*/
INT fx_stm32_mmc_deinit(UINT instance)
{
  INT ret = 0;
/* USER CODE BEGIN  FX_MMC_DEINIT */

/* USER CODE END  FX_MMC_DEINIT */

  return ret;
}

/**
* @brief Check the MMC IP status.
* @param uINT Instance MMC instance to check
* @retval 0 when ready 1 when busy
*/
INT fx_stm32_mmc_get_status(UINT instance)
{
  INT ret = 0;
/* USER CODE BEGIN  GET_STATUS */

/* USER CODE END  GET_STATUS */
  return ret;
}

/**
* @brief Read Data from the MMC device into a buffer.
* @param uINT *Buffer buffer into which the data is to be read.
* @param uINT StartBlock the first block to start reading from.
* @param uINT NbrOfBlocks total number of blocks to read.
*/
INT fx_stm32_mmc_read_blocks(UINT instance, UINT *buffer, UINT start_block, UINT total_blocks)
{
  INT ret = 0;
/* USER CODE BEGIN  READ_BLOCKS */

/* USER CODE END  READ_BLOCKS */
  return ret;
}
/**
* @brief Write data buffer into the MMC device.
* @param uINT *Buffer buffer .to write into the MMC device.
* @param uINT StartBlock the first block to start writing from.
* @param uINT NbrOfBlocks total number of blocks to write.
* @retval 0 on success error code otherwise
*/

INT fx_stm32_mmc_write_blocks(UINT instance, UINT *buffer, UINT start_block, UINT total_blocks)
{
  INT ret = 0;
/* USER CODE BEGIN  WRITE_BLOCKS */

/* USER CODE END  WRITE_BLOCKS */
  return ret;

}


/* USER CODE BEGIN  1 */

/* USER CODE END  1 */
