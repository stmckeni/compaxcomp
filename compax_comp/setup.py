from distutils.core import setup
from distutils.extension import Extension
from Cython.Distutils import build_ext


ext_modules=[
    Extension("nem", ["nem.pyx"])
]

setup(
  name = 'compax_comp',
  cmdclass = {'build_ext': build_ext},
  ext_modules = ext_modules
)