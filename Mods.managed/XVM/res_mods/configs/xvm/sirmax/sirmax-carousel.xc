/**
 * Author: demon2597
 * http://www.koreanrandom.com/forum/topic/2172-5361-51014-demon2597-config-ru-en-more/
 */
{
  "def": {
    "textFieldShadow": { "color": "{{v.premium?0x994400|0x000000}}", "alpha": 0.8, "blur": 2, "strength": 2, "distance": 0, "angle": 0 }
  },
  "carousel": {
    //"enabled": false,
    //"zoom": 0.75,
    "rows": 2,
    "padding": { "horizontal": 3, "vertical": 3 },
    //"backgroundAlpha": 50,
    //"scrollingSpeed": 2,
    //"suppressCarouselTooltips": true,
    //"hideBuyTank": true,
    //"hideBuySlot": true,
    "showTotalSlots": true,
    //"showUsedSlots": true,
    //"nations_order": ["ussr", "germany", "usa", "france", "uk", "china", "japan", "czech"],
    //"types_order":   ["lightTank", "mediumTank", "heavyTank", "AT-SPG", "SPG"],
    //"sorting_criteria": ["nation", "level", "type"],
    "sorting_criteria": ["level", "nation", "type"],
    "filters": {
      //"params":   { "enabled": false },
      //"bonus":    { "enabled": false },
      //"favorite": { "enabled": false },
      "__stub__": {}
    },
    //"filtersPadding": { "horizontal": 5, "vertical": 5 },
    //"nations_order": [],
    //"types_order":   ["lightTank", "mediumTank", "heavyTank", "AT-SPG", "SPG"],
    //"sorting_criteria": ["nation", "type", "level"],
    //"suppressCarouselTooltips": false
    "fields": {
      "tankType":       { "enabled": true,  "dx": 0, "dy": 0, "alpha": 100, "scale": 1 },
      "level":          { "enabled": false, "dx": 0, "dy": 0, "alpha": 100, "scale": 1 },
      "multiXp":        { "enabled": true,  "dx": 0, "dy": 0, "alpha": 100, "scale": 1 },
      "xp":             { "enabled": true,  "dx": 0, "dy": 0, "alpha": 100, "scale": 1 },
      //"tankName":       { "enabled": false, "dx": 0, "dy": 0, "alpha": 100, "scale": 1 },
      "statusText":     { "enabled": true,  "dx": 0, "dy": 0, "alpha": 100, "scale": 1 },
      "statusTextBuy":  { "enabled": true,  "dx": 0, "dy": 0, "alpha": 100, "scale": 1 },
      "clanLock":       { "enabled": true,  "dx": 0, "dy": 0, "alpha": 100, "scale": 1 },
      "activateButton": { "dx": 0, "dy": 0, "alpha": 100, "scale": 1 },
      "__stub__": {}
    },
    "extraFields": [
        { "x": 140, "y": 15, "width": 50, "height": 40, "align": "right", "format": "{{v.xpToElite?{{v.earnedXP%'d|0}} {{v.xpToEliteLeft<1000?<font color='#88FF88' size='20'><b>|<font color='#CCCCCC' size='12'>}}({{v.xpToEliteLeft%'d}})</font>}}", "shadow": {} },
        { "x": 140, "y": 17, "src": "img://gui/maps/icons/library/XpIcon.png" },

        { "x": 135, "y": 57, "width": 25, "height": 25, "src": "img://gui/maps/icons/library/proficiency/class_icons_{{v.mastery}}.png" },

        { "x": 140, "y": 40, "src": "cfg://sirmax/img/marksOnGun/{{v.marksOnGun|empty}}.png" },
        { "x": 147, "y": "{{v.marksOnGun?38|37}}",
          "textFormat": { "size": 9, "color": "0xC8C8B5", "bold": true, "align": "center" },
          "format": "{{v.marksOnGun}}",
          "shadow": {}
        },
        { "x": 140, "y": "{{v.marksOnGun?38|37}}",
          "textFormat": { "size": 13, "align": "right" },
          "format": "<font color='{{v.c_damageRating}}'>{{v.damageRating%.2f~%}}</font>",
          "shadow": ${ "def.textFieldShadow" }
        },

        { "x": 21, "y": 0,
          "textFormat": { "size": 12, "color": "0xC8C8B5", "bold": true },
          "format": "<font face='Arial'>{{v.rlevel}}</font>  {{v.battletiermin}}-{{v.battletiermax}}",
          "shadow": ${ "def.textFieldShadow" }
        },

        { "x": 0, "y": 15, "width": 22, "height": 22, "src": "img://gui/maps/icons/library/dossier/wins40x32.png" },
        { "x": 21, "y": 15,
          "textFormat": { "size": 12, "bold": true },
          "format": "<font color='{{v.c_winrate}}'>{{v.winrate%2d~%}}</font>",
          "shadow": ${ "def.textFieldShadow" }
        },

        { "x": 0, "y": 33, "width": 22, "height": 22, "src": "img://gui/maps/icons/library/dossier/avgDamage40x32.png" },
        { "x": 21, "y": 35,
          "textFormat": { "size": 12, "bold": true },
          "format": "<font color='{{v.c_wn8effd}}'>{{v.wn8effd%0.2f}}</font>",
          "shadow": ${ "def.textFieldShadow" }
        },

        { "x": 0, "y": 51, "width": 22, "height": 22, "src": "img://gui/maps/icons/library/dossier/techRatio40x32.png" },
        { "x": 21, "y": 53,
          "textFormat": { "font": "mono", "size": 12, "bold": true },
          "format": "<font color='{{v.battles>9?{{v.c_xte|#666666}}|#666666}}'>{{v.xte|--}}</font>",
          "shadow": ${ "def.textFieldShadow" }
        },

        //{ "x": 158, "y": 77, "align": "right", "alpha": "{{v.premium?100|0}}",
        //  "format": "<font size='15' color='#FEA659'>{{v.name}}</font>",
        //  "shadow": { "color": "0xFC3700", "alpha": 1, "blur": 10, "strength": 2, "distance": 0, "angle": 0 }
        //},

        //{ "x": 158, "y": 77, "align": "right", "alpha": "{{v.premium?0|100}}",
        //  "format": "<font size='15' color='#C8C8B5'>{{v.name}}</font>",
        //  "shadow": { "color": "0x73734C", "alpha": 0.8, "blur": 6, "strength": 2, "distance": 0, "angle": 0 }
        //},

        { "x": 0, "y": 0, "width": "160", "height": 100, "bgColor": "{{v.selected?#FFA759|#000000}}", "alpha": "{{v.selected?15|0}}" },

        //{ "x": 0, "y": 0, "width": 160, "height": 100, "borderColor": "0xFFFFFF", "alpha": "{{v.selected?100|0}}" },

        {}
    ]
  }
}
