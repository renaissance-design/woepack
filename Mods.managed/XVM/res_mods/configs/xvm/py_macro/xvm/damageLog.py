# Addons: "DamageLog"
# ktulho <http://www.koreanrandom.com/forum/user/17624-ktulho/>

import BigWorld
import Keys
import copy
import GUI
import xvm_main.python.config as config
import xvm_main.python.userprefs as userprefs
from xvm_main.python.stats import _stat
import xvm_main.python.stats as stats
import xvm_main.python.vehinfo as vehinfo
import xvm_main.python.vehinfo_wn8 as vehinfo_wn8
from items import vehicles, _xml
from Avatar import PlayerAvatar
from Vehicle import Vehicle
from xfw import *
from xvm_main.python.logger import *
from VehicleEffects import DamageFromShotDecoder
import ResMgr
from constants import ITEM_DEFS_PATH
import nations
from gui.shared.utils.TimeInterval import TimeInterval
from gui.Scaleform.daapi.view.battle.shared.damage_panel import DamagePanel
from gui.Scaleform.daapi.view.battle.shared.damage_log_panel import DamageLogPanel
from items import vehicles


on_fire = 0
isDownAlt = False


ATTACK_REASONS = {
    0: 'shot',
    1: 'fire',
    2: 'ramming',
    3: 'world_collision',
    4: 'death_zone',
    5: 'drowning',
    6: 'gas_attack',
    7: 'overturn',
    24: 'art_attack',
    25: 'air_strike'
}

VEHICLE_CLASSES = frozenset(['mediumTank', 'lightTank', 'heavyTank', 'AT-SPG', 'SPG'])

HIT_EFFECT_CODES = {
    None: 'unknown',
    0: 'intermediate_ricochet',
    1: 'final_ricochet',
    2: 'armor_not_pierced',
    3: 'armor_pierced_no_damage',
    4: 'armor_pierced',
    5: 'critical_hit'
}


MACROS_NAME = ['number', 'critical-hit', 'vehicle', 'name', 'vtype', 'c:costShell', 'costShell', 'comp-name', 'clan',
               'dmg-kind', 'c:dmg-kind', 'c:vtype', 'type-shell', 'dmg', 'reloadGun', 'c:team-dmg', 'c:hit-effects',
               'level', 'clanicon', 'clannb', 'marksOnGun', 'squad-num', 'dmg-ratio', 'hit-effects', 'c:type-shell',
               'splash-hit', 'team-dmg', 'my-alive', 'gun-caliber']


def keyLower(_dict):
    if _dict is not None:
        dict_return = {}
        for key, value in _dict.items():
            dict_return[key.lower()] = value
        return dict_return
    else:
        return None


def keyUpper(_dict):
    if _dict is not None:
        dict_return = {}
        for key, value in _dict.items():
            dict_return[key.upper()] = value
        return dict_return
    else:
        return None


def readyConfig(section):
    res = {'vehicleClass': keyLower(config.get(section + 'vtype')),
           'c_Shell': keyLower(config.get(section + 'c:costShell')),
           'costShell': keyLower(config.get(section + 'costShell')),
           'c_typeHit': keyLower(config.get(section + 'c:dmg-kind')),
           'c_VehicleClass': keyLower(config.get(section + 'c:vtype')),
           'typeHit': keyLower(config.get(section + 'dmg-kind')),
           'c_teamDmg': keyLower(config.get(section + 'c:team-dmg')),
           'teamDmg': keyLower(config.get(section + 'team-dmg')),
           'compNames': keyLower(config.get(section + 'comp-name')),
           'splashHit': keyLower(config.get(section + 'splash-hit')),
           'criticalHit': keyLower(config.get(section + 'critical-hit')),
           # 'showHitNoDamage': config.get(section + 'showHitNoDamage'),
           'hitEffect': keyLower(config.get(section + 'hit-effects')),
           'c_HitEffect': keyLower(config.get(section + 'c:hit-effects')),
           'typeShell': keyLower(config.get(section + 'type-shell')),
           'c_typeShell': keyLower(config.get(section + 'c:type-shell'))
           }
    return res


def comparing(_macro, _operator, _math):
    if isinstance(_macro, basestring):
        _math = str(_math)
    elif isinstance(_macro, float):
        _math = float(_math)
    elif isinstance(_macro, int):
        _math = int(_math)
    if isinstance(_macro, (float, int)) and isinstance(_math, (float, int)):
        if _operator == '>=':
            return _macro >= _math
        elif _operator == '<=':
            return _macro <= _math
        elif _operator == '!=':
            return _macro != _math
        elif _operator in ('==', '='):
            return _macro == _math
        elif _operator == '<':
            return _macro < _math
        elif _operator == '>':
            return _macro > _math
    elif isinstance(_macro, basestring) and isinstance(_math, basestring):
        if _operator in ('==', '='):
            return _macro == _math
        elif _operator == '!=':
            return _macro != _math
    else:
        return False


def flag(_flag):
    if _flag in ('', "'"):
        _flag = '>'
    elif _flag in ('-', "-'"):
        _flag = '<'
    elif _flag in ('0', "0'"):
        _flag = '0'
    elif _flag in ("-0", "-0'"):
        _flag = '0<'
    return _flag


def formatMacro(macro, macroes):
    _macro = macro[2:-2]
    _macro, _, _def = _macro.partition('|')
    _macro, _, _rep = _macro.partition('?')
    fm = {}
    _operator = ''
    fm['flag'] = ''
    fm['type'] = ''
    fm['width'] = ''
    fm['suf'] = ''
    for s in ('>=', '<=', '!=', '==', '=', '<', '>'):
        if s in _macro:
            _macro, _operator, _math = _macro.partition(s)
            break
    _macro, _, fm['suf'] = _macro.partition('~')
    _macro, _, t = _macro.partition('%')
    if t[-1:] in ('s', 'd', 'f', 'x', 'a'):
        fm['type'] = t[-1:]
        t = t[:-1]
    t, _, _prec = t.partition('.')
    _prec = int(_prec) if _prec.isdigit() else ''
    for s in ("-0'", "-0", "-'", "0'", '-', '0', "'"):
        if (s in t) and (s[0] == t[0]):
            _, fm['flag'], fm['width'] = t.rpartition(s)
            break
    if not fm['width'] and t.isdigit():
        fm['width'] = int(t)
    # _macro, _, _norm = _macro.partition(':')
    tempMacro = _macro
    if _macro in macroes:
        _macro = macroes[_macro]
        if _operator:
            if _rep and comparing(_macro, _operator, _math):
                _macro = _rep
            elif not comparing(_macro, _operator, _math):
                _macro = _def
        elif _rep and _macro:
            _macro = _rep
        elif _def and not _macro:
            _macro = _def
        if _macro == macroes[tempMacro]:
            fm['flag'] = flag(fm['flag'])
            fm['prec'] = ''
            if _prec != '':
                if isinstance(_macro, int):
                    _macro = int(_macro) + int(_prec)
                elif isinstance(_macro, float):
                    fm['prec'] = '.' + str(int(_prec))
                elif isinstance(_macro, basestring):
                    if len(unicode(_macro, 'utf8')) > int(_prec):
                        if (int(_prec) - len(unicode(fm['suf'], 'utf8'))) > 0:
                            _macro = unicode(_macro, 'utf8')[:(int(_prec) - len(fm['suf']))]
                        else:
                            _macro = unicode(_macro, 'utf8')[:(int(_prec))]
                            fm['suf'] = ''
                    else:
                        fm['suf'] = ''
            _macro = '{0:{flag}{width}{prec}{type}}{suf}'.format(_macro, **fm)
        # log('_macro = %s' % _macro)
        return str(_macro)
    else:
        return macro


def parser(strHTML, macroes):
    notMacroesDL = {}
    i = 0
    b = True
    if not isinstance(strHTML, str):
        strHTML = str(strHTML)
    while b:
        dl = True
        start = strHTML.rfind('{{')
        end = strHTML.find('}}', start) + 2
        b = (start >= 0) and (end >= 2)
        if b:
            for s in MACROS_NAME:
                begin = strHTML[start:end].find(s)
                if (begin == 2) and (strHTML[(start + begin + len(s))] in ('|', '?', '~', '%', '>', '<', '!', '=', '}')):
                    dl = False
                    break
            if dl:
                i += 1
                notMacroesDL['<dl>' + str(i)] = strHTML[start:end]
                strHTML = strHTML.replace(notMacroesDL['<dl>' + str(i)], ('<dl>' + str(i)))
            else:
                # old_strHTML = strHTML
                s = strHTML[start:end]
                strHTML = strHTML.replace(s, formatMacro(s, macroes))
    while notMacroesDL:
        _notMacroesDL = notMacroesDL.copy()
        for s in _notMacroesDL:
            strHTML = strHTML.replace(s, notMacroesDL.pop(s, ''))
    # log('strHTML = %s' % strHTML)
    return strHTML


class Data(object):

    def __init__(self):
        self.data = {'isAlive': True,
                     'isDamage': False,
                     'attackReasonID': 0,
                     'attackerID': 0,
                     'compName': 'unknown',
                     'splashHit': 'no-splash',
                     'criticalHit': False,
                     'hitEffect': None,
                     'damage': 0,
                     'dmgRatio': 0,
                     'oldHealth': 0,
                     'maxHealth': 0,
                     'costShell': 'unknown',
                     'shellKind': 'not_shell',
                     'teamDmg': 'unknown',
                     'attackerVehicleType': '',
                     'shortUserString': '',
                     'name': '',
                     'clanAbbrev': '',
                     'level': 1,
                     'clanicon': '',
                     'squadnum': 0,
                     'fireStage': -1,
                     'isBeginFire': False,
                     'number': None,
                     'reloadGun': 0,
					 'caliber': None
                     }

    def reset(self):
        self.__init__()

    def updateData(self):
        player = BigWorld.player()
        self.data['dmgRatio'] = self.data['damage'] * 100 // self.data['maxHealth']
        if self.data['attackerID']:
            attacker = player.arena.vehicles.get(self.data['attackerID'])
            entity = BigWorld.entity(self.data['attackerID'])
            statXVM = _stat.players.get(self.data['attackerID'], None)
            self.data['teamDmg'] = 'unknown'
            if attacker is not None:
                if attacker['team'] != player.team:
                    self.data['teamDmg'] = 'enemy-dmg'
                elif attacker['name'] == player.name:
                    self.data['teamDmg'] = 'player'
                else:
                    self.data['teamDmg'] = 'ally-dmg'
                if attacker['vehicleType']:
                    self.data['attackerVehicleType'] = list(attacker['vehicleType'].type.tags.intersection(VEHICLE_CLASSES))[0].lower()
                    self.data['shortUserString'] = attacker['vehicleType'].type.shortUserString
                    self.data['level'] = attacker['vehicleType'].level
                else:
                    self.data['attackerVehicleType'] = ''
                    self.data['shortUserString'] = ''
                    self.data['level'] = ''
                self.data['name'] = attacker['name']
                self.data['clanAbbrev'] = attacker['clanAbbrev']
            self.data['clanicon'] = _stat.getClanIcon(self.data['attackerID'])
            if statXVM is not None:
                self.data['squadnum'] = statXVM.squadnum
            self.data['marksOnGun'] = '_' + str(entity.publicInfo['marksOnGun']) if entity is not None else ''
        else:
            self.data['teamDmg'] = 'unknown'
            self.data['attackerVehicleType'] = ''
            self.data['shortUserString'] = ''
            self.data['name'] = ''
            self.data['clanAbbrev'] = ''
            self.data['level'] = ''
            self.data['clanicon'] = ''
            self.data['squadnum'] = ''
            self.data['marksOnGun'] = ''

    def typeShell(self, effectsIndex):
        self.data['costShell'] = 'unknown'
        self.data['shellKind'] = 'not_shell'
        if (self.data['attackerID'] == 0) or (self.data['attackReasonID'] != 0):
            return
        player = BigWorld.player()
        attacker = player.arena.vehicles.get(self.data['attackerID'])
        if (attacker is None) or not attacker['vehicleType']:
            self.data['shellKind'] = None
            self.data['caliber'] = None
            self.data['costShell'] = None
            return
        for shell in attacker['vehicleType'].gun['shots']:
            if effectsIndex == shell['shell']['effectsIndex']:
                self.data['shellKind'] = str(shell['shell']['kind']).lower()
                self.data['caliber'] = shell['shell']['caliber']
                xmlPath = ITEM_DEFS_PATH + 'vehicles/' + nations.NAMES[shell['shell']['id'][0]] + '/components/shells.xml'
                for name, subsection in ResMgr.openSection(xmlPath).items():
                    if name != 'icons':
                        xmlCtx = (None, xmlPath + '/' + name)
                        if _xml.readInt(xmlCtx, subsection, 'id', 0, 65535) == shell['shell']['id'][1]:
                            price = _xml.readPrice(xmlCtx, subsection, 'price')
                            self.data['costShell'] = 'gold-shell' if price[1] else 'silver-shell'
                            break
                ResMgr.purge(xmlPath, True)
                break

    def timeReload(self, attackerID):
        if self.data['attackerID']:
            player = BigWorld.player()
            attacker = player.arena.vehicles.get(attackerID)
            if (attacker is not None) and (attacker['vehicleType']):
                reload_orig = attacker['vehicleType'].gun['reloadTime']
                crew = 0.94 if attacker['vehicleType'].miscAttrs['crewLevelIncrease'] != 0 else 1
                if (attacker['vehicleType'].gun['clip'][0] == 1) and (attacker['vehicleType'].miscAttrs['gunReloadTimeFactor'] != 0):
                    rammer = attacker['vehicleType'].miscAttrs['gunReloadTimeFactor']
                else:
                    rammer = 1
                return reload_orig * crew * rammer
            else:
                return 0
        else:
            return 0

    def hitShell(self, attackerID, effectsIndex, damageFactor):
        self.data['isDamage'] = damageFactor > 0
        self.data['attackerID'] = attackerID
        self.data['attackReasonID'] = effectsIndex if effectsIndex in [24, 25] else 0
        self.data['reloadGun'] = self.timeReload(attackerID)
        self.typeShell(effectsIndex)
        if damageFactor:
            self.data['hitEffect'] = HIT_EFFECT_CODES[4]
        else:
            self.data['damage'] = 0
            self.updateData()
            self.updateLabels()
            as_event('ON_HIT')

    def updateLabels(self):
        _logAlt.output()
        _log.output()
        _lastHit.output()

    def showDamageFromShot(self, vehicle, attackerID, points, effectsIndex, damageFactor):
        maxHitEffectCode, decodedPoints = DamageFromShotDecoder.decodeHitPoints(points, vehicle.typeDescriptor)
        self.data['compName'] = decodedPoints[0].componentName if decodedPoints else 'unknown'
        self.data['splashHit'] = 'no-splash'
        self.data['criticalHit'] = (maxHitEffectCode == 5)
        if damageFactor == 0:
            self.data['hitEffect'] = HIT_EFFECT_CODES[min(3, maxHitEffectCode)]
        self.hitShell(attackerID, effectsIndex, damageFactor)

    def showDamageFromExplosion(self, vehicle, attackerID, center, effectsIndex, damageFactor):
        self.data['splashHit'] = 'splash'
        self.data['criticalHit'] = False
        if damageFactor == 0:
            self.data['hitEffect'] = HIT_EFFECT_CODES[3]
        self.hitShell(attackerID, effectsIndex, damageFactor)

    def onHealthChanged(self, vehicle, newHealth, attackerID, attackReasonID):
        if self.data['attackReasonID'] not in [24, 25]:
            self.data['attackReasonID'] = attackReasonID
        self.data['isDamage'] = True
        self.data['hitEffect'] = HIT_EFFECT_CODES[4]
        if self.data['attackReasonID'] != 0:
            self.data['costShell'] = 'unknown'
            self.data['criticalHit'] = False
            self.data['shellKind'] = 'not_shell'
            self.data['splashHit'] = 'no-splash'
            self.data['reloadGun'] = 0
        else:
            self.data['reloadGun'] = self.timeReload(attackerID)
        self.data['attackerID'] = attackerID
        self.data['damage'] = self.data['oldHealth'] - max(0, newHealth)
        self.data['isAlive'] = newHealth > 0
        self.data['oldHealth'] = newHealth
        self.updateData()
        self.updateLabels()
        as_event('ON_HIT')


data = Data()


def getValueMacroes(section, value):
    conf = readyConfig(section)#.copy()
    macro = {'c:team-dmg': conf['c_teamDmg'].get(value['teamDmg']),
             'team-dmg': conf['teamDmg'].get(value['teamDmg'], ''),
             'vtype': conf['vehicleClass'].get(value['attackerVehicleType'], 'not_vehicle'),
             'c:costShell': conf['c_Shell'].get(value['costShell']),
             'costShell': conf['costShell'].get(value['costShell'], 'unknown'),
             'c:dmg-kind': conf['c_typeHit'].get(ATTACK_REASONS[value['attackReasonID']]),
             'dmg-kind': conf['typeHit'].get(ATTACK_REASONS[value['attackReasonID']], 'reason: %s' % value['attackReasonID']),
             'c:vtype': conf['c_VehicleClass'].get(value['attackerVehicleType'], 'not_vehicle'),
             'comp-name': conf['compNames'].get(value['compName'], 'unknown'),
             'splash-hit': conf['splashHit'].get(value['splashHit'], 'unknown'),
             'critical-hit': conf['criticalHit'].get('critical') if value['criticalHit'] else conf['criticalHit'].get('no-critical'),
             'type-shell': conf['typeShell'].get(value['shellKind'], 'unknown'),
             'c:type-shell': conf['c_typeShell'].get(value['shellKind']),
             'c:hit-effects': conf['c_HitEffect'].get(value['hitEffect']),
             'hit-effects': conf['hitEffect'].get(value['hitEffect'], 'unknown'),
             'number': value['number'] if value['number'] is not None else None,
             'dmg': value['damage'],
             'dmg-ratio': value['dmgRatio'],
             'vehicle': value['shortUserString'],
             'name': value['name'],
             'clannb': value['clanAbbrev'],
             'clan': ''.join(['[', value['clanAbbrev'], ']']) if value['clanAbbrev'] else '',
             'level': value['level'],
             'clanicon': value['clanicon'],
             'squad-num': value['squadnum'],
             'reloadGun': value['reloadGun'],
             'my-alive': 'alive' if value['isAlive'] else None,
             'gun-caliber': value['caliber']
             }
    return macro


def shadow_value(section, macroes):
    shadow = {'distance': parser(config.get(section + 'shadow/distance'), macroes),
              'angle': parser(config.get(section + 'shadow/angle'), macroes),
              'alpha': parser(config.get(section + 'shadow/alpha'), macroes),
              'blur': parser(config.get(section + 'shadow/blur'), macroes),
              'strength': parser(config.get(section + 'shadow/strength'), macroes),
              'color': parser(config.get(section + 'shadow/color'), macroes),
              'hideObject': parser(config.get(section + 'shadow/hideObject'), macroes),
              'inner': parser(config.get(section + 'shadow/inner'), macroes),
              'knockout': parser(config.get(section + 'shadow/knockout'), macroes),
              'quality': parser(config.get(section + 'shadow/quality'), macroes)
                           }
    return shadow


class Log(object):

    def __init__(self, section):
        self.listLog = []
        self.section = section
        self.sumFireDmg = 0
        self.dataLogFire = None
        self.numberLine = 0
        self.dictVehicle = {}
        self.dataLog = {}
        self.shadow = {}
        self._data = None
        _data = userprefs.get('DamageLog/dLog', {'x': config.get(section + 'x'), 'y': config.get(section + 'y')})
        self.x = _data['x']
        self.y = _data['y']
        as_callback("dLog_mouseDown", self.mouse_down)
        as_callback("dLog_mouseUp", self.mouse_up)
        as_callback("dLog_mouseMove", self.mouse_move)

    def reset(self, section):
        self.listLog = []
        self.listIndents = []
        self.section = section
        self.sumFireDmg = 0
        self.dataLogFire = None
        self.numberLine = 0
        self.dictVehicle = {}
        self.dataLog = {}
        self.shadow = {}
        if None not in [self.x,  self.y]:
            userprefs.set('DamageLog/dLog', {'x': self.x, 'y': self.y})

    def mouse_down(self, _data):
        if _data['buttonIdx'] == 0:
            self._data = _data

    def mouse_up(self, _data):
        if _data['buttonIdx'] == 0:
            self._data = None

    def mouse_move(self, _data):
        if self._data:
            self.x += (_data['x'] - self._data['x'])
            self.y += (_data['y'] - self._data['y'])
            as_event('ON_HIT')

    def addLine(self, attackerID, attackReasonID):
        self.dataLog['number'] = len(self.listLog) + 1
        macroes = getValueMacroes(self.section, self.dataLog)
        self.listLog.insert(0, parser(config.get(self.section + 'formatHistory'), macroes))
        self.shadow = shadow_value(self.section, macroes)
        self.numberLine += 1
        for attacker in self.dictVehicle:
            for attack in self.dictVehicle[attacker]:
                if (attacker != attackerID) and (attack != attackReasonID):
                    self.dictVehicle[attacker][attack]['numberLine'] += 1

    def output(self):
        if (((data.data['attackReasonID'] in [2, 3]) and config.get(self.section + 'groupDamagesFromRamming_WorldCollision'))
                or ((data.data['attackReasonID'] == 1) and config.get(self.section + 'groupDamagesFromFire'))):
            self.dataLog = data.data.copy()
            attackerID = data.data['attackerID']
            attackReasonID = data.data['attackReasonID']
            if attackerID in self.dictVehicle:
                if (attackReasonID in self.dictVehicle[attackerID] and
                   ('time' in self.dictVehicle[attackerID][attackReasonID]) and
                   ('damage' in self.dictVehicle[attackerID][attackReasonID]) and
                   ((BigWorld.serverTime() - self.dictVehicle[attackerID][attackReasonID]['time']) < 1)):
                    self.dictVehicle[attackerID][attackReasonID]['time'] = BigWorld.serverTime()
                    self.dictVehicle[attackerID][attackReasonID]['damage'] += data.data['damage']
                    self.dataLog['damage'] = self.dictVehicle[attackerID][attackReasonID]['damage']
                    self.dataLog['dmgRatio'] = self.dataLog['damage'] * 100 // data.data['maxHealth']
                    self.dataLog['number'] = len(self.listLog)
                    numberLine = self.dictVehicle[attackerID][attackReasonID]['numberLine']
                    macroes = getValueMacroes(self.section, self.dataLog)
                    self.listLog[numberLine] = parser(config.get(self.section + 'formatHistory'), macroes)
                    self.shadow = shadow_value(self.section, macroes)
                else:
                    self.dictVehicle[attackerID][attackReasonID] = {'time': BigWorld.serverTime(),
                                                                    'damage': data.data['damage'],
                                                                    'numberLine': 0}
                    self.addLine(attackerID, attackReasonID)
            else:
                self.dictVehicle[attackerID] = {}
                self.dictVehicle[attackerID][attackReasonID] = {'time': BigWorld.serverTime(),
                                                                'damage': data.data['damage'],
                                                                'numberLine': 0}
                self.addLine(attackerID, attackReasonID)
        else:
            if config.get(self.section + 'showHitNoDamage') or data.data['isDamage']:
                self.dataLog = data.data
                self.addLine(None, None)
        as_event('ON_HIT')
        return


class LastHit(object):

    def __init__(self, section):
        self.dataFire = None
        self.section = section
        self.strLastHit = ''
        self.timerLastHit = None
        self.dictVehicle = {}
        self.shadow = {}
        self._data = None
        _data = userprefs.get('DamageLog/lastHit', {'x': config.get(section + 'x'), 'y': config.get(section + 'y')})
        self.x = _data['x']
        self.y = _data['y']
        as_callback("lastHit_mouseDown", self.mouse_down)
        as_callback("lastHit_mouseUp", self.mouse_up)
        as_callback("lastHit_mouseMove", self.mouse_move)
        if (self.timerLastHit is not None) and self.timerLastHit.isStarted:
            self.timerLastHit.stop()

    def reset(self, section):
        self.dataFire = None
        self.section = section
        self.strLastHit = ''
        self.timerLastHit = None
        self.dictVehicle = {}
        self.shadow = {}
        if (self.timerLastHit is not None) and self.timerLastHit.isStarted:
            self.timerLastHit.stop()
        userprefs.set('DamageLog/lastHit', {'x': self.x, 'y': self.y})

    def mouse_down(self, _data):
        if _data['buttonIdx'] == 0:
            self._data = _data

    def mouse_up(self, _data):
        if _data['buttonIdx'] == 0:
            self._data = None

    def mouse_move(self, _data):
        if self._data:
            self.x += (_data['x'] - self._data['x'])
            self.y += (_data['y'] - self._data['y'])
            as_event('ON_LAST_HIT')

    def hideLastHit (self):
        self.strLastHit = ''
        if (self.timerLastHit is not None) and self.timerLastHit.isStarted:
            self.timerLastHit.stop()
        as_event('ON_LAST_HIT')

    def output(self):
        if (((data.data['attackReasonID'] in [2, 3]) and config.get(self.section + 'groupDamagesFromRamming_WorldCollision'))
                or ((data.data['attackReasonID'] == 1) and config.get(self.section + 'groupDamagesFromFire'))):
            dataLog = data.data.copy()
            attackerID = data.data['attackerID']
            attackReasonID = data.data['attackReasonID']
            if attackerID in self.dictVehicle:
                if (attackReasonID in self.dictVehicle[attackerID] and
                   ('time' in self.dictVehicle[attackerID][attackReasonID]) and
                   ('damage' in self.dictVehicle[attackerID][attackReasonID]) and
                   ((BigWorld.serverTime() - self.dictVehicle[attackerID][attackReasonID]['time']) < 1)):
                    self.dictVehicle[attackerID][attackReasonID]['time'] = BigWorld.serverTime()
                    self.dictVehicle[attackerID][attackReasonID]['damage'] += data.data['damage']
                    dataLog['damage'] = self.dictVehicle[attackerID][attackReasonID]['damage']
                    dataLog['dmgRatio'] = dataLog['damage'] * 100 // data.data['maxHealth']
                else:
                    self.dictVehicle[attackerID][attackReasonID] = {'time': BigWorld.serverTime(),
                                                                    'damage': data.data['damage']}
            else:
                self.dictVehicle[attackerID] = {}
                self.dictVehicle[attackerID][attackReasonID] = {'time': BigWorld.serverTime(),
                                                                'damage': data.data['damage']}
            macroes = getValueMacroes(self.section, dataLog)
            self.strLastHit = parser(config.get(self.section + 'formatLastHit'), macroes)
        else:
            if config.get(self.section + 'showHitNoDamage') or data.data['isDamage']:
                macroes = getValueMacroes(self.section, data.data)
                self.strLastHit = parser(config.get(self.section + 'formatLastHit'), macroes)
            else:
                self.strLastHit = ''
        if self.strLastHit:
            if (self.timerLastHit is not None) and self.timerLastHit.isStarted:
                self.timerLastHit.stop()
            timeDisplayLastHit = float(parser(config.get(self.section + 'timeDisplayLastHit'), macroes))
            self.timerLastHit = TimeInterval(timeDisplayLastHit, self, 'hideLastHit')
            self.timerLastHit.start()
            self.shadow = shadow_value(self.section, macroes)
        as_event('ON_LAST_HIT')
        return


_log = Log('damageLog/log/')
_logAlt = Log('damageLog/logAlt/')
_lastHit = LastHit('damageLog/lastHit/')


@overrideMethod(DamageLogPanel, 'as_detailStatsS')
def as_detailStatsS(base, self, isVisible, messages):
    if not config.get('damageLog/disabledDetailStats'):
        return base(self, isVisible, messages)
    else:
        return base(self, False, messages)


@overrideMethod(DamageLogPanel, 'as_summaryStatsS')
def as_summaryStatsS(base, self, damage, blocked, assist):
    if not config.get('damageLog/disabledSummaryStats'):
        return base(self, damage, blocked, assist)


@overrideMethod(DamageLogPanel, '_onTotalEfficiencyUpdated')
def _onTotalEfficiencyUpdated(base, self, diff):
    if not config.get('damageLog/disabledSummaryStats'):
        return base(self, diff)


@registerEvent(Vehicle, 'onHealthChanged')
def onHealthChanged(self, newHealth, attackerID, attackReasonID):
    global on_fire
    if self.isPlayerVehicle and data.data['isAlive']:
        data.onHealthChanged(self, newHealth, attackerID, attackReasonID)
        if (newHealth <= 0):
            on_fire = 0
            as_event('ON_FIRE')
    elif hasattr(BigWorld.player().inputHandler.ctrl, 'curVehicleID'):
        vId = BigWorld.player().inputHandler.ctrl.curVehicleID
        v = vId if isinstance(vId, Vehicle) else BigWorld.entity(vId)
        if (v is not None) and ((self.id == v.id) and not v.isAlive()):
            on_fire = 0
            as_event('ON_FIRE')


@registerEvent(Vehicle, 'onEnterWorld')
def onEnterWorld(self, prereqs):
    if self.isPlayerVehicle:
        global on_fire
        on_fire = 0
        data.data['oldHealth'] = self.health
        data.data['maxHealth'] = self.health


@registerEvent(Vehicle, 'showDamageFromShot')
def showDamageFromShot(self, attackerID, points, effectsIndex, damageFactor):
    if self.isPlayerVehicle and data.data['isAlive']:
        data.showDamageFromShot(self, attackerID, points, effectsIndex, damageFactor)


@registerEvent(Vehicle, 'showDamageFromExplosion')
def showDamageFromExplosion(self, attackerID, center, effectsIndex, damageFactor):
    if self.isPlayerVehicle and data.data['isAlive']:
        data.showDamageFromExplosion(self, attackerID, center, effectsIndex, damageFactor)


@registerEvent(DamagePanel, 'as_setFireInVehicleS')
def as_setFireInVehicleS(self, isInFire):
    global on_fire
    if isInFire:
        on_fire = 100
    else:
        on_fire = 0
    as_event('ON_FIRE')


@registerEvent(PlayerAvatar, '_PlayerAvatar__destroyGUI')
def destroyGUI(self):
    global on_fire
    on_fire = 0
    data.reset()
    _log.reset(_log.section)
    _logAlt.reset(_logAlt.section)
    _lastHit.reset(_lastHit.section)

@registerEvent(PlayerAvatar, 'handleKey')
def handleKey(self, isDown, key, mods):
    global isDownAlt
    if (key == Keys.KEY_LALT) and isDown and not isDownAlt:
        isDownAlt = True
        as_event('ON_HIT')
    elif not ((key == Keys.KEY_LALT) and isDown) and isDownAlt:
        isDownAlt = False
        as_event('ON_HIT')


def dLog():
    return '\n'.join(_logAlt.listLog) if isDownAlt else '\n'.join(_log.listLog)


def dLog_shadow(setting):
    if (setting in _logAlt.shadow) and (setting in _log.shadow):
        return _logAlt.shadow[setting] if isDownAlt else _log.shadow[setting]
    else:
        return None


def lastHit():
    return _lastHit.strLastHit


def lastHit_shadow(setting):
    if setting in _lastHit.shadow:
        return _lastHit.shadow[setting]
    else:
        return None


def fire():
    return on_fire


