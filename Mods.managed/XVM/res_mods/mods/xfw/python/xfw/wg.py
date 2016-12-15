""" XFW Library (c) www.modxvm.com 2013-2016 """

#################################################################
# WG-Specific

import BigWorld
import ResMgr
from gui.app_loader.loader import g_appLoader

def getLobbyApp():
    return g_appLoader.getDefLobbyApp()


def getBattleApp():
    return g_appLoader.getDefBattleApp()


def getCurrentAccountDBID():
    # return 2178413 # DEBUG
    player = BigWorld.player()
    if hasattr(player, 'databaseID'):
        return player.databaseID

    arena = getattr(player, 'arena', None)
    if arena is not None:
        vehID = getattr(player, 'playerVehicleID', None)
        if vehID is not None and vehID in arena.vehicles:
            return arena.vehicles[vehID]['accountDBID']

    return None


_isReplay = None
_replayCtrl = None

def isReplay():
    global _isReplay
    if _isReplay is None:
        import BattleReplay
        global _replayCtrl
        _replayCtrl = BattleReplay.g_replayCtrl
        _isReplay = _replayCtrl.isPlaying
    return _isReplay


def getArenaPeriod():
    try:
        if isReplay():
            global _replayCtrl
            return _replayCtrl.getArenaPeriod()
        else:
            player = BigWorld.player()
            return 4 if player is None or player.arena is None else player.arena.period
    except:
        # err(traceback.format_exc())
        return 4

def getVehCD(vehicleID):
    return BigWorld.player().arena.vehicles[vehicleID]['vehicleType'].type.compactDescr


# Region and language

GAME_REGION = 'null'
_url = ResMgr.openSection('scripts_config.xml').readString('csisUrl')
if _url is not None:
    if 'csis-ct.worldoftanks.' in _url:
        GAME_REGION = 'CT'
    elif 'worldoftanks.ru' in _url:
        GAME_REGION = 'RU'
    elif 'worldoftanks.eu' in _url:
        GAME_REGION = 'EU'
    elif 'worldoftanks.com' in _url:
        GAME_REGION = 'NA'
    elif 'worldoftanks.asia' in _url:
        GAME_REGION = 'ASIA'
    elif 'worldoftanks.kr' in _url:
        GAME_REGION = 'KR'
    elif 'worldoftanks.cn' in _url:
        GAME_REGION = 'CN'
if GAME_REGION == 'null':
    _url = ResMgr.openSection('scripts_config.xml').readString('login/host/name')
    if 'Supertest' in _url:
        GAME_REGION = 'ST'

from helpers import getClientLanguage
GAME_LANGUAGE = getClientLanguage()
