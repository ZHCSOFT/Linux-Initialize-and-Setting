Sometimes we should use additional utilties of PortAudio via `libportaudio.so.2` shared library file for C++ projects, like

`portaudio/src/commom/pa_util.h`
```
PaUtil_AllocateMemory
PaUtil_FreeMemory
```
`portaudio/src/commom/pa_ringbuffer.h`
```
PaUtilRingBuffer
PaUtil_AdvanceRingBufferWriteIndex
```

But when we install portaudio by package manager or compile from source code, including these headers encounters `ld undefined reference PaUtil_***` issue on building process

We can fix this problem using some trick described below

## Clone PortAudio repository
```
git clone https://github.com/PortAudio/portaudio.git
```

## Edit files in source code directory

Add 2 lines to `add_library(PortAudio` of `portaudio/CMakeLists.txt`
```
add_library(PortAudio
  src/common/pa_allocation.c
  src/common/pa_allocation.h
  src/common/pa_converters.c
  src/common/pa_converters.h
  src/common/pa_cpuload.c
  src/common/pa_cpuload.h
  src/common/pa_debugprint.c
  src/common/pa_debugprint.h
  src/common/pa_dither.c
  src/common/pa_dither.h
  src/common/pa_endianness.h
  src/common/pa_front.c
  src/common/pa_hostapi.h
  src/common/pa_memorybarrier.h
  src/common/pa_process.c
  src/common/pa_process.h
  src/common/pa_stream.c
  src/common/pa_stream.h
  src/common/pa_trace.c
  src/common/pa_trace.h
  src/common/pa_types.h
  src/common/pa_ringbuffer.c
  src/common/pa_ringbuffer.h
  src/common/pa_util.h
)
```

Add 2 lines to `set(PORTAUDIO_PUBLIC_HEADERS` of `portaudio/CMakeLists.txt`
```
set(PORTAUDIO_PUBLIC_HEADERS 
  include/portaudio.h
  src/common/pa_ringbuffer.h
  src/common/pa_util.h
)
```

Add 2 lines to `for include in $(INCLUDES); do \` of `portaudio/Makefile.in`
```
  for include in $(INCLUDES); do \
		$(INSTALL_DATA) -m 644 $(top_srcdir)/include/$$include $(DESTDIR)$(includedir)/$$include; \
	done
	$(INSTALL_DATA) -m 644 $(top_srcdir)/src/common/pa_ringbuffer.h $(DESTDIR)$(includedir)/$$include
	$(INSTALL_DATA) -m 644 $(top_srcdir)/src/common/pa_util.h $(DESTDIR)$(includedir)/$$include
```

## Configure, make, install and verify configuration
```
./configure --prefix=YOURBUILDFILE
make --jobs=$(nproc --all)
make install
```
Check whether references are exposed on shared library
```
nm -D YOURBUILDFILE/lib/libportaudio.so.2 | grep PaUtil
```
