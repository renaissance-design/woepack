/**
 * Hit log (my hits calculator).
 */
{
  "hitLog": {
    // false - Disable.
    "enabled": true,
    // Group hits by players name.
    "groupHitsByPlayer": true,
    // Log direction: up - lines will be added from up to down, down - from down to up.
    "direction": "down",
    // Insert order: begin - insert new values to begin, end - add to end.
    "insertOrder": "begin",
    // Substitution for {{hitlog.dead}} macro when tank is dead.
    "deadMarker": "<font face='Wingdings'>N</font>",
    "blowupMarker": "<font face='Wingdings'>M</font>",
    "defaultHeader":  "{{l10n:Hits}}: <font size='13'>#0</font>",
    // Hits header format, including last hit (macros allowed, see macros.txt).
    "formatHeader":  "{{l10n:Hits}}: <font size='13'>#{{hitlog.n}}</font> {{l10n:Total}}: <b>{{hitlog.dmg-total}}</b>  {{l10n:Last}}: <font color='{{c:dmg-kind}}'><b>{{dmg}}</b></font> <font face='xvm' size='21'>{{hitlog.dead=&#x77;?&#x29;|{{hitlog.dead=&#x78;?&#x28;}}}}</font>",
    "formatHistory": "<textformat leading='-4' tabstops='[20,50,90,150]'><font size='12'>\u00D7{{hitlog.n-player}}:</font><tab>{{hitlog.dmg-player}}<tab>| <font color='{{c:dmg-kind}}'>{{dmg}}</font><tab>| <font color='{{c:dmg-kind}}'>{{dmg-kind}}</font><tab>| <font color='{{c:vtype}}'>{{vehicle}} {{dead}}</font></textformat>"
	}
}
