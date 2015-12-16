/**
 * Parameters of the Players Panels ("ears").
 */
{
  // Enemy spotted status marker format for substitutions in extra fields.
  "enemySpottedMarker": {
    // Opacity percentage of spotted markers in the panels. 0 - transparent (disabled) ... 100 - opaque.
    "alpha": "{{a:spotted}}",
    // x position.
    "x": -35,
    // y position.
    "y": -4,
    // Horizontal alignment
    "align": "right",
    // true - x position is binded to vehicle icon, false - binded to edge of the screen.
    "bindToIcon": true,
    // enemy spotted status marker format.
    "format": "{{spotted}}",
    // shadow (see below).
    "shadow": {}
  },
  "playersPanel": {
    // Opacity percentage of the panels. 0 - transparent, 100 - opaque.
    "alpha": 60,
    // Opacity percentage of icons in the panels. 0 - transparent ... 100 - opaque.
    "iconAlpha": 100,
    // true - Disable Platoon icons.
    "removeSquadIcon": false,
    // true - Remove the Players Panel mode switcher (buttons for changing size).
    "removePanelsModeSwitcher": false,
    // Start panels mode. Possible values: "none", "short", "medium", "medium2", "large".
    "startMode": "medium",
    // Alternative panels mode. Possible values: null, "none", "short", "medium", "medium2", "large".
    "altMode": null,
    // Display options for Team/Clan logos (see battleLoading.xc).
    "clanIcon": {
      "show": true,
      "x": 0,
      "y": 6,
      "xr": 0,
      "yr": 6,
      "w": 16,
      "h": 16,
      "alpha": 90
    },
    // Options for the "none" panels - empty panels.
    "none": {
      // Layout ("vertical" or "horizontal")
      "layout": "vertical",
      // Extra fields.
      "extraFields": {
        "leftPanel": {
          "x": 0, // from left side of screen
          "y": 65,
          "width": 350,
          "height": 25,
          // Set of formats for left panel
          // example:
          // "format": [
          //   // simple format (just a text)
          //   "{{nick}}",
          //   "<img src='xvm://res/img/panel-bg-l-{{alive|dead}}.png' width='318' height='28'>",
          //   // extended format
          //   { "x": 20, "y": 10, "border": 1, "borderColor": "0xFFFFFF", "format": "{{nick}}" },
          //   { "x": 200, "src": "xvm://res/contour/{{vehiclename}}.png" }
          // ]
          //
          // types of formats available for extended format:
          //   - MovieClip (for loading image)
          //   - TextField (for writing text and creating rectangles)
          // if "src" field is present, MovieClip format will be used
          // if "src" field is absent, TextField format will be used
          //
          // fields available for extended format:
          //   "src" - resource path ("xvm://res/contour/{{vehiclename}}.png")
          //   "format" - text format (macros allowed)
          //
          // fields available for both MovieClip and TextField formats:
          //   "x" - x position (macros allowed)
          //   "y" - y position (macros allowed)
          //   "w" - width (macros allowed)
          //   "h" - height (macros allowed)
          //   "alpha" - transparency in percents (0..100) (macros allowed)
          //   "rotation" - rotation in degrees (0..360) (macros allowed)
          //   "align" - horizontal alignment ("left", "center", "right")
          //      for left panel default value is "left"
          //      for right panel default value is "right"
          //
          // fields available for both TextField format only:
          //   "valign" - vertical alignment ("top", "center", "bottom")
          //      default value is "top"
          //   "borderColor" - if set, draw border with specified color (macros allowed)
          //   "bgColor" - if set, draw background with specified color (macros allowed)
          //   "antiAliasType" - anti aliasing mode ("advanced" or "normal")
          //   "shadow": {
          //     "distance" (in pixels)
          //     "angle"    (0.0 .. 360.0)
          //     "color"    "0xXXXXXX"
          //     "alpha"    (0.0 .. 1.0)
          //     "blur"     (0.0 .. 255.0)
          //     "strength" (0.0 .. 255.0)
          //    }
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
          "formats": []
        }
      }
    },
    // Options for the "short" panels - panels with frags and vehicle icon.
    "short": {
      // Display format for frags (macros allowed, see readme-en.txt).
      "fragsFormatLeft": "{{frags}}",
      "fragsFormatRight": "{{frags}}",
      // Extra fields. Each field have size 350x25. Fields are placed one above the other.
      // Set of formats for left panel (extended format supported, see above)
      "extraFieldsLeft": [],
      // Set of formats for right panel (extended format supported, see above)
      "extraFieldsRight": [
        // enemy spotted status marker (see above).
        ${"enemySpottedMarker"}
	  ]
    },
    // Options for the "medium" panels - the first of the medium panels.
    "medium": {
      // Minimum width of the player's name column, 0-250. Default is 46.
      "width": 46,
      // Display format for the left panel (macros allowed, see readme-en.txt).
      "formatLeft": " <font color='{{c:wn8}}'>{{nick}}</font>",
      // Display format for the right panel (macros allowed, see readme-en.txt).
      "formatRight": "<font color='{{c:wn8}}'>{{nick}}</font> ",
      // Display format for frags (macros allowed, see readme-en.txt).
      "fragsFormatLeft": "{{frags}}",
      "fragsFormatRight": "{{frags}}",
      // Extra fields. Each field have size 350x25. Fields are placed one above the other.
      // Set of formats for left panel (extended format supported, see above)
      "extraFieldsLeft": [],
      // Set of formats for right panel (extended format supported, see above)
      "extraFieldsRight": [
        // enemy spotted status marker (see above).
        ${"enemySpottedMarker"}
	  ]
    },
    // Options for the "medium2" panels - the second of the medium panels.
    "medium2": {
      // Maximum width of the vehicle name column, 0-250. Default is 65.
      "width": 65,
      // Display format for the left panel (macros allowed, see readme-en.txt).
      "formatLeft": "<font color='{{c:wn8}}'>{{vehicle}}</font>",
      // Display format for the right panel (macros allowed, see readme-en.txt).
      "formatRight": "<font color='{{c:wn8}}'>{{vehicle}}</font>",
      // Display format for frags (macros allowed, see readme-en.txt).
      "fragsFormatLeft": "{{frags}}",
      "fragsFormatRight": "{{frags}}",
      // Extra fields. Each field have size 350x25. Fields are placed one above the other.
      // Set of formats for left panel (extended format supported, see above)
      "extraFieldsLeft": [],
      // Set of formats for right panel (extended format supported, see above)
      "extraFieldsRight": [
        // enemy spotted status marker (see above).
        ${"enemySpottedMarker"}
	  ]
    },
    // Options for the "large" panels - the widest panels.
    "large": {
      // Minimum width of the player's name column, 0-250. Default is 170.
      "width": 170,
      // Display format for player nickname (macros allowed, see readme-en.txt).
      "nickFormatLeft": "<font color='{{c:wn8}}'>{{wn8}}</font> {{nick}}",
      "nickFormatRight": "{{nick}} <font color='{{c:wn8}}'>{{wn8}}</font>",
      // Display format for vehicle name (macros allowed, see readme-en.txt).
      "vehicleFormatLeft": "{{vehicle}}",
      "vehicleFormatRight": "{{vehicle}}",
      // Display format for frags (macros allowed, see readme-en.txt).
      "fragsFormatLeft": "{{frags}}",
      "fragsFormatRight": "{{frags}}",
      // Extra fields. Each field have size 350x25. Fields are placed one above the other.
      // Set of formats for left panel (extended format supported, see above)
      "extraFieldsLeft": [],
      // Set of formats for right panel (extended format supported, see above)
      "extraFieldsRight": [
        // enemy spotted status marker (see above).
        ${"enemySpottedMarker"}
	  ]
    }
  }
}
