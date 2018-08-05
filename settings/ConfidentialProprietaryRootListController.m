#include "ConfidentialProprietaryRootListController.h"
#import <Cephei/HBRespringController.h>
#import <Cephei/HBPreferences.h>

@implementation ConfidentialProprietaryRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Root" target:self] retain];
	}

	return _specifiers;
}

+ (NSString *)hb_shareText {
	return @"I'm using #Confidential&Proprietary by @NeinZedd9 to add text to my iPhone's lockscreen!";
}

- (void)dismiss {
	[[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil]; // Dismisses keyboard
}

@end
