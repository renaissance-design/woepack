""" XFW Library (c) www.modxvm.com 2013-2017 """

import codecs
import json
import re
from logger import *
from HTMLParser import HTMLParser

#####################################################################
# Common methods

def msec(start, end):
    td = end - start
    return int(td.microseconds / 1000 + td.seconds * 1000)

def enum(**enums):
    return type('Enum', (), enums)

def load_file(fn):
    try:
        # debug("[XFW][LIB][load_file] "+fn)
        return codecs.open(fn, 'r', 'utf-8-sig').read()
    except:
        if fn != 'res_mods/configs/xvm/xvm.xc':
            logtrace(__file__)
        return None

def load_config(fn):
    try:
        debug("[XFW][LIB][load_config]"+fn)
        return json.load(codecs.open(fn, 'r', 'utf-8-sig'))
    except:
        logtrace(__file__)
        return None

# warning: slow method, but can work with non-hashable items
def uniq(seq):
    # Order preserving
    checked = []
    for e in seq:
        if e not in checked:
            checked.append(e)
    return checked

class _MLStripper(HTMLParser):
    def __init__(self):
        self.reset()
        self.fed = []
    def handle_data(self, d):
        self.fed.append(d)
    def get_data(self):
        return ''.join(self.fed)

def strip_html_tags(html):
    s = _MLStripper()
    s.feed(html)
    return s.get_data()

def unicode_to_ascii(obj):
    if isinstance(obj, dict):
        return dict((unicode_to_ascii(key), unicode_to_ascii(value)) for key, value in obj.iteritems())
    elif isinstance(obj, list):
        return [unicode_to_ascii(element) for element in obj]
    elif isinstance(obj, unicode):
        return obj.encode('utf-8')
    else:
        return obj

def alphanumeric_sort(arr):
    convert = lambda text: int(text) if text.isdigit() else text
    alphanum_key = lambda key: [ convert(c) for c in re.split('(\d+)', key) ]
    arr.sort(key = alphanum_key)


def fix_path_slashes(path):
    """
    Replaces backslashes with slashes
    """

    if path:
        path = path.replace('\\', '/')
        if path[-1] != '/':
            path += '/'

    return path


def resolve_path(path, basepath=None):
    """
    Resolves path to file

    'xvm://*' --> './res_mods/mods/shared_resources/xvm/*'
    'res://*' --> './res_mods/mods/shared_resources/*'
    'cfg://*' --> './res_mods/configs/xvm/*'
    '*'       --> 'basepath/*'
    """

    if path[:6].lower() == "res://":
        path = path.replace("res://", "./res_mods/mods/shared_resources/", 1)
    elif path[:6].lower() == "xvm://":
        path = path.replace("xvm://", "./res_mods/mods/shared_resources/xvm/", 1)
    elif path[:6].lower() == "cfg://":
        path = path.replace("cfg://", "./res_mods/configs/xvm/", 1)
    elif basepath:
        path = fix_path_slashes(basepath)+path

    return path.replace('\\', '/')
