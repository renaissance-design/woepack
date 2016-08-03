{
  "formats": [
    {
      "x": 235,
      "y": 0,
      "width": 500,
      "height": 230,
      "screenVAlign": "bottom",
      "$ref": { "file":"../default/battleLabelsTemplates.xc", "path":"def.hitlog" }
    },
    {
      //"enabled": false,
      "hotKeyCode": 36,
      //"height": 150,
      "visibleOnHotKey": "false",
      "$ref": { "file":"../default/battleLabelsTemplates.xc", "path":"def.test2" }
    },
    {
      //"enabled": false,
      "hotKeyCode": 36,
      "height": 150,
      "$ref": { "file":"../default/battleLabelsTemplates.xc", "path":"def.test2" }
    },
    {
      "enabled": true,
      //"borderColor": "0xFF0000",
      //"width": 200,
      //"height": 20,
      "format": "{{xvm-stat?{{l10n:Chance to win}}: {{chancesStatic}}{{chancesStatic? / |}}{{chancesLive}}|--}}",
      "$ref": { "file":"../default/battleLabelsTemplates.xc", "path":"def.winChance" }
    },
    {
      "enabled": true,
      //"borderColor": "0xFF0000",
      //"y":150,
      "updateEvent": "ON_PLAYERS_HP_CHANGED,ON_VEHICLE_DESTROYED",
      "$ref": { "file":"../default/battleLabelsTemplates.xc", "path":"def.totalHP" }
    }
  ]
}
