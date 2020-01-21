# compaxcomp
a ide written in pyqt5 for addressing specific handicaps,particularly ADHD.


to get started go to the terminal where the cython main and python main is. setup.py should be in the same directory as these scripts which is in the compax_comp root. 

From there you need to compile and build for parsing via python as I included cython for c/c++ integration.

in your terminal type " python3 setup.py build_ext --inplace " and then run the .py main compax script and you should be good to go. 

it is pyinstaller friendly so you could technically create an official executable.

I am currently using Linux Lite, so if you plan to cross platform compilation, its your responsibility to set up according to python 3.8, cython, and pyinstaller, but it is optional to contribute here on github for different platforms.

*as of january 6th,2020, this is not an official demo or build, it is simply to test out and add new features as they come up.*

all the files located in compax_comp folder. nem.py is where the main file is contained.

I added the rxvt-unicode terminal for embedding and should run without the need for the dependencies or the actual terminal installed on your linux system itself. If you have trouble with your terminal, please let me know.

RXVT was originally written by Rob Nation and later extensively modified by Mark Olesen, who took over maintenance for several years. It is intended to be a slimmed-down alternate for xterm , omitting some of its little-used features, like Tektronix 4014 emulation and toolkit -style configurability.

as of january 1st, 2020, you will need to use py installer to get an executable or use at least python 3.7+ to get it working. Will not work with python2 as pyqt5 is not compatible with python2. 3.5 is rumored to support all the pyqt5 libs but proven and written with python 3.7 with exclusive compatibility with python 3.8. I had to compile 3.8 from source since 3.8 is not yet available for linux. (or it is, if you compile from the python 3.8 source code.)


*Update on jan 21 2020*
had to add extended extension. You will need to add a temp folder and in that folder you will need to add a blank file called jigga.mp4 and the video popups will use that as a temp file to write to. I tried to upload folder to github but this time around, there is no way to add a folder, or upload it, even in chrome. 

if anything in your terminal cd to the compax_comp folder and write mkdir temp and in the temp folder add jigga.mp4 for the temp raw container for mp4 file that will automatically download the video files. 
