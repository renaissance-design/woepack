""" XFW Library (c) www.modxvm.com 2013-2017 """

import events

g_xvmlogger = None
g_xfwview = None

def as_xfw_cmd(cmd, *args):
    global g_xfwview
    view = g_xfwview() if g_xfwview else None
    return view.as_xfw_cmdS(cmd, *args) if view else None

def as_event(*args):
    return as_xfw_cmd('xfw.as.py_event', *args)

_events = {}

def as_callback(event_name, handler):
    global _events
    if not event_name in _events:
        _events[event_name] = EventHook()
    _events[event_name] += handler


#####################################################################
# SWF mods initializer

import os
import weakref
import BigWorld
from . import IS_DEVELOPMENT
from constants import *
from events import *
from logger import *
from . import xfw_mods_info

_curdir = os.path.dirname(os.path.realpath(__file__))

# Load fonts from xfwfonts.swf
_xfwfonts_swf_file_name = os.path.realpath(os.path.join(_curdir, PATH.XFWFONTS_SWF_PATH))
if os.path.isfile(_xfwfonts_swf_file_name):
    try:
        aliases = {
            'xvm':('xvm', 16, 1.0),
            'mono':('mono', 16, 1.0),
            'vtype':('vtype', 16, 1.0),
            'dynamic':('dynamic', 16, 1.0),
            'dynamic2':('dynamic2', 16, 1.0)}
        from gui.Scaleform.fonts_config import FontConfig
        FontConfig('xfw', PATH.XFWFONTS_SWF_URL, aliases).load()
    except:
        err(traceback.format_exc())

# Load xfw.swf
_xfw_swf_file_name = os.path.realpath(os.path.join(_curdir, PATH.XFW_SWF_PATH))
if os.path.isfile(_xfw_swf_file_name):
    xfwInitialized = False
    appNS = None

    import game
    from gui.shared import events, g_eventBus
    from gui.Scaleform.framework.application import SFApplication
    from gui.app_loader.loader import g_appLoader
    from gui.app_loader.settings import APP_NAME_SPACE
    import xfwview

    debug('[XFW] _start')

    def _appInitialized(event):
        debug('[XFW] _appInitialized: {}'.format(event.ns))
        try:
            app = g_appLoader.getApp(event.ns)
            if app is not None:
                global g_xfwview
                g_xfwview = None
                global xfwInitialized, appNS
                xfwInitialized = False
                appNS = event.ns
                xfw_mods_info.clear_swfs()
                if event.ns == APP_NAME_SPACE.SF_LOBBY:
                    #BigWorld.callback(0, lambda: app.loadView(CONST.XFW_VIEW_ALIAS))
                    app.loadView(CONST.XFW_VIEW_ALIAS)
                elif event.ns == APP_NAME_SPACE.SF_BATTLE:
                    app.loadView(CONST.XFW_VIEW_ALIAS)
        except:
            err(traceback.format_exc())

    @overrideMethod(SFApplication, 'loadView')
    def _SFApplication_loadView(base, self, newViewAlias, name=None, *args, **kwargs):
        onLoadView(base, self, newViewAlias, name, *args, **kwargs)

    def onLoadView(base, self, newViewAlias, name=None, *args, **kwargs):
        # debug('[XFW] _SFApplication_loadView: ' + newViewAlias)
        if newViewAlias == 'hangar':
            global xfwInitialized
            if not xfwInitialized:
                BigWorld.callback(0, lambda: onLoadView(base, self, newViewAlias, name, *args, **kwargs))
                return
        base(self, newViewAlias, name, *args, **kwargs)

    g_eventBus.addListener(events.AppLifeCycleEvent.INITIALIZED, _appInitialized)

    @registerEvent(game, 'fini')
    def _fini():
        debug('[XFW] _fini')
        g_eventBus.removeListener(events.AppLifeCycleEvent.INITIALIZED, _appInitialized)
