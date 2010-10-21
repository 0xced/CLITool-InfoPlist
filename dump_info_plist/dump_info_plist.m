#import <Foundation/NSAutoreleasePool.h>
#import <Foundation/NSBundle.h>
#import <Foundation/NSData.h>
#import <Foundation/NSPropertyList.h>
#import <Foundation/NSString.h>
#import <mach-o/getsect.h>
#import <stdio.h>

int main (int argc, const char * argv[])
{
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	
	const struct section *__info_plist = getsectbyname("__TEXT", "__info_plist");
	if (!__info_plist)
	{
		fprintf(stderr, "__TEXT,__info_plist section not found\n");
		return 1;
	}
	
	NSData *plist = [NSData dataWithBytesNoCopy:(void*)__info_plist->addr length:__info_plist->size freeWhenDone:NO];
	NSData *xmlSignature = [NSData dataWithBytesNoCopy:"<?xml" length:5 freeWhenDone:NO];
	if ([[plist subdataWithRange:NSMakeRange(0, [xmlSignature length])] isEqualToData:xmlSignature])
	{
		NSString *xml = [[[NSString alloc] initWithData:plist encoding:NSUTF8StringEncoding] autorelease];
		printf("raw __info_plist section:\n-------------------------\n%s\n", [xml UTF8String]);
	}
	else
	{
		id infoPlist = [NSPropertyListSerialization propertyListFromData:plist mutabilityOption:NSPropertyListImmutable format:NULL errorDescription:NULL];
		printf("binary __info_plist section:\n----------------------------\n%s\n", [[infoPlist description] UTF8String]);
	}
	
	NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
	printf("\nmainBundle infoDictionary:\n--------------------------\n%s\n", [[infoDictionary description] UTF8String]);
	
    [pool drain];
    return 0;
}
