//
//  TopBarViewController.h
//  FallsCityBeer
//
//  Created by Roy Quesada on 4/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewletterViewController.h"
#import "ContactUsViewController.h"
#import "TwitterViewController.h"
#import "FacebookViewController.h"

@interface TopBarViewController : UIViewController {
    UIButton *lastPressed;
    NewletterViewController *newletterViewController;
    ContactUsViewController *contactUsViewController;
    TwitterViewController *twitterViewController;
    FacebookViewController *facebookViewController;
}
@property (nonatomic, retain) IBOutlet UIButton *newsLetterButton;
@property (nonatomic, retain) IBOutlet UIButton *contactUsButton;
@property (nonatomic, retain) IBOutlet UIButton *calendarButton;
@property (nonatomic, retain) IBOutlet UIButton *twitterButton;
@property (nonatomic, retain) IBOutlet UIButton *facebookButton;

-(IBAction)buttonAction:(id)sender;
- (BOOL) showNewsletter;
- (BOOL) showContactUs;
- (BOOL) showTwitter;
- (BOOL) showFacebook;
+(TopBarViewController *) sharedInstance;
@end
