cmd_btf.o := gcc -Wp,-MD,./.btf.o.d -Wp,-MT,btf.o -g -Wall -DHAVE_LIBELF_MMAP_SUPPORT -DCOMPAT_NEED_REALLOCARRAY -Wbad-function-cast -Wdeclaration-after-statement -Wformat-security -Wformat-y2k -Winit-self -Wmissing-declarations -Wmissing-prototypes -Wnested-externs -Wno-system-headers -Wold-style-definition -Wpacked -Wredundant-decls -Wshadow -Wstrict-prototypes -Wswitch-default -Wswitch-enum -Wundef -Wwrite-strings -Wformat -Wstrict-aliasing=3 -fno-strict-aliasing -Werror -Wall -fPIC -I. -I/home/zbl/prepap/monitoring/linux/tools/include -I/home/zbl/prepap/monitoring/linux/tools/arch/x86/include/uapi -I/home/zbl/prepap/monitoring/linux/tools/include/uapi -fvisibility=hidden -D"BUILD_STR(s)=$(pound)s" -c -o btf.o btf.c

source_btf.o := btf.c

deps_btf.o := \
  /usr/include/stdc-predef.h \
  /usr/include/stdio.h \
  /usr/include/features.h \
  /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h \
  /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-64.h \
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
  /usr/include/xlocale.h \
  /usr/include/unistd.h \
  /usr/include/bits/posix_opt.h \
  /usr/include/bits/environments.h \
  /usr/include/bits/confname.h \
  /usr/include/getopt.h \
  /usr/include/errno.h \
  /usr/include/bits/errno.h \
  /usr/include/linux/errno.h \
  /home/zbl/prepap/monitoring/linux/tools/arch/x86/include/uapi/asm/errno.h \
  /home/zbl/prepap/monitoring/linux/tools/include/uapi/asm-generic/errno.h \
  /home/zbl/prepap/monitoring/linux/tools/include/uapi/asm-generic/errno-base.h \
  /home/zbl/prepap/monitoring/linux/tools/include/linux/err.h \
  /home/zbl/prepap/monitoring/linux/tools/include/linux/compiler.h \
  /home/zbl/prepap/monitoring/linux/tools/include/linux/compiler-gcc.h \
  /home/zbl/prepap/monitoring/linux/tools/include/linux/types.h \
  /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdbool.h \
  /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdint.h \
  /usr/include/stdint.h \
  /usr/include/bits/wchar.h \
  /usr/include/asm/types.h \
  /usr/include/asm-generic/types.h \
  /usr/include/asm-generic/int-ll64.h \
  /home/zbl/prepap/monitoring/linux/tools/arch/x86/include/uapi/asm/bitsperlong.h \
  /home/zbl/prepap/monitoring/linux/tools/include/asm-generic/bitsperlong.h \
  /home/zbl/prepap/monitoring/linux/tools/include/uapi/asm-generic/bitsperlong.h \
  /usr/include/asm/posix_types.h \
  /usr/include/asm/posix_types_64.h \
  /usr/include/asm-generic/posix_types.h \
  /home/zbl/prepap/monitoring/linux/tools/include/uapi/linux/btf.h \
  btf.h \
  bpf.h \
  /home/zbl/prepap/monitoring/linux/tools/include/uapi/linux/bpf.h \
  /home/zbl/prepap/monitoring/linux/tools/include/uapi/linux/bpf_common.h \
  libbpf.h \
  libbpf_util.h \

btf.o: $(deps_btf.o)

$(deps_btf.o):
