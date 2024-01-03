QT += testlib network
QT -= gui

TARGET = client-tests
TEMPLATE = app

CONFIG += c++14
CONFIG += console
CONFIG -= app_bundle

####################################################################################
# include 设置

include(../qmake-destination-path.pri)

####################################################################################
# 头文件目录和源码设置

INCLUDEPATH += source \
    ../cm-lib/source \
    source/controllers/

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
    source/models/client-tests.h \
    source/mocks/mock-object-factory.h

####################################################################################
# 依赖库设置

LIBS += -L$$PRO_ROOT/binaries/$$DESTINATION_PATH -lcm-lib

####################################################################################
# 编译输出设置

# 获取当前目录的完整路径
# 使用 '/' 分割路径，创建一个路径部分的列表
# 获取列表的最后一个元素（即当前目录的名称）
CURRENT_DIR_PATH = $$PWD
DIRS = $$split(CURRENT_DIR_PATH, /)
CURRENT_DIR_NAME = $$member(DIRS, -1)

message("Current directory name: " $$CURRENT_DIR_NAME)

# 为了防止重名, 可以在 $$DESTINATION_PATH 前面增加对应的目录结构
DESTDIR = $$PRO_ROOT/binaries/$$DESTINATION_PATH
OBJECTS_DIR = $$PRO_ROOT/build/$$DESTINATION_PATH/.obj
MOC_DIR = $$PRO_ROOT/build/$$DESTINATION_PATH/$$CURRENT_DIR_NAME/.moc
RCC_DIR = $$PRO_ROOT/build/$$DESTINATION_PATH/$$CURRENT_DIR_NAME/.qrc
UI_DIR = $$PRO_ROOT/build/$$DESTINATION_PATH/$$CURRENT_DIR_NAME/.ui
