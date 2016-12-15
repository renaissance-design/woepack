""" XFW Library (c) www.modxvm.com 2013-2016 """

import os

#####################################################################
# Check for development mode

IS_DEVELOPMENT = os.environ.get('XFW_DEVELOPMENT') is not None
XFW_NO_TOKEN_MASKING = os.environ.get('XFW_NO_TOKEN_MASKING') is not None
if IS_DEVELOPMENT:
    print '[XFW] Development mode'
    # Setup development environment
    import BigWorld
    def _autoFlushPythonLog():
        BigWorld.flushPythonLog()
        BigWorld.callback(0.1, _autoFlushPythonLog)
    _autoFlushPythonLog()

XFW_WORK_DIR = '' # will be filled in later in xfw_loader.py

#####################################################################
# imports

from constants import *
from events import *
from logger import *
from singleton import *
from utils import *
from wg import *
from xfwmodsinfo import *
from swf import *

__all__ = [
    'IS_DEVELOPMENT',
    'XFW_NO_TOKEN_MASKING',
    'XFW_WORK_DIR',
    # constants
    'XFWCOMMAND',
    'XFWEVENT',
    'XFWCOLORS',
    # events
    'EventHook',
    'registerEvent',
    'overrideMethod',
    'overrideStaticMethod',
    'overrideClassMethod',
    # logger
    'traceback',
    'log',
    'err',
    'print_r',
    'debug',
    'logtrace',
    'Logger',
    # singleton
    'Singleton',
    # utils
    'msec',
    'enum',
    'load_file',
    'load_config',
    'uniq',
    'strip_html_tags',
    'unicode_to_ascii',
    'alphanumeric_sort',
    # wg
    'getLobbyApp',
    'getBattleApp',
    'getCurrentAccountDBID',
    'isReplay',
    'getArenaPeriod',
    'getVehCD',
    'GAME_REGION',
    'GAME_LANGUAGE',
    # swf
    'as_xfw_cmd',
    'as_event',
    'as_callback',
    'xfw_mods_info',
]
