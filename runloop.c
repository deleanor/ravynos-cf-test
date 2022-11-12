#include <CoreFoundation/CoreFoundation.h>
#include <stdio.h>

int main(int argc, char* argv[]) {
	CFRunLoopRef runLoop = CFRunLoopGetCurrent();
	CFRunLoopRun();
	return 0;
}
