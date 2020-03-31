HEADERS += $$PWD/chroma.h
SOURCES += $$PWD/chroma.cpp

INCLUDEPATH += $$PWD/ChromaSDK/inc
INCLUDEPATH += $$PWD

win32 {
    msvc:LIBS += user32.lib
    gcc:LIBS += -luser32
}
