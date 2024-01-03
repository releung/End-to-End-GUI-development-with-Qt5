TEMPLATE = subdirs

SUBDIRS += \
    cm-ui \
    cm-lib \
#    cm-tests # compile error!!!

message(cm project dir: $${PWD})
