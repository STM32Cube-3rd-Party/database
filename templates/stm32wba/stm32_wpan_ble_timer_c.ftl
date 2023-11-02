[#ftl]
/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file    ble_timer.c
  * @author  MCD Application Team
  * @brief   This module implements the timer core functions
  ******************************************************************************
[@common.optinclude name=mxTmpFolder+"/license.tmp"/][#--include License text --]
  ******************************************************************************
  */
/* USER CODE END Header */
[#assign myHash = {}]
[#list SWIPdatas as SWIP]
    [#if SWIP.defines??]
        [#list SWIP.defines as definition]
            [#assign myHash = {definition.name:definition.value} + myHash]
        [/#list]
    [/#if]
[/#list]
[#--
Key & Value:
[#list myHash?keys as key]
Key: ${key}; Value: ${myHash[key]}
[/#list]
--]

/* Includes ------------------------------------------------------------------*/
[#if myHash["THREADX_STATUS"]?number == 1 ]
#include "app_common.h"
#include "main.h"
[/#if]
#include "stm32wbaxx.h"
#include "blestack.h"
#include "stm32_timer.h"
#include "bleplat.h"
#include "stm_list.h"
#include "ble_timer.h"
#include "advanced_memory_manager.h"
#include "app_conf.h"
#include "ll_sys.h"
[#if myHash["SEQUENCER_STATUS"]?number == 1 ]
#include "stm32_seq.h"
[#elseif myHash["THREADX_STATUS"]?number == 1 ]
#include "app_threadx.h"
[/#if]

/* Private typedef -----------------------------------------------------------*/
typedef struct
{
  tListNode           node;         /* Actual node in the list */
  uint16_t            id;           /* Id of the timer */
  UTIL_TIMER_Object_t timerObject;  /* Timer Server object */
}BLE_TIMER_t;

/* Private defines -----------------------------------------------------------*/
[#if myHash["THREADX_STATUS"]?number == 1 ]
/* BLE_TIMER_TASK related defines */
#define BLE_TIMER_TASK_STACK_SIZE    (256*7)
#define BLE_TIMER_TASK_PRIO          (15)
#define BLE_TIMER_TASK_PREEM_TRES    (0)
[/#if]

/* Private variables ---------------------------------------------------------*/
tListNode BLE_TIMER_List;
static BLE_TIMER_t* BLE_TIMER_timer;

[#if myHash["THREADX_STATUS"]?number == 1 ]
/* BLE_TIMER_TASK related resources */
TX_THREAD BLE_TIMER_Thread;
TX_SEMAPHORE BLE_TIMER_Thread_Sem;

[/#if]
/* Private functions prototype------------------------------------------------*/
void BLE_TIMER_Background(void);
[#if myHash["THREADX_STATUS"]?number == 1 ]
static void BLE_TIMER_Background_Entry(unsigned long thread_input);
[/#if]
static void BLE_TIMER_Callback(void* arg);
static BLE_TIMER_t* BLE_TIMER_GetFromList(tListNode * listHead, uint8_t id);

void BLE_TIMER_Init(void)
{
  /* This function initializes the timer Queue */
  LST_init_head(&BLE_TIMER_List);

  /* Register Timer background task */
[#if myHash["SEQUENCER_STATUS"]?number == 1 ]
  UTIL_SEQ_RegTask(1U << CFG_TASK_BLE_TIMER_BCKGND, UTIL_SEQ_RFU, BLE_TIMER_Background);
[#elseif myHash["THREADX_STATUS"]?number == 1 ]
  CHAR * pStack;

  if (tx_byte_allocate(pBytePool, (void **) &pStack, BLE_TIMER_TASK_STACK_SIZE,TX_NO_WAIT) != TX_SUCCESS)
  {
    Error_Handler();
  }
  if (tx_semaphore_create(&BLE_TIMER_Thread_Sem, "BLE_TIMER_Thread_Sem", 0)!= TX_SUCCESS )
  {
    Error_Handler();
  }
  if (tx_thread_create(&BLE_TIMER_Thread, "BLE_TIMER_Thread", BLE_TIMER_Background_Entry, 0,
                         pStack, BLE_TIMER_TASK_STACK_SIZE,
                         BLE_TIMER_TASK_PRIO, BLE_TIMER_TASK_PREEM_TRES,
                         TX_NO_TIME_SLICE, TX_AUTO_START) != TX_SUCCESS)
  {
    Error_Handler();
  }
[#elseif myHash["FREERTOS_STATUS"]?number == 1 ]
[/#if]

  /* Initialize the Timer Server */
  UTIL_TIMER_Init();
}

uint8_t BLE_TIMER_Start(uint8_t id, uint32_t timeout)
{
  /* If the timer's id already exists, stop it */
  BLE_TIMER_Stop(id);

  /* Create a new timer instance and add it to the list */
  BLE_TIMER_t *timer = NULL;

  if(AMM_ERROR_OK != AMM_Alloc (CFG_AMM_VIRTUAL_STACK_BLE,
                                DIVC(sizeof(BLE_TIMER_t), sizeof(uint32_t)),
                                (uint32_t **)&timer,
                                NULL))
  {
    return BLE_STATUS_INSUFFICIENT_RESOURCES;
  }

  timer->id = id;
  LST_insert_tail(&BLE_TIMER_List, (tListNode *)timer);

  if(UTIL_TIMER_Create(&timer->timerObject, timeout, UTIL_TIMER_ONESHOT, &BLE_TIMER_Callback, timer) != UTIL_TIMER_OK)
  {
    LST_remove_node ((tListNode *)timer);
    (void)AMM_Free((uint32_t *)timer);
    return BLE_STATUS_FAILED;
  }

  if(UTIL_TIMER_Start(&timer->timerObject) != UTIL_TIMER_OK)
  {
    LST_remove_node ((tListNode *)timer);
    (void)AMM_Free((uint32_t *)timer);
    return BLE_STATUS_FAILED;
  }

  return BLE_STATUS_SUCCESS;
}

void BLE_TIMER_Stop(uint8_t id){
  /* Search for the id in the timers list */
  BLE_TIMER_t* timer = BLE_TIMER_GetFromList(&BLE_TIMER_List, id);

  /* If the timer's id exists, stop it */
  if(NULL != timer)
  {
    UTIL_TIMER_Stop(&timer->timerObject);
    LST_remove_node((tListNode *)timer);

    (void)AMM_Free((uint32_t *)timer);
  }
}

void BLE_TIMER_Background(void)
{
  BLEPLATCB_TimerExpiry( (uint8_t)BLE_TIMER_timer->id);
  HostStack_Process( );

  /* Delete the BLE_TIMER_timer from the list */
  LST_remove_node((tListNode *)BLE_TIMER_timer);

  (void)AMM_Free((uint32_t *)BLE_TIMER_timer);
}

[#if myHash["THREADX_STATUS"]?number == 1 ]
static void BLE_TIMER_Background_Entry(unsigned long thread_input)
{
  (void)(thread_input);

  while(1)
  {
    tx_semaphore_get(&BLE_TIMER_Thread_Sem, TX_WAIT_FOREVER);
    BLE_TIMER_Background();
    tx_thread_relinquish();
  }
}
[/#if]

static void BLE_TIMER_Callback(void* arg)
{
  BLE_TIMER_timer = (BLE_TIMER_t*)arg;

[#if myHash["SEQUENCER_STATUS"]?number == 1 ]
  UTIL_SEQ_SetTask( 1U << CFG_TASK_BLE_TIMER_BCKGND, CFG_SEQ_PRIO_0);
[#elseif myHash["THREADX_STATUS"]?number == 1 ]
  tx_semaphore_put(&BLE_TIMER_Thread_Sem);
[#elseif myHash["FREERTOS_STATUS"]?number == 1 ]
[/#if]
}

static BLE_TIMER_t* BLE_TIMER_GetFromList(tListNode * listHead, uint8_t id)
{
  BLE_TIMER_t* currentNode = (BLE_TIMER_t*)listHead->next;
  while((tListNode *)currentNode != listHead)
  {
    if(currentNode->id == id)
    {
      return currentNode;
    }
    LST_get_next_node((tListNode *)currentNode, (tListNode **)&currentNode);
  }
  return NULL;
}

