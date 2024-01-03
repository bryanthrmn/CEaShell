/**
 * --------------------------------------
 * 
 * CEaShell Source Code - info.h
 * By RoccoLox Programs and TIny_Hacker
 * Copyright 2022 - 2023
 * License: GPL-3.0
 * 
 * --------------------------------------
**/

#ifndef INFO_H
#define INFO_H

#include "defines.h"

/**
 * @brief Opens the file info context.
 * 
 * @param shellPrefs Shell preferences struct.
 * @param shellContext Shell context struct.
 * @param fileCount Number of files in the current directory.
 */
void info_Open(struct preferences_t *shellPrefs, struct context_t *shellContext, unsigned int *fileCount);

#ifdef __cplusplus
extern "C" {
#endif

#ifdef __cplusplus
}
#endif

#endif