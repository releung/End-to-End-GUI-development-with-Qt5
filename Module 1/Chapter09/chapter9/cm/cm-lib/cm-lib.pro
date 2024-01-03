QT += sql network xml
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
    source/controllers/master-controller.cpp \
    source/framework/command.cpp \
    source/controllers/command-controller.cpp \
    source/data/data-decorator.cpp \
    source/data/string-decorator.cpp \
    source/data/int-decorator.cpp \
    source/data/datetime-decorator.cpp \
    source/data/enumerator-decorator.cpp \
    source/data/entity.cpp \
    source/models/address.cpp \
    source/models/appointment.cpp \
    source/models/contact.cpp \
    source/controllers/database-controller.cpp \
    source/models/client-search.cpp \
    source/networking/network-access-manager.cpp \
    source/networking/web-request.cpp \
    source/utilities/xml-helper.cpp \
    source/rss/rss-channel.cpp \
    source/rss/rss-image.cpp \
    source/rss/rss-item.cpp \
    source/framework/object-factory.cpp \
    source/data/dropdown-value.cpp \
    source/data/dropdown.cpp

HEADERS += source/cm-lib_global.h \
    source/models/client.h \
    source/controllers/master-controller.h \
    source/controllers/navigation-controller.h \
    source/framework/command.h \
    source/controllers/command-controller.h \
    source/data/data-decorator.h \
    source/data/string-decorator.h \
    source/data/int-decorator.h \
    source/data/datetime-decorator.h \
    source/data/enumerator-decorator.h \
    source/data/entity.h \
    source/data/entity-collection.h \
    source/models/address.h \
    source/models/appointment.h \
    source/models/contact.h \
    source/controllers/i-database-controller.h \
    source/controllers/database-controller.h \
    source/models/client-search.h \
    source/networking/i-network-access-manager.h \
    source/networking/network-access-manager.h \
    source/networking/i-web-request.h \
    source/networking/web-request.h \
    source/utilities/xml-helper.h \
    source/rss/rss-channel.h \
    source/rss/rss-image.h \
    source/rss/rss-item.h \
    source/framework/i-object-factory.h \
    source/controllers/i-command-controller.h \
    source/controllers/i-navigation-controller.h \
    source/framework/object-factory.h \
    source/data/dropdown-value.h \
    source/data/dropdown.h

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