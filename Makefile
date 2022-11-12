
all: runloop preferences

runloop: runloop.m
	clang -g -O0 -D__APPLE__ -fblocks -F /System/Library/Frameworks -framework CoreFoundation runloop.m -o runloop

preferences: preferences.m
	clang -g -O0 -D__APPLE__ -fblocks -F /System/Library/Frameworks -framework CoreFoundation preferences.m -o preferences

clean:
	rm runloop
