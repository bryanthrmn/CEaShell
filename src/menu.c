#include "gfx/gfx.h"
#include "menu.h"
#include "shapes.h"
#include "ui.h"

#include <graphx.h>
#include <keypadc.h>
#include <sys/timers.h>

uint8_t *menu_Looks(uint8_t *colors, bool is24Hour) {
    shapes_RoundRectangleFill(colors[1], 8, 304, 192, 8, 39);
    shapes_RoundRectangleFill(colors[0], 8, 140, 56, 15, 46);
    shapes_RoundRectangleFill(colors[0], 8, 140, 92, 15, 109);
    shapes_RoundRectangleFill(colors[0], 8, 140, 155, 165, 46);
    const uint8_t defaultThemes[28] = {237, 246, 236, 74, 148, 0, 128, 137, 96, 226, 228, 162, 3, 100, 2, 28, 125, 58, 210, 243, 208, 81, 114, 48, 222, 255, 181, 222};
    uint8_t drawBox = 0;
    shapes_RoundRectangleFill(colors[2], 8, 26, 26, 16, 47);
    for (uint8_t y = 49; y < 78; y += 28) {
        for (int x = 18; x < 132; x += 28, drawBox += 3) {
            shapes_RoundRectangleFill(defaultThemes[drawBox], 6, 22, 22, x, y);
        }
    }
    gfx_SetColor(148);  // Invert color icon
    gfx_Line_NoClip(132, 79, 149, 96);
    gfx_FloodFill(133, 78, 0);
    shapes_RoundRectangleFill(defaultThemes[1], 7, 134, 86, 18, 112);
    shapes_RoundRectangleFill(defaultThemes[0], 6, 61, 78, 22, 116);
    shapes_RoundRectangleFill(defaultThemes[2], 6, 61, 39, 87, 116);
    gfx_TransparentSprite_NoClip(lArrow, 15, 208);

    gfx_BlitBuffer();

    uint8_t color = 0;
    uint8_t cursorY = 47;
    uint8_t prevCursorY = 47;
    int cursorX = 16;
    int prevCursorX = 16;
    uint8_t pColor = 0;

    bool keyPressed = false;    // A very clever timer thingy by RoccoLox Programs
    timer_Enable(1, TIMER_32K, TIMER_NOINT, TIMER_UP);
    
    while (kb_AnyKey());
    while (!kb_IsDown(kb_KeyYequ) && !kb_IsDown(kb_KeyClear)) {
        kb_Scan();
        if (!kb_AnyKey()) {
            keyPressed = false;
            timer_Set(1, 0);
        }
        if (kb_Data[7] && (!keyPressed || timer_Get(1) > 3000)) {
            prevCursorY = cursorY;
            prevCursorX = cursorX;
            pColor = color;
            cursorY = cursorY - 28 * (kb_IsDown(kb_KeyUp) && cursorY > 47) + 28 * (kb_IsDown(kb_KeyDown) && cursorY < 75);
            cursorX = cursorX - 28 * (kb_IsDown(kb_KeyLeft) && cursorX > 16) + 28 * (kb_IsDown(kb_KeyRight) && cursorX < 128);
            color = 3 * ((cursorX - 16) / 28) + 15 * (cursorY > 47);

            shapes_RoundRectangleFill(colors[0], 8, 26, 26, prevCursorX, prevCursorY);    // Erase old color
            shapes_RoundRectangleFill(defaultThemes[pColor], 6, 22, 22, prevCursorX + 2, prevCursorY + 2);

            shapes_RoundRectangleFill(colors[2], 8, 26, 26, cursorX, cursorY);
            shapes_RoundRectangleFill(defaultThemes[color], 6, 22, 22, cursorX + 2, cursorY + 2);

            if ((prevCursorX == 128 && prevCursorY == 75) || (cursorX == 128 && cursorY == 75)) {
                gfx_SetColor(148);
                gfx_Line_NoClip(132, 79, 149, 96);
                gfx_FloodFill(133, 78, 0);
            }
            
            if (color == 27) {
                shapes_RoundRectangleFill(255 - colors[0], 7, 134, 86, 18, 112);
                shapes_RoundRectangleFill(255 - colors[1], 6, 61, 78, 22, 116);
                shapes_RoundRectangleFill(255 - colors[2], 6, 61, 39, 87, 116);
            } else {
                shapes_RoundRectangleFill(defaultThemes[color + 1], 7, 134, 86, 18, 112);
                shapes_RoundRectangleFill(defaultThemes[color], 6, 61, 78, 22, 116);
                shapes_RoundRectangleFill(defaultThemes[color + 2], 6, 61, 39, 87, 116);
            }
            gfx_BlitBuffer();
            if (!keyPressed) {
                while (timer_Get(1) < 9000 && kb_Data[7]) {
                    kb_Scan();
                }
            }
            keyPressed = true;
            timer_Set(1,0);
        }
        if (kb_IsDown(kb_KeyEnter) || kb_IsDown(kb_Key2nd)) {
            if (color == 27) {
                for (int byte = 0; byte < 3; byte++) {  // Replace this loop with the invert whole palette thing
                    colors[byte] = 255 - colors[byte];
                }
            } else {
                colors[0] = defaultThemes[color + 1];
                colors[1] = defaultThemes[color];
                colors[2] = defaultThemes[color + 2];
            }
            gfx_FillScreen(colors[0]);
            ui_StatusBar(colors[1], is24Hour, "Customize");
            shapes_RoundRectangleFill(colors[1], 8, 304, 192, 8, 39);
            shapes_RoundRectangleFill(colors[0], 8, 140, 56, 15, 46);
            shapes_RoundRectangleFill(colors[0], 8, 140, 92, 15, 109);
            shapes_RoundRectangleFill(colors[0], 8, 140, 155, 165, 46);
            shapes_RoundRectangleFill(colors[2], 8, 26, 26, cursorX, cursorY);
            drawBox = 0;
            for (uint8_t y = 49; y < 78; y += 28) {
                for (int x = 18; x < 132; x += 28, drawBox += 3) {
                    shapes_RoundRectangleFill(defaultThemes[drawBox], 6, 22, 22, x, y);
                }
            }
            gfx_SetColor(148);  // Invert color icon
            gfx_Line_NoClip(132, 79, 149, 96);
            gfx_FloodFill(133, 78, 0);
            shapes_RoundRectangleFill(colors[0], 7, 134, 86, 18, 112);
            shapes_RoundRectangleFill(colors[1], 6, 61, 78, 22, 116);
            shapes_RoundRectangleFill(colors[2], 6, 61, 39, 87, 116);
            gfx_TransparentSprite_NoClip(lArrow, 15, 208);
            gfx_BlitBuffer();
        }
    }
    return colors;
}

void menu_Info(uint8_t color) {
    shapes_RoundRectangleFill(color, 15, 220, 192, 50, 38);
    gfx_SwapDraw();
    while (kb_AnyKey());
    while (!kb_IsDown(kb_KeyWindow) && !kb_IsDown(kb_KeyZoom) && !kb_IsDown(kb_KeyTrace) && !kb_IsDown(kb_KeyClear)) {
        kb_Scan();
    }
}

void menu_Settings(uint8_t color) {
    shapes_RoundRectangleFill(color, 15, 304, 192, 8, 39);
    gfx_TransparentSprite_NoClip(rArrow, 290, 208);
    gfx_SwapDraw();
    while (kb_AnyKey());
    while (!kb_IsDown(kb_KeyGraph) && !kb_IsDown(kb_KeyClear)) {
        kb_Scan();
    }
}
