# libmpv

libmpv headers and linking libraries

Linking libraries are only provided for `win32`, and `win32-x64` will be added. For other operating systems, use `pkg-config` and system-wide libmpv


## VERSION

The `.lib` files for Windows are updated from those builds:

https://mpv.srsfckn.biz/mpv-dev-20170212.7z


## Windows - how to generate `mpv.lib`

This `mpv.lib` for Windows was generated using the instructions on [MPV's wiki](https://github.com/mpv-player/mpv/blob/master/DOCS/compile-windows.md#linking-libmpv-with-msvc-programs) from the [srsfckn MPV windows builds](https://mpv.srsfckn.biz) Dev package. 


### x86

```
CALL "C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\vcvarsall.bat" x86
lib /def:mpv.def /name:mpv-1.dll /out:mpv.lib /MACHINE:X86
```

### x64

```
CALL "C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\vcvarsall.bat" x64
lib /def:mpv.def /name:mpv-1.dll /out:mpv.lib /MACHINE:X64
```



## Mac

The files in `lib/` are taken from the brew build of `libmpv`, 0.24.0 version in particular. The reason to use particular dylibs commited to the repo is to ensure we have consistency, since we take the include files from here either way.

It also ensures we have a consistency in versions (0.24.0) 

### Fix `rpath` if you copy files

When you copy files from system deps, you can do something like that to fix `rpath` 

```
find $1/*.dylib | while read LINE
do
    otool -l "$LINE" | grep "name " | grep "/usr/local/Cellar" | cut -d " " -f11 | while read LIB
    do
                echo "$LINE -> $LIB"
        install_name_tool -change "$LIB" "@executable_path/../Frameworks/$(basename $LIB)" $LINE
    done
done
```
