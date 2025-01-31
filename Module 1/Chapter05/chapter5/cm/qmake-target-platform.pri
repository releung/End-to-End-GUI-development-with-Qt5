include(./root-config.pri)

win32 {
    CONFIG += PLATFORM_WIN
    message(PLATFORM_WIN)

    win32-g++ {
        CONFIG += COMPILER_GCC
        message(COMPILER_GCC)
        QMAKE_TARGET.arch = x86  # 为 32 位 GCC 编译器指定 x86 架构
    }

    win32-g++-64 {
        CONFIG += COMPILER_GCC
        message(COMPILER_GCC)
        QMAKE_TARGET.arch = x86_64  # 为 64 位 GCC 编译器指定 x86_64 架构
    }

    win32-msvc2017 {
        CONFIG += COMPILER_MSVC2017
        message(COMPILER_MSVC2017)
        QMAKE_TARGET.arch = x86  # 为 MSVC2017 32 位编译器指定 x86 架构
    }

    win32-msvc2017-64 {
        CONFIG += COMPILER_MSVC2017
        message(COMPILER_MSVC2017)
        QMAKE_TARGET.arch = x86_64  # 为 MSVC2017 64 位编译器指定 x86_64 架构
    }
}


linux {
    CONFIG += PLATFORM_LINUX
    message(PLATFORM_LINUX)
    # Make QMAKE_TARGET arch available for Linux
    !contains(QT_ARCH, x86_64){
        QMAKE_TARGET.arch = x86
    } else {
        QMAKE_TARGET.arch = x86_64
    }
    linux-g++{
        CONFIG += COMPILER_GCC
        message(COMPILER_GCC)
    }
}

macx {
    CONFIG += PLATFORM_OSX
    message(PLATFORM_OSX)
    macx-clang {
        CONFIG += COMPILER_CLANG
        message(COMPILER_CLANG)
        QMAKE_TARGET.arch = x86_64
    }
    macx-clang-32{
        CONFIG += COMPILER_CLANG
        message(COMPILER_CLANG)
        QMAKE_TARGET.arch = x86
    }
}

contains(QMAKE_TARGET.arch, x86_64) {
    CONFIG += PROCESSOR_x64
    message(PROCESSOR_x64)
} else {
    CONFIG += PROCESSOR_x86
    message(PROCESSOR_x86)
}

CONFIG(debug, release|debug) {
    CONFIG += BUILD_DEBUG
    message(BUILD_DEBUG)
} else {
    CONFIG += BUILD_RELEASE
    message(BUILD_RELEASE)
}
