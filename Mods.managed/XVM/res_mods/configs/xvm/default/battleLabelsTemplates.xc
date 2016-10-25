﻿/**
 * Battle inteface text fields.
 * Текстовые поля боевого интерфейса.
 */
{
  "def": {
    /**
      TODO: update format description to ExtraFields format.

      Set of formats fields available for configuring (default value applyed, when parameter is not defined):
      Набор форматов полей доступных для настройки (значение по-умолчанию применяется, если параметр не указан):
     ┌────────────────────────────┬──────────────────────────────────────────────────────────────────────────
     │ Parameters / Параметры     │ Description / Описание
     ├────────────────────────────┼──────────────────────────────────────────────────────────────────────────
     │ "enabled"                  │ enable/disable field creation: true or false (default: false)
     │                            │ включить/отключить создание полей: true or false (по-умолчанию: false)
     ├────────────────────────────┼──────────────────────────────────────────────────────────────────────────
     │ "updateEvent"              │ events on which field updates, use with dynamic macros; to disable define null value or delete parameter;
     │                            │ multiple events separated by comma
     │                            │ события по которому обновляется поле, используйте динамические макросы; для отключения используйте значение null или удалите параметр;
     │                            │ несколько событий разделяются запятой
     │                            │ доступные события:
     │                            │ allowed events:
     │                            │   ON_BATTLE_STATE_CHANGED
     │                            │   ON_PLAYERS_HP_CHANGED
     │                            │   ON_VEHICLE_DESTROYED
     │                            │   ON_CURRENT_VEHICLE_DESTROYED
     │                            │   ON_MODULE_CRITICAL
     │                            │   ON_MODULE_DESTROYED
     │                            │   ON_MODULE_REPAIRED
     │                            │   ON_DAMAGE_CAUSED
     │                            │   ON_DAMAGE_CAUSED_ALLY
     │                            │   ON_TARGET_IN  - aim at the vehicle
     │                            │   ON_TARGET_OUT - aim not at the vehicle
     │                            │   ON_PANEL_MODE_CHANGED
     │                            │   ON_EVERY_FRAME           * can reduce performance
     │                            │   ON_EVERY_SECOND          * can reduce performance
     │                            │   PY(event_name)  - event from python, sent by as_event(event_name)
     ├────────────────────────────┼──────────────────────────────────────────────────────────────────────────
     │ "mouseEvents"              │ the events handlers must be binded using the function as_callback(event_name)
     │ {                          │ обработчики событий должны быть привязаны с помощью функции as_callback(event_name)
     │   "click"                  │ event is sent when the mouse button clicked inside the field
     │                            │ событие отправляется при клике мышкой внутри поля
     │   "mouseDown"              │ event is sent when the mouse button pressed inside the field
     │                            │ событие отправляется при нажатии кнопки мышки внутри поля
     │   "mouseUp"                │ event is sent when the mouse button released inside the field
     │                            │ событие отправляется при отжатии кнопки мышки внутри поля
     │   "mouseOver"              │ event is sent when the mouse pointer enters the field
     │                            │ событие отправляется при перемещении курсора мыши на поле
     │   "mouseOut"               │ event is sent when the mouse pointer leaves the field
     │                            │ событие отправляется при перемещении курсора мыши из поля
     │   "mouseMove"              │ event is sent when mouse pointer moves inside the field
     │                            │ событие отправляется при перемещении курсора мыши внутри поля
     │   "mouseWheel"             │ event is sent when mouse wheel rolled inside the field
     │ }                          │ событие отправляется при прокручивании колеса мыши внутри поля
     ├────────────────────────────┼──────────────────────────────────────────────────────────────────────────
     │ "hotKeyCode"               │ keyboard key code (see list in hotkeys.xc), when pressed - switches text field to show and apply configured html in "format", or hide;
     │                            │ when defined, text field will not be shown until key is pressed, to disable define null value or delete parameter
     │                            │ горячие клавиши клавиатуры (список в hotkeys.xc), при нажатии - выводится текстовое поле и применяются параметры html в "format", или скрывается поле;
     │                            │ текстовое поле не будет отображаться, пока не будет нажата клавиша, для отключения используйте значение null или удалите параметр;
     ├────────────────────────────┼──────────────────────────────────────────────────────────────────────────
     │ "onHold"                   │ false - take action by key click; true - while key is remains pressed (default: false)
     │                            │ false - производит действие по разовому нажатию клавиши; true - по удержанию (по-умолчанию: false)
     ├────────────────────────────┼──────────────────────────────────────────────────────────────────────────
     │ "visibleOnHotKey"          │ true - field visible on hot key pressed; false - vice versa (default: true)
     │                            │ true - поле отображается при нажатии горячей клавиши; false - наоборот (по-умолчанию: true)
     ├────────────────────────────┼──────────────────────────────────────────────────────────────────────────
     │ "x"                        │ x position (macros allowed) (default: 0)
     │                            │ положение по оси x (доступно использование макросов) (по-умолчанию: 0)
     ├────────────────────────────┼──────────────────────────────────────────────────────────────────────────
     │ "y"                        │ y position (macros allowed) (default: 0)
     │                            │ положение по оси y (доступно использование макросов) (по-умолчанию: 0)
     ├────────────────────────────┼──────────────────────────────────────────────────────────────────────────
     │ "width"                    │ width (macros allowed) (default: 0)
     │                            │ ширина элемента (доступно использование макросов) (по-умолчанию: 0)
     ├────────────────────────────┼──────────────────────────────────────────────────────────────────────────
     │ "height"                   │ height (macros allowed) (default: 0)
     │                            │ высота элемента (доступно использование макросов) (по-умолчанию: 0)
     ├────────────────────────────┼──────────────────────────────────────────────────────────────────────────
     │ "alpha"                    │ transparency in percents (0..100) (macros allowed) (default: 100)
     │                            │ прозрачность элемента, в процентах (0..100) (доступно использование макросов) (по-умолчанию: 100)
     ├────────────────────────────┼──────────────────────────────────────────────────────────────────────────
     │ "rotation"                 │ rotation in degrees (0..360) (macros allowed) (default: 0)
     │                            │ поворот элемента, в градусах (доступно использование макросов) (по-умолчанию: 0)
     ├────────────────────────────┼──────────────────────────────────────────────────────────────────────────
     │ "scaleX"                   │ scaling axis X in % (use negative values for mirroring) (default: 100)
     │                            │ масштабирование по оси x в % (используйте отрицательные значения для зеркального отображения) (по-умолчанию: 100)
     ├────────────────────────────┼──────────────────────────────────────────────────────────────────────────
     │ "scaleY"                   │ scaling axis Y (%, use negative values for mirroring) (default: 100)
     │                            │ масштабирование по оси y (%, используйте отрицательные значения для зеркального отображения) (по-умолчанию: 100)
     ├────────────────────────────┼──────────────────────────────────────────────────────────────────────────
     │ "align"                    │ horizontal alignment of the field relative to its position ("left" [default], "center", "right")
     │                            │ горизонтальное выравнивание текстового поля относительно его позиции ("left" [по-умолчанию], "center", "right")
     ├────────────────────────────┼──────────────────────────────────────────────────────────────────────────
     │ "valign"                   │ vertical alignment of the field relative to its position ("top" [default], "center", "bottom")
     │                            │ вертикальное выравнивание текстового поля относительно его позиции ("top" [по-умолчанию], "center", "bottom")
     ├────────────────────────────┼──────────────────────────────────────────────────────────────────────────
     │ "screenHAlign"             │ horizontal alignment of the field on the screen ("left" [default], "center", "right")
     │                            │ горизонтальное выравнивание поля на экране ("left" [по-умолчанию], "center", "right")
     ├────────────────────────────┼──────────────────────────────────────────────────────────────────────────
     │ "screenVAlign"             │ vertical alignment of the field on the screen ("top" [default], "center", "bottom")
     │                            │ вертикальное выравнивание поля на экране ("top" [по-умолчанию], "center", "bottom")
     ├────────────────────────────┼──────────────────────────────────────────────────────────────────────────
     │ "borderColor"              │ if set, draw border with specified color (macros allowed) (default: null)
     │                            │ окрашивает границу в заданный цвет, если установлен (доступно использование макросов) (по-умолчанию: null)
     ├────────────────────────────┼──────────────────────────────────────────────────────────────────────────
     │ "bgColor"                  │ if set, draw background with specified color (macros allowed) (default: null)
     │                            │ окрашивает фон в заданный цвет, если установлен (доступно использование макросов) (по-умолчанию: null)
     ├────────────────────────────┼──────────────────────────────────────────────────────────────────────────
     │ "antiAliasType"            │ sets anti-aliasing to advanced anti-aliasing ("advanced" [default] or "normal")
     │                            │ задает использование расширенных возможностей сглаживания ("advanced" [по-умолчанию] or "normal")
     ├────────────────────────────┼──────────────────────────────────────────────────────────────────────────
     │ "shadow"                   │ shadow settings, defaults:
     │                            │ настройки тени, значение по умолчанию:
     │                            │
     │                            │ "shadow": { "enabled": true, "distance": 0, "angle": 0, "color": "0x000000", "alpha": 75, "blur": 2, "strength": 1 }
     │----------------------------│--------------------------------------------------------------------------
     │ "distance"                 │ distance shadow, in pixels (default: 0)
     │                            │ дистанция тени, в пикселях (по-умолчанию: 0)
     │----------------------------│--------------------------------------------------------------------------
     │ "angle"                    │ angle shadow (0.0 .. 360.0) (default: 0)
     │                            │ угол смещения тени, в градусах (по-умолчанию: 0)
     │----------------------------│--------------------------------------------------------------------------
     │ "color"                    │ color shadow ("0xXXXXXX") (default: "0x000000")
     │                            │ цвет тени ("0xXXXXXX") (по-умолчанию: "0x000000")
     │----------------------------│--------------------------------------------------------------------------
     │ "alpha"                    │ shadow alpha (0 .. 100) (default: 75)
     │                            │ прозрачность тени (0 .. 100) (по-умолчанию: 75)
     │----------------------------│--------------------------------------------------------------------------
     │ "blur"                     │ blur shadow (0.0 .. 255.0) (default: 2)
     │                            │ эффект размывки тени (0.0 .. 255.0) (по-умолчанию: 2)
     │----------------------------│--------------------------------------------------------------------------
     │ "strength"                 │ strength shadow (0.0 .. 255.0) (default: 1)
     │                            │ интенсивность тени (0.0 .. 255.0) (по-умолчанию: 1)
     │----------------------------│--------------------------------------------------------------------------
     │ "hideObject"               │ Indicates whether or not the object is hidden. The value true indicates that the object itself is not drawn; only the shadow is visible. The default is false (the object is shown).
     │                            │ Определяет, является ли объект скрытым. Значение true указывает на то, что сам объект не нарисован, видна только его тень. Значение по умолчанию — false (объект отображается).
     │----------------------------│--------------------------------------------------------------------------
     │ "inner"                    │ Indicates whether or not the shadow is an inner shadow. The value true indicates an inner shadow. The default is false, an outer shadow (a shadow around the outer edges of the object).
     │                            │ Определяет, является ли тень внутренней тенью. Значение true указывает на наличие внутренней тени. Значение по умолчанию false задает внешнюю тень (тень вокруг внешнего контура объекта).
     │----------------------------│--------------------------------------------------------------------------
     │ "knockout"                 │ Applies a knockout effect (true), which effectively makes the object's fill transparent and reveals the background color of the document. The default is false (no knockout).
     │                            │ Применяет эффект выбивки (true), который фактически делает заливку объекта прозрачной и выявляет цвет фона документа. Значение по умолчанию — false (без выбивки).
     │----------------------------│--------------------------------------------------------------------------
     │ "quality"                  │ The number of times to apply the filter. The default value is 1 (applying the filter once). Although you can use additional numeric values up to 15 to achieve different effects, higher values are rendered more SLOWLY.
     │                            │ Заданное число применений фильтра. Значение по умолчанию — 1 (однократное применение фильтра). Можно использовать дополнительные числовые значения до 15 для получения разнообразных эффектов, более высокие значения выполняются ДОЛЬШЕ.
     ├────────────────────────────┼──────────────────────────────────────────────────────────────────────────
     │ "textFormat"               │ it applies global style to HTML in "format"; note, that defined font attributes in "format" override those in "textFormat"
     │                            │ применяет глобальный стиль HTML в "format"; обратите внимание, что определенные атрибуты шрифта в "format" переопределяют "textFormat"
     │                            │ field default styles, defaults:
     │                            │ стандартный стиль поля, значение по умолчанию:
     │                            │
     │                            │ "textFormat": { "font": "$FieldFont", "color": "0xFFFFFF", "size": 12, "align": "left", "valign": "top", "bold": false, "italic": false, "underline": false, "display": "block", "leading": 0, "marginLeft": 0, "marginRight": 0 },
     │----------------------------│--------------------------------------------------------------------------
     │ "font"                     │ font name (default: "$FieldFont")
     │                            │ наименование шрифта (по-умолчанию: "$FieldFont")
     │----------------------------│--------------------------------------------------------------------------
     │ "color"                    │ font color ("0xXXXXXX") (default: "0xFFFFFF")
     │                            │ цвет шрифта ("0xXXXXXX") (по-умолчанию: "0xFFFFFF")
     │----------------------------│--------------------------------------------------------------------------
     │ "size"                     │ font size (default: 12)
     │                            │ размер шрифта (по-умолчанию: 12)
     │----------------------------│--------------------------------------------------------------------------
     │ "align"                    │ horizontal alignment of the text inside the field (left [default], center, right)
     │                            │ горизонтальное выравнивание текста текста внутри поля (left [по-умолчанию], center, right)
     │----------------------------│--------------------------------------------------------------------------
     │ "valign"                   │ vertical alignment of the text inside the field ("top" [default], "center", "bottom")
     │                            │ вертикальное выравнивание текста внутри поля ("none" [по-умолчанию], "top", "center", "bottom")
     │----------------------------│--------------------------------------------------------------------------
     │ "bold"                     │ true - bold (default: false)
     │                            │ true - жирный (по-умолчанию: false)
     │----------------------------│--------------------------------------------------------------------------
     │ "italic"                   │ true - italic (default: false)
     │                            │ true - курсив (по-умолчанию: false)
     │----------------------------│--------------------------------------------------------------------------
     │ "underline"                │ true - underline (default: false)
     │                            │ true - подчеркивание (по-умолчанию: false)
     │----------------------------│--------------------------------------------------------------------------
     │ "display"                  │ defines how element must be showed (inline, block [default], none)
     │                            │ указывает как именно элемент должен быть показан (inline, block [по-умолчанию], none)
     │----------------------------│--------------------------------------------------------------------------
     │ "leading"                  │ space between lines, similarly (<textformat leading='-XX'>...</textformat>) (default: 0)
     │                            │ пространство между строками, аналогично (<textformat leading='-XX'>...</textformat>) (по-умолчанию: 0)
     │----------------------------│--------------------------------------------------------------------------
     │ "marginLeft"               │ indent left, similarly (<textformat lefMargin='XX'>...</textformat>) (default: 0)
     │                            │ отступ слева, аналогично (<textformat lefMargin='XX'>...</textformat>) (по-умолчанию: 0)
     │----------------------------│--------------------------------------------------------------------------
     │ "marginRight"              │ indent left, similarly (<textformat rightMargin='XX'>...</textformat>) (default: 0)
     │                            │ отступ справа, аналогично (<textformat rightMargin='XX'>...</textformat>) (по-умолчанию: 0)
     ├────────────────────────────┼──────────────────────────────────────────────────────────────────────────
     │ "src"                      │ display image
     │                            │ отображение изображения
     ├────────────────────────────┼──────────────────────────────────────────────────────────────────────────
     │ "format"                   │ displayed text field data (HTML allowed, macros allowed) (default: "")
     │                            │ отображаемые данные в текстовых полях (доступно использование HTML и макросов) (по-умолчанию: "")
     └────────────────────────────┴──────────────────────────────────────────────────────────────────────────
    */
    "hitlogHeader": {
      "enabled": true,
      "updateEvent": "ON_DAMAGE_CAUSED, ON_PANEL_MODE_CHANGED",
      "x": "{{pp.mode=0?5|{{py:math.sum({{pp.widthLeft}},50)}}}}",
      "y": "{{pp.mode=0?65|40}}",
      "width": 500,
      "height": 1000,
      "textFormat": { "color": "0xF4EFE8", "size": 15 },
      "format": "{{hitlog-header}}"
      // Format of the full hitlog (header and body)
      // Формат полного хит-лога (шапка и тело)
      // "format": "{{hitlog-header}}\n{{hitlog-body}}"
    },
    "hitlogBody": {
      "enabled": true,
      "hotKeyCode": 56, "onHold": "true", "visibleOnHotKey": false,
      "updateEvent": "ON_DAMAGE_CAUSED, ON_PANEL_MODE_CHANGED",
      "x": "{{pp.mode=0?5|{{py:math.sum({{pp.widthLeft}},50)}}}}",
      "y": "{{pp.mode=0?85|60}}",
      "width": 500,
      "height": 1000,
      "textFormat": { "color": "0xF4EFE8", "size": 15 },
      "format": "{{hitlog-body}}"
    },
    "totalHP": {
      "enabled": true,
      "updateEvent": "ON_PLAYERS_HP_CHANGED",
      "x": 0,
      "y": 30,
      "screenHAlign": "center",
      "align": "center",
      "shadow": { "distance": 1, "angle": 90, "alpha": 80, "blur": 5, "strength": 1.5 },
      "textFormat": { "font": "mono", "size": 18, "align": "center" },
      "format": "{{py:xvm.total_hp.text}}"
    },
    "avgDamage": {
      "enabled": true,
      "updateEvent": "ON_DAMAGE_CAUSED",
      "x": -170,
      "y": 30,
      "screenHAlign": "center",
      "align": "right",
      "shadow": { "distance": 1, "angle": 90, "alpha": 80, "blur": 5, "strength": 1.5 },
      "textFormat": { "size": 15, "align": "center" },
      "format": "{{py:xvm.total_hp.avgDamage('{{l10n:avgDamage}}: ',{{hitlog.dmg-total}})}}"
    },
    "mainGun": {
      "enabled": true,
      "updateEvent": "ON_DAMAGE_CAUSED, ON_DAMAGE_CAUSED_ALLY",
      "x": 170,
      "y": 30,
      "screenHAlign": "center",
      "shadow": { "distance": 1, "angle": 90, "alpha": 80, "blur": 5, "strength": 1.5 },
      "textFormat": { "size": 15, "align": "center" },
      "format": "{{py:xvm.total_hp.mainGun('{{l10n:mainGun}}: ',{{hitlog.dmg-total}})}}"
    },
    "winChance": {
      "enabled": false,
      "updateEvent": "ON_VEHICLE_DESTROYED",
      "x": 230,
      "y": 2,
      "shadow": { "distance": 1, "angle": 90, "alpha": 80, "blur": 5, "strength": 1.5 },
      "textFormat": { "size": 15 },
      "format": "{{xvm-stat?{{l10n:Team strength}}: {{py:xvm.team_strength('{{allyStrengthStatic}}','{{enemyStrengthStatic}}')}} / {{py:xvm.team_strength('{{allyStrengthLive}}','{{enemyStrengthLive}}')}}}}"
    },
    "damageLog": {
      "enabled": true,
      "updateEvent": "PY(ON_HIT)",
      "x": 240,
      "y": 0,
      "width": 300,
      "height": 233,
      "screenVAlign": "bottom",
      "shadow": { "distance": 1, "angle": 90, "alpha": 80, "blur": 5, "strength": 3 },
      "textFormat": { "color": "0xF4EFE8", "size": 16 },
      "format": "{{py:xvm.damageLog.dLog}}"
    },
    "timerReload": {
      "enabled": true,
      "updateEvent": "PY(ON_TIMER_RELOAD)",
      "x": 240,
      "y": 0,
      "width": 300,
      "height": 252,
      "screenVAlign": "bottom",
      "shadow": { "distance": 1, "angle": 90, "alpha": 80, "blur": 5, "strength": 3 },
      "textFormat": { "color": "0xF4EFE8", "size": 16 },
      "format": "{{py:xvm.damageLog.timerReload}}"
    },
    "lastHit": {
      "enabled": true,
      "updateEvent": "PY(ON_LAST_HIT)",
      "x": -120,
      "y": 200,
      "width": 200,
      "height": 100,
      "screenHAlign": "center",
      "screenVAlign": "center",
      "shadow": { "distance": 1, "angle": 90, "alpha": 80, "blur": 5, "strength": 3 },
      "textFormat": {"align": "center", "color": "0xF4EFE8", "size": 16 },
      "format": "{{py:xvm.damageLog.lastHit}}"
    },
    "fire": {
      "enabled": false,
      "updateEvent": "PY(ON_FIRE)",
      "x": 120,
      "y": 200,
      "width": 200,
      "height": 100,
      "alpha": "{{py:xvm.damageLog.fire}}",
      "screenHAlign": "center",
      "screenVAlign": "center",
      "shadow": { "distance": 1, "angle": 90, "alpha": 80, "blur": 5, "strength": 3 },
      "textFormat": {"align": "center", "color": "0xF4EFE8", "size": 16 },
      "format": "ПОЖАР"
    },
    "test": {
      "enabled": true,
      "y": -170,
      "width": 200,
      "height": 70,
      "alpha": 70,
      "screenHAlign": "center",
      "screenVAlign": "bottom",
      "shadow": { "distance": 1, "angle": 90, "alpha": 80, "strength": 5},
      "textFormat": { "color": "{{battleType=1?0x00FFFF|0xFFFF00}}", "size": 25, "align": "center", "bold": true, "leading": -1, "marginLeft": 2, "marginRight": 2 },
      "format": "This is a demo of XVM text fields on battle interface. You may disable it in battle.xc<br/> Press '<font color='#60FF00'>J</font>' hot-key to show info field"
    },
    "test2": {
      "enabled": true,
      "hotKeyCode": 36,
      "updateEvent": "ON_TARGET_IN,ON_TARGET_OUT",
      "y": -70,
      "width": 310,
      "height": 50,
      "alpha": 70,
      "screenHAlign": "center",
      "screenVAlign": "bottom",
      "bgColor": "0x000000",
      "borderColor": "0x101009",
      "shadow": { "distance": 1, "angle": 90, "alpha": 80, "strength": 8},
      "textFormat": { "color": "0x60FF00", "size": 15, "align": "center", "marginLeft": 2, "marginRight": 2},
      "format": "<font color='#FFFFFF'><b>Info text field (XTE: <font color='{{c:xte}}'>{{xte}}</font>)</b></font><br/>Battle tier:<font color='#ff1aff'> {{battletier}}</font> <p align='right'>Vehicle: <font color='#ff1aff'>{{vehicle}}</font> (<font color='{{c:t-winrate}}'>{{t-winrate%2d}}%</font>)</p>"
    }
  }
}
