TOOLS	=	readself pupunpack unself unpkg sceverify
COMMON	=	tools.o aes.o sha1.o
DEPS	=	Makefile tools.h types.h

CC	=	gcc
CFLAGS	=	-g -O0 -Wall -W
LDFLAGS =	-lz

OBJS	= $(COMMON) $(addsuffix .o, $(TOOLS))

all: $(TOOLS)

$(TOOLS): %: %.o $(COMMON) $(DEPS)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $< $(COMMON) 

$(OBJS): %.o: %.c $(DEPS)
	$(CC) $(CFLAGS) -c -o $@ $<

clean:
	-rm -f $(OBJS)
