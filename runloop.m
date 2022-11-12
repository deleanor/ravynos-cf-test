#import <CoreFoundation/CoreFoundation.h>

#include <stdio.h>

static void callback(CFRunLoopTimerRef timer, void *info) {
	int *value = (int *)info;
	*value += 1;
	printf("%d\n", *value);
	if (*value == 5) {
		CFRunLoopStop(CFRunLoopGetCurrent());
	}
}

int main(int argc, char* argv[]) {
	@autoreleasepool {
        int i = 0;
        CFRunLoopTimerRef timer;
        CFRunLoopTimerContext timer_context;

        bzero(&timer_context, sizeof(timer_context));
        timer_context.info = &i;
        timer = CFRunLoopTimerCreate(NULL, CFAbsoluteTimeGetCurrent(), 0.5, 0, 0, callback, &timer_context);
        CFRunLoopAddTimer(CFRunLoopGetCurrent(), timer, kCFRunLoopCommonModes);
        CFRunLoopRun();
	}
	printf("Exiting.\n");
	return 0;
}
