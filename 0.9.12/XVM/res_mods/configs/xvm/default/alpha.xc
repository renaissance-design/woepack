﻿/**
 * Options for dynamic transparency. Values ​​from smallest to largest.
 * Настройки динамической прозрачности. Значения от меньшего к большему.
 */
{
  // Dynamic transparency by various statistical parameters.
  // Динамическая прозрачность по различным статистическим показателям.
  "alphaRating": {
    "very_bad":     "100",  // very bad   / очень плохо
    "bad":          "70",   // bad        / плохо
    "normal":       "40",   // normal     / средне
    "good":         "10",   // good       / хорошо
    "very_good":    "0",    // very good  / очень хорошо
    "unique":       "0"     // unique     / уникально
  },
  // Dynamic transparency by remaining health points.
  // Динамическая прозрачность по оставшемуся запасу прочности.
  "alphaHP": {
    "very_low":         "100",  // very low       / очень низкий
    "low":              "75",   // low            / низкий
    "average":          "50",   // average        / средний
    "above_average":    "0"     // above-average  / выше среднего
  },
  "alpha": {
    // Dynamic transparency by spotted status
    // Динамическая прозрачность по статусу засвета
    "spotted": {
      "neverSeen":      100,
      "lost":           100,
      "spotted":        100,
      "dead":           100,
      "neverSeen_arty": 100,
      "lost_arty":      100,
      "spotted_arty":   100,
      "dead_arty":      100
    },
    // Dynamic transparency by remaining health.
    // Динамическая прозрачность по оставшемуся здоровью.
    "hp": [
      { "value": 200,  "alpha": ${"alphaHP.very_low"     } },
      { "value": 400,  "alpha": ${"alphaHP.low"          } },
      { "value": 1000, "alpha": ${"alphaHP.average"      } },
      { "value": 9999, "alpha": ${"alphaHP.above_average"} }
    ],
    // Dynamic transparency by percentage of remaining health.
    // Динамическая прозрачность по проценту оставшегося здоровья.
    "hp_ratio": [
      { "value": 10,  "alpha": ${"alphaHP.very_low"     } },
      { "value": 25,  "alpha": ${"alphaHP.low"          } },
      { "value": 50,  "alpha": ${"alphaHP.average"      } },
      { "value": 101, "alpha": ${"alphaHP.above_average"} }
    ],
    // Dynamic transparency for XVM Scale
    // Динамическая прозрачность по шкале XVM
    "x": [
      { "value": 16.5, "alpha": ${"alphaRating.very_bad" } },
      { "value": 33.5, "alpha": ${"alphaRating.bad"      } },
      { "value": 52.5, "alpha": ${"alphaRating.normal"   } },
      { "value": 75.5, "alpha": ${"alphaRating.good"     } },
      { "value": 92.5, "alpha": ${"alphaRating.very_good"} },
      { "value": 999,  "alpha": ${"alphaRating.unique"   } }
    ],
    // Dynamic transparency by efficiency
    // Динамическая прозрачность по эффективности
    "eff": [
      { "value": 615,  "alpha": ${"alphaRating.very_bad" } },
      { "value": 870,  "alpha": ${"alphaRating.bad"      } },
      { "value": 1175, "alpha": ${"alphaRating.normal"   } },
      { "value": 1525, "alpha": ${"alphaRating.good"     } },
      { "value": 1850, "alpha": ${"alphaRating.very_good"} },
      { "value": 9999, "alpha": ${"alphaRating.unique"   } }
    ],
    // Dynamic transparency by WN6 rating
    // Динамическая прозрачность по рейтингу WN6
    "wn6": [
      { "value": 460,  "alpha": ${"alphaRating.very_bad" } },
      { "value": 850,  "alpha": ${"alphaRating.bad"      } },
      { "value": 1215, "alpha": ${"alphaRating.normal"   } },
      { "value": 1620, "alpha": ${"alphaRating.good"     } },
      { "value": 1960, "alpha": ${"alphaRating.very_good"} },
      { "value": 9999, "alpha": ${"alphaRating.unique"   } }
    ],
    // Dynamic transparency by WN8 rating
    // Динамическая прозрачность по рейтингу WN8
    "wn8": [
      { "value": 380,  "alpha": ${"alphaRating.very_bad" } },
      { "value": 860,  "alpha": ${"alphaRating.bad"      } },
      { "value": 1420, "alpha": ${"alphaRating.normal"   } },
      { "value": 2105, "alpha": ${"alphaRating.good"     } },
      { "value": 2770, "alpha": ${"alphaRating.very_good"} },
      { "value": 9999, "alpha": ${"alphaRating.unique"   } }
    ],
    // Dynamic transparency by WG rating
    // Динамическая прозрачность по рейтингу WG
    "wgr": [
      { "value": 2495,  "alpha": ${"alphaRating.very_bad" } },
      { "value": 4345,  "alpha": ${"alphaRating.bad"      } },
      { "value": 6425,  "alpha": ${"alphaRating.normal"   } },
      { "value": 8625,  "alpha": ${"alphaRating.good"     } },
      { "value": 10040, "alpha": ${"alphaRating.very_good"} },
      { "value": 99999, "alpha": ${"alphaRating.unique"   } }
    ],
    // Dynamic transparency by win percent
    // Динамическая прозрачность по проценту побед
    "winrate": [
      { "value": 46.5, "alpha": ${"alphaRating.very_bad" } },
      { "value": 48.5, "alpha": ${"alphaRating.bad"      } },
      { "value": 52.5, "alpha": ${"alphaRating.normal"   } },
      { "value": 57.5, "alpha": ${"alphaRating.good"     } },
      { "value": 64.5, "alpha": ${"alphaRating.very_good"} },
      { "value": 101,  "alpha": ${"alphaRating.unique"   } }
    ],
    // Dynamic transparency by kilo-battles
    // Динамическая прозрачность по количеству кило-боев
    "kb": [
      { "value": 2,   "alpha": ${"alphaRating.very_bad" } },
      { "value": 6,   "alpha": ${"alphaRating.bad"      } },
      { "value": 16,  "alpha": ${"alphaRating.normal"   } },
      { "value": 30,  "alpha": ${"alphaRating.good"     } },
      { "value": 43,  "alpha": ${"alphaRating.very_good"} },
      { "value": 999, "alpha": ${"alphaRating.unique"   } }
    ],
    // Dynamic transparency by average level of player tanks
    // Динамическая прозрачность по среднему уровню танков игрока
    "avglvl": [
      { "value": 2,   "alpha": ${"alphaRating.very_bad" } },
      { "value": 3,   "alpha": ${"alphaRating.bad"      } },
      { "value": 5,   "alpha": ${"alphaRating.normal"   } },
      { "value": 7,   "alpha": ${"alphaRating.good"     } },
      { "value": 9,   "alpha": ${"alphaRating.very_good"} },
      { "value": 11,  "alpha": ${"alphaRating.unique"   } }
    ],
    // Dynamic transparency by battles on current tank
    // Динамическая прозрачность по количеству боев на текущем танке
    "t_battles": [
      { "value": 100,   "alpha": ${"alphaRating.very_bad" } },
      { "value": 250,   "alpha": ${"alphaRating.bad"      } },
      { "value": 500,   "alpha": ${"alphaRating.normal"   } },
      { "value": 1000,  "alpha": ${"alphaRating.good"     } },
      { "value": 1800,  "alpha": ${"alphaRating.very_good"} },
      { "value": 99999, "alpha": ${"alphaRating.unique"   } }
    ],
    // Dynamic transparency by average damage on current tank
    // Динамическая прозрачность по среднему урону за бой на текущем танке
    "tdb": [
      { "value": 500,  "alpha": ${"alphaRating.very_bad" } },
      { "value": 750,  "alpha": ${"alphaRating.bad"      } },
      { "value": 1000, "alpha": ${"alphaRating.normal"   } },
      { "value": 1800, "alpha": ${"alphaRating.good"     } },
      { "value": 2500, "alpha": ${"alphaRating.very_good"} },
      { "value": 9999, "alpha": ${"alphaRating.unique"   } }
    ],
    // Dynamic transparency by average damage efficiency on current tank
    // Динамическая прозрачность по эффективности урона за бой на текущем танке
    "tdv": [
      { "value": 0.6,  "alpha": ${"alphaRating.very_bad" } },
      { "value": 0.8,  "alpha": ${"alphaRating.bad"      } },
      { "value": 1.0,  "alpha": ${"alphaRating.normal"   } },
      { "value": 1.3,  "alpha": ${"alphaRating.good"     } },
      { "value": 2.0,  "alpha": ${"alphaRating.very_good"} },
      { "value": 15,   "alpha": ${"alphaRating.unique"   } }
    ],
    // Dynamic transparency by average frags per battle on current tank
    // Динамическая прозрачность по среднему количеству фрагов за бой на текущем танке
    "tfb": [
      { "value": 0.6,  "alpha": ${"alphaRating.very_bad" } },
      { "value": 0.8,  "alpha": ${"alphaRating.bad"      } },
      { "value": 1.0,  "alpha": ${"alphaRating.normal"   } },
      { "value": 1.3,  "alpha": ${"alphaRating.good"     } },
      { "value": 2.0,  "alpha": ${"alphaRating.very_good"} },
      { "value": 15,   "alpha": ${"alphaRating.unique"   } }
    ],
    // Dynamic transparency by number of spotted enemies per battle on current tank
    // Динамическая прозрачность по среднему количеству засвеченных врагов за бой на текущем танке
    "tsb": [
      { "value": 0.6,  "alpha": ${"alphaRating.very_bad" } },
      { "value": 0.8,  "alpha": ${"alphaRating.bad"      } },
      { "value": 1.0,  "alpha": ${"alphaRating.normal"   } },
      { "value": 1.3,  "alpha": ${"alphaRating.good"     } },
      { "value": 2.0,  "alpha": ${"alphaRating.very_good"} },
      { "value": 15,   "alpha": ${"alphaRating.unique"   } }
    ]
  }
}
