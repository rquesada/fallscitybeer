//
//  HomeViewController.h
//  FallsCityBeer
//
//  Created by Roy Quesada on 2/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopBarViewController.h"
#import "AppDelegate.h"
#import <QuartzCore/QuartzCore.h>

@interface HomeViewController : UIViewController{
    TopBarViewController *topBarViewController;
    AppDelegate *appDelegate;
}

- (void) startAnimation;
@property (nonatomic, retain) IBOutlet UIView *rightView;
@property (nonatomic, retain) IBOutlet UIView *leftView;

@property (nonatomic, retain) NSString *animationStatus;
extern NSString * const ANIMATION_ON_PROGRESS;
extern NSString * const ANIMATION_JUST_END;
extern NSString * const ANIMATION_CAN_START;

@end
