#ifndef MENU_H
#define MENU_H

#ifdef __cplusplus
extern "C" {
#endif

#include <stdint.h>
#include <stdbool.h>

uint8_t * menu_Looks(uint8_t *, bool);

void menu_Info(uint8_t);

void menu_Settings(uint8_t);

#ifdef __cplusplus
}
#endif

#endif