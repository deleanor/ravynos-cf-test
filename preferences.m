#import <CoreFoundation/CoreFoundation.h>

#include <stdio.h>

int main(int argc, char *argv[]) {
	CFPreferencesSetValue(
		CFSTR("key"),
		CFSTR("value"),
		CFSTR("appId"),
		kCFPreferencesCurrentUser,
		kCFPreferencesCurrentHost);
	CFPropertyListRef roundtrip = CFPreferencesCopyValue(
		CFSTR("key"),
		CFSTR("appId"),
		kCFPreferencesCurrentUser,
		kCFPreferencesCurrentHost);

	char outValue[256];
	CFStringGetCString(
		(CFStringRef)roundtrip,
		outValue,
		256,
		kCFStringEncodingASCII);
	
	printf("Returned value: %s\n", outValue);
		
	return 0;
}
