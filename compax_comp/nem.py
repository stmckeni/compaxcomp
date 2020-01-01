# !/usr/bin python3

#proun

import os
import sys
from PyQt5.QtWidgets import *

from PyQt5.QtWebChannel import *


from PyQt5.QtGui import *
from PyQt5.QtCore import *
from PyQt5.QtWebEngine import *
from PyQt5.QtWebEngineWidgets import *
from PyQt5.QtPrintSupport import *




#key notes difference between exec_ and show(is that exec_ domainates focus and runs separate) and show is just part of teh parent widget


#try to create a terminal embed within a widget as needed

class DaTerminal(QWidget):
    def __init__(dis,parent=None,*args,**kwargs):
        super(DaTerminal,dis).__init__(parent,*args,**kwargs)
        dis.setStyleSheet("""background: black; color: green; """)
        dis.process = QProcess(dis)
        #set process channel mode 
        dis.process.setProcessChannelMode(QProcess.MergedChannels)
        
        dis.process.readyRead.connect(dis._on_terminal_output)
        dis.process.errorOccurred.connect(dis._on_da_terminal_error)
        dis.process.finished.connect(dis._on_terminal_exit)
        
        
      
        
        dis.terminal = QWidget(dis)
        layout = QVBoxLayout(dis)
        layout.addWidget(dis.terminal)
        #works with also urxvt
       
        dis.setFixedSize(640,480)
        print("toasty")
        print(os.environ["PATH"])
        #initialize path safekeeping
        dis.Label__oldEnv = 0
        
        #initializing the terminal
        dis.__da_init_terminal_startit()
        
        
        #safely add terminal source executable to app
    def __add_terminal_to_env(dis):
        dis.Label__oldEnv = os.environ["PATH"]
        print(dis.Label__oldEnv)
        os.environ["PATH"] = ":/compax_comp/datterminalstandalonesexxxx/:"+dis.Label__oldEnv
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
    def _on_da_terminal_error(dis,error):
        print("")
        print("there's a fgoiddamn fuckin error. Process error: {0}".format(str(error)))
        print("")
        
        
    #handle the terminal exiting
    @pyqtSlot()
    def _on_terminal_exit(dis,exitCode,exitStatus):
        print("")
        print("Exit kode = {0}".format(str(exitCode)))
        print("Exit status is labeled az = {0}".format(str(exitStatus)))
        print("")
    
        




#simplify hbox additions
def generateHorizontalLayout(groupboxlabel):
        horizontalGroupBox = QGroupBox(groupboxlabel)
        layout = QHBoxLayout()
        ## add the hbox add widgets codes here
        bb = QPushButton('bubu')
        layout.addWidget(bb)
        
        ##exit actions and proceed on the stack
        horizontalGroupBox.setLayout(layout)
        return horizontalGroupBox


#create basic window for later use

class daHomeBlot(QWidget):
    def __init__(dis,*args,**kwargs):
        super(daHomeBlot,dis).__init__(*args,**kwargs)
        dis.setStyleSheet("""background:black; color:green;""")
        #create the browser engine
        dis.kk = QWebEngineView()
        #first page to load on creation of the web browser engine
        dis.kk.load(QUrl("https://mgtow.com"))
        
        #set up the interface for the text editor
        dis.textEdit = da_distractfree_writer()
      
        #create the url box
        dis.da_url_box = QTextEdit()
        #set the size of the url box
        dis.da_url_box.setGeometry(1,1,0.2,0.22)
        dis.title = 'compax comp basic ide'
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
        dis.browzeloadbutton = QPushButton("load", dis)
        dis.browzeloadbutton.clicked.connect(dis.meme_clinc)
        windowLayout.addWidget(dis.browzeloadbutton)
        dis.setLayout(windowLayout)
      
        dis.da_url_box.setAutoFormatting(QTextEdit.AutoAll)
        
        
        
    def createHorizontalLayout(dis):
        dis.horizontalGroupBox = QGroupBox("the stupid nigga's best text editor")
        layout = QHBoxLayout()
        meme = dis.textEdit
        layout.addWidget(meme)
        mer = QPushButton('rememe',dis)
        mer.clicked.connect(dis.mer_clink)
        layout.addWidget(mer)
        layout.addWidget(dis.kk)
        dis.horizontalGroupBox.setLayout(layout)
        
        
        
    @pyqtSlot()
    def meme_clinc(dis):
        print('aneemeee')
        print(dis.kk)
        dis.kk.load(QUrl(dis.da_url_box.toPlainText()))
        
        
        
        
        
        
    @pyqtSlot()
    def mer_clink(dis):
        print('merr twerk to cum')
        dis.kk.createWindow(QWebEnginePage().WebWindowType())
   
         
        
        
        



#The main window

class daMainWindow(QMainWindow):
    def __init__(this_object):
        super(daMainWindow,this_object).__init__()
        print("damainwindowlives")
        this_object.Da_System_Icon = QIcon( "images/anutechlogo.png")
        #set the icon for the program
        print(this_object.Da_System_Icon)
        
        #this_object.setWindowIcon()
        #set the title for the main window
        this_object.dawindowtitle = "Compax comp c-ver 0.0.1"
        this_object.setWindowTitle(this_object.dawindowtitle)
        #attempt to create a new window widget to centralize on the main window.
        this_object.window1 = DaTerminal()
        #this_object.window1 = QWidget()
        this_object.window1.setStyleSheet("""background: black; """)
        this_object.window1.move(200,200)
        this_object.widlayout = QStackedLayout()
        
        this_object.window1.setLayout(this_object.widlayout)
        
        this_object.setCentralWidget(this_object.window1)
        
        
        #set the diehardz
        
        
        this_object.vboxlayout = QVBoxLayout(this_object)
        
        beraba = QPushButton("click me", this_object)
        
        this_object.vboxlayout.addWidget(beraba)
        
        
        
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
        
        
        #initialize the toolbars
        this_object.initialize_toolbar()
        #start the program
        this_object.initialize_program()
        
        
        
        
    def initialize_program(this_object):
        #set the main window size
        this_object.setGeometry(50,50,800,600)
        this_object.vboxlayout.addWidget(generateHorizontalLayout("plymothrock"))
        #show the main window
        this_object.show()
        #set the programmer workspace window()
        this_object.ide_workspace = Programmer_Workspace()
        #standalone writer
        this_object.da_writer = da_distractfree_writer()
        
    #update title
    def update_title(this_object):
        print(this_object.dawindowtitle)
        
        
        
    def initialize_toolbar(this_object):
       
        
        #set actions
        cut_action = QAction(this_object.Da_System_Icon,"cut",this_object)
        open_code_action = QAction(this_object.Da_System_Icon,"IDE",this_object)
        open_writer_action = QAction(this_object.Da_System_Icon,"standalone writer",this_object)
        open_file_action = QAction(this_object.Da_System_Icon,"open da file",this_object)
        save_file_action = QAction(this_object.Da_System_Icon,"save da file",this_object)
        saveas_file_action = QAction(this_object.Da_System_Icon,"save da file as",this_object)
        print_action = QAction(this_object.Da_System_Icon,"print da file",this_object)
        
        
        #set status tips
        open_code_action.setStatusTip("enter IDE workspace")
        open_writer_action.setStatusTip("distraction-free writers mode")
        print_action.setStatusTip("Print current page out")
        saveas_file_action.setStatusTip("save the fucking file as")
        open_file_action.setStatusTip("open the file")
        save_file_action.setStatusTip("save the file")
        #set triggers (QAction().triggered.connect(function))
        open_code_action.triggered.connect(this_object.set_ide_workspace)
        open_writer_action.triggered.connect(this_object.set_da_distractfree_writer)
        print_action.triggered.connect(this_object.file_print)
        saveas_file_action.triggered.connect(this_object.file_saveas)
        save_file_action.triggered.connect(this_object.file_save)
        open_file_action.triggered.connect(this_object.file_open)
        #add each action to the menu and toolbar respectively
        this_object.workspace_menu.addAction(open_code_action)
        this_object.workspace_toolbar.addAction(open_code_action)
        this_object.workspace_menu.addAction(open_writer_action)
        this_object.workspace_toolbar.addAction(open_writer_action)
        this_object.file_menu.addAction(open_file_action)
        this_object.file_toolbar.addAction(open_file_action)
        this_object.file_menu.addAction(save_file_action)
        this_object.file_menu.addAction(saveas_file_action)
        this_object.file_menu.addAction(print_action)
        this_object.file_toolbar.addAction(save_file_action)
        this_object.file_toolbar.addAction(saveas_file_action)
        this_object.file_toolbar.addAction(print_action)
        
        
        #set the file toolbar
        
        
        
        
    #set the ide workspace to select
    @pyqtSlot()
    def set_ide_workspace(this_object):
        this_object.demka = daHomeBlot()
        this_object.demka.show()
        this_object.term = DaTerminal()
        this_object.term.show()
        #this_object.ide_workspace.show()
        
        
        
        
        
    #set the stand alone writer to sleect
    @pyqtSlot()
    def set_da_distractfree_writer(this_object):
        
        this_object.vboxlayout.addWidget(this_object.da_writer)
        this_object.da_writer.setWindowTitle("da text pad")
        this_object.da_writer.show()
      
        
        
        
    #open file
    @pyqtSlot()
    def file_open(this_object):
        path, _ = QFileDialog.getOpenFileName(this_object,"Open da file","","python skwips (*.py); All Da files(*.*)")
        
        if path:
            try:
                with open(path,'rU') as f:
                    text = f.read()
                    
                    
            except Exception as e:
                this_object.dialog_critical(str(e))
                
                
            else:
                this_object.da_writer.path = path
                this_object.da_writer.setPlainText(text)
                this_object.ide_workspace.textEdit.setPlainText(text)
                this_object.update_title()
                
    #file save 
    @pyqtSlot()           
    def file_save(this_object):
        if this_object.da_writer.path or this_object.ide_workspace.textEdit.path is None:
            return this_object.file_saveas()
        
        
        this_object._save_to_path(this_object.da_writer.path)
        this_object._save_to_path(this_object.ide_workspace.textEdit.path)
        
    #file save as 
    @pyqtSlot()   
    def file_saveas(this_object):
        path, _ = QFileDialog.getSaveFileName(this_object,"save dis file","","python skwips (*.py); All Da files(*.*)")
        
        if not path:
            return
        this_object.da_writer.path = this_object.ide_workspace.textEdit.path = path
        
        this_object._save_to_path(path)
    
    #save to path
    def _save_to_path(this_object,path):
        text = this_object.da_writer.toPlainText()
        text_from_ide = this_object.ide_workspace.textEdit.toPlainText()
        if not path:
            this_object.da_writer.path = this_object.ide_workspace.textEdit.path = path
            plat_path = path
            print("resetting path dto save...")
            print(path)
            
            
        else:
            plat_path = path
            print("path seems to be working. running diagnostics...")
            print(path)
            print(plat_path)
            try:
                with open(plat_path,'w') as f:
                    if text == text_from_ide:
                       
                        f.write(text_from_ide)
                        
                    else:
                        f.write(text_from_ide)
                
                
                
            except Exception as e:
                this_object.dialog_critical(str(e))
            
            
            
            else:
                this_object.da_writer.path = this_object.ide_workspace.textEdit.path = path
                this_object.update_title()
        
        
        
        
        
    #file print
    @pyqtSlot()
    def file_print(this_object):
        d1g = QPrintDialog()
        if d1g.exec_():
            this_object.ide_workspace.textEdit.print_(d1g.printer())
            this_object.da_writer.print_(d1g.printer())
        
#set up the programmer work space
class Programmer_Workspace(QDialog):
    def __init__(dis, *args,**kwargs):
        super(Programmer_Workspace,dis).__init__(*args,**kwargs)
        #create the browser engine
        dis.kk = QWebEngineView()
        #first page to load on creation of the web browser engine
        dis.kk.load(QUrl("https://mgtow.com"))
        
        #set up the interface for the text editor
        dis.textEdit = da_distractfree_writer()
      
        #create the url box
        dis.da_url_box = QTextEdit()
        #set the size of the url box
        dis.da_url_box.setGeometry(1,1,20,2)
        dis.title = 'programming workspace'
        dis.left = 10
        dis.top = 10
        dis.width = 920
        dis.height = 600
        
        dis.initUI()
        
        
    def initUI(dis):
        print('verkka')
        dis.setWindowTitle(dis.title)
        dis.setGeometry(dis.left,dis.top,dis.width,dis.height)
        dis.createHorizontalLayout()
        #set the placeholder for the url link
        dis.da_url_box.setPlaceholderText("https://")
       
        windowLayout = QVBoxLayout()
        windowLayout.addWidget(dis.da_url_box)
        windowLayout.addWidget(dis.horizontalGroupBox)
        dis.browzeloadbutton = QPushButton("load", dis)
        dis.browzeloadbutton.clicked.connect(dis.meme_clinc)
        windowLayout.addWidget(dis.browzeloadbutton)
        dis.setLayout(windowLayout)
      
        dis.da_url_box.setAutoFormatting(QTextEdit.AutoAll)
        
        
        
    def createHorizontalLayout(dis):
        dis.horizontalGroupBox = QGroupBox("the stupid nigga's best text editor")
        layout = QHBoxLayout()
        meme = dis.textEdit
        layout.addWidget(meme)
        mer = QPushButton('rememe',dis)
        mer.clicked.connect(dis.mer_clink)
        layout.addWidget(mer)
        layout.addWidget(dis.kk)
        dis.horizontalGroupBox.setLayout(layout)
        
        
        
    @pyqtSlot()
    def meme_clinc(dis):
        print('aneemeee')
        print(dis.kk)
        dis.kk.load(QUrl(dis.da_url_box.toPlainText()))
        
        
        
        
        
        
    @pyqtSlot()
    def mer_clink(dis):
        print('merr twerk to cum')
        dis.kk.createWindow(QWebEnginePage().WebWindowType())
   
   
   
   
   
   
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
        print("text editor loaded")
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
        
        
        pass
        
        
        
#start of the program
if __name__ == '__main__':
     app = QApplication(sys.argv)
     compax_executable = daMainWindow()
     if compax_executable:
         sys.exit(app.exec_())