/**
 * Parameters for tank carousel
 */
{
  "carousel": {
    // false - Disable customizable carousel.
    "enabled": true,
    // Scale of carousel cells.
    "zoom": 0.9,
    // Number of rows on the carousel.
    "rows": 3,
    // Spacing between carousel cells.
    "padding": {
        "horizontal": 10,   // ?? ???????????
        "vertical": 2       // ?? ?????????
    },
    // true - show filters even if all tanks fit on the screen.
    // true - ?????????? ??????? ???? ???? ??? ????? ?????????? ?? ??????.
    "alwaysShowFilters": false,
    // true - hide cell "Buy tank".
    // true - ?????? ?????? "?????? ????".
    "hideBuyTank": false,
    // true - hide cell "Buy slot".
    // true - ?????? ?????? "?????? ????".
    "hideBuySlot": false,
    // Visibility filters.
    // ????????? ????????.
    "filters": {
      // false - hide filter.
      // false - ?????? ??????.
      "nation":   { "enabled": true },  // nation           / ??????
      "type":     { "enabled": true },  // vehicle class    / ??? ???????
      "level":    { "enabled": true },  // vehicle level    / ??????? ???????
      "favorite": { "enabled": true },  // favorite tanks   / ???????? ?????
      "prefs":    { "enabled": true }   // other filters    / ?????? ???????
    },
    // Standard cell elements.
    // ??????????? ???????? ?????.
       "fields": {
      "tankType": { "visible": true, "dx": 0, "dy": 0, "alpha": 100, "scale": 1 },
      "level":    { "visible": true, "dx": 0, "dy": 0, "alpha": 100, "scale": 1 },
      "xp":       { "visible": true, "dx": 0, "dy": 0, "alpha": 100, "scale": 1 },
      "multiXp":  { "visible": true, "dx": 0, "dy": 0, "alpha": 100, "scale": 1 },
      "tankName": { "visible": true, "dx": 0, "dy": 0, "alpha": 100, "scale": 1 }
    },
    "extraFields": [
      { "x": 46, "y": -1, "format": "<font size='12' face='$FieldFont' color='{{v.c_winrate}}'><b>{{v.winrate%5.2f~%}}</b></font>", "shadow": { "color": "0x000000", "alpha": 0.8, "blur": 2, "strength": 5, "distance": 0, "angle": 0 }},
      { "x": 111, "y": -1, "align": "right", "format": "<font size='12' face='$FieldFont' color='{{v.c_battles}}'>{{v.battles%-4d}}</font>", "shadow": { "color": "0x000000", "alpha": 0.8, "blur": 2, "strength": 5, "distance": 0, "angle": 0 }},
      { "x": 119, "y": 12, "format": "<img src='img://gui/maps/icons/library/proficiency/class_icons_{{v.mastery}}.png' width='26' height='26'>" },
      { "x": 1, "y": 20, "format": "<font size='12' face='$FieldFont' color='{{v.c_tfb}}'>{{v.tfb%-4.2f}}</font>", "shadow": { "color": "0x000000", "alpha": 0.8, "blur": 2, "strength": 5, "distance": 0, "angle": 0 }},
      { "x": 1, "y": 34, "format": "<font size='12' face='$FieldFont' color='#FFFFFF'>{{v.tdb%-4d}}</font>", "shadow": { "color": "0x000000", "alpha": 0.8, "blur": 2, "strength": 5, "distance": 0, "angle": 0 }},
      { "x": 1, "y": 49, "format": "<font size='12' face='$FieldFont' color='#00CC99'>{{v.wn8expd%-4d}}</font>", "shadow": { "color": "0x000000", "alpha": 0.8, "blur": 2, "strength": 5, "distance": 0, "angle": 0 }},
      { "x": 128, "y": 34, "format": "<font size='12' face='$FieldFont' color='{{v.c_xte}}'>{{v.xte}}</font>" },
      { "x": 107, "y": 49, "format": "<font size='12' face='$FieldFont' color='{{v.c_damageRating}}'>{{v.damageRating%-5.2f~%}}</font>", "shadow": { "color": "0x000000", "alpha": 0.8, "blur": 2, "strength": 5, "distance": 0, "angle": 0 }}
    ],
    "nations_order": ["usa", "uk", "germany", "france", "ussr", "china", "japan"],
    "types_order":   ["lightTank", "mediumTank", "heavyTank", "AT-SPG", "SPG"],
    "sorting_criteria": ["nation", "type", "level"]
  }
}
