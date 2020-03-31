
#ifndef _CHROMASDKIMPL_H_
#define _CHROMASDKIMPL_H_

#pragma once

#include <windows.h>
#include <assert.h> // for assert

#include "RzChromaSDKDefines.h"
#include "RzChromaSDKTypes.h"
#include "RzErrors.h"

const COLORREF BLACK = RGB(0,0,0);
const COLORREF WHITE = RGB(255,255,255);
const COLORREF RED = RGB(255,0,0);
const COLORREF GREEN = RGB(0,255,0);
const COLORREF BLUE = RGB(0,0,255);
const COLORREF YELLOW = RGB(255,255,0);
const COLORREF PURPLE = RGB(128,0,128);
const COLORREF CYAN = RGB(00,255,255);
const COLORREF ORANGE = RGB(255,165,00);
const COLORREF PINK = RGB(255,192,203);
const COLORREF GREY = RGB(125, 125, 125);

#define ALL_DEVICES         0
#define KEYBOARD_DEVICES    1
#define MOUSEMAT_DEVICES    2
#define MOUSE_DEVICES       3
#define HEADSET_DEVICES     4
#define KEYPAD_DEVICES      5

class CChromaSDKImpl
{
public:
    CChromaSDKImpl();
    ~CChromaSDKImpl();

    BOOL Initialize();
    BOOL UnInitialize();

    void PlayLoadingAnimation(UINT DeviceType);
    void ShowKeys(UINT DeviceType, UINT NumKeys, UINT VKey[], COLORREF Color, BOOL Animate=FALSE);
    void ShowKeysWithCustomCol(UINT DeviceType, UINT NumKeys, UINT VKey[], COLORREF Colors[], BOOL Animate=FALSE);
    void ShowLevel(UINT DeviceType, UINT Hp, UINT Ammo);
    void ShowAlert(UINT DeviceType, COLORREF Color);
    void ShowGauge(UINT DeviceType, UINT Level);
    void ShowBitmap(UINT DeviceType, HBITMAP hBitmap);
    void ShowDamageEffect(UINT DeviceType);
    void ShowColor(UINT DeviceType, COLORREF Color);
    void ResetEffects(UINT DeviceType);
    BOOL IsDeviceConnected(RZDEVICEID DeviceId);

private:
    HMODULE m_ChromaSDKModule;
};

#endif
