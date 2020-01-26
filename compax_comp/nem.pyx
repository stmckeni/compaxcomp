# !/usr/bin python3

#proun
#compax comp created by spencer williams
from libc.stdlib cimport *
from libc.stdio cimport *


import time
import re
import os
import sys
import requests
import shutil


from PyQt5.QtWidgets import *

from PyQt5.QtWebChannel import *


from PyQt5.QtGui import *
from PyQt5.QtCore import *
from PyQt5.QtWebEngine import *
from PyQt5.QtWebEngineWidgets import *
from PyQt5.QtPrintSupport import *
from PyQt5.QtMultimedia import *
from PyQt5.QtMultimediaWidgets import *



#key notes difference between exec_ and show(is that exec_ domainates focus and runs separate) and show is just part of teh parent widget

""""
this is how to include c files the extern way



cdef extern from "jelexus.c":
    void testicles(int blip)
    cdef struct Foo:
        int make
        float moo
        void* mera


"""
   

#download and stream
def _download_and_stream(url=
"https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4",is_online_stream=False):
    _d_url = url
    
    #chunk size
    chunk_size = 512
    r = requests.get(_d_url,stream=is_online_stream)
    with open("temp/jigga.mp4","wb") as f:
        for chunk in r.iter_content(chunk_size=chunk_size):
            f.write(chunk)



    print(_d_url)

    return "temp/jigga.mp4"


class da_extern_video_Window(QWidget):
    def __init__(self):
        super(da_extern_video_Window, self).__init__()
        
        #set data var
        self._da_online_path = ""
        if(self._da_online_path == ""):
            self._set_url_link("https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4")
            self._da_online_path = self._get_da_url_link()
        #set position slider
        self.positionSlider = QSlider(Qt.Horizontal)
        #set error label
        self.errorLabel = QLabel()
        #create a media player object
        self.player = QMediaPlayer(self)
        #create a video widget for the video to be blit on
        self.viewer = QVideoWidget(self)
        #set the player to play the video blit
        self.player.setVideoOutput(self.viewer)
        #handle the state of the video to be changed
        self.player.stateChanged.connect(self.handleStateChanged)
        #set the video title
        self.setWindowTitle("browser video player....")
        #what to do when the position of the video is changed
        self.player.positionChanged.connect(self.positionChanged)
        #handle the duration of selected file
        self.player.durationChanged.connect(self.durationChanged)
        #handle the error
        self.player.error.connect(self.handleError)
        #play button
        self.button1 = QPushButton('Play', self)
        #stop button
        self.button2 = QPushButton('Stop', self)
        #call function (or method) when play button is clicked
        self.button1.clicked.connect(self.player.play)
        #call function (or method) when stop button is clicked
        self.button2.clicked.connect(self.player.stop)
        #enable stop button
        self.button2.setEnabled(True)
        #do a grid layout
        layout = QGridLayout(self)
        #add the video to thw layout
        layout.addWidget(self.viewer, 0, 0, 1, 2)
        #add the play button to the laayout
        layout.addWidget(self.button1, 1, 0)
        #add the stop button to the grid layout
        layout.addWidget(self.button2, 1, 1)
        #add the position slider to the layout
        layout.addWidget(self.positionSlider,2,0)
        #add the error label to the layout
        layout.addWidget(self.errorLabel,3,0)
        #create a buffer object just in case
        self._buffer = QBuffer(self)
        #create a data object
        self._data = None
        #do the rest of the functions 
        #self._init_handle_video_nuttin()
    #initialize the video
    def _init_handle_video_nuttin(self):

      
        #set postion range
        self.positionSlider.setRange(0,0)
        #set what to do when slider is moved
        self.positionSlider.sliderMoved.connect(self.setPosition)
        
        #set sizr policy
        self.errorLabel.setSizePolicy(QSizePolicy.Preferred,QSizePolicy.Maximum)

        _eek_online_path = self._get_da_url_link()
        edt = _download_and_stream(str(_eek_online_path),True)
        print("!@#$! diagnostics for download data")
        print(edt)
        print("Now fucking fuck the fuck off!")
        path = str("temp/jigga.mp4")
        if path:
            self.button1.setEnabled(False)
            self.button2.setEnabled(True)
            self.player.setMedia(QMediaContent(QUrl.fromLocalFile(QFileInfo(path).absoluteFilePath())))
            self.player.play()

        else:
            print("error has occurred, cause")
            print(path)     

    def handleStateChanged(self, state):
        if state == QMediaPlayer.StoppedState:
            self.button1.setEnabled(True)
            self.button2.setEnabled(False)


        else:
            self.button1.setEnabled(False)
            self.button2.setEnabled(True)



    def positionChanged(self,position):
        self.positionSlider.setValue(position)


    def durationChanged(self,duration):
        self.positionSlider.setRange(0,duration)

    def setPosition(self,position):
        self.player.setPosition(position)

    def handleError(self):
        self.button1.setEnabled(False)
        self.errorLabel.setText("Fuckin' error: "+self.player.errorString())







    def _set_url_link(self,online_path="https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4"):

        self._da_online_path = online_path


    def _get_da_url_link(self):
        return self._da_online_path


#add a hide and unhide feature for all the dockable areas
class De_da_dock_button(QWidget):
    def __init__(dis,*args,**kwargs):
        super(De_da_dock_button,dis).__init__(*args,**kwargs)
        dis.setStyleSheet("""background: red; color: green; """)
        #set dock button title
        dis.setWindowTitle("show/hide docks")
        #create the button
        dis.da_button_1 = QPushButton("show/hide all docks",dis)
        #connect the signal
        dis.da_button_1.clicked.connect(dis._da_sho_n_hyde_dock)
        #create a vbox layout
        dis.vbox = QVBoxLayout()
        
        #add to the main widget
        dis.vbox.addWidget(dis.da_button_1)
        #add layout to the widget
        dis.setLayout(dis.vbox)


    #connect the signal for the dock show and hide button
    @pyqtSlot()
    def _da_sho_n_hyde_dock(dis):


        print("dock button initialized...")
        pass

    #start the loop for the regular plugin method
    def _run_da_reg_control_plugin(dis):
        dis.show()






#try to create a terminal embed within a widget as needed

class DaTerminal(QWidget):
    def __init__(dis,dynamic_scale=False,parent=None,*args,**kwargs):
        super(DaTerminal,dis).__init__(parent,*args,**kwargs)
        dis.setStyleSheet("""background: red; color: green; """)
        #set terminal title
        dis.setWindowTitle("da compax comp terminal")
        dis.process = QProcess(dis)
        #set process channel mode 
        dis.process.setProcessChannelMode(QProcess.MergedChannels)
        #set up process factors
        dis.process.readyRead.connect(dis._on_terminal_output)
        #when the process has an error
        dis.process.errorOccurred.connect(dis._on_da_terminal_error)
        #when the process is basically finished.
        dis.process.finished.connect(dis._on_terminal_exit)
        dis.dynamic_scale = dynamic_scale
        
      
        
        dis.terminal = QWidget(dis)
        layout = QVBoxLayout(dis)
        layout.addWidget(dis.terminal)
        #works with also urxvt
        if (not dis.dynamic_scale) or (dis.dynamic_scale == "False"):
            dis.setFixedSize(640,480)
        print("toasty")
        print("checking dynamic scale status")
        print("dynamic scale status is : {} \n".format(dis.dynamic_scale))
        print(os.environ["PATH"])
        #initialize path safekeeping (redundant?)
        dis.Label__oldEnv = 0
        
        #initializing the terminal
        dis.__da_init_terminal_startit()
        
        
        #safely add terminal source executable to app
    def __add_terminal_to_env(dis):
        dis.Label__oldEnv = os.environ["PATH"]
        print(dis.Label__oldEnv)
        os.environ["PATH"] = "/compax_comp/datterminalstandalonesexxxx/:"+dis.Label__oldEnv
        print("checking temp env")
        print("la temp dir iz: ")
        print(os.environ["PATH"])
        print("rejoyce in the end of this dianostic of ensuring temp switch")
        
        
    #safely remove terminal source executable from os path to avoid system tampering
    def __remove_terminal_from_env(dis):
        print("removing path buggy")
        os.environ["PATH"] = dis.Label__oldEnv
        print("path changed")
        print("environment var is:")
        print(os.environ["PATH"])
        
        
        
    #commands content for handling slots for signals
    
    def __da_init_terminal_startit(dis):
        dis.__add_terminal_to_env()
        command = str("rxvt-unicode")
        dis.process.start(command,['-embed',str(int(dis.winId())), '-bg','black','-fg','blue', '-hc','red','-cr','green','-pr','yellow'])
        dis.process.waitForStarted(-1)
        dis.__remove_terminal_from_env()
        
    #set the output for the terminal
    @pyqtSlot()
    def _on_terminal_output(dis):
        da_data = bytes(dis._process.readAll()).decode().replace('\r\n','\n')
        print(da_data)    
        
    #handle on error for the terminal
    @pyqtSlot()
    def _on_da_terminal_error(error):
        print("")
        print("there's a fgoiddamn fuckin error. Process error: {0}".format(str(error)))
        print("")
        
        
    #handle the terminal exiting
    @pyqtSlot()
    def _on_terminal_exit(exitCode):
        print("")
        print("Exit kode = {0}".format(str(exitCode)))
        
        
        
    #attempt to override the close event to end the terminal process properly
    def closeEvent(dis,event):
        dis.process.terminate()
        dis.process.waitForFinished()
        event.accept()
    
        
    #set if terminal scale will be dynamic or not
    def set_dynamic_scale(dis,dynamic_result=True):
        dis.dynamic_scale = dynamic_result

#handle dash blank
class Ae_web_page(QWebEnginePage):
    def createWindow(dis, _type):
        page = QWebEnginePage(dis)
        page.urlChanged.connect(dis.on_url_changed)
        return page

    @pyqtSlot(QUrl)
    def on_url_changed(dis,url):
        page = dis.sender()
        dis.setUrl(url)
        page.deleteLater()



#create the compax comp browser
class da_Web_Browser(QWidget):
    def __init__(dis,*args,**kwargs):
        super(da_Web_Browser,dis).__init__(*args,**kwargs)
        #create the browser tab title
        dis.title_tab_name = "da web browser"
        #set the web browser
        dis.browser = QWebEngineView()
        #set the web browser settings object
        #dis.browser_settings = dis.browser.settings()

        dis.browser_settings = QWebEngineSettings.globalSettings()
        #set plugins and javascript to be enabled
        dis.browser_settings.setAttribute(QWebEngineSettings.PluginsEnabled,True)
        dis.browser_settings.setAttribute(QWebEngineSettings.JavascriptEnabled,True)
        dis.browser_settings.setAttribute(QWebEngineSettings.LocalContentCanAccessRemoteUrls, True)
        dis.browser_settings.fullscreenSupportEnabled=True
        dis.browser_settings. allowRunningInsecureContent = True
        dis.browser_settings.screenCaptureEnabled = True
        dis.browser_settings.webGLEnabled = True
        
        dis._dis_da_url = "https://www.bitchute.com/video/oPmPhCZoWmo9"
        #set homepage by default
        page = Ae_web_page(dis.browser)
        dis.browser.setPage(page)
        dis.browser.load(QUrl(dis._dis_da_url))

        dis._da_source_html_data = requests.get(dis._dis_da_url).text
        
        #what to do on the changed url
        #dis.browser.urlChanged.connect(lambda : dis.browser.renew_urlbar(QUrl("https://mgtow.com"),dis) )
        #when the page finishes loading
        dis.browser.loadFinished.connect(lambda : dis.setWindowTitle(dis.browser.page().title()))
        #set the vbox layout
        dis.vboxlayout = QVBoxLayout()
        #set the horizontal group box for the browser controls
        dis.hboxgroup = QGroupBox("da browser controlz")
        #set the horizontal layout
        dis.hboxlayout = QHBoxLayout()
        #get the url line edit
        dis.url_box = QLineEdit()
        #set up the popup
        dis.Browser_control_window = QWidget()
        #set dimensions for the controls
        dis.Browser_control_window.setGeometry(100,100,100,100)
        #set the vbox layout for the browser controls
        dis._bvd_vbox = QVBoxLayout()
        #set the object button to call the browser controls
        dis._call_Buttin = QPushButton("display da controls",dis)
        #set the slot to the button signal
        dis._call_Buttin.clicked.connect(dis._show_browser_controls)
        #set the load page button
        dis._load_pagedd_url = QPushButton("load yer url",dis)
        
        dis._load_pagedd_url.clicked.connect(dis.load_da_page   )
        #set the back page button
        dis._vefor_go_back_button = QPushButton("go back",dis)
        dis._vefor_go_back_button.clicked.connect(dis._back_buitton) 
        #skip forward a page button
        dis._eefor_forward_button = QPushButton("skip forward",dis)
        dis._eefor_forward_button.clicked.connect(dis._skip_forward_button_i)
        #reload or refresh a page
        dis.__breelooad = QPushButton("refresh da page",dis)
        dis.__breelooad.clicked.connect(dis._dat_da_relode)
        #stop the page
        dis._dat_stop_da_page_buttonshp = QPushButton("stop loading da page",dis)
        dis._dat_stop_da_page_buttonshp.clicked.connect(dis._dat_stop_da_page)
        





        #set up the url box
        dis.url_box.setPlaceholderText("enter da url here. https://,ftp://,http://,etc...")
        #set load the page from the url box when return or enter is pressed
        dis.url_box.returnPressed.connect(dis.load_da_page)
        
       
        #add buttons to the horizontal box layout for the browser controls
        """
        print('back enabled', w.page().action(QWebEnginePage.Back).isEnabled())
    print('forward enabled', w.page().action(QWebEnginePage.Forward).isEnabled())
        """
        #load url
        dis.hboxlayout.addWidget( dis._load_pagedd_url)
        #go back a page
        dis.hboxlayout.addWidget( dis._vefor_go_back_button  )
        #go forward a page
        dis.hboxlayout.addWidget(dis._eefor_forward_button)
        #refresh a page
        dis.hboxlayout.addWidget(dis.__breelooad)
        #stop loading a page
        dis.hboxlayout.addWidget(dis._dat_stop_da_page_buttonshp)
        
        #set the layout for the popup window and add the horizontal group box contents to it
        dis._bvd_vbox.addWidget(dis.hboxgroup)
        dis.Browser_control_window.setLayout(dis._bvd_vbox)
        #add widgets to the vertical layout
        dis.vboxlayout.addWidget(dis.url_box)
        dis.vboxlayout.addWidget(dis.browser)
       
        dis.vboxlayout.addWidget(dis._call_Buttin)
        #set the current horizontal layout to the  horizontal box group
        dis.hboxgroup.setLayout(dis.hboxlayout)
        #set the overall layout
        dis.setLayout(dis.vboxlayout)

    #set to run via the loop
    def _da_run_da_custom_plugin(dis):
        dis.show()
        print("browser plugin is loading for shit browser")


    #set the tab title name as necessary
    def _set_da_custom_title(dis,title="da mgtow browser"):
        #set the title to the class title
        dis.title_tab_name = title
        

    #get the tab title name as needed
    def _get_da_custom_title(dis):
        return dis.title_tab_name


    #set up the button to load the browser controls
    @pyqtSlot()
    def _show_browser_controls(dis):
        dis.Browser_control_window.show()
        print("now sho' in' browser controls popup")

    #set up connection to load a new page
    @pyqtSlot()
    def load_da_page(dis):
        dis._dis_da_url = dis.url_box.text()
        #load the webpage
        dis.browser.load(QUrl(dis._dis_da_url))
        #call the video capture intitally
        dis._sq_video_init()
       
       





        print("fucking page is loaded. fuck off")



    #set up to intercept and download videos
    @pyqtSlot()
    def _sq_video_init(dis):
        #check if page contains either a mp4 file or a youtube type style m3u8 data and if it does, open the video player with the temporary data
        print("sq video init")


    #set up a back function 
    @pyqtSlot()
    def _back_buitton(dis):
        print('back enabled', dis.browser.page().action(QWebEnginePage.Back).isEnabled())
        dis.browser.page().triggerAction(QWebEnginePage.Back)
        



    #set up a skip forward function
    @pyqtSlot()
    def _skip_forward_button_i(dis):
         dis.browser.page().triggerAction(QWebEnginePage.Forward)





    #reload page connection
    @pyqtSlot()
    def _dat_da_relode(dis):
        dis.browser.reload()
        print("page reloadin")








    #stop the page loading
    @pyqtSlot()
    def _dat_stop_da_page(dis):
        dis.browser.page().triggerAction(QWebEnginePage.Stop)
        print("loading manually destroyed. I hope you're proud of yourself, you sick fuck!")








#create basic window for later use

class daHomeBlot(QWidget):
    def __init__(dis,*args,**kwargs):
        super(daHomeBlot,dis).__init__(*args,**kwargs)
        dis.setStyleSheet("""background:black; color:green;""")
        #create the browser engine
        dis.kk = QWebEngineView()
        #first page to load on creation of the web browser engine
        dis.kk.load(QUrl("https://upwork.com"))
        
        #set up the interface for the text editor
        dis.textEdit = QTextEdit()
      
        #create the url box
        dis.da_url_box = QLineEdit()

        #set the page load when enter is pressed
        dis.da_url_box.returnPressed.connect(dis.meme_clinc)
        #set the size of the url box
        dis.da_url_box.setGeometry(0.01,0.01,0.2,0.2)
        dis.title = 'Upwork proposal system'
        dis.left = 10
        dis.top = 10
        dis.width = 920
        dis.height = 600
        
        dis.initUI()
        
        
    def initUI(dis):
        
        dis.setWindowTitle(dis.title)
        dis.setGeometry(dis.left,dis.top,dis.width,dis.height)
        dis.createHorizontalLayout()
        #set the placeholder for the url link
        dis.da_url_box.setPlaceholderText("enter your url here. https://,http://,ftp://, etc...")
       
        windowLayout = QVBoxLayout()
        windowLayout.addWidget(dis.da_url_box)
        windowLayout.addWidget(dis.horizontalGroupBox)
        dis.browzeloadbutton = QPushButton("load url", dis)
        dis.browzeloadbutton.clicked.connect(dis.meme_clinc)
        windowLayout.addWidget(dis.browzeloadbutton)
        dis.setLayout(windowLayout)
      
         
        
        
        
    def createHorizontalLayout(dis):
        dis.horizontalGroupBox = QGroupBox("dat proposal text editor")
        layout = QHBoxLayout()
        meme = dis.textEdit
        layout.addWidget(meme)
        mer = QPushButton('generate random proposal templates',dis)
        mer.clicked.connect(dis.mer_clink)
        layout.addWidget(mer)
        layout.addWidget(dis.kk)
        dis.horizontalGroupBox.setLayout(layout)
        
        
        
    @pyqtSlot()
    def meme_clinc(dis):
        print('aneemeee')
        print(dis.kk)
        dis.kk.load(QUrl(dis.da_url_box.text()))
        
        
        
        
        
        
    @pyqtSlot()
    def mer_clink(dis):
        print('create wendoh')
        dis.kk.createWindow(QWebEnginePage().WebWindowType())
   
         
        
        
 
"""""
#set the browser thread
class Browser_thread(QThread):
    signal = pyqtSignal('PyQt_PyObject')

    def __init__(this_thread):
        QThread.__init__(this_thread)
        
       
        
       

    
    def run(this_thread):
        print("thwead runz!")
        
     


class w_runnable(QRunnable):
    def __init__(dis,url,fn,*args,**kwargs):
        super(w_runnable,dis).__init__()

        dis.url = url
        dis.fn = fn
        dis.args = args
        dis.kwargs = kwargs


    @pyqtSlot()
    def run(dis):
        dis.fn(*dis.args,**dis.kwargs)
        _check_video_tag = "<video "
        _check_mp4 = ".mp4"
        _check_m8u3 = ".m8u3"
        _1_da_source_html_data = str(requests.get(dis.url).text)
        #raw html get request
        _1_a = requests.get(dis.url)
        print("get status: find mp4")
        _1_mp4_find_status = _1_da_source_html_data.find(_check_mp4)
        print(_1_mp4_find_status)
      
        if(_1_mp4_find_status < 0):
            print("video find failed")
        else:
            print("mp4 found on page")
            _1_soup_bs_parsed_data = BS(_1_a.content,'html.parser')
       
            print("<end of FUCKING DIAGNOSTICS>")
            print("flamboyancy revee")
            print("status report")
            #https://www.bitchute.com/video/oPmPhCZoWmo9/
            print(_1_mp4_find_status)
            if(_1_mp4_find_status < 0):
                print("video find failed rot in hell!")
            else:
                #prettify data
                print(_1_soup_bs_parsed_data.prettify())

                dis._1_text_output = da_distractfree_writer()
                dis._1_text_output.setText(_1_da_source_html_data)
                dis._1_text_output.show()
                xdata = _1_soup_bs_parsed_data.find('source')
           
                print("is it over?")
                print(xdata['src'])
            
                _1_udemy_soup_bs_parsed_data = BS(_1_a.content,'html.parser')
                udemy_capture = _1_udemy_soup_bs_parsed_data.find('video')
                dis.veek = da_extern_video_Window()
                if(xdata['src']):
                    dis.veek._set_url_link(str(xdata['src']))
                elif(udemy_capture['src']):
                    dis.veek._set_url_link(str(udemy_capture['src']))
                else:
                    dis.veek._set_url_link("https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4")
                dis.veek._init_handle_video_nuttin()
                dis.veek.show()

"""



#The main window

class daMainWindow(QMainWindow):
    def __init__(this_object):
        super(daMainWindow,this_object).__init__()
        print("damainwindowlives")
        #create the threadpool
        this_object.threadpool = QThreadPool()
        print("Multithreading technology with a maximum of %d fucking threads" % this_object.threadpool.maxThreadCount())
        this_object.Da_System_Icon = QIcon( "images/anutechlogo.png")

        #set current file focus path
        this_object.dafilepath = ''
        #init custom tab
        this_object.tabs = QTabWidget()
       
        
        #start the directory view for the file system in the folder
        this_object.model = QFileSystemModel()
        #set the system path
        this_object.model.setRootPath(QDir.currentPath())
        #set the directory tree
        this_object.tree = QTreeView()
        #set the directory model for the tree view
        this_object.tree.setModel(this_object.model)
        #set directory options 
        this_object.tree.setAnimated(True)
        this_object.tree.setIndentation(20)
        this_object.tree.setSortingEnabled(True)
        this_object.tree.setWindowTitle("Da Directorhy")
        this_object.tree.resize(640,480)

        #initialize the terminal system
        this_object._start_dat_terminal_n_debug_system()
        #set the icon for the program
        print(this_object.Da_System_Icon)
        #set the vboxlayout
        this_object.vboxlayout = QVBoxLayout()
        #this_object.setWindowIcon()
        #set the title for the main window
        this_object.dawindowtitle = "Compax comp c-ver 0.0.1"
        this_object.setWindowTitle(this_object.dawindowtitle)
        #make homepage doc widget
        this_object.docked = QDockWidget("control station",this_object)
        
        #add editor portion
        this_object.editRDok = QDockWidget("custom dock",this_object)
        #add custom dock area
        this_object.addDockWidget(Qt.RightDockWidgetArea,this_object.editRDok)
        #add doc widget to the left hand area
        this_object.addDockWidget(Qt.LeftDockWidgetArea,this_object.docked)
        #the widget to be docked. can be text editor or browser editor, or anything really as long as it's a QWidget object 
       
        this_object.dockedWidget = QWidget(this_object)
       
        #add tabs to the custom area dock
        this_object.customDockareawidget = this_object.tabs
        #set the widget to be used in the dock widget
        this_object.docked.setWidget(this_object.dockedWidget)
        #set the custom dock area widget for the tabs
        this_object.editRDok.setWidget(this_object.customDockareawidget)
        #set the layodut for the left dock, we will use the vbox object dynamically
        this_object.dockedWidget.setLayout(this_object.vboxlayout)
        
        this_object.setCentralWidget(this_object.tree)
        #call function when items on the directory view are double clicked.
        this_object.tree.doubleClicked.connect(this_object.open_dat_newttt_file)

        #set text document area
        this_object.editoreDock = QDockWidget("Editor area",this_object)
        #set the tabs to use for the docking
        this_object.editorTabs = QTabWidget()
        #set the tab to a text editor
        
        #set the doc tab widget to use on the document area
        this_object.editoreDock.setWidget(this_object.editorTabs)
        #set the widget to be placed on the top or center by default
        this_object.addDockWidget(Qt.TopDockWidgetArea,this_object.editoreDock) 









        
         #set the file toolbars
        
        this_object.file_toolbar = QToolBar("main")
        this_object.file_toolbar.setIconSize(QSize(14,14))
        this_object.addToolBar(this_object.file_toolbar)
        this_object.workspace_toolbar = QToolBar("workspace")
        this_object.workspace_toolbar.setIconSize(QSize(14,14))
        this_object.addToolBar(this_object.workspace_toolbar)
        
        #set the file menus
        this_object.file_menu = this_object.menuBar().addMenu("&main")
        
        this_object.workspace_menu = this_object.menuBar().addMenu("&workspace")
        
        

        #set up the control list
        this_object.control_list = []
        #set up default controls and the browser
        # for example this_object._add_control_object(QPushButton("piece of fucking shit"))

        #set up the regular control area
        this_object.reg_ct_list = []

        
        """set the control docks button for reg dock area
        dissadint_dock = De_da_dock_button()
        this_object._add_reg_control_object(dissadint_dock)
        """
        
        #initialize the control list
        this_object.init_control_area()
        #initialize the regular control area
        this_object._init_reg_control_area()
        this_object.kabito = da_Web_Browser()
        
        this_object.kabito.show()
        
        #initialize the toolbars
        this_object.initialize_toolbar()
        #start the program
        this_object.initialize_program()
      
        
        
        
    #initalize the browser
    def _web_init_pee_dee(this_object):
        #set the web browser by default
        
       
        print("thread connect")



    #set up for the regular control area
    def _init_reg_control_area(this_object):
        print("reg control area triggered")
        print(this_object.reg_ct_list)
        for reg_ct_index in range(len(this_object.reg_ct_list)):
            
            this_object.vboxlayout.addWidget(this_object.reg_ct_list[reg_ct_index])
            this_object.reg_ct_list[reg_ct_index]._run_da_reg_control_plugin()

    #set up the custom control dock area
    def init_control_area(this_object):
       
        ## add the hbox and add widgets codes here for possible extension
        for control_list_index in range(len(this_object.control_list)):
            this_object.customDockareawidget.addTab(this_object.control_list[control_list_index],str( this_object.control_list[control_list_index]._get_da_custom_title()       ))
            this_object.control_list[control_list_index]._da_run_da_custom_plugin()

    #add the regular control widgets to the regular control list
    def _add_reg_control_object(this_object,da_QWidget):
        this_object.reg_ct_list.append(da_QWidget)
        print(this_object.reg_ct_list)

    #add the control widgets to the control list
    def _add_control_object(this_object,da_QWidget):
        this_object.control_list.append(da_QWidget)

    def initialize_program(this_object):
        #set the main window size
        this_object.setGeometry(50,50,800,600)
        
        #show the main window
        this_object.show()
        #include a new perogrammer instance
        this_object.ide_workspace = daHomeBlot()
        #standalone writer
        this_object.da_writer = da_distractfree_writer()
        
    #update title
    def update_title(this_object,updated_title="sexy chids"):
        print(this_object.dawindowtitle)
        this_object.setWindowTitle(updated_title)
        this_object.ide_workspace.setWindowTitle(updated_title)
        this_object.da_writer.setWindowTitle(updated_title)
        
        
        
    def initialize_toolbar(this_object):
       
        
        #set actions
        cut_action = QAction(this_object.Da_System_Icon,"cut",this_object)
        open_code_action = QAction(this_object.Da_System_Icon,"Upwork proposal environment",this_object)
        open_writer_action = QAction(this_object.Da_System_Icon,"standalone writer",this_object)
        open_file_action = QAction(this_object.Da_System_Icon,"open da file",this_object)
        save_file_action = QAction(this_object.Da_System_Icon,"save da file",this_object)
        saveas_file_action = QAction(this_object.Da_System_Icon,"save da file as",this_object)
        print_action = QAction(this_object.Da_System_Icon,"print da file",this_object)
        terminal_open_action = QAction(this_object.Da_System_Icon,"open da terminal",this_object)
        show_n_hyde_dock_action = QAction(this_object.Da_System_Icon,"Show hidden docks",this_object)
        show_n_hide_web_browser_action = QAction(this_object.Da_System_Icon,"Show web browser",this_object)
        
        #set status tips
        open_code_action.setStatusTip("enter Upwork proposal workspace")
        open_writer_action.setStatusTip("distraction-free writers mode")
        print_action.setStatusTip("Print current page out")
        saveas_file_action.setStatusTip("save the fucking file as")
        open_file_action.setStatusTip("open the file")
        save_file_action.setStatusTip("save the file")
        terminal_open_action.setStatusTip("open da terminal")
        show_n_hyde_dock_action.setStatusTip("Show the hidden dockable sections of your IDE. Useful in case you close them out and need them back up")
        show_n_hide_web_browser_action.setStatusTip("show the companion web browser")
        #set triggers (QAction().triggered.connect(function))
        open_code_action.triggered.connect(this_object.set_ide_workspace)
        open_writer_action.triggered.connect(this_object.set_da_distractfree_writer)
        print_action.triggered.connect(this_object.file_print)
        saveas_file_action.triggered.connect(this_object.file_saveas)
        save_file_action.triggered.connect(this_object.file_save)
        open_file_action.triggered.connect(this_object.file_open)
        terminal_open_action.triggered.connect(this_object.__open_da_terminal)
        show_n_hyde_dock_action.triggered.connect(this_object._id_da_sho_n_hyde_dock)
        show_n_hide_web_browser_action.triggered.connect(this_object._we_show_da_web_browser)
        #add each action to the menu and toolbar respectively
        this_object.workspace_menu.addAction(open_code_action)
        this_object.workspace_toolbar.addAction(open_code_action)
        this_object.workspace_menu.addAction(open_writer_action)
        this_object.workspace_toolbar.addAction(open_writer_action)
        this_object.workspace_menu.addAction(show_n_hyde_dock_action)
        this_object.workspace_toolbar.addAction(show_n_hyde_dock_action)
        this_object.workspace_menu.addAction(show_n_hide_web_browser_action)
        this_object.workspace_toolbar.addAction(show_n_hide_web_browser_action)
        this_object.file_menu.addAction(open_file_action)
        this_object.file_toolbar.addAction(open_file_action)
        this_object.file_menu.addAction(show_n_hyde_dock_action)
        this_object.file_toolbar.addAction(show_n_hyde_dock_action)
        this_object.file_menu.addAction(save_file_action)
        this_object.file_menu.addAction(saveas_file_action)
        this_object.file_menu.addAction(print_action)
        this_object.file_menu.addAction(terminal_open_action)
        
        
        this_object.file_toolbar.addAction(save_file_action)
        this_object.file_toolbar.addAction(saveas_file_action)
        this_object.file_toolbar.addAction(print_action)
        this_object.file_toolbar.addAction(terminal_open_action)
        
        
        #set terminal to also be included with the workspace menu
        this_object.workspace_menu.addAction(terminal_open_action)
        this_object.workspace_toolbar.addAction(terminal_open_action)
        
        #set the file toolbar
        

    #set the web browser
    @pyqtSlot()
    def _we_show_da_web_browser(this_object):
        if(this_object.kabito.hide()):
            this_object.kabito.show()
        this_object.kabito.show()
        
        
    #set the ide workspace to select
    @pyqtSlot()
    def set_ide_workspace(this_object):
        this_object.ide_workspace.show()
        
       
        
        
    @pyqtSlot()
    def __open_da_terminal(this_object):
        this_object.term = DaTerminal()
        this_object.term.show()
        
        
    #set the stand alone writer to sleect
    @pyqtSlot()
    def set_da_distractfree_writer(this_object):
        #add the writer to the vboxy layout
        this_object.vboxlayout.addWidget(this_object.da_writer)
        #set the title of the notepad
        this_object.da_writer.setWindowTitle("da text pad")
        #show the text pad
        this_object.da_writer.show()
      
        
        
        
    #open file
    @pyqtSlot()
    def file_open(this_object):
        #set path to the file according to the file dialog
        path, _ = QFileDialog.getOpenFileName(this_object,"Open da file","","da python filez (*.py);;All Da files(*.*)")
        #if the path is set (if file successfully opens)
        if path:
            #try to read each line and put the resulting parsed file into text variable
            try:
                with open(path,'rU') as f:
                    text = f.read()
                    
            #catch the exception should one occur        
            except Exception as e:
                #open critical qt dialog to show the error
                this_object.dialog_critical(str(e))
                
                
            else:
                 #if path fails to load, set the path to the current document being edited on
                this_object.dafilepath = path
                #open a new distract free writer for use in the tab
                opentempnu_dtr = da_distractfree_writer()
                #set the plain text of the text editor on the ide.
                opentempnu_dtr.setPlainText(text)
                #add the writer to the editor tab section
                this_object.editorTabs.addTab(opentempnu_dtr,this_object.Da_System_Icon,str(this_object.dafilepath))
                #set the path of the currently active tab to the focusable file path
                this_object.editorTabs.currentWidget().path = this_object.dafilepath
                #debug to check and see if the widget path fits 
                print(this_object.editorTabs.currentWidget().path)
                #if path fails to load, set the path to the current document being edited on to just do it again. redundant? absolutely but i will optimize later.
                path = this_object.editorTabs.currentWidget().path
                #set the plain text of the text editor on the ide. redundant
                this_object.editorTabs.currentWidget().setPlainText(text)
                #update the title
                this_object.update_title(path)
                
    #file save 
    @pyqtSlot()           
    def file_save(this_object):
        print("testing the save path:::as follows:")
        print(this_object.editorTabs.currentWidget().path)
        print("localized focused path")
        print(this_object.dafilepath)
        this_object.editorTabs.currentWidget().path = this_object.dafilepath

        if (this_object.editorTabs.currentWidget().path is None):
            return this_object.file_saveas()
        
        else:
            this_object._save_to_path(this_object.editorTabs.currentWidget().path)
        
    #file save as 
    @pyqtSlot()   
    def file_saveas(this_object):
        path, _ = QFileDialog.getSaveFileName(this_object,"save dis file","","All Da files(*.*)")
        
        if not path:
            return
        this_object.editorTabs.currentWidget().path = path
        
        this_object._save_to_path(this_object.editorTabs.currentWidget().path)
    
    #save to path
    def _save_to_path(this_object,path):
        text = this_object.editorTabs.currentWidget().toPlainText()
        if not path:
            print("path error occurred...")
            print(path)
            
            
        else:
            plat_path = path
            print("path seems to be working. running diagnostics...")
            print(path)
            print(plat_path)
            try:
                with open(plat_path,'w') as f:
                    f.write(text)
                
                
                
            except Exception as e:
                this_object.dialog_critical(str(e))
            
            
            
            else:
                this_object.editorTabs.currentWidget().path = path
                this_object.update_title(this_object.editorTabs.currentWidget().path)
        
        
        
        
        
    #file print
    @pyqtSlot()
    def file_print(this_object):
        d1g = QPrintDialog()
        if d1g.exec_():
            this_object.editorTabs.currentWidget().print_(d1g.printer())
            
            
    #attempt to override the close event to end the terminal process properly
    def closeEvent(this_object,event):
        this_object.window1.process.terminate()
        this_object.window1.process.waitForFinished()
        event.accept()

    #open file from directory structure
    #@pyqtSlot()
    def open_dat_newttt_file(this_object,index):
        cdef int k = 3
               #set path to the file according to the file dialog
               

        
        print(index)
        path = this_object.model.filePath(index)
        print(path)
        #if the path is set (if file successfully opens)
        if path:
            #try to read each line and put the resulting parsed file into text variable
            try:
                with open(path,'rU') as f:
                    text = f.read()
                    
            #catch the exception should one occur        
            except Exception as e:
                #open critical qt dialog to show the error
                QDialog().dialog_critical(str(e))
                
                
            else:
                #if path fails to load, set the path to the current document being edited on
                this_object.dafilepath = path
                nu_dtr = da_distractfree_writer()
                #set the plain text of the text editor on the ide.
                nu_dtr.setPlainText(text)
                
                this_object.editorTabs.addTab(nu_dtr,this_object.Da_System_Icon,str(this_object.dafilepath))
                this_object.editorTabs.currentWidget().path = this_object.dafilepath
                print(this_object.editorTabs.currentWidget().path)
        print(k)
        



    #initialize the terminal program and run it in a dynamic dockable tab in the bottom
    def _start_dat_terminal_n_debug_system(this_object):
    #start a dockable sequence
        this_object.term_dock = QDockWidget("Terminal & debugging tools",this_object)
        #add terminals tabs
        this_object.terminal_tabzee = QTabWidget()

        #add initial terminal set the dynamic scale to true
        this_object.__the_first_terminal = DaTerminal(True)
        #set the dynamic scale manually and once true, make sure the terminal scales with the window activity
        this_object.__the_first_terminal.set_dynamic_scale(True)
        this_object.__the_first_terminal.setStyleSheet("QWidget{height:100%; width:100%;}")
        #add the terminal to the tab
        this_object.terminal_tabzee.addTab(this_object.__the_first_terminal,"terminal 1")
        

        #set the tab widget for use on the terminal dock area
        this_object.term_dock.setWidget(this_object.terminal_tabzee)
        #set the widget on bottom by default
        this_object.addDockWidget(Qt.BottomDockWidgetArea,this_object.term_dock)
        
        
        
        
    #bring up companion webkit app on the side
    @pyqtSlot()
    def _bring_up_nu_browser(this_object):
        mimp = da_Web_Browser()
        mimp.show()
        print("web button signal")
   
    #handle showing and hiding of dock system
    @pyqtSlot()
    def _id_da_sho_n_hyde_dock(this_object):

        #capture the dock objects
        dock_1 = this_object.docked
        dock_2 = this_object.editRDok
        dock_3 = this_object.editoreDock
        dock_4 = this_object.term_dock
        #check to see if docks are hidden and to show them if they are
        if(dock_1.isHidden()):
            dock_1.show()

        if(dock_2.isHidden()):
            dock_2.show()



        if(dock_3.isHidden()):
            dock_3.show()

        if(dock_4.isHidden()):
            dock_4.show()









#writers tab without distractions 
class da_distractfree_writer(QTextEdit):
    def __init__(self,*args,**kwargs):
        super(da_distractfree_writer,self).__init__(*args,**kwargs)
        
        
        self.setAcceptRichText(False)
        
        fixedfont = QFontDatabase.systemFont(QFontDatabase.FixedFont)
        fixedfont.setPointSize(16)
        self.setFont(fixedfont)
        self.setGeometry(10,10,800,600)
        
        
        #set the path to the current file
        #set to none by default
        self.path = None
        
        self.run_writer_program()
        
        
       #todo: set widget to capture text file contents 
    def set_file_contents(self):
        pass
        
    #initialize the text editor of the program
    def run_writer_program(self):
          #debug(module, name, pm=False)
        printf("text editor loaded")
        self.setDocumentTitle("texteditor")
        #we make sure for word wrap to true
        if(self.wordWrapMode() == 4):
            print("Pure word wrap mode is active")
            cnxf_check = self.wordWrapMode() if (self.wordWrapMode() == 4) else 0
            print("cnxf check word wrap mod confirms...")
            print(cnxf_check)
            
        else:
            print("something went wrong with true word wrap...attempting to fix it")
            self.setWordWrapMode(4)
            x_faxkter = self.wordWrapMode() if (self.wordWrapMode() == 4) else 0
            if not x_faxkter == 4:
                print("true word wrap failed. I think I am broken...")

        #set the font weight for the text editor
        self.setFontWeight(42)
        #set the text background color
        self.setTextBackgroundColor(QColor(255,212,22,75))
        #set the text color
        self.setTextColor(QColor(255,0,0,255))
        #set the cursor width
        self.setCursorWidth(11)
        #text editor can paste
        self.canPaste = True
        #set auto formatting
        self.setAutoFormatting(QTextEdit.AutoAll)
        cdef int x_xdabber = 13
        printf("\ndigital slut #: %d \n",x_xdabber)
        
        
        pass
        
        
        
#start of the program
cdef start_main_compax_comp():
    
    app = QApplication(sys.argv)
    compax_executable = daMainWindow()

    if compax_executable:
        sys.exit(app.exec_())

         


#call the main c function here in python

def s_da_main_program():
    start_main_compax_comp()