/**
 * Parameters for hangar
 * Параметры ангара
 */
{
  "hangar": {
    // true - Show XWN8 instead of XEFF in company windows
    "xwnInCompany": true,
    "enableGoldLocker": true,
    // true - enable locker for free XP
    "enableFreeXpLocker": true,
    // true - Use credits instead of gold as default currency for ammo and equipment
    "defaultBoughtForCredits": true,
    // true - Show mastery mark in tech tree
    "masteryMarkInTechTree": true,
    // true - Hide price button in tech tree
    "hidePricesInTechTree": false,
    // true - Enable removable equipment auto return (Camouflage net, Stereoscope, Toolbox)
    "enableEquipAutoReturn": true,
    // true - Make vehicle not ready for battle if low ammo
    "blockVehicleIfLowAmmo": false,
    // Below this percentage, ammo is low. (0 - 100)
    "lowAmmoPercentage": 100,
    // true - Enable widgets
    "widgetsEnabled": false,
    // Ping servers
    "pingServers": {
      // true - Enable display of ping to the servers
      "enabled": true,
      // Update interval, in ms
      "updateInterval": 10000,
      // Axis field coordinates
      "x": 3,
      "y": 51,
      // Transparency
      "alpha": 80,
      // Server to response time text delimiter
      "delimiter": ": ",
      // Maximum number of column rows
      "maxRows": 2,
      // Gap between columns
      "columnGap": 3,
      // Leading between lines.
      "leading": 0,
      // true - place at top of other windows, false - at bottom.
      "topmost": true,
      // Text style
      "fontStyle": {
        // Font name
        "name": "$FieldFont",
        "size": 12,         // Размер
        "bold": false,      // Жирный
        "italic": false,    // Курсив
        // Different colors depending on server response time
        // Разные цвета в зависимости от времени отклика сервера
        "color": {
          "great": "0xFFCC66",  // Отличный
          "good":  "0xE5E4E1",  // Хороший
          "poor":  "0x96948F",  // Так себе
          "bad":   "0xD64D4D"   // Плохой
        }
      },
      // Threshold values defining response quality
      // Пороговые значения, определяющие качество отклика
      "threshold": {
        // Below this value response is great
        // До этого значения отклик отличный
        "great": 35,
        // Below this value response is good
        // До этого значения отклик хороший
        "good": 60,
        // Below this value response is poor
        // До этого значения отклик так себе
        "poor": 100
        // Values above define bad response
        // Значения более считаются плохим откликом
      },
      // Параметры тени
      "shadow": {
        "enabled": true,
        "color": "0x000000",
        "distance": 0,
        "angle": 0,
        "alpha": 70,
        "blur": 4,
        "strength": 2
      }
    },
    // Parameters for tank carousel
    // Параметры карусели танков
    "carousel": ${"carousel.xc":"carousel"},
    // Parameters for hangar clock
    // Параметры часов в ангаре
    "clock": ${"clock.xc":"clock"}
  }
}
