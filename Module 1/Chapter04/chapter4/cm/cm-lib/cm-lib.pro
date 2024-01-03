QT -= gui

TARGET = cm-lib
TEMPLATE = lib

CONFIG += c++14

DEFINES += CMLIB_LIBRARY

####################################################################################
# include ����

include(../qmake-destination-path.pri)

####################################################################################
# ͷ�ļ�Ŀ¼��Դ������

INCLUDEPATH += source

SOURCES += source/models/client.cpp \
    source/controllers/master-controller.cpp \
    source/framework/command.cpp \
    source/controllers/command-controller.cpp

HEADERS += source/cm-lib_global.h \
    source/models/client.h \
    source/controllers/master-controller.h \
    source/controllers/navigation-controller.h \
    source/framework/command.h \

####################################################################################
# �����������

# ��ȡ��ǰĿ¼������·��
# ʹ�� '/' �ָ�·��������һ��·�����ֵ��б�
# ��ȡ�б�����һ��Ԫ�أ�����ǰĿ¼�����ƣ�
CURRENT_DIR_PATH = $$PWD
DIRS = $$split(CURRENT_DIR_PATH, /)
CURRENT_DIR_NAME = $$member(DIRS, -1)

message("Current directory name: " $$CURRENT_DIR_NAME)

# Ϊ�˷�ֹ����, ������ $$DESTINATION_PATH ǰ�����Ӷ�Ӧ��Ŀ¼�ṹ
DESTDIR = $$PRO_ROOT/binaries/$$DESTINATION_PATH
OBJECTS_DIR = $$PRO_ROOT/build/$$DESTINATION_PATH/.obj
MOC_DIR = $$PRO_ROOT/build/$$DESTINATION_PATH/$$CURRENT_DIR_NAME/.moc
RCC_DIR = $$PRO_ROOT/build/$$DESTINATION_PATH/$$CURRENT_DIR_NAME/.qrc
UI_DIR = $$PRO_ROOT/build/$$DESTINATION_PATH/$$CURRENT_DIR_NAME/.ui

