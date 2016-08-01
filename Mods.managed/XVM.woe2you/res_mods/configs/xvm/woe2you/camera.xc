﻿/**
 * Camera settings
 * Настройки камеры
 */
{
  "camera": {
    // false - disable camera settings.
    // false - отключить настройки камеры.
    "enabled": false,
    // Arcade mode
    // Аркадный режим
    "arcade": {
      // Camera distance range: [min, max], default - [2, 25]
      // Отдаление камеры: [мин, макс], по умолчанию - [2, 25]
      "distRange": [2, 25],
      // Start distance (null for default behavior - saved state from the last battle)
      // Начальная дистанция (null для поведения по умолчанию - сохраненная позиция из последнего боя)
      "startDist": null,
      // Чувствительность прокрутки (default = 5)
      // Scroll sensitivity (по умолчанию = 5)
      "scrollSensitivity": 5,
      // false - disable the shot recoil effect (for the enabled dynamic camera option)
      // false - выключить эффект отдачи от выстрела (для включенной опции динамической камеры)
      "shotRecoilEffect": true
    },
    // Postmortem mode
    // Режим после смерти
    "postmortem": {
      // Camera distance range: [min, max], default - [2, 25]
      // Отдаление камеры: [мин, макс], по умолчанию - [2, 25]
      "distRange": [2, 25],
      // Start distance (null for default behavior - maximum distance)
      // Начальная дистанция (null для поведения по умолчанию - максимальная дистанция)
      "startDist": null,
      // Чувствительность прокрутки (default = 5)
      // Scroll sensitivity (по умолчанию = 5)
      "scrollSensitivity": 5,
      // false - disable the shot recoil effect (for the enabled dynamic camera option)
      // false - выключить эффект отдачи от выстрела (для включенной опции динамической камеры)
      "shotRecoilEffect": true
    },
    // Strategic mode (arty)
    // Стратегический режим (арта)
    "strategic": {
      // Camera distance range: [min, max], default - [40, 100]
      // Отдаление камеры: [мин, макс], по умолчанию - [40, 100]
      "distRange": [40, 100],
      // false - disable the shot recoil effect (for the enabled dynamic camera option)
      // false - выключить эффект отдачи от выстрела (для включенной опции динамической камеры)
      "shotRecoilEffect": true
    },
    // Sniper mode
    // Снайперский режим
    "sniper": {
      // List of multiplicities for the sniper mode
      // Default: [ 2, 4, 8 ]. It's possible to use a greater number of values.
      // Список значений кратности для снайперского режима
      // По умолчанию: [ 2, 4, 8 ]. Можно использовать большее количество значений.
      "zooms": [2, 4, 8],
      // Start zoom value (null for default behavior - last used state)
      // Начальное значение кратности (null для поведения по умолчанию - последнее использовавшееся значение)
      "startZoom": null,
      // Zoom Indicator (see playersPanel.xc for parameters description)
      // Global macros allowed in all fields
      // Индикатор масштаба (см. playersPanel.xc для описания параметров)
      // Можно использовать глобальные макросы во всех полях
      "zoomIndicator": {
        // false - disable.
        // false - выключить.
        "enabled": true,
        // Field position relative to screen center
        // Положение поля относительно центра экрана
        "x": 150,
        "y": 30,
        // Field size
        // Размер поля
        "width": 100,
        "height": 40,
        // Opacity in percents (0..100)
        // Прозрачность
        "alpha": 100,
        "rotation": 0,
        "scaleX": 1,
        "scaleY": 1,
        // Horizonatal text alignment (left, center, right)
        // Горизонтальное выравнивание текста (left, center, right)
        "align": "left",
        // Vertical text alignment (top, center, bottom)
        // Вертикальное выравнивание текста (top, center, bottom)
        "valign": "center",
        // Background color
        // Цвет фона
        "bgColor": null,
        // Border color
        // Цвет рамки
        "borderColor": null,
        "antiAliasType": "advanced",
        // Text format
        // Формат текста
        "format": "<font face='$TitleFont' color='#95CB29' size='16'>x{{zoom}}</font>",
        // Shadow options
        // Параметры тени
        "shadow": {
          // false - no shadow
          // false - без тени
          "enabled": true,
          "distance": 0,             // (in pixels)     / offset distance / дистанция смещения
          "angle": 0,                // (0.0 .. 360.0)  / offset angle    / угол смещения
          "color": "0x192E0E",       // "0xXXXXXX"      / color           / цвет
          "alpha": 100,              // (0 .. 100)      / opacity         / прозрачность
          "blur": 3,                 // (0.0 .. 255.0)  / blur            / размытие
          "strength": 2              // (0.0 .. 255.0)  / intensity       / интенсивность
        }
      },
      // false - disable the shot recoil effect (for the enabled dynamic camera option)
      // false - выключить эффект отдачи от выстрела (для включенной опции динамической камеры)
      "shotRecoilEffect": true
    }
  }
}
