""" XFW loader (c) www.modxvm.com 2013-2017 """

_XFW_VER = '4.0.0'

import glob
import platform
import os
import sys
import shutil
import traceback
import BigWorld
import ResMgr
from helpers import VERSION_FILE_PATH

# get version
# ver = 'v.0.8.7 #512' or 'v.0.8.7 Common Test #499' or 'Supertest v.ST 0.9.15.1 #366'
ver = ResMgr.openSection(VERSION_FILE_PATH).readString('version')
if 'Supertest v.ST ' in ver:
    ver = ver.replace('Supertest v.ST ', 'v.')
ver = ver[2:ver.index('#') - 1]
short_ver = ver if not ' ' in ver else ver[:ver.index(' ')]  # X.Y.Z or X.Y.Z.a

# wd: "<base_dir>/mods" directory
wd = os.path.dirname(os.path.realpath(__file__))
wd = wd[0:wd.rfind('\\')]
wd = wd[0:wd.rfind('\\')]

import xfw
import xfw.console
xfw.XFW_WORK_DIR = wd

# get path of "./res_mods/0.9.10" etc.
xfw.constants.PATH.GENERAL_MODS_DIR = ResMgr.openSection('../paths.xml')['Paths'].values()[0].asString.lstrip('./')

print("[XFW] Version: %s" % _XFW_VER)
print("[XFW] Working dir: %s" % wd)

packages_folder = '%s/packages' % wd
sys.path.insert(0, packages_folder)  # add packages folder to path
sys.path.insert(0, '%s/xfw/python/lib' % wd)  # add 3rd-party libs to path

# setup error levels for libs logging
import logging
logging.getLogger('pika').setLevel(logging.ERROR)

# remove obsolete packages
obsolete_packages = ['xvm_comments'] # need to delete those from packages
for dir_name in obsolete_packages:
    absolute_path = '%s/%s' % (packages_folder, dir_name)
    if os.path.isdir(absolute_path):
        shutil.rmtree(absolute_path, True)
        if os.path.isdir(absolute_path): # not deleted
            status = 'fail'
        else:
            status = 'success'
        print('[XFW] Deleting old directory %s ... %s' % (dir_name, status))

# load python mods
def load_mods():
    mods = [i.replace("\\", "/").replace("//", "/") for i in glob.iglob('%s/packages/*/python' % wd.replace('[', '[[]'))]
    xvm_main_idx = [i for i, word in enumerate(mods) if word.endswith('/xvm_main/python')]
    if xvm_main_idx and len(xvm_main_idx):
        mods.insert(0, mods.pop(xvm_main_idx[0]))
    for m_dir in mods:
        if os.path.isdir(m_dir) and (os.path.exists('%s/__init__.py' % m_dir) or os.path.exists('%s/__init__.pyc' % m_dir)) :
            try:
                m_dir = m_dir[0:m_dir.rfind("/")]  # m_dir:  module root directory (/mods/packages/<modname>/)
                m_name = m_dir[m_dir.rfind("/") + 1:]  # m_name: module name

                print("[XFW] Loading mod: " + m_name),
                open(m_dir + '/__init__.py', 'a').close()

                mod = __import__('%s.python' % m_name, globals(), locals(), ['XFW_MOD_INFO'])
                modinfo = mod.XFW_MOD_INFO

                xfw_mod_version = modinfo.get('VERSION', '0.0')
                xfw_mod_url = modinfo.get('URL', 'http://www.modxvm.com/')
                xfw_mod_update_url = modinfo.get('UPDATE_URL', 'http://www.modxvm.com/')
                xfw_mod_game_versions = modinfo.get('GAME_VERSIONS', None)

                global short_ver
                print "%s (%s)" % (xfw_mod_version, xfw_mod_url)
                if short_ver not in xfw_mod_game_versions:
                    print(
                        "[XFW][%s] WARNING: Mod is not tested for compatibility with the current version of the game"
                        % m_name)
                    print("[XFW][%s]          Game version:  " % m_name + short_ver)
                    print("[XFW][%s]          Compatible:    " % m_name + ", ".join(xfw_mod_game_versions))
                    if xfw_mod_update_url:
                        print("[XFW][%s]          Please look for updates on the mod's website:" % m_name)
                        print("[XFW][%s]            %s" % (m_name, xfw_mod_update_url))

                xfw.xfw_mods_info.add(m_name, modinfo)

                os.remove(m_dir + '/__init__.py')
                os.remove(m_dir + '/__init__.pyc')
            except Exception:
                print("=============================")
                print("[XFW][%s] Error loading mod:" % m_name)
                traceback.print_exc()
                print("=============================")

load_mods()
