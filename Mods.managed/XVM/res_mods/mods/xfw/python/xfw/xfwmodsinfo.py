""" XFW Library (c) www.modxvm.com 2013-2016 """

class _XfwModsInfo(object):
    info = {}
    loaded_swfs = {}

    def add(self, name, modinfo):
        self.info[name] = modinfo

    def update(self, name, modinfo):
        if name not in self.info:
            self.add(name, modinfo)
        else:
            self.info[name].update(modinfo)

    def swf_loaded(self, swf):
        self.loaded_swfs[swf] = 1

    def clear_swfs(self):
        self.loaded_swfs = {}
        for key in iter(self.info):
            self.info[key].pop('swf_file_name', None)

xfw_mods_info = _XfwModsInfo()
