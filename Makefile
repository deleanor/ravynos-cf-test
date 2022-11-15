CC=clang
CFLAGS=-g -O0 -D__APPLE__ -DDEBUG -fblocks -F /System/Library/Frameworks -framework CoreFoundation -fobjc-arc


all: runloop preferences

runloop: runloop.m
	${CC} ${CFLAGS}  runloop.m -o runloop

preferences: preferences.m
	${CC} ${CFLAGS} preferences.m -o preferences

clean:
	rm -rf runloop preferences
