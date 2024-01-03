[TOC]



# pri pro 说明

可执行文件和库的 `.pro` 中：

```
####################################################################################
# include 设置

include(../qmake-destination-path.pri)


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


定义了编译输出目录是项目根目录的 binaries 和 build 文件夹下.
```

```
qmake-destination-path.pri 会 include:
	include(./qmake-target-platform.pri)
之后, qmake-target-platform.pri 会 include:
	include(./root-config.pri)

```

## e.g.

exe:

```
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

RESOURCES += views.qrc

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

```

lib:

```
QT -= gui

TARGET = cm-lib
TEMPLATE = lib

CONFIG += c++14

DEFINES += CMLIB_LIBRARY

####################################################################################
# include 设置

include(../qmake-destination-path.pri)

####################################################################################
# 头文件目录和源码设置

INCLUDEPATH += source

SOURCES += source/models/client.cpp \
    source/controllers/master-controller.cpp

HEADERS += source/cm-lib_global.h \
    source/models/client.h \
    source/controllers/master-controller.h

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

```

















