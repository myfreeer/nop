CC ?= gcc
CFLAGS += -Wall -Wextra -lkernel32 -O3 -Os -s \
	-nostartfiles -nostdlib -nodefaultlibs -mwindows \
	-fmerge-all-constants -fno-asynchronous-unwind-tables \
	-Wl,--gc-sections -Wl,--build-id=none

EXTRA_CFLAGS = -fno-ident -fno-stack-protector -fomit-frame-pointer \
	-fno-unwind-tables -falign-functions=1 -falign-jumps=1 -falign-loops=1 \
	-ffunction-sections -fdata-sections  -fno-math-errno

all: nop.exe

clean:
	-@rm -f *.exe *.o

%.exe: %.c
	$(CC) $< -o $@ $(CFLAGS) $(EXTRA_CFLAGS)

.PHONY: clean
.SILENT: clean