""" XVM (c) www.modxvm.com 2013-2017 """

import traceback
import simplejson

from gui.shared import g_eventBus, events
from gui.app_loader import g_appLoader
from gui.app_loader.settings import GUI_GLOBAL_SPACE_ID

from xfw import *

import xvm_main.python.config as config
from xvm_main.python.logger import *
import xvm_main.python.utils as utils

from consts import *
import xmqp
from vehicleMarkers import g_markers


class EVENTS(object):
    XMQP_HOLA = 'xmqp_hola'
    XMQP_FIRE = 'xmqp_fire'
    XMQP_VEHICLE_TIMER = 'xmqp_vehicle_timer'
    XMQP_DEATH_ZONE_TIMER = 'xmqp_death_zone_timer'
    XMQP_SPOTTED = 'xmqp_spotted'
    XMQP_MINIMAP_CLICK = 'xmqp_minimap_click'

class TARGETS(object):
    NONE   = 0x00
    BATTLE = 0x01
    VMM    = 0x02
    ALL    = 0xFF


def onXmqpConnected(e):
    #debug('onXmqpConnected')
    # send "hola" broadcast
    data = {'event': EVENTS.XMQP_HOLA, 'capabilities': xmqp.getCapabilitiesData()}
    if xmqp.is_active():
        xmqp.call(data)
    _sendCapabilities()

def onBattleInit():
    _sendCapabilities()

def onXmqpMessage(e):
    try:
        #debug('onXmqpMessage: ' + str(e.ctx))
        data = e.ctx.get('data', '')
        event_type = data['event']
        global _event_handlers
        if event_type in _event_handlers:
            _event_handlers[event_type](e.ctx.get('accountDBID', ''), data)
        else:
            debug('unknown XMQP message: {}'.format(data))
    except Exception as ex:
        err(traceback.format_exc())


# XMQP default event handler

def _as_xmqp_event(accountDBID, data, targets=TARGETS.ALL):

    #debug('_as_xmqp_event: {} => {}'.format(accountDBID, data))

    if xmqp.XMQP_DEVELOPMENT:
        if accountDBID == utils.getAccountDBID():
            accountDBID = getCurrentAccountDBID()

    battle = getBattleApp()
    if not battle:
        return

    if not data:
        warn('[XMQP] no data')
        return

    if 'event' not in data:
        warn('[XMQP] no "event" field in data: %s' % str(data))
        return

    event = data['event']
    data = None if not data else unicode_to_ascii(data)

    if targets & TARGETS.BATTLE:
        as_xfw_cmd(XVM_BATTLE_COMMAND.AS_XMQP_EVENT, accountDBID, event, data)

    if targets & TARGETS.VMM:
        if g_markers.enabled:
            g_markers.call(XVM_BATTLE_COMMAND.AS_XMQP_EVENT, accountDBID, event, data)

# battle init

def _sendCapabilities():
    for accountDBID, data in xmqp.players_capabilities.iteritems():
        #debug('_sendCapabilities: {} {}'.format(accountDBID, data))
        if xmqp.XMQP_DEVELOPMENT:
            if accountDBID == utils.getAccountDBID():
                accountDBID = getCurrentAccountDBID()
        _as_xmqp_event(accountDBID, {'event': EVENTS.XMQP_HOLA, 'capabilities': data})

# "hola" xmqp event handler

def _onXmqpHola(accountDBID, data):
    accountDBID = int(accountDBID)
    if xmqp.XMQP_DEVELOPMENT:
        if accountDBID == utils.getAccountDBID():
            accountDBID = getCurrentAccountDBID()
    if accountDBID not in xmqp.players_capabilities:
        xmqp.players_capabilities[accountDBID] = data['capabilities']
        #debug('_onXmqpHola: {} {}'.format(accountDBID, data))
        _as_xmqp_event(accountDBID, data)


# WG events hooks

from gui.Scaleform.daapi.view.battle.shared.destroy_timers_panel import DestroyTimersPanel

# fire in vehicle:
#   enable: True, False

@registerEvent(DestroyTimersPanel, '_DestroyTimersPanel__setFireInVehicle')
def _DestroyTimersPanel__setFireInVehicle(self, isInFire):
    if xmqp.is_active():
        xmqp.call({'event':EVENTS.XMQP_FIRE,'enable':isInFire})

# vehicle death timer
#   code: drown, overturn, ALL
#   enable: True, False

@registerEvent(DestroyTimersPanel, '_DestroyTimersPanel__showDestroyTimer')
def _DestroyTimersPanel__showDestroyTimer(self, value):
    if xmqp.is_active() and g_appLoader.getSpaceID() == GUI_GLOBAL_SPACE_ID.BATTLE:
        code, totalTime, level = value
        xmqp.call({
            'event':EVENTS.XMQP_VEHICLE_TIMER,
            'enable':True,
            'code':code,
            'totalTime':totalTime,
            'level':level})

@registerEvent(DestroyTimersPanel, '_DestroyTimersPanel__hideDestroyTimer')
def _DestroyTimersPanel__hideDestroyTimer(self, value):
    if xmqp.is_active() and g_appLoader.getSpaceID() == GUI_GLOBAL_SPACE_ID.BATTLE:
        code = value
        if code is None:
            code = 'ALL'
        xmqp.call({
            'event':EVENTS.XMQP_VEHICLE_TIMER,
            'enable':False,
            'code':code})

# death zone timers
#   zoneID: death_zone, gas_attack, ALL
#   enable: True, False

@registerEvent(DestroyTimersPanel, '_DestroyTimersPanel__showDeathZoneTimer')
def _DestroyTimersPanel__showDeathZoneTimer(self, value):
    if xmqp.is_active() and g_appLoader.getSpaceID() == GUI_GLOBAL_SPACE_ID.BATTLE:
        code, totalTime, level = value
        xmqp.call({
            'event':EVENTS.XMQP_DEATH_ZONE_TIMER,
            'enable':True,
            'code':code,
            'totalTime':totalTime,
            'level':level})

@registerEvent(DestroyTimersPanel, '_DestroyTimersPanel__hideDeathZoneTimer')
def _DestroyTimersPanel__hideDeathZoneTimer(self, value):
    if xmqp.is_active() and g_appLoader.getSpaceID() == GUI_GLOBAL_SPACE_ID.BATTLE:
        code = value
        if code is None:
            code = 'ALL'
        xmqp.call({
            'event':EVENTS.XMQP_DEATH_ZONE_TIMER,
            'enable':False,
            'code':code})

# sixth sense indicator

from gui.Scaleform.daapi.view.battle.shared.indicators import SixthSenseIndicator

@registerEvent(SixthSenseIndicator, 'as_showS')
def _SixthSenseIndicator_as_showS(self):
    if xmqp.is_active():
        xmqp.call({'event': EVENTS.XMQP_SPOTTED})

# minimap click

def send_minimap_click(path):
    #debug('send_minimap_click: [...]')
    if xmqp.is_active():
        path = [[int(x), int(y)] for x,y in path]
        #debug('send_minimap_click: {}'.format(path))
        xmqp.call({
            'event': EVENTS.XMQP_MINIMAP_CLICK,
            'path': path,
            'color': config.networkServicesSettings.x_minimap_clicks_color})


# register event handlers

_event_handlers = {
    EVENTS.XMQP_HOLA: _onXmqpHola,
    EVENTS.XMQP_FIRE: _as_xmqp_event,
    EVENTS.XMQP_VEHICLE_TIMER: _as_xmqp_event,
    EVENTS.XMQP_DEATH_ZONE_TIMER: _as_xmqp_event,
    EVENTS.XMQP_SPOTTED: _as_xmqp_event,
    EVENTS.XMQP_MINIMAP_CLICK: lambda id, data: _as_xmqp_event(id, data, targets=TARGETS.BATTLE)}
