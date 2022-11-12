#import <CoreFoundation/CoreFoundation.h>

#include <stdio.h>

CFStringRef createString(const char *value) {
	return CFStringCreateWithCString(NULL, value, kCFStringEncodingASCII);
}

int main(int argc, char *argv[]) {
	CFPreferencesSetValue(
		createString("key"),
		createString("value"),
		createString("appId"),
		kCFPreferencesCurrentUser,
		kCFPreferencesCurrentHost);
	CFPropertyListRef roundtrip = CFPreferencesCopyValue(
		createString("key"),
		createString("appId"),
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
