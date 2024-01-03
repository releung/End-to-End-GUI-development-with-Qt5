QT += testlib
QT -= gui

TARGET = client-tests
TEMPLATE = app

CONFIG += c++14
CONFIG += console
CONFIG -= app_bundle

####################################################################################
# include ����

include(../qmake-destination-path.pri)

####################################################################################
# ͷ�ļ�Ŀ¼��Դ������

INCLUDEPATH += source \
    ../cm-lib/source

SOURCES += source/models/client-tests.cpp \
    source/test-suite.cpp \
    source/main.cpp \
    source/controllers/master-controller-tests.cpp \
    source/data/datetime-decorator-tests.cpp \
    source/data/enumerator-decorator-tests.cpp \
    source/data/int-decorator-tests.cpp \
    source/data/string-decorator-tests.cpp


HEADERS += \
    source/test-suite.h \
    source/controllers/master-controller-tests.h \
    source/data/datetime-decorator-tests.h \
    source/data/enumerator-decorator-tests.h \
    source/data/int-decorator-tests.h \
    source/data/string-decorator-tests.h \
    source/models/client-tests.h

####################################################################################
# ����������

LIBS += -L$$PRO_ROOT/binaries/$$DESTINATION_PATH -lcm-lib

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
