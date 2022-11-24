#import <Foundation/NSString.h>
#import <Foundation/NSURL.h>

#import <CoreFoundation/CFString.h>
#import <CoreFoundation/CFURL.h>

#include <stdio.h>

void nsprint(const char * aPrefix, NSString* aString) {
    printf("%s: %s\n", aPrefix, [aString UTF8String]);
}

void CheckEqual(CFTypeRef a, CFTypeRef b) {
    if (CFEqual(a, b)) {
        printf("PASS");
    } else {
        printf("FAIL\n    a: ");
        CFShow(a);
        printf("\n    b: ");
        CFShow(b);
    }
}

int main(int argc, char* argv[]) {

    // CFString/NSString
    NSString* nsstr = @"NSString";
    CFStringRef cfstr = CFSTR("CFString");
    nsprint("nsstr", nsstr);
    nsprint("cfstr", (__bridge NSString*)cfstr);
    if (![nsstr isEqual:(__bridge NSString*)cfstr]) {
        printf("FAIL: nsstr != cfstr");
    }
    if (CFStringCompare((CFStringRef)nsstr, cfstr, 0) != kCFCompareEqualTo) {
        printf("FAIL: CFStringCompare");
    }
    CheckEqual((__bridge CFTypeRef)nsstr, cfstr);

    // CFURL/NSURL
    CFURLRef cfurl = CFURLCreateWithString(kCFAllocatorDefault, CFSTR("https://ravynos.com"), NULL);
    NSURL* nsurl = [NSURL URLWithString:@"https://ravynos.com"];
    nsprint("cfurl", [(__bridge NSURL*)cfurl host]);
    nsprint("nsurl", [nsurl host]);
    if (![nsurl isEqual:(__bridge NSURL*)cfurl]) {
        printf("FAIL: nsurl != cfurl\n");
    }

    return 0;
}
