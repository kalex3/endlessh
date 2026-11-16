.POSIX:
CC       = cc
CFLAGS   = -std=c99 -Wall -Wextra -Wno-missing-field-initializers -Os -static
LDFLAGS  = -s
PREFIX   = /usr/local

all: endlessh

endlessh: endlessh.c
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ endlessh.c

install: endlessh
	install -d $(DESTDIR)$(PREFIX)/bin
	install -m 755 endlessh $(DESTDIR)$(PREFIX)/bin/
	install -d $(DESTDIR)$(PREFIX)/share/man/man1
	install -m 644 endlessh.1 $(DESTDIR)$(PREFIX)/share/man/man1/

clean:
	rm -rf endlessh
