#import <Cephei/HBPreferences.h>

#define kWidth [[UIApplication sharedApplication] keyWindow].frame.size.width
#define kHeight [[UIApplication sharedApplication] keyWindow].frame.size.height

BOOL enabled;
NSString *_Nonnull text = @"Confidential & Proprietary, Call 1-800-MY-APPLE";

@interface SBDashBoardView : UIView
@property (nonatomic, retain) UILabel *nz9_cpText;
- (UILabel *)updateCPLabel:(UILabel *)label;
@end

%hook SBDashBoardView
%property (nonatomic, retain) UILabel *nz9_cpText;

- (instancetype)initWithFrame:(CGRect)arg1 {
	self = %orig;
	self.nz9_cpText = [self updateCPLabel: [UILabel alloc]];
	[self addSubview: self.nz9_cpText];
	return self;
}

%new
- (UILabel *)updateCPLabel:(UILabel *)label {
	label = [label initWithFrame:CGRectMake(0, 0, kWidth, 15)];
	label.center = CGPointMake((kWidth * 1/2), (kHeight * 31/32));
	label.text = [NSString stringWithFormat:@"%@", text];
	label.font = [UIFont systemFontOfSize: 10];
	label.textColor = UIColor.whiteColor;
	label.textAlignment = NSTextAlignmentCenter;

	if(enabled) {
		label.hidden = NO;
	}
	else {
		label.hidden = YES;
	}

	return label;
}

- (void)layoutSubviews {
	%orig;
	self.nz9_cpText = [self updateCPLabel: self.nz9_cpText];
}

%end

%ctor {
    HBPreferences *settings = [[HBPreferences alloc] initWithIdentifier:@"com.neinzedd9.confidentialproprietarysettings"];

		[settings registerBool:&enabled default:YES forKey:@"enabled"];
		[settings registerObject:&text default:@"Confidential & Proprietary, Call 1-800-MY-APPLE" forKey:@"text"];

		%init;
}
