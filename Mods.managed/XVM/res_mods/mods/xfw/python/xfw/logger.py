""" XFW Library (c) www.modxvm.com 2013-2016 """

#####################################################################
# Logging to python.log

import datetime
import traceback
from . import IS_DEVELOPMENT

def log(msg):
    print datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S:'), msg

def print_r(object, include=None, exclude=None):
    for attr in dir(object):
        if (include is None or attr.find(include) >= 0) and (exclude is None or attr.find(exclude) == -1):
            try:
                print "obj.%s = %s" % (attr, getattr(object, attr))
            except:
                print "obj.%s = %s" % (attr, '<error>')

def err(msg):
    log('[ERROR] %s' % msg)

def debug(msg):
    if IS_DEVELOPMENT:
        log('[DEBUG] %s' % msg)

def logtrace(exc=None):
    print("=============================")
    import traceback
    if exc is not None:
        err(str(exc))
        traceback.print_exc()
    else:
        traceback.print_stack()
    print("=============================")


#####################################################################
# Logger class

class Logger(object):
    def __init__(self, filename):
        self.logfile = open(filename, "w", 2 if IS_DEVELOPMENT else 8192)

    def __del__(self):
        self.logfile.close()

    def add(self, s):
        self.logfile.write("%s: %s\n" % (datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S'), s))

    def debug(self, s):
        if IS_DEVELOPMENT:
            self.add("[DEBUG] " + str(s))

    def error(self, s):
        self.add("[ERROR] " + str(s))

    def info(self, s):
        self.add("[INFO]  " + str(s))

    def warning(self, s):
        self.add("[WARN]  " + str(s))

    def trace(self, exc=None):
        self.add("=============================")
        import traceback
        if exc is not None:
            self.error(str(exc))
            self.add(traceback.format_exc())
        else:
            self.add(traceback.format_stack())
        self.add("=============================")
