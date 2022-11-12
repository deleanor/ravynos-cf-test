runloop: runloop.m
	clang -g -O0 -D__APPLE__ -fblocks -F /System/Library/Frameworks -framework CoreFoundation runloop.m -o runloop

clean:
	rm runloop
