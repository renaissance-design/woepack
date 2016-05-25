﻿/**
 * Extra sounds settings.
 * Настройки дополнительных звуков.
 * http://www.koreanrandom.com/forum/topic/18955-
 */
{
  "sounds": {
    "enabled": true,
    // List of extra banks to load from folder res_mods/X.Y.Z/audioww.
    // Use semicolon for multiple values: "bank1.bnk; bank2.bnk;..."
    // Список дополнительных банков для загрузки из папки res_mods/X.Y.Z/audioww.
    // Несколько банков необходимо указывать через точку с запятой: "bank1.bnk; bank2.bnk;..."
    "soundBanks": {
      "hangar": "xvm.bnk",
      "battle": "xvm.bnk"
    },
    // Enable sound events logging in the xvm.log
    // Включить логгирование звуковых событий в xvm.log
    "logSoundEvents": false,
    // Sound events remapping
    // Переопределение звуковых событий
    "soundMapping": {
      // Event mapping
      // Переопределение события
      //"originalEventName": "newEventName"
      // To disable sound event use empty string for value
      // Для отключения звукового события используйте пустую строку для значения
      //"originalEventName": ""
      //
      // Disable original sixth sense light bulb sound event
      // Отключить оригинальный звук лампы шестого чувства
      "lightbulb": "",
      //
      // Disable original enemy detection event      
      // Отключить оригинальный звук обнаружения противника
      //"enemy_sighted_for_team": "",
      //      
      // Disable original fire sound event
      // Отключить оригинальный звук пожара
      //"vo_fire_started": "",
      //
      // Disable original ammo bay damaged event
      // Отключить оригинальный звук повреждения боеукладки
      //"vo_ammo_bay_damaged": "",
      //
      // Disable original notifications informing about the imminent end of the battle event
      // Отключить оригинальный звук оповещения сообщающий о скором завершении боя
      //"time_buzzer_01": "",
      //"time_buzzer_02": "",
      //
      // Sound events added by XVM
      // Звуковые события, добавленные в XVM
      //
      // Perk SixthSense
      // Перк Шестое чувство
      "xvm_sixthSense": "sixthsense",
      // Perk SixthSense (On vehicle Т-34-85 Rudy)
      // Перк Шестое чувство (На технике Т-34-85 Rudy)
      "xvm_sixthSenseRudy": "sixthSenseRudy",
      // Enemy detection (Use in together with disable original enemy detection event) 
      // Обнаружение противника (Используйте вместе с отключением оригинального звука обнаружения противника)
      "xvm_enemySighted": "",      
      //"xvm_enemySighted": "enemySighted",      
      // Fire alert
      // Пожар
      "xvm_fireAlert": "fireAlert",
      // Damage ammoBay
      // Повреждение боеукладки
      "xvm_ammoBay": "ammoBay",
      // Notifications informing about the imminent end of the battle (Use in together with disable original event)
      // Оповещения сообщающие о скором завершении боя (Используйте вместе с отключением оригинального звука)
      "xvm_battleEnd_5_min": "",
      //"xvm_battleEnd_5_min": "battleEnd_5_min",
      "xvm_battleEnd_3_min": "",
      //"xvm_battleEnd_3_min": "battleEnd_3_min",
      "xvm_battleEnd_2_min": "",
      //"xvm_battleEnd_2_min": "battleEnd_2_min",
      "xvm_battleEnd_1_min": "",
      //"xvm_battleEnd_1_min": "battleEnd_1_min",
      "xvm_battleEnd_30_sec": "",
      //"xvm_battleEnd_30_sec": "battleEnd_30_sec",
      "xvm_battleEnd_5_sec": ""
      //"xvm_battleEnd_5_sec": "battleEnd_5_sec"
    }
  }
}
