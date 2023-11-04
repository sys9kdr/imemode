CFLAGS=-O3 -Wall -Wextra -Werror -flto
LDFLAGS=-Wl,--as-needed -Wl,-O1 -Wl,--sort-common -Wl,--no-undefined -Wl,--strip-all
LDLIBS=-limm32 -luser32

imemode.exe: imemode.o
	$(CC) $(LDFLAGS) -o $@ $^ $(LDLIBS)

imemode.o: imemode.c
	$(CC) $(CFLAGS) -c -o $@ $^

.PHONY: clean

clean:
	rm -f imemode.exe imemode.o
