﻿/**
 * Camera settings
 * Настройки камеры
 */
{
  "camera": {
    // Global camera settings switch
    // Глобальный переключатель настроек камеры
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
      "scrollSensitivity": 5
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
      "scrollSensitivity": 5
    },
    // Strategic mode (arty)
    // Стратегический режим (арта)
    "strategic": {
      // Camera distance range: [min, max], default - [40, 100]
      // Отдаление камеры: [мин, макс], по умолчанию - [40, 100]
      "distRange": [40, 100]
    },
    // Sniper mode
    // Снайперский режим
    "sniper": {
      // List of multiplicities for the sniper mode
      // It is possible to use a greater number of values: [ 2, 4, 8, 16 ]
      // Список значений кратности для снайперского режима
      // Можно использовать большее количество значений: [ 2, 4, 8, 16 ]
      "zooms": [2, 4, 8]
    }
  }
}
