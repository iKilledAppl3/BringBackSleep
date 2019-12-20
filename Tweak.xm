#import "BringBackSleep.h"
/*

	This tweak was created out of boredom don't be stupid just use the actual Control Center for tvOS 13.
	Copyright 2019 J.K. Hayslip (@iKilledAppl3) & ToxicAppl3 INSDC./iKilledAppl3 LLC.
	Friday, December, 20, 2019 was a fun day for us all!
	Anyways enjoy and remember not to spoil yourself!


*/


%hook TVSMMainViewController
-(void)viewDidLoad {
  if (kEnabled) {
	// Make sure we call this original view if not we can't add the alert view!
	%orig;
	//Hide the original view!
	for (UIView *view in self.view.subviews) {
		[view removeFromSuperview];
	}

// call the main view controller of the application so we can push the alert to the main view.
UIViewController *vc = [UIApplication sharedApplication].keyWindow.rootViewController;


//then call ther alert controller

	UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Sleep Now?"
                               message:@"This will also turn off any connected devices."
                               preferredStyle:UIAlertControllerStyleAlert];
 
UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"Sleep" style:UIAlertActionStyleDefault
   handler:^(UIAlertAction * action) {

   		//This is kinda hacky but hey it works :P
   		// Allocating the sleep module so we can call the sleep function.
   		TVSMSleepModule *sleepModule = [[%c(TVSMSleepModule) alloc] init];
        [sleepModule handleAction];

        // Here we need to release the view so we have to call this method....
        // I haven't found a way around this yet... :/ 

        TVSMSystemMenuManager *menuMan = [%c(TVSMSystemMenuManager) sharedInstance];
        [menuMan dismissSystemMenu];

   	}];

   UIAlertAction* cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault
   handler:^(UIAlertAction * action) {

        // Here we need to release the view so we have to call this method....
        // I haven't found a way around this yet... :/ 

        TVSMSystemMenuManager *menuMan = [%c(TVSMSystemMenuManager) sharedInstance];
        [menuMan dismissSystemMenu];

   	}];
 
[alert addAction:defaultAction];
[alert addAction:cancel];
[vc presentViewController:alert animated:YES completion:nil];
	
  }
else {
  %orig;
}

}
%end

// Load preferences to make sure changes are written to the plist
static void loadPrefs() {

  NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:PLIST_PATH];
  
    //our preference values that write to a plist file when a user selects somethings
  kEnabled = [([prefs objectForKey:@"kEnabled"] ?: @(YES)) boolValue];
}

%ctor {
  CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback) loadPrefs, CFSTR("com.ikilledappl3.nosleeptilbrooklyn.prefschanged"), NULL, CFNotificationSuspensionBehaviorDeliverImmediately);
  loadPrefs();
}
