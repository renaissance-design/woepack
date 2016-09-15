﻿/**
 * General parameters for minimap.
 * Общие параметры миникарты. Видео по некоторым аспектам редактирования http://www.youtube.com/watch?feature=player_embedded&v=NBJcqWuEoLo
 */
{
  "minimap": {
    // false - Disable.
    // false - отключить.
    "enabled": true,
    // Map image transparency.
    // Прозрачность изображения карты.
    "mapBackgroundImageAlpha": 100,
    // Self icon transparency. White pointing arrow.
    // Прозрачность своей иконки. Белая стрелка.
    "selfIconAlpha": 75,
    // Self icon scale. White pointing arrow.
    // Масштаб своей иконки. Белая стрелка.
    "selfIconScale": 1,
    // Vehicle type icons transparency.
    // Прозрачность иконок типа техники.
    "iconAlpha": 100,
    // Vehicles icon scale. Does not affect attached geometry and textfields. Floating point allowed: 0.7, 1.4.
    // Масштаб иконки техники. Не влияет на прикрепленную к геометрию и текстовые поля. Можно дробные: 0.7, 1.4.
    "iconScale": 1,
    // Camera direction green triangle transparency.
    // Прозрачность зеленого треугольника направления камеры.
    "directionTriangleAlpha": 100,
    // Standard camera direction line transparency.
    // Прозрачность стандартного луча направления камеры.
    "directionLineAlpha": 100,
    // Show camera line after death
    // Отображать линию направления камеры после смерти
    "showDirectionLineAfterDeath": true,
    // Path to icon for arty aim
    // Путь к иконке для артиллерийского прицела
    "minimapAimIcon": "xvm://res/MinimapAim.png",
    // Scale factor for the minimap aim icon (in percents)
    // Масштаб иконки для артиллерийского прицела (в процентах)
    "minimapAimIconScale": 50,
    // Map zoom by key pressing. Key is defined at file "hotkeys.xc".
    // Увеличение миникарты по нажатию кнопки. Кнопка задается в файле "hotkeys.xc".
    "zoom": {
      // Zoom index value for minimap zoom key (0..5).
      // Значение масштаба миникарты при нажатии клавиши масштаба (0..5).
      "index": 5,
      // false - does not set zoomed minimap at display center.
      // false - не устанавливать увеличенную миникарту по центру экрана.
      "centered": false
    },
    // Map size label
    // Поле размера карты
    "mapSize": ${"minimapMapSize.xc":"mapSize"},
    // Use standard circles
    // Использовать стандартные круги
    "useStandardCircles": false,
    // Use standard labels
    // Использовать стандартные надписи
    "useStandardLabels": false,
    // Use standard lines
    // Использовать стандартные линии
    "useStandardLines": false,
    // Minimap labels.
    // Надписи на миникарте.
    "labels": ${"minimapLabels.xc":"labels"},
    "labelsData": ${"minimapLabelsData.xc":"labelsData"},
    // Minimap circles.
    // Круги на миникарте.
    "circles": ${"minimapCircles.xc":"circles"},
    // Minimap lines.
    // Линии на миникарте.
    "lines": ${"minimapLines.xc":"lines"}
  }
}
