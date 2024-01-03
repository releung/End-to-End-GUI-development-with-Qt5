QT += qml quick xml

TEMPLATE = app

CONFIG += c++14

####################################################################################
# include ����

include(../qmake-destination-path.pri)

####################################################################################
# ͷ�ļ�Ŀ¼��Դ������

INCLUDEPATH += source \
    ../cm-lib/source

SOURCES += source/main.cpp

RESOURCES += views.qrc \
    assets.qrc \
    components.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH = $$PWD

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
OBJECTS_DIR = $$PRO_ROOT/build/$$DESTINATION_PATH/$$CURRENT_DIR_NAME/.obj
MOC_DIR = $$PRO_ROOT/build/$$DESTINATION_PATH/$$CURRENT_DIR_NAME/.moc
RCC_DIR = $$PRO_ROOT/build/$$DESTINATION_PATH/$$CURRENT_DIR_NAME/.qrc
UI_DIR = $$PRO_ROOT/build/$$DESTINATION_PATH/$$CURRENT_DIR_NAME/.ui
