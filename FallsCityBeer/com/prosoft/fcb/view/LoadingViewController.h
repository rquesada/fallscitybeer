//
//  LoadingViewController.h
//  FallsCityBeer
//
//  Created by Roy Quesada on 2/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Constants.h"
#import <QuartzCore/QuartzCore.h>

@interface LoadingViewController : UIViewController{
    NSTimer * timer;
}
@property (nonatomic, retain) IBOutlet UIImageView *rightImage;
@property (nonatomic, retain) IBOutlet UIImageView *leftImage;
@property (nonatomic, retain) IBOutlet UIImageView *rightImageEffect;
@property (nonatomic, retain) IBOutlet UIImageView *leftImageEffect;
- (void) inits;
- (void) goHome;

@end
