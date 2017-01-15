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
