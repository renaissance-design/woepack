﻿/**
 * Parameters of the Players Panels ("ears").
 * Параметры панелей игроков ("ушей").
 *
 * Extra field parameters:
 *
 * types of formats available for extended format:
 *   - MovieClip (for loading image)
 *   - TextField (for writing text and creating rectangles)
 * if "src" field is present, MovieClip format will be used
 * if "src" field is absent, TextField format will be used
 *
 * fields available for extended format:
 *   "src" - resource path ("xvm://res/contour/{{vehiclename}}.png")
 *   "format" - text format (macros allowed)
 *
 * fields available for both MovieClip and TextField formats:
 *   "enabled" - enable/disable field creation (global macros allowed)
 *   "x" - x position (macros allowed)
 *   "y" - y position (macros allowed)
 *   "width" - width (macros allowed)
 *   "height" - height (macros allowed)
 *   "bindToIcon" - if enabled, x position is binded to vehicle icon (default false)
 *   "alpha" - transparency in percents (0..100) (macros allowed)
 *   "rotation" - rotation in degrees (0..360) (macros allowed)
 *   "align" - horizontal alignment ("left", "center", "right")
 *      for left panel default value is "left"
 *      for right panel default value is "right"
 *   "scaleX", "scaleY" - scaling (use negative values for mirroring)
 *   "hotKeyCode" - keyboard key code (see list in hotkeys.xc), when pressed - switches text field to show and apply configured html in "format", or hide; when defined, text field will not be shown until key is pressed, to disable define null value or delete parameter
 *   "onHold" - take action by key click (false) or while key is remains pressed (true); (default: false)
 *   "visibleOnHotKey" - field visible on hot key pressed (true) or vice versa (false); (default: true)
 *
 * fields available for TextField format only:
 *   "valign" - vertical alignment ("top", "center", "bottom")
 *      default value is "top"
 *   "borderColor" - if set, draw border with specified color (macros allowed)
 *   "bgColor" - if set, draw background with specified color (macros allowed)
 *   "antiAliasType" - anti aliasing mode ("advanced" or "normal")
 *
 * fields available for MovieClip format only:
 *   "highlight" - highlight icon depending on the player state, default false
 *
 * fields available for players panel only:
 *   "layer": field z-order
 *     values:
 *     "substrate": put field behind all standard fields, x value depends on the players panel width
 *     "bottom": put field behind all standard fields, x value does not depend on the players panel width
 *     "normal": put field between vehicle icon and standard text fields (default)
 *     "top": put field above standard fields
 *
 *   http://help.adobe.com/en_US/FlashPlatform/reference/actionscript/3/flash/text/TextFormat.html
 *   "textFormat": {
 *     "font"
 *     "size"
 *     "color"
 *     "bold"
 *     "italic"
 *     "underline"
 *     "align"
 *     "leftMargin"
 *     "rightMargin"
 *     "indent"
 *     "leading"
 *     "tabStops"
 *   }
 *
 *   http://help.adobe.com/en_US/FlashPlatform/reference/actionscript/3/flash/filters/DropShadowFilter.html
 *   "shadow": {
 *     "enabled"
 *     "distance" (in pixels)
 *     "angle"    (0.0 .. 360.0)
 *     "color"    "0xXXXXXX"
 *     "alpha"    (0.0 .. 100.0)
 *     "blur"     (0.0 .. 255.0)
 *     "strength" (0.0 .. 255.0)
 *     "quality"
 *     "inner"
 *     "knockout"
 *     "hideObject"
 *   }
 */
{
  // Enemy spotted status marker definition.
  // Шаблон маркера статуса засвета противника.
  "enemySpottedMarker": {
    // Opacity percentage of spotted markers in the panels. 0 - transparent (disabled) ... 100 - opaque.
    // Прозрачность в процентах маркеров засвета в ушах. 0 - полностью прозрачные (отключены), 100 - не прозрачные.
    "alpha": "{{a:spotted}}",
    // x position.
    // положение по горизонтали.
    "x": 86,
    // y position.
    // положение по вертикали.
    "y": 1,
    // Horizontal alignment
    // Выравнивание по горизонтали
    "align": "center",
    // true - x position is binded to vehicle icon, false - binded to edge of the screen.
    // true - положение по горизонтали отсчитывается от иконки танка, false - от края экрана.
    "bindToIcon": true,
    // enemy spotted status marker format.
    // формат маркера статуса засвета.
    "format": "<font color='{{c:spotted}}'>{{spotted}}</font>",
    // shadow (see below).
    // настройки тени (см. ниже).
    "shadow": {}
  },
  // XMQP service marker definition.
  // Шаблон маркера сервиса XMQP.
  "xmqpServiceMarker": {
    "x": 86, "y": 1, "align": "center", "bindToIcon": true,
    "format": "<font face='xvm' size='23' color='{{alive?{{x-spotted?#FFBB00|{{x-sense-on?#D9D9D9|#BFBFBF}}}}|#FFFFFF}}' alpha='{{alive?#FF|#80}}'>{{alive?{{x-spotted?&#x70;|{{x-sense-on?&#x70;|{{x-enabled?&#x7A;}}}}}}}}</font>",
    "shadow": {}
  },
  // Clan icon definition.
  // Шаблон иконки клана.
  "clanIcon": {
    "enabled": true,
    "x": 65, "y": 6, "width": 16, "height": 16, "align": "center", "alpha": 90, "bindToIcon": true,
    "src": "{{clanicon}}"
    //"format": "<img src='{{clanicon}}' width='16' height='16'>"
  },
  // Is XVM user marker definition.
  // Шаблон маркера пользователя XVM.
  "xvmUserMarker": {
    "enabled": false,
    "x": 10, "y": 5, "bindToIcon": true,
    "src": "xvm://res/icons/xvm/xvm-user-{{xvm-user|none}}.png"
  },
  // Parameters of the Players Panels ("ears").
  // Параметры панелей игроков ("ушей").
  "playersPanel": {
    // false - Disable.
    // false - отключить.
    "enabled": true,
    // Opacity percentage of the panels. 0 - transparent, 100 - opaque.
    // Прозрачность в процентах ушей. 0 - прозрачные, 100 - не прозрачные.
    "alpha": 80,
    // Opacity percentage of icons in the panels. 0 - transparent ... 100 - opaque.
    // Прозрачность в процентах иконок в ушах. 0 - прозрачные, 100 - не прозрачные.
    "iconAlpha": 100,
    // true - disable background of the selected player.
    // true - убрать подложку выбранного игрока.
    "removeSelectedBackground": false,
    // true - Remove the Players Panel mode switcher (buttons for changing size).
    // true - убрать переключатель режимов ушей мышкой.
    "removePanelsModeSwitcher": false,
    // Start panels mode. Possible values: "none", "short", "medium", "medium2", "large".
    // Начальный режим ушей. Возможные значения: "none", "short", "medium", "medium2", "large".
    "startMode": "large",
    // Alternative panels mode. Possible values: null, "none", "short", "medium", "medium2", "large".
    // Альтернативный режим ушей. Возможные значения: null, "none", "short", "medium", "medium2", "large".
    "altMode": null,
    // Options for the "none" panels - empty panels.
    // Режим ушей "none" - пустые уши.
    "none": {
      // false - disable (отключить)
      "enabled": true,
      // Width of area for switching to "large" mode on mouse over
      // Ширина области переключения в режим "large" при наведении мыши
      "expandAreaWidth": 230,
      // Layout ("vertical" or "horizontal")
      // Размещение ("vertical" - вертикально, или "horizontal" - горизонтально)
      "layout": "vertical",
      // Extra fields.
      // Дополнительные поля.
      "extraFields": {
        "leftPanel": {
          "x": 0, // from left side of screen
          "y": 65,
          "width": 350,
          "height": 25,
          // Set of formats for left panel
          // Набор форматов для левой панели
          // example:
          // "format": [
          //   // simple format (just a text)
          //   "{{nick}}",
          //   "<img src='xvm://res/img/panel-bg-l-{{alive|dead}}.png' width='318' height='28'>",
          //   // extended format
          //   { "x": 20, "y": 10, "borderColor": "0xFFFFFF", "format": "{{nick}}" },
          //   { "x": 200, "src": "xvm://res/contour/{{vehiclename}}.png" },
          //   { "x": 200, "src": "img://gui/maps/icons/vehicle/{{vehiclename}}.png" }
          //   { "x": 200, "src": "cfg://user/img/{{vehiclename}}.png" }
          // ]
          //
          // * all fields are optional
          //
          "formats": []
        },
        "rightPanel": {
          "x": 0, // from right side of screen
          "y": 65,
          "width": 350,
          "height": 25,
          // Set of formats for right panel (extended format supported, see above)
          // Набор форматов для правой панели (поддерживается расширенный формат, см. выше)
          "formats": []
        }
      }
    },
    // Options for the "short" panels - panels with frags and vehicle icon.
    // Режим ушей "short" - короткие уши (фраги и иконка танка).
    "short": {
      // false - disable (отключить)
      "enabled": true,
      // Displayed standard fields in this mode and their order.
      // Available names: "frags", "vehicle", "nick".
      // Отображаемые стандартные поля в данном режиме, и их порядок.
      // Допустимые названия: "frags", "vehicle", "nick".
      "standardFields": [ "frags" ],
      // Width of area for switching to "large" mode on mouse over
      // Ширина области переключения в режим "large" при наведении мыши
      "expandAreaWidth": 230,
      // true - disable platoon icons
      // true - убрать отображение иконок взвода
      "removeSquadIcon": false,
      // Offset of X value for vehicle icon.
      // Смещение координаты X для иконки танка.
      "vehicleIconXOffsetLeft": 0,
      "vehicleIconXOffsetRight": 0,
      // Offset of X value for vehicle level.
      // Смещение координаты X для уровня танка.
      "vehicleLevelXOffsetLeft": 0,
      "vehicleLevelXOffsetRight": 0,
      // transparency of vehicle level
      // прозрачность уровня танка
      "vehicleLevelAlpha": 100,
      // Offset of X value for frags column.
      // Смещение координаты X для поля фрагов.
      "fragsXOffsetLeft": 0,
      "fragsXOffsetRight": 0,
      // Width of the frags column. Default is 24.
      // Ширина поля фрагов. По умолчанию: 24.
      "fragsWidth": 24,
      // Display format for frags (macros allowed, see macros.txt).
      // Формат отображения фрагов (допускаются макроподстановки, см. macros.txt).
      "fragsFormatLeft": "{{frags}}",
      "fragsFormatRight": "{{frags}}",
      // Offset of X value for player name column.
      // Смещение координаты X для поля имени игрока.
      "nickXOffsetLeft": 0,
      "nickXOffsetRight": 0,
      // Minimum width of the player name column. Default is 46.
      // Минимальная ширина поля имени игрока. По умолчанию: 46.
      "nickMinWidth": 46,
      // Maximum width of the player name column. Default is 158.
      // Максимальная ширина поля имени игрока. По умолчанию: 158.
      "nickMaxWidth": 158,
      // Display format for player nickname (macros allowed, see macros.txt).
      // Формат отображения имени игрока (допускаются макроподстановки, см. macros.txt).
      "nickFormatLeft": "<font face='mono' size='{{xvm-stat?13|0}}' color='{{c:r}}' alpha='{{alive?#FF|#80}}'>{{r}}</font> {{name%.15s~..}}<font alpha='#A0'>{{clan}}</font>",
      "nickFormatRight": "<font alpha='#A0'>{{clan}}</font>{{name%.15s~..}} <font face='mono' size='{{xvm-stat?13|0}}' color='{{c:r}}' alpha='{{alive?#FF|#80}}'>{{r}}</font>",
      // Offset of X value for vehicle name column.
      // Смещение координаты X для поля названия танка.
      "vehicleXOffsetLeft": 0,
      "vehicleXOffsetRight": 0,
      // Width of the vehicle name column. Default is 72.
      // Ширина поля названия танка. По умолчанию: 72.
      "vehicleWidth": 72,
      // Display format for vehicle name (macros allowed, see macros.txt).
      // Формат отображения названия танка (допускаются макроподстановки, см. macros.txt).
      "vehicleFormatLeft": "{{vehicle}}",
      "vehicleFormatRight": "{{vehicle}}",
      // Extra fields. Each field have default size 350x25.
      // Fields are placed one above the other.
      // Дополнительные поля. Каждое поле имеет размер по умолчанию 350x25.
      // Поля располагаются друг над другом.
      // Set of formats for left panel (extended format supported, see above)
      // Набор форматов для левой панели (поддерживается расширенный формат, см. выше)
      "extraFieldsLeft": [
        ${"clanIcon"},
        ${"xvmUserMarker"},
        // XMQP service marker (see above).
        // Маркер сервиса XMQP (см. выше).
        ${"xmqpServiceMarker"}
      ],
      // Set of formats for right panel (extended format supported, see above)
      // Набор форматов для правой панели (поддерживается расширенный формат, см. выше)
      "extraFieldsRight": [
        ${"clanIcon"},
        ${"xvmUserMarker"},
        // enemy spotted status marker (see above).
        // маркер статуса засвета противника (см. выше).
        ${"enemySpottedMarker"}
      ]
    },
    // Options for the "medium" panels - the first of the medium panels.
    // Режим ушей "medium" - первые средние уши в игре.
    "medium": {
      // false - disable (отключить)
      "enabled": true,
      // Displayed standard fields in this mode and their order.
      // Available names: "frags", "vehicle", "nick".
      // Отображаемые стандартные поля в данном режиме, и их порядок.
      // Допустимые названия: "frags", "vehicle", "nick".
      "standardFields": [ "frags", "nick" ],
      // Width of area for switching to "large" mode on mouse over
      // Ширина области переключения в режим "large" при наведении мыши
      "expandAreaWidth": 230,
      // true - disable platoon icons
      // true - убрать отображение иконок взвода
      "removeSquadIcon": false,
      // Offset of X value for vehicle icon.
      // Смещение координаты X для иконки танка.
      "vehicleIconXOffsetLeft": 0,
      "vehicleIconXOffsetRight": 0,
      // Offset of X value for vehicle level.
      // Смещение координаты X для уровня танка.
      "vehicleLevelXOffsetLeft": 0,
      "vehicleLevelXOffsetRight": 0,
      // transparency of vehicle level
      // прозрачность уровня танка
      "vehicleLevelAlpha": 100,
      // Offset of X value for frags column.
      // Смещение координаты X для поля фрагов.
      "fragsXOffsetLeft": 0,
      "fragsXOffsetRight": 0,
      // Width of the frags column. Default is 24.
      // Ширина поля фрагов. По умолчанию: 24.
      "fragsWidth": 24,
      // Display format for frags (macros allowed, see macros.txt).
      // Формат отображения фрагов (допускаются макроподстановки, см. macros.txt).
      "fragsFormatLeft": "{{frags}}",
      "fragsFormatRight": "{{frags}}",
      // Offset of X value for player name column.
      // Смещение координаты X для поля имени игрока.
      "nickXOffsetLeft": 0,
      "nickXOffsetRight": 0,
      // Minimum width of the player name column. Default is 46.
      // Минимальная ширина поля имени игрока. По умолчанию: 46.
      "nickMinWidth": 46,
      // Maximum width of the player name column. Default is 158.
      // Максимальная ширина поля имени игрока. По умолчанию: 158.
      "nickMaxWidth": 158,
      // Display format for player nickname (macros allowed, see macros.txt).
      // Формат отображения имени игрока (допускаются макроподстановки, см. macros.txt).
      "nickFormatLeft": "<font color='{{c:r}}' alpha='{{alive?#FF|#80}}'>{{name%.12s~..}}</font> <font alpha='#A0'>{{clan}}</font>",
      "nickFormatRight": "<font alpha='#A0'>{{clan}}</font> <font color='{{c:r}}' alpha='{{alive?#FF|#80}}'>{{name%.12s~..}}</font>",
      // Offset of X value for vehicle name column.
      // Смещение координаты X для поля названия танка.
      "vehicleXOffsetLeft": 0,
      "vehicleXOffsetRight": 0,
      // Width of the vehicle name column. Default is 72.
      // Ширина поля названия танка. По умолчанию: 72.
      "vehicleWidth": 72,
      // Display format for vehicle name (macros allowed, see macros.txt).
      // Формат отображения названия танка (допускаются макроподстановки, см. macros.txt).
      "vehicleFormatLeft": "<font color='{{c:r}}' alpha='{{alive?#FF|#80}}'>{{vehicle}}</font>",
      "vehicleFormatRight": "<font color='{{c:r}}' alpha='{{alive?#FF|#80}}'>{{vehicle}}</font>",
      // Extra fields. Each field have size 350x25. Fields are placed one above the other.
      // Дополнительные поля. Каждое поле имеет размер 350x25. Поля располагаются друг над другом.
      // Set of formats for left panel (extended format supported, see above)
      // Набор форматов для левой панели (поддерживается расширенный формат, см. выше)
      "extraFieldsLeft": [
        ${"clanIcon"},
        ${"xvmUserMarker"},
        // XMQP service marker (see above).
        // Маркер сервиса XMQP (см. выше).
        ${"xmqpServiceMarker"}
      ],
      // Set of formats for right panel (extended format supported, see above)
      // Набор форматов для правой панели (поддерживается расширенный формат, см. выше)
      "extraFieldsRight": [
        ${"clanIcon"},
        ${"xvmUserMarker"},
        // enemy spotted status marker (see above).
        // маркер статуса засвета противника (см. выше).
        ${"enemySpottedMarker"}
      ]
    },
    // Options for the "medium2" panels - the second of the medium panels.
    // Режим ушей "medium2" - вторые средние уши в игре.
    "medium2": {
      // false - disable (отключить)
      "enabled": true,
      // Displayed standard fields in this mode and their order.
      // Available names: "frags", "vehicle", "nick".
      // Отображаемые стандартные поля в данном режиме, и их порядок.
      // Допустимые названия: "frags", "vehicle", "nick".
      "standardFields": [ "frags", "vehicle" ],
      // Width of area for switching to "large" mode on mouse over
      // Ширина области переключения в режим "large" при наведении мыши
      "expandAreaWidth": 230,
      // true - disable platoon icons
      // true - убрать отображение иконок взвода
      "removeSquadIcon": false,
      // Offset of X value for vehicle icon.
      // Смещение координаты X для иконки танка.
      "vehicleIconXOffsetLeft": 0,
      "vehicleIconXOffsetRight": 0,
      // Offset of X value for vehicle level.
      // Смещение координаты X для уровня танка.
      "vehicleLevelXOffsetLeft": 0,
      "vehicleLevelXOffsetRight": 0,
      // transparency of vehicle level
      // прозрачность уровня танка
      "vehicleLevelAlpha": 100,
      // Offset of X value for frags column.
      // Смещение координаты X для поля фрагов.
      "fragsXOffsetLeft": 0,
      "fragsXOffsetRight": 0,
      // Width of the frags column. Default is 24.
      // Ширина поля фрагов. По умолчанию: 24.
      "fragsWidth": 24,
      // Display format for frags (macros allowed, see macros.txt).
      // Формат отображения фрагов (допускаются макроподстановки, см. macros.txt).
      "fragsFormatLeft": "{{frags}}",
      "fragsFormatRight": "{{frags}}",
      // Offset of X value for player name column.
      // Смещение координаты X для поля имени игрока.
      "nickXOffsetLeft": 0,
      "nickXOffsetRight": 0,
      // Minimum width of the player name column. Default is 46.
      // Минимальная ширина поля имени игрока. По умолчанию: 46.
      "nickMinWidth": 46,
      // Maximum width of the player name column. Default is 158.
      // Максимальная ширина поля имени игрока. По умолчанию: 158.
      "nickMaxWidth": 158,
      // Display format for player nickname (macros allowed, see macros.txt).
      // Формат отображения имени игрока (допускаются макроподстановки, см. macros.txt).
      "nickFormatLeft": "<font color='{{c:r}}' alpha='{{alive?#FF|#80}}'>{{name%.12s~..}}</font> <font alpha='#A0'>{{clan}}</font>",
      "nickFormatRight": "<font alpha='#A0'>{{clan}}</font> <font color='{{c:r}}' alpha='{{alive?#FF|#80}}'>{{name%.12s~..}}</font>",
      // Offset of X value for vehicle name column.
      // Смещение координаты X для поля названия танка.
      "vehicleXOffsetLeft": 0,
      "vehicleXOffsetRight": 0,
      // Width of the vehicle name column. Default is 72.
      // Ширина поля названия танка. По умолчанию: 72.
      "vehicleWidth": 72,
      // Display format for vehicle name (macros allowed, see macros.txt).
      // Формат отображения названия танка (допускаются макроподстановки, см. macros.txt).
      "vehicleFormatLeft": "<font color='{{c:r}}' alpha='{{alive?#FF|#80}}'>{{vehicle}}</font>",
      "vehicleFormatRight": "<font color='{{c:r}}' alpha='{{alive?#FF|#80}}'>{{vehicle}}</font>",
      // Extra fields. Each field have size 350x25. Fields are placed one above the other.
      // Дополнительные поля. Каждое поле имеет размер 350x25. Поля располагаются друг над другом.
      // Set of formats for left panel (extended format supported, see above)
      // Набор форматов для левой панели (поддерживается расширенный формат, см. выше)
      "extraFieldsLeft": [
        ${"clanIcon"},
        ${"xvmUserMarker"},
        // XMQP service marker (see above).
        // Маркер сервиса XMQP (см. выше).
        ${"xmqpServiceMarker"}
      ],
      // Set of formats for right panel (extended format supported, see above)
      // Набор форматов для правой панели (поддерживается расширенный формат, см. выше)
      "extraFieldsRight": [
        ${"clanIcon"},
        ${"xvmUserMarker"},
        // enemy spotted status marker (see above).
        // маркер статуса засвета противника (см. выше).
        ${"enemySpottedMarker"}
      ]
    },
    // Options for the "large" panels - the widest panels.
    // Режим ушей "large" - широкие уши в игре.
    "large": {
      // false - disable (отключить)
      "enabled": true,
      // Displayed standard fields in this mode and their order.
      // Available names: "frags", "vehicle", "nick".
      // Отображаемые стандартные поля в данном режиме, и их порядок.
      // Допустимые названия: "frags", "vehicle", "nick".
      "standardFields": [ "frags", "nick", "vehicle" ],
      // true - disable platoon icons
      // true - убрать отображение иконок взвода
      "removeSquadIcon": false,
      // Offset of X value for vehicle icon.
      // Смещение координаты X для иконки танка.
      "vehicleIconXOffsetLeft": 0,
      "vehicleIconXOffsetRight": 0,
      // Offset of X value for vehicle level.
      // Смещение координаты X для уровня танка.
      "vehicleLevelXOffsetLeft": 0,
      "vehicleLevelXOffsetRight": 0,
      // transparency of vehicle level
      // прозрачность уровня танка
      "vehicleLevelAlpha": 100,
      // Offset of X value for frags column.
      // Смещение координаты X для поля фрагов.
      "fragsXOffsetLeft": 0,
      "fragsXOffsetRight": 0,
      // Width of the frags column. Default is 24.
      // Ширина поля фрагов. По умолчанию: 24.
      "fragsWidth": 24,
      // Display format for frags (macros allowed, see macros.txt).
      // Формат отображения фрагов (допускаются макроподстановки, см. macros.txt).
      "fragsFormatLeft": "{{frags}}",
      "fragsFormatRight": "{{frags}}",
      // Offset of X value for player name column.
      // Смещение координаты X для поля имени игрока.
      "nickXOffsetLeft": 0,
      "nickXOffsetRight": 0,
      // Minimum width of the player name column. Default is 46.
      // Минимальная ширина поля имени игрока. По умолчанию: 46.
      "nickMinWidth": 46,
      // Maximum width of the player name column, Default is 158.
      // Максимальная ширина поля имени игрока. По умолчанию: 158.
      "nickMaxWidth": 158,
      // Display format for player nickname (macros allowed, see macros.txt).
      // Формат отображения имени игрока (допускаются макроподстановки, см. macros.txt).
      "nickFormatLeft": "<font face='mono' size='{{xvm-stat?13|0}}' color='{{c:r}}' alpha='{{alive?#FF|#80}}'>{{r|--}}</font> {{name%.15s~..}}<font alpha='#A0'>{{clan}}</font>",
      "nickFormatRight": "<font alpha='#A0'>{{clan}}</font>{{name%.15s~..}} <font face='mono' size='{{xvm-stat?13|0}}' color='{{c:r}}' alpha='{{alive?#FF|#80}}'>{{r}}</font>",
      // Offset of X value for vehicle name column.
      // Смещение координаты X для поля названия танка.
      "vehicleXOffsetLeft": 0,
      "vehicleXOffsetRight": 0,
      // Width of the vehicle name column. Default is 72.
      // Ширина поля названия танка. По умолчанию: 72.
      "vehicleWidth": 72,
      // Display format for vehicle name (macros allowed, see macros.txt).
      // Формат отображения названия танка (допускаются макроподстановки, см. macros.txt).
      "vehicleFormatLeft": "{{vehicle}}",
      "vehicleFormatRight": "{{vehicle}}",
      // Extra fields. Each field have size 350x25. Fields are placed one above the other.
      // Дополнительные поля. Каждое поле имеет размер 350x25. Поля располагаются друг над другом.
      // Set of formats for left panel (extended format supported, see above)
      // Набор форматов для левой панели (поддерживается расширенный формат, см. выше)
      "extraFieldsLeft": [
        ${"clanIcon"},
        ${"xvmUserMarker"},
        // XMQP service marker (see above).
        // Маркер сервиса XMQP (см. выше).
        ${"xmqpServiceMarker"}
      ],
      // Set of formats for right panel (extended format supported, see above)
      // Набор форматов для правой панели (поддерживается расширенный формат, см. выше)
      "extraFieldsRight": [
        ${"clanIcon"},
        ${"xvmUserMarker"},
        // enemy spotted status marker (see above).
        // маркер статуса засвета противника (см. выше).
        ${"enemySpottedMarker"}
      ]
    }
  }
}
