cmd_event-parse.o := gcc -Wp,-MD,./.event-parse.o.d -Wp,-MT,event-parse.o -g -Wall -fPIC -I. -I /home/zbl/prepap/monitoring/linux/tools/include -D_GNU_SOURCE -D"BUILD_STR(s)=$(pound)s" -c -o event-parse.o event-parse.c

source_event-parse.o := event-parse.c

deps_event-parse.o := \
  /usr/include/stdc-predef.h \
  /usr/include/inttypes.h \
  /usr/include/features.h \
  /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h \
  /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-64.h \
  /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdint.h \
  /usr/include/stdint.h \
  /usr/include/bits/wchar.h \
  /usr/include/stdio.h \
  /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stddef.h \
  /usr/include/bits/types.h \
  /usr/include/bits/typesizes.h \
  /usr/include/libio.h \
  /usr/include/_G_config.h \
  /usr/include/wchar.h \
  /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdarg.h \
  /usr/include/bits/stdio_lim.h \
  /usr/include/bits/sys_errlist.h \
  /usr/include/stdlib.h \
  /usr/include/bits/waitflags.h \
  /usr/include/bits/waitstatus.h \
  /usr/include/endian.h \
  /usr/include/bits/endian.h \
  /usr/include/bits/byteswap.h \
  /usr/include/bits/byteswap-16.h \
  /usr/include/xlocale.h \
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
  /usr/include/string.h \
  /usr/include/ctype.h \
  /usr/include/errno.h \
  /usr/include/bits/errno.h \
  /usr/include/linux/errno.h \
  /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h \
  /usr/include/asm-generic/errno-base.h \
  /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/limits.h \
  /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/syslimits.h \
  /usr/include/limits.h \
  /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h \
  /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h \
  /usr/include/bits/xopen_lim.h \
  /home/zbl/prepap/monitoring/linux/tools/include/linux/time64.h \
  /usr/include/netinet/in.h \
  /usr/include/sys/socket.h \
  /usr/include/sys/uio.h \
  /usr/include/bits/uio.h \
  /usr/include/bits/socket.h \
  /usr/include/bits/socket_type.h \
  /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h \
  /usr/include/asm-generic/socket.h \
  /usr/include/asm/sockios.h \
  /usr/include/asm-generic/sockios.h \
  /usr/include/bits/in.h \
  event-parse.h \
  /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdbool.h \
  /usr/include/regex.h \
  trace-seq.h \
  event-parse-local.h \
  event-utils.h \

event-parse.o: $(deps_event-parse.o)

$(deps_event-parse.o):
