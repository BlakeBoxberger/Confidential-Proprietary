#import <Cephei/HBPreferences.h>

NSString *text;

@interface SBDashBoardView : UIView
@property (nonatomic, retain) UILabel *nz9_cpText;
- (void)nz9_initCPLabel;
@end

%hook SBDashBoardView
%property (nonatomic, retain) UILabel *nz9_cpText;

- (instancetype)initWithFrame:(CGRect)arg1 {
	self = %orig;
	[self nz9_initCPLabel];
	[self addSubview: self.nz9_cpText];
	return self;
}

%new
- (void)nz9_initCPLabel {
	self.nz9_cpText = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 375, 10)];
	self.nz9_cpText.center = CGPointMake(187.5, 780);
	self.nz9_cpText.text = [NSString stringWithFormat:@"%@", text];
	self.nz9_cpText.font = [UIFont systemFontOfSize: 10];
	self.nz9_cpText.textColor = UIColor.whiteColor;
	self.nz9_cpText.textAlignment = NSTextAlignmentCenter;
}

%end

%ctor {
    HBPreferences *settings = [[HBPreferences alloc] initWithIdentifier:@"com.neinzedd9.confidentialproprietarysettings"];
    [settings registerDefaults:@{
  																@"enabled": @YES,
  																@"text": @"Confidential & Proprietary, Call 1-800-MY-APPLE",
  															 }];
    BOOL enabled = [settings boolForKey:@"enabled"];
    text = (NSString *)[settings objectForKey:@"text"];
    if(enabled) {
      %init;
    }
}
