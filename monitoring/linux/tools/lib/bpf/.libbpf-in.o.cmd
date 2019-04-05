cmd_libbpf-in.o :=  ld   -r -o libbpf-in.o  libbpf.o bpf.o nlattr.o btf.o libbpf_errno.o str_error.o netlink.o bpf_prog_linfo.o libbpf_probes.o xsk.o
