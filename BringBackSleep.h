@import UIKit;
#import <objc/runtime.h> 

// Make sure our path is specified so our tweak knows where to store all of the settings :)
#define PLIST_PATH @"/var/mobile/Library/Preferences/com.ikilledappl3.nosleeptilbrooklyn.plist"

/*

	This tweak was created out of boredom don't be stupid just use the actual Control Center for tvOS 13.
	Copyright 2019 J.K. Hayslip (@iKilledAppl3) & ToxicAppl3 INSDC./iKilledAppl3 LLC.
	Friday, December, 20, 2019 was a fun day for us all!
	Anyways enjoy and remember not to spoil yourself!


*/

// Tweak setting options
BOOL kEnabled;

// Apple interfaces :P
@interface TVSMMainViewController : UIViewController
-(UIView *)backgroundView;
@end

@interface TVSMSystemMenuManager : NSObject
+(id)sharedInstance;
-(void)dismissSystemMenu;
@end

@interface TVSMSleepModule : NSObject
+(long long)buttonStyle;
-(id)contentViewController;
-(void)handleAction;
-(BOOL)dismissAfterAction;
@end