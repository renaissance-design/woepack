""" XFW Library (c) www.modxvm.com 2013-2017 """

# EXPORT

class XFWCOMMAND(object):
    XFW_CMD = "xfw.cmd"
    XFW_COMMAND_GETGAMEREGION = "xfw.gameRegion"
    XFW_COMMAND_GETGAMELANGUAGE = "xfw.gameLanguage"
    XFW_COMMAND_CALLBACK = "xfw.callback"
    XFW_COMMAND_MESSAGEBOX = 'xfw.messageBox'
    XFW_COMMAND_SYSMESSAGE = 'xfw.systemMessage'

class XFWEVENT(object):
    SWF_LOADED = 'xfw.swf_loaded'

class XFWCOLORS(object): #in hex, 6 symbols
    UICOLOR_LABEL = "A19D95"
    UICOLOR_VALUE = "C9C9B6"
    UICOLOR_LIGHT = "FDF4CE"
    UICOLOR_DISABLED = "4C4A47"
    UICOLOR_GOLD = "FFC133"
    UICOLOR_GOLD2 = "CBAD78"
    UICOLOR_BLUE = "408CCF"

    UICOLOR_TEXT1 = "E1DDCE"
    UICOLOR_TEXT2 = "B4A983"
    UICOLOR_TEXT3 = "9F9260"

    C_WHITE = "FCFCFC"
    C_RED = "FE0E00"
    C_ORANGE = "FE7903"
    C_YELLOW = "F8F400"
    C_GREEN = "60FF00"
    C_BLUE = "02C9B3"
    C_PURPLE = "D042F3"
    C_MAGENTA = "EE33FF"
    C_GREENYELLOW = "99FF44"
    C_REDSMOOTH = "DD4444"
    C_REDBRIGHT = "FF0000"

# INTERNAL

class CONST(object):
    XFW_VIEW_ALIAS = 'xfw_injector'
    XFW_COMPONENT_ALIAS = 'xfw'

class PATH(object):
    GENERAL_MODS_DIR = '' # will be filled in later with 'res_mods/0.9.9' in xfw_loader.py.
    XFW_MODS_DIR = "res_mods/mods/packages/"
    XFW_SWF_URL = "../../../mods/xfw/actionscript/xfw.swf"
    XFW_SWF_PATH = "../" + XFW_SWF_URL
    XFWFONTS_SWF_URL = "../../../mods/xfw/actionscript/xfwfonts.swf"
    XFWFONTS_SWF_PATH = "../" + XFWFONTS_SWF_URL
    XVM_LOG_FILE_NAME = "xvm.log"

class COMMAND(object):
    # Flash -> Python
    XFW_COMMAND_LOG = "xfw.log"
    XFW_COMMAND_INITIALIZED = "xfw.initialized"
    XFW_COMMAND_SWF_LOADED = "xfw.swf_loaded"
    XFW_COMMAND_GETMODS = "xfw.getMods"
    XFW_COMMAND_LOADFILE = "xfw.loadFile"

class URLS(object):
    WG_API_SERVERS = {
        'RU':   'http://api.worldoftanks.ru',
        'EU':   'http://api.worldoftanks.eu',
        'NA':   'http://api.worldoftanks.com',
        'ASIA': 'http://api.worldoftanks.asia',
        'KR':   'http://api.worldoftanks.kr',
      # can be uncommented to test on common test server:
      # 'CT':   'http://api.worldoftanks.ru',
    }
