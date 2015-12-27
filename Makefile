all: boxplorer.exe shadershrink.exe edit-cfg.exe glsl.exe

CFLAGS=/nologo /I. /IAntTweakBar/include /IAntTweakBar/src /MD /D_CONSOLE /DWIN32 /Gm- /EHsc /GS /Gd /W3 /WX- /Ox /DTW_NO_LIB_PRAGMA /DTW_STATIC
LDFLAGS=/link /LIBPATH:FMOD /SUBSYSTEM:console /nologo

TW_OBJS=TwBar.obj TwFonts.obj TwMgr.obj TwColors.obj TwOpenGL.obj \
        TwPrecomp.obj LoadOGL.obj TwEventWin.obj \
	TwEventSDL.obj TwEventSDL12.obj TwEventSDL13.obj

boxplorer.exe: boxplorer.cc default_shaders.h shader_procs.h TGA.h Makefile.win32 $(TW_OBJS) \
               cfgs\menger.cfg.data\fragment.glsl
	cl -c $(CFLAGS) boxplorer.cc
	link $(LDFLAGS) boxplorer.obj  $(TW_OBJS)

shadershrink.exe: shadershrink.cc Makefile.win32
	cl $(CFLAGS) shadershrink.cc $(LDFLAGS)

glsl.exe: glsl.cc TGA.h glsl.h Makefile.win32 cfgs\menger.cfg.data\fragment.glsl
        cl $(CFLAGS) glsl.cc $(LDFLAGS)

edit-cfg.exe: edit-cfg.cc Makefile.win32
	cl $(CFLAGS) edit-cfg.cc $(LDFLAGS)

TwBar.obj: AntTweakBar\src\TwBar.cpp
	cl -c $(CFLAGS) $**

TwMgr.obj: AntTweakBar\src\TwMgr.cpp
	cl -c $(CFLAGS) $**

TwColors.obj: AntTweakBar\src\TwColors.cpp
	cl -c $(CFLAGS) $**

TwFonts.obj: AntTweakBar\src\TwFonts.cpp
	cl -c $(CFLAGS) $**

TwEventSDL.obj: AntTweakBar\src\TwEventSDL.c
	cl -c $(CFLAGS) $**

TwEventSDL12.obj: AntTweakBar\src\TwEventSDL12.c
	cl -c $(CFLAGS) $**

TwEventSDL13.obj: AntTweakBar\src\TwEventSDL13.c
	cl -c $(CFLAGS) $**

TwOpenGL.obj: AntTweakBar\src\TwOpenGL.cpp
	cl -c $(CFLAGS) $**

TwPrecomp.obj: AntTweakBar\src\TwPrecomp.cpp
	cl -c $(CFLAGS) $**

LoadOGL.obj: AntTweakBar\src\LoadOGL.cpp
	cl -c $(CFLAGS) $**

TwEventWin.obj: AntTweakBar\src\TwEventWin.c
	cl -c $(CFLAGS) $**
