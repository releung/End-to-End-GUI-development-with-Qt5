QT += qml quick

TEMPLATE = app

CONFIG += c++14

####################################################################################
# include 设置

include(../qmake-destination-path.pri)

####################################################################################
# 头文件目录和源码设置

INCLUDEPATH += source \
    ../cm-lib/source

SOURCES += source/main.cpp

RESOURCES += views.qrc \
    assets.qrc \
    components.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH = $$PWD

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
OBJECTS_DIR = $$PRO_ROOT/build/$$DESTINATION_PATH/$$CURRENT_DIR_NAME/.obj
MOC_DIR = $$PRO_ROOT/build/$$DESTINATION_PATH/$$CURRENT_DIR_NAME/.moc
RCC_DIR = $$PRO_ROOT/build/$$DESTINATION_PATH/$$CURRENT_DIR_NAME/.qrc
UI_DIR = $$PRO_ROOT/build/$$DESTINATION_PATH/$$CURRENT_DIR_NAME/.ui
