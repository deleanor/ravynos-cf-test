#import <CoreFoundation/CoreFoundation.h>

#include <stdio.h>

int main(int argc, char *argv[]) {

    CFPreferencesSetAppValue(CFSTR("key"), CFSTR("value"), kCFPreferencesCurrentApplication);

    if (!CFPreferencesAppSynchronize(kCFPreferencesCurrentApplication)) {
        printf("Failed to synchronize preferences.\n");
        return 1;
    }
    
    CFPropertyListRef readValue = CFPreferencesCopyAppValue(CFSTR("key"), kCFPreferencesCurrentApplication);
	
	if (readValue == NULL) {
        printf("Preference value not found\n");
        return 1;
	} else {
        char outValue[256];
        CFStringGetCString((CFStringRef)readValue,outValue, 256, kCFStringEncodingASCII);
        printf("Returned value: %s\n", outValue);
        return 0;
    }
}
