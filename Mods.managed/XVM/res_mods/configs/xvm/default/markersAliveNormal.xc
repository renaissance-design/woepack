﻿/**
 * Options for alive without Alt markers.
 * Настройки маркеров для живых без Alt.
 */
{
  // Definitions
  // Шаблоны
  "def": {
    // Floating damage values.
    // Всплывающий урон.
    "damageText": {
      // false - disable / не отображать.
      "enabled": true,
      // Axis field coordinates
      // Положение поля по осям
      "x": 0,
      "y": -67,
      // Opacity (dynamic transparency allowed, see macros.txt).
      // Прозрачность (допускается использование динамической прозрачности, см. macros.txt)
      "alpha": 100,
      "align": "center",
      // Font options.
      // Параметры шрифта.
      "textFormat": {
        "font": "$FieldFont",           // Font name      / Название
        "size": 18,                     // Font size      / Размер
        // Color (dynamic colors allowed, see macros.txt).
        // Цвет (допускается использование динамического цвета, см. macros.txt)
        "color": null,
        "bold": false,                  // True - bold    / Жирный.
        "italic": false                 // True - italic  / Курсив.
      },
      // Shadow options.
      // Параметры тени.
      "shadow": {
        // false - no shadow
        // false - без тени
        "enabled": true,
        "distance": 0,                  // (in pixels)     / offset distance / дистанция смещения
        "angle": 45,                    // (0.0 .. 360.0)  / offset angle    / угол смещения
        "color": "0x000000",            // "0xXXXXXX"      / color           / цвет
        "alpha": 100,                   // (0 .. 100)      / opacity         / прозрачность
        "blur": 3,                      // (0.0 .. 255.0)  / blur            / размытие
        "strength": 1                   // (0.0 .. 255.0)  / intensity       / интенсивность
      },
      // Rising speed of displayed damage (float up speed).
      // Время отображения отлетающего урона.
      "speed": 2,
      // Maximum distance of target for which damage rises.
      // Расстояние, на которое отлетает урон.
      "maxRange": 40,
      // Text for normal damage (see description of macros in the macros.txt).
      // Текст при обычном уроне (см. описание макросов в macros.txt).
      "damageMessage": "{{dmg}}",
      // Text for ammo rack explosion (see description of macros in the macros.txt).
      // Текст при взрыве боеукладки (см. описание макросов в macros.txt).
      "blowupMessage": "{{l10n:blownUp}}\n{{dmg}}"
    },
    // Text field with the name of the tank.
    // Текстовое поле с названием танка.
    "tankName": {
      "name": "Tank name",
      "enabled": true,
      "x": 0,
      "y": -36,
      "alpha": 100,
      "align": "center",
      "textFormat": {
        "font": "$FieldFont",
        "size": 13,
        "color": null,
        "bold": false,
        "italic": false
      },
      "shadow": {
        "enabled": true,
        "distance": 0,
        "angle": 45,
        "color": "0x000000",
        "alpha": 100,
        "blur": 6,
        "strength": 2
      },
      "format": "{{vehicle}}{{turret}}"
    },
    // Text field with the name of the player.
    // Текстовое поле с именем игрока.
    "playerName": {
      "name": "Player name",          // название текстового поля, ни на что не влияет
      "enabled": true,                // false - не отображать
      "x": 0,                         // положение по оси X
      "y": -51,                       // положение по оси Y
      "alpha": 100,                   // прозрачность (допускается использование динамической прозрачности, см. macros.txt)
      "align": "center",              // выравнивание текста (left, center, right)
      // Font options.
      // Параметры шрифта.
      "textFormat": {
        "font": "$FieldFont",         //   название
        "size": 13,                   //   размер
        "color": null,                //   цвет (допускается использование динамического цвета, см. macros.txt)
        "bold": false,                //   обычный (false) или жирный (true)
        "italic": false               //   обычный (false) или курсив (true)
      },
      // Shadow options.
      // Параметры тени.
      "shadow": {
        // false - no shadow
        // false - без тени
        "enabled": true,
        "distance": 0,                //   дистанция смещения
        "angle": 45,                  //   угол смещения
        "color": "0x000000",          //   цвет
        "alpha": 100,                 //   прозрачность
        "blur": 6,                    //   размытие
        "strength": 2                 //   интенсивность
      },
      "format": "<font size='{{battletype?13|{{squad?13|0}}}}'>{{name}}</font>"  // формат текста. См. описание макросов в macros.txt
    },
    // Text field with the remaining health.
    // Текстовое поле с оставшимся здоровьем.
    "tankHp": {
      "name": "Tank HP",
      "enabled": true,
      "x": 0,
      "y": -20,
      "alpha": 100,
      "align": "center",
      "textFormat": {
        "font": "$FieldFont",
        "size": 11,
        "color": "0xD9D9D9",
        "bold": true,
        "italic": false
      },
      "shadow": {
        "enabled": true,
        "distance": 0,
        "angle": 45,
        "color": "0x000000",
        "alpha": 100,
        "blur": 4,
        "strength": 1
      },
      "format": "{{hp}}"
    },
    // Text field with rating.
    // Текстовое поле с рейтингом.
    "rating": {
      "name": "Rating",
      "enabled": true,
      "x": -32,
      "y": -21,
      "alpha": "{{xvm-stat?100|0}}",
      "align": "right",
      "textFormat": {
        "font": "xvm",
        "size": 17,
        "color": "{{c:r|#999999}}",
        "bold": false,
        "italic": false
      },
      "shadow": {
        "enabled": true,
        "distance": 0,
        "angle": 45,
        "color": "0x000000",
        "alpha": 100,
        "blur": 2,
        "strength": 1
      },
      "format": "&#x115;"
    },
    // Text field with the XMQP event marker.
    // Текстовое поле с маркером события XMQP.
    "xmqpEvent": {
      "name": "xmqp event",           //  название текстового поля, ни на что не влияет
      "enabled": true,                //  false - не отображать
      "x": 0,                         //  положение по оси X
      "y": "{{battletype?-73|{{squad?-73|-58}}}}",  //  положение по оси Y
      "alpha": 100,                   //  прозрачность (допускается использование динамической прозрачности, см. macros.txt)
      "align": "center",              //  выравнивание текста (left, center, right)
      // Font options.
      // Параметры шрифта.
      "textFormat": {
        "font": "xvm",                //  название
        "size": 24,                   //  размер
        "color": "0xFFBB00",          //  цвет (допускается использование динамического цвета, см. macros.txt)
        "bold": false,                //  обычный (false) или жирный (true)
        "italic": false               //  обычный (false) или курсив (true)
      },
      // Shadow options.
      // Параметры тени.
      "shadow": {
        // false - no shadow
        // false - без тени
        "enabled": true,
        "distance": 0,                //  дистанция смещения
        "angle": 45,                  //  угол смещения
        "color": "0x000000",          //  цвет
        "alpha": 100,                 //  прозрачность
        "blur": 4,                    //  размытие
        "strength": 1                 //  интенсивность
      },
      "format": "<font color='{{x-spotted?#FFBB00|#FFFFFF}}' alpha='{{x-spotted?#FF|#80}}'>{{x-spotted?&#x70;|{{x-sense-on?&#x70;}}}}</font> {{x-overturned?&#x112;}}"  //  формат текста. См. описание макросов в macros.txt
    },
    // Position of the player
    // Порядковый номер игрока
    "position": {
      "name": "position",             //  название текстового поля, ни на что не влияет
      "enabled": true,                //  false - не отображать
      "x": 0,                         //  положение по оси X
      "y": -51,                       //  положение по оси Y
      "alpha": 100,                   //  прозрачность (допускается использование динамической прозрачности, см. macros.txt)
      "align": "center",              //  выравнивание текста (left, center, right)
      "textFormat": {                 //  параметры шрифта
        "font": "$FieldFont",         //  название
        "size": 13,                   //  размер
        "color": "0xEDEDED",          //  цвет (допускается использование динамического цвета, см. macros.txt)
        "bold": false,                //  обычный (false) или жирный (true)
        "italic": false               //  обычный (false) или курсив (true)
      },
      "shadow": {                     //  параметры тени
        // false - no shadow
        // false - без тени
        "enabled": true,
        "distance": 0,                //   дистанция смещения
        "angle": 45,                  //   угол смещения
        "color": "{{c:system}}",      //   цвет
        "alpha": 100,                 //   прозрачность
        "blur": 6,                    //   размытие
        "strength": 2                 //   интенсивность
      },
      "format": "<font size='{{battletype?13|0}}'>{{position}}</font>"  //  формат текста. См. описание макросов в macros.txt
    },
    // "Top tankers" rank.
    // Позиция в "Танковых асах".
    "topTankers": {
      "name": "topTankers",
      "enabled": true,
      "x": 33,
      "y": -21,
      "alpha": 100,
      "align": "left",
      "format": "<img src='{{top_tankers_emblem}}' width='16' height='16'>"
    }
  },
  // Настройки для союзников.
  "ally": {
    // Type of vehicle icon (HT/MT/LT/TD/Arty).
    // Иконка типа танка (ТТ/СТ/ЛТ/ПТ/Арта).
    "vehicleIcon": {
      // false - disable / не отображать
      "enabled": true,
      // true - show speaker even if enabled=false
      // true - показывать спикер, даже если enabled=false
      "showSpeaker": false,
      // Axis field coordinates
      // Положение поля по осям
      "x": 0,
      "y": -16,
      // Opacity.
      // Прозрачность.
      "alpha": 100,
      // Maximum scale (default is 100).
      // Максимальный масштаб (по умолчанию 100).
      "maxScale": 100,
      // Offset along the X axis (?)
      // Смещение по оси X (?)
      "offsetX": 0,
      // Offset along the Y axis (?)
      // Смещение по оси Y (?)
      "offsetY": 0
    },
    // Индикатор здоровья.
    "healthBar": {
      "enabled": true,                  //   false - не отображать
      "x": -36,                         //   положение по оси X
      "y": -33,                         //   положение по оси Y
      "alpha": 100,                     //   прозрачность (допускается использование динамической прозрачности, см. macros.txt)
      "color": null,                    //   цвет основной (допускается использование динамического цвета, см. macros.txt)
      "lcolor": null,                   //   цвет дополнительный (для градиента)
      "width": 70,                      //   ширина полосы здоровья
      "height": 12,                     //   высота полосы здоровья
      // Параметры подложки и рамки.
      "border": {
        "alpha": 35,                    //     прозрачность
        "color": "0x000000",            //     цвет
        "size": 1                       //     размер рамки
      },
      // Параметры оставшегося здоровья.
      "fill": {
        "alpha": 50                     //     прозрачность
      },
      // Параметры анимации отнимаемого здоровья.
      "damage": {
        "alpha": 100,                   //     прозрачность
        "color": "{{c:dmg}}",           //     цвет
        "fade": 1                       //     время затухания в секундах
      }
    },
    // Floating damage values for ally, player, squadman.
    // Всплывающий урон для союзника, игрока, взводного.
    "damageText": {
      "$ref": { "path":"def.damageText" }
    },
    "damageTextPlayer": {
      "$ref": { "path":"def.damageText" }
    },
    "damageTextSquadman": {
      "$ref": { "path":"def.damageText" }
    },
    // Vehicle contour icon.
    // Контурная иконка танка.
    "contourIcon": {
      // false - disable / не отображать.
      "enabled": false,
      // Axis field coordinates.
      // Положение поля по осям.
      "x": 6,
      "y": -65,
      // Opacity (dynamic transparency allowed, see macros.txt).
      // Прозрачность (допускается использование динамической прозрачности, см. macros.txt).
      "alpha": 100,
      // Color (dynamic colors allowed, see macros.txt).
      // Цвет (допускается использование динамического цвета, см. macros.txt).
      "color": null,
      // Color intensity from 0 to 100. The default is 0 (off).
      // Интенсивность цвета от 0 до 100. По умолчанию 0, т.е. выключено.
      "amount": 0
    },
    // Vehicle tier.
    // Уровень танка.
    "levelIcon": {
      "enabled": false,  // false - disable        / не отображать.
      "x": 0,            // Position on the X axis / Положение по оси X.
      "y": -21,          // Position on the Y axis / Положение по оси Y.
      "alpha": 100       // Opacity                / Прозрачность.
    },
    // Markers "Help!" and "Attack!".
    // Маркеры "Нужна помощь" и "Атакую".
    "actionMarker": {
      "enabled": true,   // false - disable        / не отображать.
      "x": 0,            // Position on the X axis / Положение по оси X.
      "y": -67,          // Position on the Y axis / Положение по оси Y.
      "alpha": 100       // Opacity                / Прозрачность.
    },
    // Block of text fields (extended format supported, see extra-field.txt).
    // Блок текстовых полей (поддерживается расширенный формат, см. extra-field.txt).
    "textFields": [
      ${ "def.topTankers" },
      ${ "def.tankName" },
      ${ "def.playerName" },
      ${ "def.tankHp" },
      ${ "def.rating" },
      ${ "def.xmqpEvent" }
    ]
  },
  // Настройки для противников.
  "enemy": {
    // Type of vehicle icon (HT/MT/LT/TD/Arty).
    // Иконка типа танка (ТТ/СТ/ЛТ/ПТ/Арта).
    "vehicleIcon": {
      "enabled": true,
      "showSpeaker": false,
      "x": 0,
      "y": -16,
      "alpha": 100,
      "maxScale": 100,
      "offsetX": 0,
      "offsetY": 0
    },
    // Индикатор здоровья.
    "healthBar": {
      "enabled": true,
      "x": -36,
      "y": -33,
      "alpha": 100,
      "color": null,
      "lcolor": null,
      "width": 70,
      "height": 12,
      "border": {
        "alpha": 35,
        "color": "0x000000",
        "size": 1
      },
      "fill": {
        "alpha": 50
      },
      "damage": {
        "alpha": 100,
        "color": "{{c:dmg}}",
        "fade": 1
      }
    },
    // Floating damage values for ally, player, squadman.
    // Всплывающий урон для союзника, игрока, взводного.
    "damageText": {
      "$ref": { "path":"def.damageText" }
    },
    "damageTextPlayer": {
      "$ref": { "path":"def.damageText" }
    },
    "damageTextSquadman": {
      "$ref": { "path":"def.damageText" }
    },
    // Vehicle contour icon.
    // Контурная иконка танка.
    "contourIcon": {
      "enabled": false,
      "x": 6,
      "y": -65,
      "alpha": 100,
      "color": null,
      "amount": 0
    },
    // Vehicle tier.
    // Уровень танка.
    "levelIcon": {
      "enabled": false,
      "x": 0,
      "y": -21,
      "alpha": 100
    },
    // Markers "Help!" and "Attack!".
    // Маркеры "Нужна помощь" и "Атакую".
    "actionMarker": {
      "enabled": true,
      "x": 0,
      "y": -67,
      "alpha": 100
    },
    // Block of text fields (extended format supported, see extra-field.txt).
    // Блок текстовых полей (поддерживается расширенный формат, см. extra-field.txt).
    "textFields": [
      ${ "def.topTankers" },
      ${ "def.tankName" },
      ${ "def.tankHp" },
      ${ "def.rating" },
      ${ "def.position" }
    ]
  }
}