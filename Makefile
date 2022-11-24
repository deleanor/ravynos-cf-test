CC=clang
CFLAGS=-g -O0 -D__APPLE__ -DDEBUG -fblocks -F /System/Library/Frameworks -framework CoreFoundation -fobjc-arc


all: runloop preferences bridging

runloop: runloop.m
	${CC} ${CFLAGS}  runloop.m -o runloop

preferences: preferences.m
	${CC} ${CFLAGS} preferences.m -o preferences

bridging: bridging.m
	${CC} ${CFLAGS} bridging.m -o bridging

clean:
	rm -rf runloop preferences bridging
