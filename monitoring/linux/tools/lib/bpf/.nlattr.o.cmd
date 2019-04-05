cmd_nlattr.o := gcc -Wp,-MD,./.nlattr.o.d -Wp,-MT,nlattr.o -g -Wall -DHAVE_LIBELF_MMAP_SUPPORT -DCOMPAT_NEED_REALLOCARRAY -Wbad-function-cast -Wdeclaration-after-statement -Wformat-security -Wformat-y2k -Winit-self -Wmissing-declarations -Wmissing-prototypes -Wnested-externs -Wno-system-headers -Wold-style-definition -Wpacked -Wredundant-decls -Wshadow -Wstrict-prototypes -Wswitch-default -Wswitch-enum -Wundef -Wwrite-strings -Wformat -Wstrict-aliasing=3 -fno-strict-aliasing -Werror -Wall -fPIC -I. -I/home/zbl/prepap/monitoring/linux/tools/include -I/home/zbl/prepap/monitoring/linux/tools/arch/x86/include/uapi -I/home/zbl/prepap/monitoring/linux/tools/include/uapi -fvisibility=hidden -D"BUILD_STR(s)=$(pound)s" -c -o nlattr.o nlattr.c

source_nlattr.o := nlattr.c

deps_nlattr.o := \
  /usr/include/stdc-predef.h \
  /usr/include/errno.h \
  /usr/include/features.h \
  /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h \
  /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-64.h \
  /usr/include/bits/errno.h \
  /usr/include/linux/errno.h \
  /home/zbl/prepap/monitoring/linux/tools/arch/x86/include/uapi/asm/errno.h \
  /home/zbl/prepap/monitoring/linux/tools/include/uapi/asm-generic/errno.h \
  /home/zbl/prepap/monitoring/linux/tools/include/uapi/asm-generic/errno-base.h \
  nlattr.h \
  /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdint.h \
  /usr/include/stdint.h \
  /usr/include/bits/wchar.h \
  /home/zbl/prepap/monitoring/linux/tools/include/uapi/linux/netlink.h \
  /home/zbl/prepap/monitoring/linux/tools/include/linux/kernel.h \
  /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdarg.h \
  /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stddef.h \
  /usr/include/assert.h \
  /home/zbl/prepap/monitoring/linux/tools/include/linux/compiler.h \
  /home/zbl/prepap/monitoring/linux/tools/include/linux/compiler-gcc.h \
  /home/zbl/prepap/monitoring/linux/tools/include/linux/types.h \
  /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdbool.h \
  /usr/include/asm/types.h \
  /usr/include/asm-generic/types.h \
  /usr/include/asm-generic/int-ll64.h \
  /home/zbl/prepap/monitoring/linux/tools/arch/x86/include/uapi/asm/bitsperlong.h \
  /home/zbl/prepap/monitoring/linux/tools/include/asm-generic/bitsperlong.h \
  /home/zbl/prepap/monitoring/linux/tools/include/uapi/asm-generic/bitsperlong.h \
  /usr/include/asm/posix_types.h \
  /usr/include/asm/posix_types_64.h \
  /usr/include/asm-generic/posix_types.h \
  /usr/include/endian.h \
  /usr/include/bits/endian.h \
  /usr/include/bits/byteswap.h \
  /usr/include/bits/types.h \
  /usr/include/bits/typesizes.h \
  /usr/include/bits/byteswap-16.h \
  /usr/include/byteswap.h \
  /usr/include/linux/socket.h \
  /usr/include/linux/rtnetlink.h \
  /home/zbl/prepap/monitoring/linux/tools/include/uapi/linux/if_link.h \
  /usr/include/linux/if_addr.h \
  /usr/include/linux/neighbour.h \
  /usr/include/string.h \
  /usr/include/xlocale.h \
  /usr/include/stdio.h \
  /usr/include/libio.h \
  /usr/include/_G_config.h \
  /usr/include/wchar.h \
  /usr/include/bits/stdio_lim.h \
  /usr/include/bits/sys_errlist.h \

nlattr.o: $(deps_nlattr.o)

$(deps_nlattr.o):
