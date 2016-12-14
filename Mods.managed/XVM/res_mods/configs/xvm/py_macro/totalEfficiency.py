﻿import BigWorld
from xfw import *
from xvm_main.python.logger import *
from Vehicle import Vehicle
from Avatar import PlayerAvatar
# from gui.battle_control import g_sessionProvider
from gui.battle_control.battle_constants import PERSONAL_EFFICIENCY_TYPE
from gui.Scaleform.daapi.view.battle.shared.damage_log_panel import DamageLogPanel
from gui.Scaleform.daapi.view.battle.shared.ribbons_panel import BattleRibbonsPanel

totalDamage = 0
totalAssist = 0
totalBlocked = 0
maxHealth = 0
damageReceived = 0
vehiclesHealth = {}
damagesSquad = 0
detection = 0

ribbonTypes = {
    'armor': 0,
    'damage': 0,
    'ram': 0,
    'burn': 0,
    'kill': 0,
    'teamKill': 0,
    'spotted': 0,
    'assistTrack': 0,
    'assistSpot': 0,
    'crits': 0,
    'capture': 0,
    'defence': 0,
    'assist': 0
}


@registerEvent(DamageLogPanel, '_onTotalEfficiencyUpdated')
def _onTotalEfficiencyUpdated(self, diff):
    global totalDamage
    global totalAssist
    global totalBlocked
    if PERSONAL_EFFICIENCY_TYPE.DAMAGE in diff:
        totalDamage = diff[PERSONAL_EFFICIENCY_TYPE.DAMAGE]
    if PERSONAL_EFFICIENCY_TYPE.ASSIST_DAMAGE in diff:
        totalAssist = diff[PERSONAL_EFFICIENCY_TYPE.ASSIST_DAMAGE]
    if PERSONAL_EFFICIENCY_TYPE.BLOCKED_DAMAGE in diff:
        totalBlocked = diff[PERSONAL_EFFICIENCY_TYPE.BLOCKED_DAMAGE]
    as_event('ON_TOTAL_EFFICIENCY')


@registerEvent(BattleRibbonsPanel, '_BattleRibbonsPanel__addBattleEfficiencyEvent')
def addBattleEfficiencyEvent(self, ribbonType = '', leftFieldStr = '', vehName = '', vehType = '', rightFieldStr = ''):
    global ribbonTypes
    if ribbonType in ['assistTrack']:
        ribbonTypes[ribbonType] = (totalAssist - ribbonTypes['assistSpot']) if totalAssist else 0
    if ribbonType in ['assistSpot']:
        ribbonTypes[ribbonType] = (totalAssist - ribbonTypes['assistTrack']) if totalAssist else 0
    if ribbonType in ['spotted', 'kill', 'teamKill', 'crits']:
        ribbonTypes[ribbonType] += 1
    as_event('ON_TOTAL_EFFICIENCY')


@registerEvent(Vehicle, 'onHealthChanged')
def onHealthChanged(self, newHealth, attackerID, attackReasonID):
    global vehiclesHealth
    if self.id in vehiclesHealth:
        damage = vehiclesHealth[self.id] - max(0, newHealth)
        vehiclesHealth[self.id] = newHealth
        player = BigWorld.player()
        attacker = player.arena.vehicles.get(attackerID)
        if player.guiSessionProvider.getArenaDP().isSquadMan(vID=attackerID) and attacker['name'] != player.name:
            global damagesSquad
            damagesSquad += damage
            as_event('ON_TOTAL_EFFICIENCY')
    global damageReceived
    if self.isPlayerVehicle:
        damageReceived = maxHealth - max(0, newHealth)
        as_event('ON_TOTAL_EFFICIENCY')


@registerEvent(Vehicle, 'onEnterWorld')
def onEnterWorld(self, prereqs):
    player = BigWorld.player()
    if self.publicInfo['team'] != player.team:
        global vehiclesHealth
        vehiclesHealth[self.id] = self.health
    if self.isPlayerVehicle:
        global maxHealth
        maxHealth = self.health


@registerEvent(PlayerAvatar, '_PlayerAvatar__destroyGUI')
def destroyGUI(self):
    global vehiclesHealth
    global totalDamage
    global totalAssist
    global totalBlocked
    global damageReceived
    global damagesSquad
    global detection
    global ribbonTypes
    vehiclesHealth = {}
    totalDamage = 0
    totalAssist = 0
    totalBlocked = 0
    damageReceived = 0
    damagesSquad = 0
    detection = 0
    ribbonTypes = {
        'armor': 0,
        'damage': 0,
        'ram': 0,
        'burn': 0,
        'kill': 0,
        'teamKill': 0,
        'spotted': 0,
        'assistTrack': 0,
        'assistSpot': 0,
        'crits': 0,
        'capture': 0,
        'defence': 0,
        'assist': 0
    }


@xvm.export('xvm.totalDamage', deterministic=False)
def xvm_totalDamage():
    return totalDamage


@xvm.export('xvm.totalAssist', deterministic=False)
def xvm_totalAssist():
    return totalAssist


@xvm.export('xvm.totalBlocked', deterministic=False)
def xvm_totalBlocked():
    return totalBlocked


@xvm.export('xvm.damageReceived', deterministic=False)
def xvm_damageReceived():
    return damageReceived


@xvm.export('xvm.totalDamagesBlocked', deterministic=False)
def xvm_totalDamagesBlocked():
    return totalDamage + totalBlocked


@xvm.export('xvm.totalDamagesAssist', deterministic=False)
def xvm_totalDamagesAssist():
    return totalDamage + totalAssist


@xvm.export('xvm.totalDamagesBlockedAssist', deterministic=False)
def xvm_totalDamagesBlockedAssist():
    return totalDamage + totalAssist + totalBlocked


@xvm.export('xvm.totalDamagesBlockedReceived', deterministic=False)
def xvm_totalDamagesBlockedReceived():
    return totalDamage + totalBlocked + damageReceived


@xvm.export('xvm.totalBlockedReceived', deterministic=False)
def xvm_totalBlockedReceived():
    return totalBlocked + damageReceived


@xvm.export('xvm.totalDamagesSquad', deterministic=False)
def xvm_totalDamagesSquad():
    return damagesSquad + totalDamage


@xvm.export('xvm.damagesSquad', deterministic=False)
def xvm_damagesSquad():
    return damagesSquad


@xvm.export('xvm.detection', deterministic=False)
def xvm_detection():
    return ribbonTypes['spotted']


@xvm.export('xvm.frags', deterministic=False)
def xvm_frags():
    return ribbonTypes['kill']


@xvm.export('xvm.assistTrack', deterministic=False)
def xvm_assistTrack():
    return ribbonTypes['assistTrack']


@xvm.export('xvm.assistSpot', deterministic=False)
def xvm_assistSpot():
    return ribbonTypes['assistSpot']


@xvm.export('xvm.crits', deterministic=False)
def xvm_crits():
    return ribbonTypes['crits']