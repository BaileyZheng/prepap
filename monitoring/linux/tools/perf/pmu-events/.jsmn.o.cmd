cmd_pmu-events/jsmn.o := gcc -Wp,-MD,pmu-events/.jsmn.o.d -Wp,-MT,pmu-events/jsmn.o  -D"BUILD_STR(s)=$(pound)s"   -c -o pmu-events/jsmn.o pmu-events/jsmn.c

source_pmu-events/jsmn.o := pmu-events/jsmn.c

deps_pmu-events/jsmn.o := \
  /usr/include/stdc-predef.h \
  /usr/include/stdlib.h \
  /usr/include/features.h \
  /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h \
  /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-64.h \
  /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stddef.h \
  /usr/include/bits/waitflags.h \
  /usr/include/bits/waitstatus.h \
  /usr/include/endian.h \
  /usr/include/bits/endian.h \
  /usr/include/bits/byteswap.h \
  /usr/include/bits/types.h \
  /usr/include/bits/typesizes.h \
  /usr/include/bits/byteswap-16.h \
  /usr/include/sys/types.h \
  /usr/include/time.h \
  /usr/include/sys/select.h \
  /usr/include/bits/select.h \
  /usr/include/bits/sigset.h \
  /usr/include/bits/time.h \
  /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h \
  /usr/include/alloca.h \
  /usr/include/bits/stdlib-float.h \
  pmu-events/jsmn.h \

pmu-events/jsmn.o: $(deps_pmu-events/jsmn.o)

$(deps_pmu-events/jsmn.o):
