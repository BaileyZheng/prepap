cmd_ui/browsers/map.o := gcc -Wp,-MD,ui/browsers/.map.o.d -Wp,-MT,ui/browsers/map.o -Wbad-function-cast -Wdeclaration-after-statement -Wformat-security -Wformat-y2k -Winit-self -Wmissing-declarations -Wmissing-prototypes -Wnested-externs -Wno-system-headers -Wold-style-definition -Wpacked -Wredundant-decls -Wshadow -Wstrict-prototypes -Wswitch-default -Wswitch-enum -Wundef -Wwrite-strings -Wformat -Wstrict-aliasing=3 -fno-strict-aliasing -DHAVE_ARCH_X86_64_SUPPORT -Iarch/x86/include/generated -DHAVE_SYSCALL_TABLE_SUPPORT -DHAVE_PERF_REGS_SUPPORT -DHAVE_ARCH_REGS_QUERY_REGISTER_OFFSET -O6 -fno-omit-frame-pointer -ggdb3 -funwind-tables -Wall -Wextra -std=gnu99 -fstack-protector-all -D_FORTIFY_SOURCE=2 -I/home/zbl/prepap/monitoring/linux/tools/perf/util/include -I/home/zbl/prepap/monitoring/linux/tools/perf/arch/x86/include -I/home/zbl/prepap/monitoring/linux/tools/include/uapi -I/home/zbl/prepap/monitoring/linux/tools/include/ -I/home/zbl/prepap/monitoring/linux/tools/arch/x86/include/uapi -I/home/zbl/prepap/monitoring/linux/tools/arch/x86/include/ -I/home/zbl/prepap/monitoring/linux/tools/arch/x86/ -I/home/zbl/prepap/monitoring/linux/tools/perf/util -I/home/zbl/prepap/monitoring/linux/tools/perf -I/home/zbl/prepap/monitoring/linux/tools/lib/ -I/usr/include/python2.7/ -I/home/zbl/temp/papi/src -I/home/zbl/temp/papi/src/testlib /home/zbl/temp/papi/src/testlib/do_loops.o /home/zbl/temp/papi/src/testlib/test_utils.o /home/zbl/temp/papi/src/testlib/dummy.o /home/zbl/temp/papi/src/libpapi.a -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE -DHAVE_SYNC_COMPARE_AND_SWAP_SUPPORT -DHAVE_PTHREAD_ATTR_SETAFFINITY_NP -DHAVE_PTHREAD_BARRIER -DHAVE_EVENTFD -DHAVE_GET_CURRENT_DIR_NAME -DHAVE_DWARF_GETLOCATIONS_SUPPORT -DHAVE_GLIBC_SUPPORT -DHAVE_AIO_SUPPORT -DHAVE_SCHED_GETCPU_SUPPORT -DHAVE_SETNS_SUPPORT -DHAVE_LIBELF_SUPPORT -DHAVE_LIBELF_MMAP_SUPPORT -DHAVE_ELF_GETPHDRNUM_SUPPORT -DHAVE_GELF_GETNOTE_SUPPORT -DHAVE_ELF_GETSHDRSTRNDX_SUPPORT -DHAVE_DWARF_SUPPORT -DHAVE_LIBBPF_SUPPORT -DHAVE_BPF_PROLOGUE -DHAVE_SDT_EVENT -DHAVE_JITDUMP -DHAVE_DWARF_UNWIND_SUPPORT -DNO_LIBUNWIND_DEBUG_FRAME -DHAVE_LIBUNWIND_SUPPORT -DHAVE_LIBCRYPTO_SUPPORT -I/usr/include/slang -DHAVE_SLANG_SUPPORT -DHAVE_GTK2_SUPPORT -DHAVE_LIBPERL_SUPPORT -DHAVE_TIMERFD_SUPPORT -DHAVE_LIBPYTHON_SUPPORT -DHAVE_CPLUS_DEMANGLE_SUPPORT -DHAVE_LIBBFD_SUPPORT -DHAVE_ZLIB_SUPPORT -DHAVE_LZMA_SUPPORT -DHAVE_BACKTRACE_SUPPORT -DHAVE_LIBNUMA_SUPPORT -DHAVE_KVM_STAT_SUPPORT -DHAVE_PERF_READ_VDSO32 -DHAVE_AUXTRACE_SUPPORT -D"BUILD_STR(s)=$(pound)s" -DENABLE_SLFUTURE_CONST -c -o ui/browsers/map.o ui/browsers/map.c

source_ui/browsers/map.o := ui/browsers/map.c

deps_ui/browsers/map.o := \
  /usr/include/stdc-predef.h \
  /usr/include/elf.h \
  /usr/include/features.h \
  /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h \
  /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-64.h \
  /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdint.h \
  /usr/include/stdint.h \
  /usr/include/bits/wchar.h \
  /usr/include/inttypes.h \
  /usr/include/sys/ttydefaults.h \
  /usr/include/string.h \
  /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stddef.h \
  /usr/include/xlocale.h \
  /usr/include/bits/string.h \
  /usr/include/bits/string2.h \
  /usr/include/endian.h \
  /usr/include/bits/endian.h \
  /usr/include/bits/byteswap.h \
  /usr/include/bits/types.h \
  /usr/include/bits/typesizes.h \
  /usr/include/bits/byteswap-16.h \
  /usr/include/stdlib.h \
  /usr/include/bits/string3.h \
  /home/zbl/prepap/monitoring/linux/tools/include/linux/bitops.h \
  /usr/include/asm/types.h \
  /usr/include/asm-generic/types.h \
  /usr/include/asm-generic/int-ll64.h \
  /home/zbl/prepap/monitoring/linux/tools/include/uapi/asm/bitsperlong.h \
  /home/zbl/prepap/monitoring/linux/tools/include/uapi/../../arch/x86/include/uapi/asm/bitsperlong.h \
  /home/zbl/prepap/monitoring/linux/tools/include/uapi/asm-generic/bitsperlong.h \
  /home/zbl/prepap/monitoring/linux/tools/include/linux/bits.h \
  /home/zbl/prepap/monitoring/linux/tools/include/linux/compiler.h \
  /home/zbl/prepap/monitoring/linux/tools/include/linux/compiler-gcc.h \
  /home/zbl/prepap/monitoring/linux/tools/include/linux/types.h \
  /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdbool.h \
  /usr/include/asm/posix_types.h \
  /usr/include/asm/posix_types_64.h \
  /usr/include/asm-generic/posix_types.h \
  /home/zbl/prepap/monitoring/linux/tools/include/asm-generic/bitops.h \
  /home/zbl/prepap/monitoring/linux/tools/include/asm-generic/bitops/__ffs.h \
  /home/zbl/prepap/monitoring/linux/tools/include/asm-generic/bitops/__ffz.h \
  /home/zbl/prepap/monitoring/linux/tools/include/asm-generic/bitops/fls.h \
  /home/zbl/prepap/monitoring/linux/tools/include/asm-generic/bitops/__fls.h \
  /home/zbl/prepap/monitoring/linux/tools/include/asm-generic/bitops/fls64.h \
  /home/zbl/prepap/monitoring/linux/tools/include/asm-generic/bitops/find.h \
  /home/zbl/prepap/monitoring/linux/tools/include/asm-generic/bitops/hweight.h \
  /home/zbl/prepap/monitoring/linux/tools/include/asm-generic/bitops/arch_hweight.h \
  /home/zbl/prepap/monitoring/linux/tools/include/asm-generic/bitops/const_hweight.h \
  /home/zbl/prepap/monitoring/linux/tools/include/asm-generic/bitops/atomic.h \
  /home/zbl/prepap/monitoring/linux/tools/include/asm-generic/bitops/non-atomic.h \
  ui/browsers/../../util/util.h \
  /usr/include/fcntl.h \
  /usr/include/bits/fcntl.h \
  /usr/include/bits/fcntl-linux.h \
  /usr/include/bits/uio.h \
  /usr/include/sys/types.h \
  /usr/include/time.h \
  /usr/include/sys/select.h \
  /usr/include/bits/select.h \
  /usr/include/bits/sigset.h \
  /usr/include/bits/time.h \
  /usr/include/bits/select2.h \
  /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h \
  /usr/include/linux/falloc.h \
  /usr/include/bits/stat.h \
  /usr/include/bits/fcntl2.h \
  /usr/include/bits/waitflags.h \
  /usr/include/bits/waitstatus.h \
  /usr/include/alloca.h \
  /usr/include/bits/stdlib-float.h \
  /usr/include/bits/stdlib.h \
  /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdarg.h \
  ui/browsers/../../util/debug.h \
  ui/browsers/../../util/event.h \
  /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/limits.h \
  /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/syslimits.h \
  /usr/include/limits.h \
  /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h \
  /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h \
  /usr/include/bits/xopen_lim.h \
  /usr/include/bits/stdio_lim.h \
  /usr/include/stdio.h \
  /usr/include/libio.h \
  /usr/include/_G_config.h \
  /usr/include/wchar.h \
  /usr/include/bits/sys_errlist.h \
  /usr/include/bits/stdio.h \
  /usr/include/bits/stdio2.h \
  /home/zbl/prepap/monitoring/linux/tools/include/linux/kernel.h \
  /usr/include/assert.h \
  /usr/include/byteswap.h \
  /home/zbl/prepap/monitoring/linux/tools/include/uapi/linux/bpf.h \
  /home/zbl/prepap/monitoring/linux/tools/include/uapi/linux/bpf_common.h \
  ui/browsers/../../util/../perf.h \
  /usr/include/bits/timex.h \
  /usr/include/linux/stddef.h \
  /home/zbl/prepap/monitoring/linux/tools/include/uapi/linux/perf_event.h \
  /usr/include/linux/ioctl.h \
  /usr/include/asm/ioctl.h \
  /usr/include/asm-generic/ioctl.h \
  /usr/include/asm/byteorder.h \
  /usr/include/linux/byteorder/little_endian.h \
  /usr/include/linux/swab.h \
  /home/zbl/prepap/monitoring/linux/tools/perf/util/include/asm/swab.h \
  ui/browsers/../../util/../perf-sys.h \
  /usr/include/unistd.h \
  /usr/include/bits/posix_opt.h \
  /usr/include/bits/environments.h \
  /usr/include/bits/confname.h \
  /usr/include/getopt.h \
  /usr/include/bits/unistd.h \
  /usr/include/sys/syscall.h \
  /home/zbl/prepap/monitoring/linux/tools/arch/x86/include/uapi/asm/unistd.h \
  /home/zbl/prepap/monitoring/linux/tools/arch/x86/include/asm/unistd_64.h \
  /usr/include/bits/syscall.h \
  /home/zbl/prepap/monitoring/linux/tools/include/asm/barrier.h \
  /home/zbl/prepap/monitoring/linux/tools/include/asm/../../arch/x86/include/asm/barrier.h \
  ui/browsers/../../util/../util/target.h \
  ui/browsers/../../util/build-id.h \
  ui/browsers/../../util/tool.h \
  ui/browsers/../../util/perf_regs.h \
  /home/zbl/prepap/monitoring/linux/tools/perf/arch/x86/include/perf_regs.h \
  /home/zbl/prepap/monitoring/linux/tools/arch/x86/include/uapi/asm/perf_regs.h \
  ui/browsers/../../util/../ui/helpline.h \
  ui/browsers/../../util/../ui/../util/cache.h \
  ui/browsers/../../util/../ui/../util/strbuf.h \
  /home/zbl/prepap/monitoring/linux/tools/lib/subcmd/pager.h \
  ui/browsers/../../util/../ui/../util/../ui/ui.h \
  /usr/include/pthread.h \
  /usr/include/sched.h \
  /usr/include/bits/sched.h \
  /usr/include/bits/setjmp.h \
  /home/zbl/prepap/monitoring/linux/tools/include/linux/string.h \
  ui/browsers/../../util/../ui/progress.h \
  ui/browsers/../../util/../ui/util.h \
  ui/browsers/../../util/map.h \
  /home/zbl/prepap/monitoring/linux/tools/include/linux/refcount.h \
  /home/zbl/prepap/monitoring/linux/tools/include/linux/atomic.h \
  /home/zbl/prepap/monitoring/linux/tools/include/asm/atomic.h \
  /home/zbl/prepap/monitoring/linux/tools/include/asm/../../arch/x86/include/asm/atomic.h \
  /home/zbl/prepap/monitoring/linux/tools/include/asm/../../arch/x86/include/asm/rmwcc.h \
  /home/zbl/prepap/monitoring/linux/tools/arch/x86/include/asm/cmpxchg.h \
  /home/zbl/prepap/monitoring/linux/tools/include/linux/list.h \
  /home/zbl/prepap/monitoring/linux/tools/include/linux/poison.h \
  /home/zbl/prepap/monitoring/linux/tools/include/linux/rbtree.h \
  ui/browsers/../../util/symbol.h \
  ui/browsers/../../util/map_symbol.h \
  ui/browsers/../../util/branch.h \
  ui/browsers/../../util/path.h \
  ui/browsers/../../util/symbol_conf.h \
  /usr/include/libelf.h \
  /usr/include/gelf.h \
  ui/browsers/../../util/dso.h \
  ui/browsers/../../util/rwsem.h \
  ui/browsers/../browser.h \
  ui/browsers/../helpline.h \
  ui/browsers/../keysyms.h \
  ui/browsers/../libslang.h \
  /usr/include/slang/slang.h \
  ui/browsers/map.h \
  /home/zbl/prepap/monitoring/linux/tools/perf/util/sane_ctype.h \

ui/browsers/map.o: $(deps_ui/browsers/map.o)

$(deps_ui/browsers/map.o):
