""" XFW Library (c) www.modxvm.com 2013-2016 """

import os
import glob
import traceback
import itertools
import weakref

from gui import DialogsInterface, SystemMessages
from gui.app_loader.loader import g_appLoader
from gui.app_loader.settings import APP_NAME_SPACE
from gui.shared import g_eventBus, EVENT_BUS_SCOPE
from gui.shared.events import HasCtxEvent, ComponentEvent
from gui.Scaleform.daapi.view import dialogs
from gui.Scaleform.framework import g_entitiesFactories, ViewSettings, ViewTypes, ScopeTemplates
from gui.Scaleform.framework.entities.View import View
from gui.Scaleform.framework.entities.BaseDAAPIComponent import BaseDAAPIComponent
from gui.Scaleform.genConsts.BATTLE_VIEW_ALIASES import BATTLE_VIEW_ALIASES

from constants import *
from . import *
import swf


_LOG_COMMANDS = [
    COMMAND.XFW_COMMAND_INITIALIZED,
    XFWCOMMAND.XFW_COMMAND_MESSAGEBOX,
]

_WOT_ROOT = '../../../../'


class _XfwInjectorView(View):

    def __init__(self):
        super(_XfwInjectorView, self).__init__()

    def _populate(self):
        super(_XfwInjectorView, self)._populate()
        if swf.appNS in [APP_NAME_SPACE.SF_LOBBY, APP_NAME_SPACE.SF_BATTLE]:
            self.flashObject.as_inject()

class _XfwComponent(BaseDAAPIComponent):

    def __init__(self):
        super(_XfwComponent, self).__init__()
        swf.g_xfwview = weakref.ref(self)

    def as_xfw_cmdS(self, cmd, *args):
        try:
            if self.flashObject is None:
                return None
            return self.flashObject.as_xfw_cmd(cmd, *args)
        except:
            err(traceback.format_exc())

    def xfw_cmd(self, cmd, *args):
        try:
            if IS_DEVELOPMENT and cmd in _LOG_COMMANDS:
                debug('[XFW] xfw_cmd: {} {}'.format(cmd, args))
            if cmd == COMMAND.XFW_COMMAND_LOG:
                if swf.g_xvmlogger is None:
                    swf.g_xvmlogger = Logger(PATH.XVM_LOG_FILE_NAME)
                swf.g_xvmlogger.add(*args)
            elif cmd == COMMAND.XFW_COMMAND_INITIALIZED:
                swf.xfwInitialized = True
            elif cmd == COMMAND.XFW_COMMAND_SWF_LOADED:
                xfw_mods_info.swf_loaded(args[0])
                g_eventBus.handleEvent(HasCtxEvent(XFWEVENT.SWF_LOADED, args[0]))
            elif cmd == COMMAND.XFW_COMMAND_GETMODS:
                return self.getMods()
            elif cmd == COMMAND.XFW_COMMAND_LOADFILE:
                return load_file(args[0])
            elif cmd == XFWCOMMAND.XFW_COMMAND_GETGAMEREGION:
                return GAME_REGION
            elif cmd == XFWCOMMAND.XFW_COMMAND_GETGAMELANGUAGE:
                return GAME_LANGUAGE
            elif cmd == XFWCOMMAND.XFW_COMMAND_CALLBACK:
                e = swf._events.get(args[0], None)
                if e:
                    e.fire({
                      "name": args[0],
                      "type": args[1],
                      "x": int(args[2]),
                      "y": int(args[3]),
                      "stageX": int(args[4]),
                      "stageY": int(args[5]),
                      "buttonIdx": int(args[6]),
                      "delta": int(args[7])
                    })
            elif cmd == XFWCOMMAND.XFW_COMMAND_MESSAGEBOX:
                # title, message
                DialogsInterface.showDialog(dialogs.SimpleDialogMeta(
                    args[0],
                    args[1],
                    dialogs.I18nInfoDialogButtons('common/error')),
                    (lambda x: None))
            elif cmd == XFWCOMMAND.XFW_COMMAND_SYSMESSAGE:
                # message, type
                # Types: gui.SystemMessages.SM_TYPE:
                #   'Error', 'Warning', 'Information', 'GameGreeting', ...
                SystemMessages.pushMessage(
                    args[0],
                    type=SystemMessages.SM_TYPE.of(args[1]))
            else:
                handlers = g_eventBus._EventBus__scopes[EVENT_BUS_SCOPE.DEFAULT][XFWCOMMAND.XFW_CMD]
                for handler in handlers.copy():
                    try:
                        (result, status) = handler(cmd, *args)
                        if status:
                            return result
                    except TypeError:
                        err(traceback.format_exc())
                log('WARNING: unknown command: {}'.format(cmd))
        except:
            err(traceback.format_exc())

    # commands handlers

    def getMods(self):
        #log(xfw_mods_info.info)
        # debug('[XFW] getMods')
        try:
            app = g_appLoader.getApp(swf.appNS)
            if app is None:
                return None

            as_path = None
            if app.appNS == APP_NAME_SPACE.SF_LOBBY:
                as_path = 'as_lobby'
            elif app.appNS == APP_NAME_SPACE.SF_BATTLE:
                as_path = 'as_battle'
            else:
                return None

            mods_dir = PATH.XFW_MODS_DIR
            if not os.path.isdir(mods_dir):
                return None

            files = glob.iglob('{}/*/{}/*.swf'.format(mods_dir, as_path))
            for m in files:
                m = '%s%s' % (_WOT_ROOT, m.replace('\\', '/').replace('//', '/'))
                # debug('[XFW] getMods: ' + m)
                name = os.path.basename(os.path.dirname(os.path.dirname(m)))
                if not m.lower().endswith('_ui.swf') and not m.lower().endswith('_view.swf'):
                    xfw_mods_info.update(name, {'swf_file_name':m})

            return xfw_mods_info.info

        except:
            err(traceback.format_exc())
        return None


g_entitiesFactories.addSettings(ViewSettings(
    CONST.XFW_VIEW_ALIAS,
    _XfwInjectorView,
    PATH.XFW_SWF_URL,
    ViewTypes.WINDOW,
    None,
    ScopeTemplates.GLOBAL_SCOPE))

g_entitiesFactories.addSettings(ViewSettings(
    CONST.XFW_COMPONENT_ALIAS,
    _XfwComponent,
    None,
    ViewTypes.COMPONENT,
    None,
    ScopeTemplates.DEFAULT_SCOPE))
