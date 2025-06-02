// See LICENSE for license details.

#include "uart.h"

volatile uint32_t *uart_base_ptr = (uint32_t *)(UART_BASE);

void uart_send(uint8_t data) {
  // wait until THR empty
  *uart_base_ptr = data;
}
