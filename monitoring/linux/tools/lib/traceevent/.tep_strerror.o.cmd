cmd_tep_strerror.o := gcc -Wp,-MD,./.tep_strerror.o.d -Wp,-MT,tep_strerror.o -g -Wall -fPIC -I. -I /home/zbl/prepap/monitoring/linux/tools/include -D_GNU_SOURCE -D"BUILD_STR(s)=$(pound)s" -c -o tep_strerror.o tep_strerror.c

source_tep_strerror.o := tep_strerror.c

deps_tep_strerror.o := \
  /usr/include/stdc-predef.h \
  /usr/include/string.h \
  /usr/include/features.h \
  /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h \
  /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-64.h \
  /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stddef.h \
  /usr/include/xlocale.h \
  /usr/include/stdio.h \
  /usr/include/bits/types.h \
  /usr/include/bits/typesizes.h \
  /usr/include/libio.h \
  /usr/include/_G_config.h \
  /usr/include/wchar.h \
  /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdarg.h \
  /usr/include/bits/stdio_lim.h \
  /usr/include/bits/sys_errlist.h \
  event-parse.h \
  /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdbool.h \
  /usr/include/regex.h \
  /usr/include/sys/types.h \
  /usr/include/time.h \
  /usr/include/endian.h \
  /usr/include/bits/endian.h \
  /usr/include/bits/byteswap.h \
  /usr/include/bits/byteswap-16.h \
  /usr/include/sys/select.h \
  /usr/include/bits/select.h \
  /usr/include/bits/sigset.h \
  /usr/include/bits/time.h \
  /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h \
  trace-seq.h \

tep_strerror.o: $(deps_tep_strerror.o)

$(deps_tep_strerror.o):
