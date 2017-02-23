""" XVM (c) www.modxvm.com 2013-2017 """

#####################################################################
# MOD INFO

XFW_MOD_INFO = {
    # mandatory
    'VERSION':       '0.9.17.1',
    'URL':           'http://www.modxvm.com/',
    'UPDATE_URL':    'http://www.modxvm.com/en/download-xvm/',
    'GAME_VERSIONS': ['0.9.17.1'],
    # optional
}


#####################################################################
# imports


import os
import threading
import traceback

import BigWorld
import game
from gui.shared import g_eventBus
from gui.Scaleform.daapi.settings.views import VIEW_ALIAS
from gui.shared import EVENT_BUS_SCOPE

from xfw import *
from xfw.constants import PATH

import xvm_main.python.config as config
from xvm_main.python.logger import *

from hashlib import sha1


#####################################################################
# globals

integrity_result = None
lock = threading.RLock()
# check incorrect hash, missing and extra files
check_xvm_dirs = [
    'res_mods/mods/xfw',
    'res_mods/mods/packages',
    ]


#####################################################################
# handlers

def start():
    g_eventBus.addListener(VIEW_ALIAS.LOBBY_HANGAR, checkIntegrity, EVENT_BUS_SCOPE.LOBBY)

BigWorld.callback(0, start)

@registerEvent(game, 'fini')
def fini():
    remove_listener()

def remove_listener():
    g_eventBus.removeListener(VIEW_ALIAS.LOBBY_HANGAR, checkIntegrity, EVENT_BUS_SCOPE.LOBBY)

#####################################################################
# handlers

def checkIntegrity(*args, **kwargs):
    try:
        remove_listener() # don't call the check again
        thread = threading.Thread(target=_checkIntegrityAsync)
        thread.daemon = False
        thread.start()
        BigWorld.callback(0.05, _checkResult)
    except Exception, ex:
        err('checkIntegrity() exception: ' + traceback.format_exc())


def _checkResult(*args, **kwargs):
    with lock:
        if integrity_result is None:
            BigWorld.callback(0.05, _checkResult)
            return
        log('xvm_integrity results: %s' % ('incorrect!\n\t' + '\n\t'.join(integrity_result) if integrity_result else 'correct!'))


def _checkIntegrityAsync(*args, **kwargs):
    try:
        global integrity_result
        try:
            from hash_table import HASH_DATA
        except:
            with lock:
                integrity_result = ['hash_table.py is missing/corrupt']
            return
        result = []
        for path in check_xvm_dirs:
            for folder, _, files_arr in os.walk(path):
                for filename in files_arr:
                    if (filename.endswith('.swf') or filename.endswith('.py')) and filename != '__version__.py' and filename != 'hash_table.py':
                        file_fullpath = (folder + '/' + filename).replace('\\', '/')
                        if file_fullpath in HASH_DATA:
                            with open(file_fullpath, 'rb') as f:
                                if sha1(f.read()).hexdigest() != HASH_DATA[file_fullpath]:
                                    result.append('hash mismatch in file: %s' % file_fullpath)
                            del HASH_DATA[file_fullpath]
                        else:
                            result.append('extra file %s' % file_fullpath)
        for file_fullpath in HASH_DATA.keys():
            if not (file_fullpath.endswith('__version__.py') or file_fullpath.endswith('hash_table.py')):
                if not os.path.isfile(file_fullpath):
                    result.append('file is missing: %s' % file_fullpath)
                else:
                    with open(file_fullpath, 'rb') as f:
                        if sha1(f.read()).hexdigest() != HASH_DATA[file_fullpath]:
                            result.append('hash mismatch in file: %s' % file_fullpath)
        with lock:
            integrity_result = result
    except Exception, ex:
        err('_checkIntegrityAsync() exception: ' + traceback.format_exc())
        with lock:
            integrity_result = ['Error']
