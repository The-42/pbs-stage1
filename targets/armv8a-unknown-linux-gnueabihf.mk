arch = arm
variant = v8a
cpu = unknown
os = linux
libc = gnu
abi = eabi
fp = hard

target := $(arch)$(variant)-$(cpu)-$(os)-$(libc)$(abi)hf
