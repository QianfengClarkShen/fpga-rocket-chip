// See LICENSE for license details.

#ifndef UART_HEADER_H
#define UART_HEADER_H

#include <stdint.h>
#include "mem_map.h"

#define UART_BASE ((uint32_t)(MEM_MAP_UART_BASE))

extern void uart_send(uint8_t);


#endif
