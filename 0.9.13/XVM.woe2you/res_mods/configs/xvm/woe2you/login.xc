/**
 * Parameters for login screen
 */
{
  "login": {
    // Skip intro movie
    "skipIntro": true,
    // Save last server
    "saveLastServer": false,
    // Auto enter to the game
    "autologin": false,
    // Auto confirm old replays playing
    "confirmOldReplays": false,
    // Ping servers
    "pingServers": {
      "$ref": { "file": "hangar.xc", "path": "hangar.pingServers" },
      // true - Show ping to the servers
      "enabled": true,
      // Axis field coordinates
      "x": 5,
      "y": 30
    }
  }
}
