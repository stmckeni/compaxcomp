# -*- mode: python ; coding: utf-8 -*-

block_cipher = None


a = Analysis(['compax_comp.py'],
             pathex=['/home/stmckeni/Documents/desktop software/compax_comp'],
             binaries=[],
             datas=[],
             hiddenimports=['requests', 'PyQt5', 'PyQt5.QtWidgets', 'PyQt5.QtWebChannel', 'PyQt5.QtWebEngine', 'PyQt5.QtNetwork', 'PyQt5.QtWebEngineCore', 'PyQt5.QtWebEngineWidgets', 'PyQt5.QtMultimedia', 'PyQt5.QtMultimediaWidgets'],
             hookspath=[],
             runtime_hooks=[],
             excludes=[],
             win_no_prefer_redirects=False,
             win_private_assemblies=False,
             cipher=block_cipher,
             noarchive=False)
pyz = PYZ(a.pure, a.zipped_data,
             cipher=block_cipher)
exe = EXE(pyz,
          a.scripts,
          a.binaries,
          a.zipfiles,
          a.datas,
          [],
          name='compax_comp',
          debug=False,
          bootloader_ignore_signals=False,
          strip=False,
          upx=True,
          upx_exclude=[],
          runtime_tmpdir=None,
          console=True )
