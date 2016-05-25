/**
 * Minimap circles. Only real map meters. Only for own unit.
 */
{
    "circles": {
        "enabled": true,
        // TODO: better description
        // View distance
        //   "enabled": false 
        //   "distance" 
        //   "scale" 
        //   "thickness" 
        //   "alpha"
        //   "color"
        //   "state"
        "view": [
            // Main circles:
            { "enabled":  true, "distance": "blindarea", "scale": 1, "thickness": 0.75, "alpha": 50, "color": "0x3EB5F1" },
            { "enabled":  true, "distance": 445, "scale": 1, "thickness":  1.1, "alpha": 45, "color": "0x008000" },
			
            // Additional circles:
            { "enabled": true, "distance": 50, "scale": 1, "thickness": 0.5, "alpha": 50, "color": "0xFF0000" },
			{ "enabled": true, "distance": 100, "scale": 1, "thickness": 0.5, "alpha": 15, "color": "0xCCFFCC" },
			{ "enabled": true, "distance": 150, "scale": 1, "thickness": 0.5, "alpha": 15, "color": "0xCCFFCC" },
			{ "enabled": true, "distance": 200, "scale": 1, "thickness": 0.5, "alpha": 15, "color": "0xCCFFCC" },
			{ "enabled": true, "distance": 250, "scale": 1, "thickness": 0.5, "alpha": 15, "color": "0xCCFFCC" },
			{ "enabled": true, "distance": 300, "scale": 1, "thickness": 0.5, "alpha": 15, "color": "0xCCFFCC" },
			{ "enabled": true, "distance": 350, "scale": 1, "thickness": 0.5, "alpha": 15, "color": "0xCCFFCC" },
			{ "enabled": true, "distance": 400, "scale": 1, "thickness": 0.5, "alpha": 15, "color": "0xCCFFCC" },
			{ "enabled": true, "distance": 450, "scale": 1, "thickness": 0.5, "alpha": 15, "color": "0xCCFFCC" },
			{ "enabled": true, "distance": 500, "scale": 1, "thickness": 0.5, "alpha": 15, "color": "0xCCFFCC" },
			{ "enabled": true, "distance": 550, "scale": 1, "thickness": 0.5, "alpha": 15, "color": "0xCCFFCC" },
			{ "enabled": true, "distance": 564, "scale": 1, "thickness": 0.7, "alpha": 40, "color": "0xFFFFFF" },
            { "enabled": false, "distance": "standing",  "scale": 1, "thickness":  1.0, "alpha": 60, "color": "0xCCFFCC" },
            { "enabled": false, "distance": "motion",    "scale": 1, "thickness":  1.0, "alpha": 60, "color": "0x0000FF" },
            { "enabled": false, "distance": "dynamic",   "scale": 1, "thickness":  1.0, "alpha": 60, "color": "0x3EB5F1" }
        ],
		
        // Maximum range of fire for artillery
        // Artillery gun fire range may differ depending on vehicle angle relative to ground
        // and vehicle height positioning relative to target. These factors are not considered.
        // See pics at http://goo.gl/ZqlPa
        "artillery": { "enabled": true, "alpha": 55, "color": "0xFF6666", "thickness": 0.5 },
		
        // Maximum range of shooting for machine gun
        "shell":     { "enabled": true, "alpha": 55, "color": "0xFF6666", "thickness": 0.5 },
		
        // Special circles dependent on vehicle type.
        // Many configuration lines for the same vehicle make many circles.
        // See other vehicle types at (replace : symbol with -):
        // http://code.google.com/p/wot-xvm/source/browse/trunk/src/xpm/xvmstat/vehinfo_short.py
        "special": [
          // Example: Artillery gun fire range circle
          // "enabled": false - выключен; "thickness" - толщина; "alpha" - прозрачность; "color" - цвет.
          //{ "ussr-SU-18": { "enabled": true, "thickness": 1, "alpha": 60, "color": "0xEE4444", "distance": 500 } },
        ]
    }
}